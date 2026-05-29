<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
    /* Khi được thích, ép icon đổ đầy màu FILL=1 và giữ nguyên màu sắc thương hiệu cũ */
    .is-favorite-active .material-symbols-outlined {
        font-variation-settings: 'FILL' 1, 'wght' 400, 'GRAD' 0, 'opsz' 24 !important;
        color: #934b19 !important; /* Đã đổi về màu nâu/vàng thương hiệu cũ của bạn */
    }
</style>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Get context path from JSP
        const contextPath = '<%= request.getContextPath() %>';

        // Function to get CSRF token from meta tags
        function getCsrfToken() {
            const tokenMeta = document.querySelector("meta[name='_csrf']");
            const headerMeta = document.querySelector("meta[name='_csrf_header']");

            const token = tokenMeta ? tokenMeta.getAttribute("content") : '';
            const header = headerMeta ? headerMeta.getAttribute("content") : '';

            return { token, header };
        }

        // Function to handle toggling favorite status via AJAX
        window.toggleFavorite = function(buttonElement, bookId) {
            if (!bookId) {
                console.error('bookId is undefined or null. Cannot toggle favorite.');
                alert('Không thể cập nhật danh sách yêu thích: Thiếu ID sách.');
                return;
            }

            const csrf = getCsrfToken();
            const url = contextPath + "/api/wishlist/toggle/" + bookId;

            // Check if CSRF header name is valid before making the request
            if (!csrf.header || csrf.header.trim() === '') {
                console.error('CSRF Header Name is empty or invalid. Cannot make request.');
                alert('Lỗi bảo mật: Không thể lấy thông tin CSRF. Vui lòng tải lại trang.');
                return;
            }

            fetch(url, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    [csrf.header]: csrf.token
                }
            })
            .then(response => {
                if (!response.ok) {
                    // If not authenticated, redirect to login
                    if (response.status === 401) {
                        window.location.href = `${contextPath}/login`;
                        return;
                    }
                    throw new Error('Network response was not ok. Status: ' + response.status);
                }
                return response.json();
            })
            .then(data => {
                if (data.isFavorite !== undefined) {
                    // 1. THAY ĐỔI GIAO DIỆN NGAY LẬP TỨC BẰNG CLASS CSS
                    if (data.isFavorite) {
                        buttonElement.classList.add('is-favorite-active');
                    } else {
                        buttonElement.classList.remove('is-favorite-active');
                    }

                    // 2. CẬP NHẬT CÁC THUỘC TÍNH PHỤ TRỢ (DATA ATTRIBUTE & TITLE)
                    buttonElement.setAttribute('data-is-favorite', data.isFavorite);
                    buttonElement.title = data.isFavorite ? 'Xóa khỏi danh sách yêu thích' : 'Thêm vào danh sách yêu thích';

                    // 3. XỬ LÝ ĐẶC BIỆT KHI Ở TRANG DANH SÁCH YÊU THÍCH (WISH LIST PAGE)
                    if (!data.isFavorite && window.location.pathname.includes('/profile/wishlist')) {
                        const bookCard = buttonElement.closest('.book-card-item');
                        if (bookCard) {
                            bookCard.remove(); // Xóa thẻ sách khỏi giao diện ngay lập tức
                            
                            // Kiểm tra nếu danh sách trống thì hiển thị thông báo rỗng
                            const wishlistGrid = document.querySelector('.wishlist-grid');
                            if (wishlistGrid && wishlistGrid.children.length === 0) {
                                const emptyMessage = document.createElement('div');
                                emptyMessage.className = 'col-span-full text-center py-10 text-on-surface-variant';
                                emptyMessage.textContent = 'Bạn chưa có sách nào trong danh sách yêu thích.';
                                wishlistGrid.appendChild(emptyMessage);
                            }
                        }
                    }
                    console.log(data.message);
                }
            })
            .catch(error => {
                console.error('Error toggling favorite status:', error);
                alert('Có lỗi xảy ra khi cập nhật danh sách yêu thích. Vui lòng thử lại.');
            });
        };
    });
</script>