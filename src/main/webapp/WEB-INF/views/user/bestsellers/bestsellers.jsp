<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="light" lang="vi">
<head>
    <jsp:include page="/WEB-INF/jsp/common/head.jsp">
        <jsp:param name="title" value="Sách Bán Chạy Nhất | The Digital Atelier"/>
    </jsp:include>
    <style>
        .book-card-shadow { transition: all 0.4s cubic-bezier(0.165, 0.84, 0.44, 1); }
        .book-card-shadow:hover { transform: translateY(-8px); }
        .rank-number { -webkit-text-stroke: 1px rgba(147, 75, 25, 0.2); color: transparent; font-weight: 900; }
        .bg-gradient-primary { background: linear-gradient(to right, #934b19, #843f0d); }
    </style>
</head>
<body class="text-on-surface">
    <jsp:include page="/WEB-INF/jsp/common/header.jsp">
        <jsp:param name="currentPage" value="bestsellers"/>
    </jsp:include>

    <main class="max-w-screen-2xl mx-auto px-8 py-16">
        <!-- Hero Section Title -->
        <div class="mb-16">
            <h1 class="font-headline text-5xl md:text-6xl text-on-surface mb-4 leading-tight">Bảng Xếp Hạng <br/><span class="italic text-primary">Sách Bán Chạy Nhất</span></h1>
            <p class="text-on-surface-variant max-w-2xl font-body text-lg leading-relaxed">Khám phá những tác phẩm văn học và nghệ thuật đang chiếm lĩnh tâm hồn độc giả. Mỗi cuốn sách là một hành trình tinh hoa được tuyển chọn kỹ lưỡng.</p>
        </div>
        <!-- Best Sellers Grid -->
        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 xl:grid-cols-5 gap-y-20 gap-x-10">
            <c:forEach items="${bestsellers}" var="book" varStatus="loop">
                <article class="group relative flex flex-col">
                    <div class="absolute -top-12 -left-4 font-headline text-8xl rank-number opacity-20 pointer-events-none group-hover:opacity-40 transition-opacity">
                        <fmt:formatNumber value="${loop.index + 1}" minIntegerDigits="2"/>
                    </div>
                    <c:set var="currentBook" value="${book}" scope="request"/>
                    <c:set var="isFavorite" value="${favoriteBookIds.contains(book.id)}" scope="request"/>
                    <jsp:include page="/WEB-INF/jsp/common/book-card.jsp"/>
                </article>
            </c:forEach>
        </div>
        <!-- Pagination -->
        <div class="mt-24 flex items-center justify-center space-x-4">
            <button class="w-12 h-12 flex items-center justify-center rounded-lg border border-outline/20 text-on-surface-variant hover:bg-primary-container/20 hover:text-primary transition-all">
                <span class="material-symbols-outlined">chevron_left</span>
            </button>
            <button class="w-12 h-12 flex items-center justify-center rounded-lg bg-primary text-on-primary font-bold">1</button>
            <button class="w-12 h-12 flex items-center justify-center rounded-lg border border-outline/20 text-on-surface-variant hover:bg-primary-container/20 hover:text-primary transition-all">2</button>
            <button class="w-12 h-12 flex items-center justify-center rounded-lg border border-outline/20 text-on-surface-variant hover:bg-primary-container/20 hover:text-primary transition-all">3</button>
            <span class="text-on-surface-variant">...</span>
            <button class="w-12 h-12 flex items-center justify-center rounded-lg border border-outline/20 text-on-surface-variant hover:bg-primary-container/20 hover:text-primary transition-all">12</button>
            <button class="w-12 h-12 flex items-center justify-center rounded-lg border border-outline/20 text-on-surface-variant hover:bg-primary-container/20 hover:text-primary transition-all">
                <span class="material-symbols-outlined">chevron_right</span>
            </button>
        </div>
    </main>

    <jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>
    <script>
        // Micro-interaction for rank numbers visibility on scroll
        const observerOptions = {
            threshold: 0.1
        };

        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('opacity-100');
                    entry.target.style.transform = 'translateY(0)';
                }
            });
        }, observerOptions);

        document.querySelectorAll('article').forEach(item => {
            item.style.opacity = '0';
            item.style.transform = 'translateY(20px)';
            item.style.transition = 'all 0.6s cubic-bezier(0.16, 1, 0.3, 1)';
            observer.observe(item);
        });

        // Final opacity for rank numbers once they are in view
        setTimeout(() => {
            document.querySelectorAll('article').forEach((item, index) => {
                setTimeout(() => {
                    item.style.opacity = '1';
                    item.style.transform = 'translateY(0)';
                }, index * 100);
            });
        }, 100);
    </script>
</body>
</html>