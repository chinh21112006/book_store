<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="light" lang="vi">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>Chủ Đề Sách | The Digital Atelier</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif:wght@400;700&amp;family=Be+Vietnam+Pro:wght@300;400;500;700&amp;display=swap" rel="stylesheet"/>
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
<!-- TopNavBar -->
<nav class="bg-surface/90 backdrop-blur-md sticky top-0 z-50 transition-all duration-300">
    <div class="flex justify-between items-center w-full px-8 py-6 max-w-screen-2xl mx-auto">
        <div class="font-headline text-2xl font-bold text-primary tracking-tight">
            <a href="${pageContext.request.contextPath}/home">The Digital Atelier</a>
        </div>
        <div class="hidden md:flex items-center gap-8">
            <a class="text-on-surface-variant font-medium hover:text-primary transition-colors" href="${pageContext.request.contextPath}/bestsellers">Sách Bán Chạy</a>
            <a class="text-primary font-bold border-b-2 border-primary pb-1 transition-all" href="${pageContext.request.contextPath}/categories">Chủ Đề Sách</a>
            <a class="text-on-surface-variant font-medium hover:text-primary transition-colors" href="#">Tác Giả</a>
        </div>
        <div class="flex items-center gap-6">
            <div class="hidden lg:flex items-center bg-surface-container-high rounded-lg px-4 py-2 w-64">
                <span class="material-symbols-outlined text-on-surface-variant mr-2">search</span>
                <input class="bg-transparent border-none focus:ring-0 text-label-md w-full placeholder-on-surface-variant/50" placeholder="Tìm kiếm sách..." type="text"/>
            </div>
            <div class="flex gap-4">
                <a href="${pageContext.request.contextPath}/cart" class="p-2 hover:bg-primary-container/20 rounded-lg transition-all duration-300 active:scale-90">
                    <span class="material-symbols-outlined text-primary">shopping_cart</span>
                </a>
                <button class="p-2 hover:bg-primary-container/20 rounded-lg transition-all duration-300 active:scale-90">
                    <span class="material-symbols-outlined text-primary">person</span>
                </button>
            </div>
        </div>
    </div>
</nav>
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
<!-- Footer -->
<footer class="bg-surface-container-low mt-auto border-t-0 py-16 px-8 text-center">
    <div class="max-w-screen-2xl mx-auto flex flex-col items-center">
        <div class="font-headline text-xl text-primary mb-4">The Digital Atelier</div>
        <p class="font-body text-label-lg leading-relaxed text-on-surface-variant mb-8 max-w-xl">
            © 2024 The Digital Atelier. Nơi những tâm hồn yêu sách tìm thấy nơi trú ẩn.
        </p>
        <div class="flex flex-wrap justify-center gap-8 mb-8">
            <a class="text-on-surface-variant hover:text-primary transition-opacity cursor-pointer" href="#">Về Chúng Tôi</a>
            <a class="text-on-surface-variant hover:text-primary transition-opacity cursor-pointer" href="#">Chính Sách Giao Hàng</a>
            <a class="text-on-surface-variant hover:text-primary transition-opacity cursor-pointer" href="#">Điều Khoản Dịch Vụ</a>
            <a class="text-on-surface-variant hover:text-primary transition-opacity cursor-pointer" href="#">Câu Hỏi Thường Gặp</a>
        </div>
        <div class="flex gap-6">
            <span class="material-symbols-outlined text-primary cursor-pointer hover:scale-110 transition-transform">social_leaderboard</span>
            <span class="material-symbols-outlined text-primary cursor-pointer hover:scale-110 transition-transform">share</span>
            <span class="material-symbols-outlined text-primary cursor-pointer hover:scale-110 transition-transform">mail</span>
        </div>
    </div>
</footer>
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
