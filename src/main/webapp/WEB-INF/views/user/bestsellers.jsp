<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="light" lang="vi">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>Sách Bán Chạy Nhất | The Digital Atelier</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif:ital,wght@0,400;0,700;0,900;1,400&amp;family=Be+Vietnam+Pro:wght@300;400;500;600;700&amp;display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <script id="tailwind-config">
      tailwind.config = {
        darkMode: "class",
        theme: {
          extend: {
            "colors": {
                    "primary-container": "#ffdbc9",
                    "outline": "#7f8454",
                    "tertiary-fixed": "#fbdbb0",
                    "surface-tint": "#934b19",
                    "on-error": "#ffffff",
                    "surface-container-low": "#fafcda",
                    "tertiary": "#78603e",
                    "inverse-on-surface": "#9e9e88",
                    "outline-variant": "#b8bd88",
                    "secondary-dim": "#6c5433",
                    "surface-bright": "#fefee5",
                    "primary": "#934b19",
                    "secondary-container": "#ffddb2",
                    "on-tertiary": "#ffffff",
                    "error-dim": "#5c1202",
                    "secondary-fixed-dim": "#f0cfa5",
                    "on-tertiary-container": "#624c2c",
                    "tertiary-container": "#fbdbb0",
                    "inverse-primary": "#f69a62",
                    "surface-variant": "#e7edb4",
                    "on-secondary-fixed-variant": "#6f5736",
                    "on-secondary-container": "#654e2d",
                    "tertiary-dim": "#6b5434",
                    "surface-container-highest": "#e7edb4",
                    "surface-dim": "#e1e8a7",
                    "secondary-fixed": "#ffddb2",
                    "on-background": "#363b12",
                    "on-secondary": "#ffffff",
                    "primary-fixed-dim": "#ffc9ab",
                    "on-tertiary-fixed": "#4e3a1b",
                    "inverse-surface": "#0e0f03",
                    "secondary": "#79603e",
                    "on-surface": "#363b12",
                    "surface-container-lowest": "#ffffff",
                    "error-container": "#fe8b70",
                    "surface-container-high": "#eef2c1",
                    "on-secondary-fixed": "#513c1c",
                    "on-primary-fixed-variant": "#8f4816",
                    "on-error-container": "#742410",
                    "on-surface-variant": "#63683a",
                    "tertiary-fixed-dim": "#eccda3",
                    "surface-container": "#f4f7ce",
                    "on-primary-fixed": "#6a2e00",
                    "on-primary": "#fff6f2",
                    "primary-fixed": "#ffdbc9",
                    "background": "#fefee5",
                    "surface": "#fefee5",
                    "on-primary-container": "#833f0c",
                    "primary-dim": "#843f0d",
                    "on-tertiary-fixed-variant": "#6d5635",
                    "error": "#a54731"
            },
            "borderRadius": {
                    "DEFAULT": "0.5rem",
                    "lg": "0.5rem",
                    "xl": "0.75rem",
                    "full": "9999px"
            },
            "fontFamily": {
                    "headline": ["Noto Serif"],
                    "display": ["Noto Serif"],
                    "body": ["Be Vietnam Pro"],
                    "label": ["Be Vietnam Pro"]
            }
          },
        },
      }
    </script>
    <style>
        body { font-family: 'Be Vietnam Pro', sans-serif; background-color: #fefee5; }
        .font-headline { font-family: 'Noto Serif', serif; }
        .material-symbols-outlined { font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24; }
        .book-card-shadow { transition: all 0.4s cubic-bezier(0.165, 0.84, 0.44, 1); }
        .book-card-shadow:hover { transform: translateY(-8px); }
        .rank-number { -webkit-text-stroke: 1px rgba(147, 75, 25, 0.2); color: transparent; font-weight: 900; }
        .bg-gradient-primary { background: linear-gradient(to right, #934b19, #843f0d); }
    </style>
</head>
<body class="text-on-surface">
<!-- TopNavBar -->
<header class="bg-surface/90 backdrop-blur-md dark:bg-surface/90 docked full-width top-0 sticky z-50">
    <div class="flex justify-between items-center w-full px-8 py-6 max-w-screen-2xl mx-auto">
        <div class="font-headline text-2xl font-bold text-primary tracking-tight">
            <a href="${pageContext.request.contextPath}/home">The Digital Atelier</a>
        </div>
        <nav class="hidden md:flex items-center space-x-8">
            <a class="text-primary font-bold border-b-2 border-primary pb-1 transition-all" href="${pageContext.request.contextPath}/bestsellers">Sách Bán Chạy</a>
            <a class="text-on-surface-variant font-medium hover:text-primary transition-colors" href="${pageContext.request.contextPath}/categories">Chủ Đề Sách</a> <%-- Added link --%>
            <a class="text-on-surface-variant font-medium hover:text-primary transition-colors" href="#">Tác Giả</a>
        </nav>
        <div class="flex items-center space-x-6">
            <div class="relative hidden lg:block">
                <input class="bg-surface-container-high border-none rounded-lg py-2 pl-4 pr-10 w-64 font-body text-label-md focus:ring-1 focus:ring-primary/30" placeholder="Tìm kiếm tác phẩm..." type="text"/>
                <span class="material-symbols-outlined absolute right-3 top-1/2 -translate-y-1/2 text-on-surface-variant">search</span>
            </div>
            <div class="flex items-center space-x-4">
                <a href="${pageContext.request.contextPath}/cart" class="text-primary hover:bg-primary-container/20 p-2 rounded-lg transition-all duration-300 scale-95 active:scale-90">
                    <span class="material-symbols-outlined" data-icon="shopping_cart">shopping_cart</span>
                </a>
                <button class="text-primary hover:bg-primary-container/20 p-2 rounded-lg transition-all duration-300 scale-95 active:scale-90">
                    <span class="material-symbols-outlined" data-icon="person">person</span>
                </button>
            </div>
        </div>
    </div>
</header>
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
                <div class="book-card-shadow relative aspect-[2/3] overflow-hidden rounded-lg bg-surface-container-low mb-6">
                    <a href="${pageContext.request.contextPath}/books/${book.id}">
                        <img alt="${book.title}" class="w-full h-full object-cover transition-transform duration-700 group-hover:scale-105" src="${book.imageUrl}"/>
                    </a>
                    <div class="absolute inset-0 bg-primary/0 group-hover:bg-primary/5 transition-colors duration-300"></div>
                </div>
                <div class="flex-grow">
                    <a href="${pageContext.request.contextPath}/books/${book.id}">
                        <h3 class="font-headline text-xl text-on-surface mb-1 leading-snug group-hover:text-primary transition-colors">${book.title}</h3>
                    </a>
                    <p class="font-body text-label-md text-on-surface-variant mb-4">${book.author}</p>
                    <p class="font-body text-headline-sm font-bold text-primary mb-6">
                        <fmt:formatNumber value="${book.price}" type="number" groupingUsed="true"/>đ
                    </p>
                </div>
                <form action="${pageContext.request.contextPath}/cart/add" method="post">
                    <input type="hidden" name="bookId" value="${book.id}"/>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <button type="submit" class="bg-gradient-primary text-on-primary font-body py-3 px-4 rounded-lg flex items-center justify-center space-x-2 w-full scale-95 hover:scale-100 transition-transform active:scale-95 shadow-lg shadow-primary/10">
                        <span class="material-symbols-outlined text-sm" style="font-variation-settings: 'FILL' 1;">shopping_cart</span>
                        <span class="font-semibold text-sm">Thêm vào giỏ</span>
                    </button>
                </form>
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
<!-- Footer -->
<footer class="bg-surface-container-low full-width mt-auto">
    <div class="flex flex-col items-center justify-center w-full py-16 px-8 border-t-0 bg-surface-container-low text-center">
        <div class="font-headline text-xl text-primary mb-4">The Digital Atelier</div>
        <div class="flex flex-wrap justify-center gap-x-8 gap-y-4 mb-8">
            <a class="text-on-surface-variant hover:text-primary font-body text-label-lg leading-relaxed transition-opacity" href="#">Về Chúng Tôi</a>
            <a class="text-on-surface-variant hover:text-primary font-body text-label-lg leading-relaxed transition-opacity" href="#">Chính Sách Giao Hàng</a>
            <a class="text-on-surface-variant hover:text-primary font-body text-label-lg leading-relaxed transition-opacity" href="#">Điều Khoản Dịch Vụ</a>
            <a class="text-on-surface-variant hover:text-primary font-body text-label-lg leading-relaxed transition-opacity" href="#">Câu Hỏi Thường Gặp</a>
        </div>
        <p class="text-on-surface-variant font-body text-label-lg leading-relaxed max-w-md">© 2024 The Digital Atelier. Nơi những tâm hồn yêu sách tìm thấy nơi trú ẩn.</p>
    </div>
</footer>
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
