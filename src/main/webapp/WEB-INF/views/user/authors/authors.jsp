<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <jsp:include page="/WEB-INF/jsp/common/head.jsp">
        <jsp:param name="title" value="Danh Sách Tác Giả | The Digital Atelier"/>
    </jsp:include>
    <style>
        .material-symbols-outlined {
            font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
            display: inline-block;
            vertical-align: middle;
        }
        body {
            font-family: 'Be Vietnam Pro', sans-serif;
            background-color: #fefee5;
            color: #363b12;
            -webkit-font-smoothing: antialiased;
        }
        .serif-text { font-family: 'Noto Serif', serif; }
        .author-card {
            transition: transform 0.4s cubic-bezier(0.2, 1, 0.3, 1), box-shadow 0.4s ease;
        }
        .author-card:hover {
            transform: translateY(-8px);
        }
        .alphabet-pill:hover {
            background-color: rgba(147, 75, 25, 0.1);
        }
    </style>
</head>
<body class="min-h-screen flex flex-col">
    <jsp:include page="/WEB-INF/jsp/common/header.jsp">
        <jsp:param name="currentPage" value="authors"/>
    </jsp:include>

    <main class="flex-grow">
        <!-- Hero Section -->
        <section class="max-w-screen-2xl mx-auto px-8 pt-16 pb-8">
            <div class="grid grid-cols-1 md:grid-cols-2 gap-12 items-center">
                <div>
                    <h1 class="font-headline text-5xl md:text-6xl font-bold text-on-surface leading-tight mb-6">Những người kể chuyện xuất chúng</h1>
                    <p class="font-body text-lg text-on-surface-variant max-w-lg mb-8 leading-relaxed">Khám phá thế giới qua lăng kính của những tác giả vĩ đại nhất, từ những cây bút cổ điển đến những ngôi sao văn học hiện đại.</p>
                </div>
                <div class="relative h-[300px] md:h-[400px] rounded-2xl overflow-hidden group">
                    <img alt="Authors Hero" class="w-full h-full object-cover transition-transform duration-700 group-hover:scale-105" src="https://lh3.googleusercontent.com/aida-public/AB6AXuBwiyWp5r3qoAxr8IEFSkkMub4ixvFqD_IiwS_vSDaUbGE8radnB1Iyg5OSLiLyVFTmuCmJPjPx-YK6YN4z_UzVsVRf9u-e0KzVVaX0uEl7bfNlDmfaPqWkn7PxWDNioewS4QB7mHTg3uN-dFEyJYssgg-Hid8L2QeqDYJM-HvNw4tRGizWkwKPUdWUVZJahQjOMfWZO_FzXUnbtEvljyMwMUm3SEKWZdWbePQr7oZ7lauOj4DpWntxxj23AqYhldp6eQh0uHMp3XKL"/>
                    <div class="absolute inset-0 bg-gradient-to-t from-background/40 to-transparent"></div>
                </div>
            </div>
        </section>

        <!-- Search and Filter Section -->
        <section class="max-w-screen-2xl mx-auto px-8 py-12">
            <div class="bg-surface-container-low rounded-2xl p-8 shadow-sm">
                <div class="flex flex-col md:flex-row md:items-center justify-between gap-8">
                    <div class="relative flex-1 max-w-xl">
                        <span class="material-symbols-outlined absolute left-4 top-1/2 -translate-y-1/2 text-primary">search</span>
                        <input class="w-full bg-surface-container-lowest border-none rounded-xl py-4 pl-12 pr-4 focus:ring-2 focus:ring-primary/20 text-body font-body shadow-sm placeholder:text-on-surface-variant/60" placeholder="Tìm tên tác giả bạn yêu thích..." type="text"/>
                    </div>
                    <div class="flex flex-wrap items-center gap-3">
                        <span class="text-label-md font-bold text-primary mr-2">Lọc theo:</span>
                        <div class="flex flex-wrap gap-2">
                            <button class="bg-primary text-on-primary px-4 py-2 rounded-full text-sm font-medium">Tất cả</button>
                            <button class="bg-surface-container-lowest text-on-surface-variant px-4 py-2 rounded-full text-sm font-medium hover:bg-primary-container/20 transition-all">Trong nước</button>
                            <button class="bg-surface-container-lowest text-on-surface-variant px-4 py-2 rounded-full text-sm font-medium hover:bg-primary-container/20 transition-all">Quốc tế</button>
                        </div>
                    </div>
                </div>

                <%-- Removed Alphabet Filter section --%>
            </div>
        </section>

        <!-- Authors Grid -->
        <section class="max-w-screen-2xl mx-auto px-8 py-12">
            <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-x-8 gap-y-12">
                <c:forEach items="${authors}" var="author">
                    <div class="author-card bg-surface-container-lowest rounded-2xl p-8 flex flex-col items-center text-center group cursor-pointer">
                        <a href="${pageContext.request.contextPath}/authors/${author.id}">
                            <div class="relative w-32 h-32 mb-6 p-1 border-2 border-primary-container rounded-full overflow-hidden transition-all group-hover:border-primary">
                                <img alt="${author.name}" class="w-full h-full object-cover rounded-full" src="${author.imageUrl}"/>
                            </div>
                            <h3 class="font-headline text-xl font-bold mb-2 group-hover:text-primary transition-colors">${author.name}</h3>
                            <p class="font-body text-sm italic text-on-surface-variant mb-4 px-2 leading-relaxed">${author.bio}</p>
                            <div class="mt-auto pt-4 flex items-center space-x-2 text-primary">
                                <span class="material-symbols-outlined text-sm">book</span>
                                <span class="text-label-md font-bold uppercase tracking-wider">${author.books.size()} Tác phẩm</span>
                            </div>
                        </a>
                    </div>
                </c:forEach>
            </div>

            <!-- Pagination or Load More -->
            <div class="mt-20 flex justify-center">
                <button class="group flex items-center space-x-3 bg-primary text-on-primary px-8 py-4 rounded-full font-bold transition-all hover:shadow-lg active:scale-95">
                    <span>Xem thêm tác giả</span>
                    <span class="material-symbols-outlined transition-transform group-hover:translate-x-1">arrow_forward</span>
                </button>
            </div>
        </section>
    </main>

    <jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>
    <script>
        // Đồng bộ hành vi click cho toàn bộ danh sách chữ cái mới
        document.querySelectorAll('.alphabet-pill').forEach(pill => {
            pill.addEventListener('click', function() {
                document.querySelectorAll('.alphabet-pill').forEach(el => {
                    el.classList.remove('bg-primary', 'text-on-primary', 'font-bold');
                    el.classList.add('text-on-surface-variant', 'font-medium');
                });
                this.classList.add('bg-primary', 'text-on-primary', 'font-bold');
                this.classList.remove('text-on-surface-variant', 'font-medium');
            });
        });

        // Header scroll effect
        window.addEventListener('scroll', () => {
            const header = document.querySelector('header');
            if (window.scrollY > 20) {
                header.classList.add('shadow-sm', 'py-4');
                header.classList.remove('py-6');
            } else {
                header.classList.remove('shadow-sm', 'py-4');
                header.classList.add('py-6');
            }
        });
    </script>
</body>
</html>
