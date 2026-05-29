<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="light" lang="vi">
<head>
    <jsp:include page="/WEB-INF/jsp/common/head.jsp">
        <jsp:param name="title" value="Chủ Đề Sách | The Digital Atelier"/>
    </jsp:include>
    <style>
        .material-symbols-outlined {
            font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
        }
        .editorial-shadow {
            box-shadow: 0 24px 48px -12px rgba(54, 59, 18, 0.06);
        }
        .card-overlay {
            background: linear-gradient(to top, rgba(54, 59, 18, 0.8) 0%, rgba(54, 59, 18, 0.2) 60%, transparent 100%);
        }
        .stagger-item { opacity: 0; transform: translateY(20px); }
    </style>
</head>
<body class="bg-background text-on-surface font-body min-h-screen flex flex-col">
    <jsp:include page="/WEB-INF/jsp/common/header.jsp">
        <jsp:param name="currentPage" value="categories"/>
    </jsp:include>

    <main class="flex-grow max-w-screen-2xl mx-auto w-full px-8 py-12">
        <!-- Hero Section -->
        <header class="mb-16 text-center max-w-3xl mx-auto">
            <h1 class="font-display text-5xl font-bold text-on-surface mb-6 leading-tight">Khám Phá Thế Giới Qua Từng Chủ Đề</h1>
            <p class="text-on-surface-variant text-lg leading-relaxed">
                Tại The Digital Atelier, chúng tôi tin rằng mỗi thể loại là một cánh cửa mở ra những chân trời mới. Hãy chọn một chủ đề để bắt đầu hành trình trí tuệ của bạn.
            </p>
        </header>
        <!-- Category Grid -->
        <section class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-8">
            <c:forEach items="${categories}" var="category" varStatus="loop">
                <div class="group relative aspect-[3/4] overflow-hidden rounded-lg bg-surface-container-lowest stagger-item editorial-shadow cursor-pointer transition-transform duration-500 hover:-translate-y-2">
                    <a href="${pageContext.request.contextPath}/categories/${category.id}">
                        <img class="absolute inset-0 w-full h-full object-cover transition-transform duration-700 group-hover:scale-110" src="${category.imageUrl}" alt="${category.name}"/>
                        <div class="card-overlay absolute inset-0 flex flex-col justify-end p-8">
                            <%-- Assuming you might want to display book count per category later --%>
                            <%-- <span class="text-on-primary-fixed-variant text-sm font-bold uppercase tracking-widest mb-2 opacity-0 group-hover:opacity-100 transition-opacity duration-300">1,240 Đầu Sách</span> --%>
                            <h3 class="font-headline text-2xl text-white font-bold mb-4">${category.name}</h3>
                            <div class="h-1 w-0 bg-primary group-hover:w-full transition-all duration-500"></div>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </section>
        <!-- Newsletter / Community Section -->
        <section class="mt-24 bg-surface-container-low rounded-2xl p-12 flex flex-col md:flex-row items-center gap-12 editorial-shadow">
            <div class="md:w-1/2">
                <h2 class="font-headline text-3xl font-bold mb-4 text-primary">Tham gia cộng đồng Atelier</h2>
                <p class="text-on-surface-variant leading-relaxed mb-6">Đăng ký để nhận những gợi ý sách được cá nhân hóa theo chủ đề yêu thích của bạn và không bỏ lỡ những tác phẩm mới nhất từ các tác giả hàng đầu.</p>
                <div class="flex gap-4">
                    <input class="bg-surface-container-lowest border-none focus:ring-2 focus:ring-primary rounded-lg flex-grow px-6 py-3 shadow-sm" placeholder="Email của bạn..." type="email"/>
                    <button class="bg-primary text-on-primary px-8 py-3 rounded-lg font-bold hover:bg-primary-dim transition-all active:scale-95 shadow-lg">Gửi ngay</button>
                </div>
            </div>
            <div class="md:w-1/2 flex justify-center">
                <div class="relative w-64 h-64">
                    <div class="absolute inset-0 bg-primary/10 rounded-full animate-pulse"></div>
                    <div class="absolute inset-4 bg-primary/20 rounded-full"></div>
                    <span class="material-symbols-outlined absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 text-8xl text-primary/40">auto_stories</span>
                </div>
            </div>
        </section>
    </main>

    <jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const items = document.querySelectorAll('.stagger-item');
            items.forEach((item, index) => {
                setTimeout(() => {
                    item.style.transition = 'all 0.8s cubic-bezier(0.16, 1, 0.3, 1)';
                    item.style.opacity = '1';
                    item.style.transform = 'translateY(0)';
                }, index * 100);
            });

            // Smooth scroll for nav shadow
            window.addEventListener('scroll', () => {
                const nav = document.querySelector('nav');
                if (window.scrollY > 50) {
                    nav.classList.add('editorial-shadow', 'bg-surface/95');
                } else {
                    nav.classList.remove('editorial-shadow', 'bg-surface/95');
                }
            });
        });
    </script>
</body>
</html>
