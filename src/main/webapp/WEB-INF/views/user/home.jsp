<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html class="light" lang="vi">
<head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>Trang Chủ | The Digital Atelier</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif:ital,wght@0,400;0,700;0,900;1,400&amp;family=Be+Vietnam+Pro:wght@300;400;500;600;700&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<script id="tailwind-config">
      tailwind.config = {
        darkMode: "class",
        theme: {
          extend: {
            "colors": {
                    "inverse-on-surface": "#9e9e88",
                    "on-primary-fixed-variant": "#8f4816",
                    "primary-container": "#ffdbc9",
                    "primary": "#934b19",
                    "on-background": "#363b12",
                    "secondary-fixed-dim": "#f0cfa5",
                    "on-primary": "#fff6f2",
                    "error": "#a54731",
                    "tertiary": "#78603e",
                    "on-tertiary": "#ffffff",
                    "on-primary-container": "#833f0c",
                    "inverse-primary": "#f69a62",
                    "on-error": "#ffffff",
                    "primary-dim": "#843f0d",
                    "on-surface-variant": "#63683a",
                    "on-error-container": "#742410",
                    "on-secondary-fixed-variant": "#6f5736",
                    "on-tertiary-fixed-variant": "#6d5635",
                    "secondary-container": "#ffddb2",
                    "primary-fixed": "#ffdbc9",
                    "surface": "#fefee5",
                    "surface-dim": "#e1e8a7",
                    "outline-variant": "#b8bd88",
                    "on-secondary-container": "#654e2d",
                    "background": "#fefee5",
                    "on-secondary-fixed": "#513c1c",
                    "surface-container": "#f4f7ce",
                    "outline": "#7f8454",
                    "surface-container-high": "#eef2c1",
                    "primary-fixed-dim": "#ffc9ab",
                    "surface-tint": "#934b19",
                    "secondary-fixed": "#ffddb2",
                    "error-container": "#fe8b70",
                    "tertiary-dim": "#6b5434",
                    "surface-container-lowest": "#ffffff",
                    "on-tertiary-container": "#624c2c",
                    "on-secondary": "#ffffff",
                    "surface-container-highest": "#e7edb4",
                    "secondary": "#79603e",
                    "surface-container-low": "#fafcda",
                    "inverse-surface": "#0e0f03",
                    "tertiary-fixed-dim": "#eccda3",
                    "on-tertiary-fixed": "#4e3a1b",
                    "secondary-dim": "#6c5433",
                    "tertiary-fixed": "#fbdbb0",
                    "on-primary-fixed": "#6a2e00",
                    "surface-variant": "#e7edb4",
                    "surface-bright": "#fefee5",
                    "tertiary-container": "#fbdbb0",
                    "on-surface": "#363b12",
                    "error-dim": "#5c1202"
            },
            "borderRadius": {
                    "DEFAULT": "0.5rem",
                    "lg": "0.5rem",
                    "xl": "0.75rem",
                    "full": "9999px"
            },
            "fontFamily": {
                    "headline": ["Noto Serif"],
                    "body": ["Be Vietnam Pro"],
                    "label": ["Be Vietnam Pro"]
            }
          },
        },
      }
    </script>
<style>
        body { font-family: 'Be Vietnam Pro', sans-serif; background-color: #fefee5; color: #363b12; }
        .font-serif { font-family: 'Noto Serif', serif; }
        .material-symbols-outlined { font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24; }
        .book-card-shadow { box-shadow: 0 4px 20px -2px rgba(147, 75, 25, 0.08); }
        .hero-gradient { background: linear-gradient(to right, #fefee5 20%, transparent 100%); }
    </style>
</head>
<body class="bg-background text-on-surface">
<!-- Top Navigation Bar -->
<header class="w-full top-0 sticky z-50 bg-[#fefee5] dark:bg-stone-950 shadow-sm dark:shadow-none">
<nav class="flex justify-between items-center w-full px-12 py-6 max-w-[1440px] mx-auto">
<div class="flex items-center gap-12">
<a class="font-serif text-2xl font-black text-[#363b12] dark:text-stone-100" href="${pageContext.request.contextPath}/">The Digital Atelier</a>
<div class="hidden md:flex gap-8">
<a class="text-[#934b19] border-b-2 border-[#934b19] pb-1 font-serif font-bold tracking-tight text-xl cursor-pointer active:scale-95 transition-transform" href="#">Sách Mới</a>
<a class="text-[#363b12] dark:text-stone-400 hover:text-[#934b19] transition-colors font-serif font-bold tracking-tight text-xl cursor-pointer active:scale-95 transition-transform" href="#">Bán Chạy</a>
<a class="text-[#363b12] dark:text-stone-400 hover:text-[#934b19] transition-colors font-serif font-bold tracking-tight text-xl cursor-pointer active:scale-95 transition-transform" href="#">Chủ Đề</a>
<a class="text-[#363b12] dark:text-stone-400 hover:text-[#934b19] transition-colors font-serif font-bold tracking-tight text-xl cursor-pointer active:scale-95 transition-transform" href="#">Tác Giả</a>
</div>
</div>
<div class="flex items-center gap-6">
<div class="relative flex items-center bg-surface-container-high px-4 py-2 rounded-lg">
<span class="material-symbols-outlined text-on-surface-variant mr-2">search</span>
<input class="bg-transparent border-none focus:ring-0 text-sm w-48 font-body" placeholder="Tìm kiếm sách..." type="text"/>
</div>
<button class="hover:bg-[#fafcda] dark:hover:bg-stone-800 rounded-lg transition-all duration-300 p-2 cursor-pointer active:scale-95">
<span class="material-symbols-outlined text-[#934b19] dark:text-[#d27d42]">shopping_cart</span>
</button>

<sec:authorize access="isAuthenticated()">
    <div class="flex items-center gap-4">
        <span class="font-body font-medium text-[#363b12]">Chào, <sec:authentication property="principal.username" /></span>
        <form action="${pageContext.request.contextPath}/logout" method="POST">
             <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
             <button type="submit" class="hover:bg-[#fafcda] dark:hover:bg-stone-800 rounded-lg transition-all duration-300 p-2 cursor-pointer active:scale-95">
                <span class="material-symbols-outlined text-red-600">logout</span>
            </button>
        </form>
    </div>
</sec:authorize>
<sec:authorize access="!isAuthenticated()">
    <a href="${pageContext.request.contextPath}/login" class="hover:bg-[#fafcda] dark:hover:bg-stone-800 rounded-lg transition-all duration-300 p-2 cursor-pointer active:scale-95">
        <span class="material-symbols-outlined text-[#934b19] dark:text-[#d27d42]">person</span>
    </a>
</sec:authorize>

</div>
</nav>
</header>
<main>
<!-- Hero Section -->
<section class="relative h-[600px] overflow-hidden bg-surface-container-low">
<div class="absolute inset-0 z-0">
<img alt="Atmospheric library" class="w-full h-full object-cover opacity-30 mix-blend-multiply" data-alt="atmospheric quiet library with sunlight streaming through large windows onto wooden bookshelves and a cozy reading nook" src="https://lh3.googleusercontent.com/aida-public/AB6AXuCVGbX4_IVAg_bnK9IE6a_tC3sq4wWIcMRYlTVpPGxbvOvz8AFqMi-N-9FhJGSjeuI8mBvO1J5sm97FYCqFcyyX3tNa5CkdYgZmSTZOj1pqv72c0LKOw_B_uMFYtG_TaipAEGgsG4a5UDaB2GfIvT4h7YBZo89OYANRCwT_8VmBJaSYX6SgEMu4C839MTjP_zwSB7FgeU2EnXeq4Qlg-3lDllSfrOi1lXw5uHrJF6YfhcrF4kviTmhqKoPSvtpV4obvwaa50lMNO3e2"/>
<div class="absolute inset-0 hero-gradient"></div>
</div>
<div class="relative z-10 max-w-[1440px] mx-auto px-12 h-full flex flex-col justify-center items-start">
<span class="text-primary font-body font-semibold tracking-widest uppercase mb-4">Bộ Sưu Tập Mùa Thu</span>
<h1 class="font-serif text-7xl font-black text-on-surface leading-tight mb-6 max-w-2xl">Đánh Thức Tâm Hồn Qua Từng Trang Sách.</h1>
<p class="font-body text-xl text-on-surface-variant mb-10 max-w-xl leading-relaxed">
                    Khám phá những tác phẩm văn học kinh điển và hiện đại được tuyển chọn kỹ lưỡng cho những tâm hồn tò mò.
                </p>
<div class="flex gap-4">
<button class="bg-primary hover:bg-primary-dim text-on-primary px-10 py-4 rounded-lg font-body font-bold transition-all duration-300 transform hover:-translate-y-1 shadow-lg">
                        Khám Phá Ngay
                    </button>
<button class="text-primary hover:bg-primary-container px-10 py-4 rounded-lg font-body font-bold transition-all duration-300">
                        Xem Danh Mục
                    </button>
</div>
</div>
</section>
<!-- Featured Section (Bento Grid) -->
<section class="max-w-[1440px] mx-auto px-12 py-24">
<div class="flex justify-between items-end mb-12">
<div>
<h2 class="font-serif text-4xl font-bold text-on-surface mb-2">Tác Phẩm Tiêu Biểu</h2>
<div class="h-1 w-20 bg-primary"></div>
</div>
<a class="text-primary font-body font-semibold flex items-center gap-2 hover:underline underline-offset-4" href="#">
                    Xem tất cả <span class="material-symbols-outlined text-sm">arrow_forward</span>
</a>
</div>
<div class="grid grid-cols-12 gap-8 h-[700px]">
<!-- Main Featured Card -->
<div class="col-span-6 bg-surface-container-lowest rounded-lg overflow-hidden group cursor-pointer relative book-card-shadow">
<img alt="Featured Book" class="w-full h-full object-cover transition-transform duration-700 group-hover:scale-105" data-alt="close-up of a minimalist book cover titled The Art of Silence on a textured linen background with dramatic shadows" src="https://lh3.googleusercontent.com/aida-public/AB6AXuA5AsuH3AnEiouCSyjMd2vF8xa6pfYpwOqdytgJY-z9RQHlYGokRji2qzLMXdExPzaKYyFdFgyAh62LD1IC9mT-1mA9tJPQTL5IYOTyy5D-YnV4DGZ8wQjve4CY0CzFgjw3hkRISeCsQ1PGUfjH-oaeJw40EpOilQodHRlnmv8tb4uXTHhYZDkNjOgeh0et45YL6MNGouljJisfCSoIRTkxo7AaVJKgWACtnb9Qu7GaNzJRV1MtJPVVbNODuLqZZVM1Rc0IiDcthTad"/>
<div class="absolute bottom-0 left-0 right-0 p-8 bg-gradient-to-t from-black/80 to-transparent text-white">
<span class="bg-primary px-3 py-1 text-xs font-bold rounded mb-4 inline-block">SÁCH CỦA THÁNG</span>
<h3 class="font-serif text-3xl font-bold mb-2">Nghệ Thuật Của Sự Tĩnh Lặng</h3>
<p class="text-white/80 mb-4 line-clamp-2">Một hành trình sâu sắc vào nội tâm để tìm thấy sự bình yên giữa thế gian ồn ào.</p>
<button class="bg-white text-black px-6 py-2 rounded font-bold text-sm">Tìm Hiểu Thêm</button>
</div>
</div>
<!-- Secondary Featured Cards -->
<div class="col-span-3 grid grid-rows-2 gap-8">
<div class="bg-surface-container-high rounded-lg p-6 flex flex-col justify-between hover:bg-surface-container-highest transition-colors cursor-pointer group">
<div>
<h4 class="font-serif text-xl font-bold text-on-surface mb-2">Văn Chương Cổ Điển</h4>
<p class="text-sm text-on-surface-variant font-body">Sống lại những giá trị vượt thời gian.</p>
</div>
<img alt="Classic books" class="w-32 self-end transform group-hover:rotate-12 transition-transform duration-500" data-alt="stack of vintage leather-bound books with gold leaf details on a rustic wooden table" src="https://lh3.googleusercontent.com/aida-public/AB6AXuDauhZI-y8LBW3lxJNGzBoW8DI32VxzS-pXLk2Oujvk-AcnCKGhvt0W6dLe54EHU9v6lG7GBykbZGuoadQTHZZPaEIr-R56RgG4qzAhzJcGXhn3vnWSXikFtv-irM5LgWN2ZFbTzYPcrBpPQBf1pI-LxXkqxZgTLT9kEDSHoDqeBX7AldliGGls2OlKd7tB_ljEsIeXiF0ueHomqfd5AVHMYebAZ0mrgsvcqKyHBdGozvn6o_ZQNbOKEdY4wA9KT1zvM3bCPPAuiZnh"/>
</div>
<div class="bg-tertiary-container rounded-lg p-6 flex flex-col justify-between hover:opacity-90 transition-opacity cursor-pointer group">
<div>
<h4 class="font-serif text-xl font-bold text-on-tertiary-container mb-2">Tư Duy Đột Phá</h4>
<p class="text-sm text-on-tertiary-container/70 font-body">Mở rộng tầm nhìn và kiến thức.</p>
</div>
<span class="material-symbols-outlined text-6xl text-on-tertiary-container/20 self-end">lightbulb</span>
</div>
</div>
<div class="col-span-3 bg-surface-container rounded-lg p-8 flex flex-col items-center text-center justify-center border-2 border-dashed border-outline-variant/30">
<span class="material-symbols-outlined text-5xl text-primary mb-4">auto_stories</span>
<h4 class="font-serif text-2xl font-bold mb-4">Gói Hội Viên Thân Thiết</h4>
<p class="text-on-surface-variant text-sm mb-6 leading-relaxed">Nhận ưu đãi 20% cho tất cả đơn hàng và truy cập thư viện ebook độc quyền.</p>
<button class="w-full py-3 border-2 border-primary text-primary font-bold rounded-lg hover:bg-primary hover:text-white transition-all">Tham Gia Ngay</button>
</div>
</div>
</section>
<!-- New Arrivals Section -->
<section class="bg-surface-container-low py-24">
<div class="max-w-[1440px] mx-auto px-12">
<div class="flex justify-between items-end mb-16">
<div>
<h2 class="font-serif text-4xl font-bold text-on-surface mb-2">Sách Mới Về</h2>
<p class="font-body text-on-surface-variant">Những tựa sách vừa cập bến Digital Atelier tuần này.</p>
</div>
</div>
<div class="grid grid-cols-4 gap-10">
<!-- Book Card 1 -->
<div class="group">
<div class="aspect-[2/3] bg-surface-container-lowest rounded-lg overflow-hidden relative mb-6 book-card-shadow">
<img alt="Book cover" class="w-full h-full object-cover transition-transform duration-500 group-hover:scale-110" data-alt="a modern book cover with abstract blue and gold geometric shapes titled The Celestial Map" src="https://lh3.googleusercontent.com/aida-public/AB6AXuA7wrUg_LnHQo_RDmPALIuNYdoHFGujYAKoh4CntkYmkAfH4F4n42WzSL5RNOSG76ISD-GV36npUZnVFfe0p3LqVtaAYgGL3CT147VE4TBkFg2SQ0sIP8A83OyGIq-u8xdoQ_maKQoHiRLTI9K2MCVEsWr4P92trylgZZ7tG6FoZYl42OuAIP1rbfTtFM3PgYhwvRG-Q2Z7qIi4iagOjiPf6u-mxzibqoT96AgH5-mQTfZGTj0nEvWEjesFNCceHlXOH0It2xuCP8D2"/>
<button class="absolute bottom-4 left-4 right-4 bg-primary text-on-primary py-3 rounded-lg font-bold opacity-0 translate-y-4 group-hover:opacity-100 group-hover:translate-y-0 transition-all duration-300 flex items-center justify-center gap-2">
<span class="material-symbols-outlined text-sm">shopping_cart</span>
                                Thêm Vào Giỏ
                            </button>
</div>
<h3 class="font-serif text-xl font-bold mb-1 group-hover:text-primary transition-colors">Bản Đồ Thiên Hà</h3>
<p class="text-on-surface-variant text-sm mb-3">Elena Vance</p>
<div class="flex items-center gap-2">
<span class="text-primary font-bold text-lg">245.000đ</span>
<span class="text-on-surface-variant/50 line-through text-sm">320.000đ</span>
</div>
</div>
<!-- Book Card 2 -->
<div class="group">
<div class="aspect-[2/3] bg-surface-container-lowest rounded-lg overflow-hidden relative mb-6 book-card-shadow">
<img alt="Book cover" class="w-full h-full object-cover transition-transform duration-500 group-hover:scale-110" data-alt="minimalist cream book cover with a single delicate hand-drawn leaf illustration titled Seasons of Soul" src="https://lh3.googleusercontent.com/aida-public/AB6AXuAEVeJq03ZUKo8_QILAHvzsgll1ed4afKgTo179WYTpVykFmC_nh6ecQF39uheuIDjMRd9Nksr4Qdu8KsW_7Ulf1da7zR_ueMEaNY4vAUTpwyEvqU-cxstVL-3nPbEPqQjioqRiuL9ZS0zCgrtomPOVDtikKKsg5R8t9ETvOsNjBb--tC6OI6X8stbBpoZ_wIBXK8edkZ8XjptPw1QRWPBNJXDGrQr1VVBPL18wjYW7RT55bAbAM7iOtlX4rJbvyChT912ryYqyl0Jb"/>
<button class="absolute bottom-4 left-4 right-4 bg-primary text-on-primary py-3 rounded-lg font-bold opacity-0 translate-y-4 group-hover:opacity-100 group-hover:translate-y-0 transition-all duration-300 flex items-center justify-center gap-2">
<span class="material-symbols-outlined text-sm">shopping_cart</span>
                                Thêm Vào Giỏ
                            </button>
</div>
<h3 class="font-serif text-xl font-bold mb-1 group-hover:text-primary transition-colors">Mùa Trong Tâm Hồn</h3>
<p class="text-on-surface-variant text-sm mb-3">Minh Nhật</p>
<div class="flex items-center gap-2">
<span class="text-primary font-bold text-lg">189.000đ</span>
</div>
</div>
<!-- Book Card 3 -->
<div class="group">
<div class="aspect-[2/3] bg-surface-container-lowest rounded-lg overflow-hidden relative mb-6 book-card-shadow">
<img alt="Book cover" class="w-full h-full object-cover transition-transform duration-500 group-hover:scale-110" data-alt="bold red and black typography on white book cover titled Crimson Echoes by Arthur Thorne" src="https://lh3.googleusercontent.com/aida-public/AB6AXuC9fWbpSl6Yw03a6radvbIE-rpf95F_VwniwOh3cAduECNqLmKu4E_n-qIQcjdQzVLmERb4TUY4jDwEU33PrvA3aamVsUGXH-u7QKcwiwBs2niJlMb9xBEWfpTWJnQ5Y3xcyFX6PDQeZqEotY1A7xPZNp4r1SN-cAxXlKEGzyvFv5vFn7EKzuGaqUuQHyLuRx1UIB23mnu8j7JLEHL67fmJ93pajH7YhxSJZ8-mltEwvXpVkPJHHj-7q194V6kXV33JXWoUuJ4Ix6zT"/>
<button class="absolute bottom-4 left-4 right-4 bg-primary text-on-primary py-3 rounded-lg font-bold opacity-0 translate-y-4 group-hover:opacity-100 group-hover:translate-y-0 transition-all duration-300 flex items-center justify-center gap-2">
<span class="material-symbols-outlined text-sm">shopping_cart</span>
                                Thêm Vào Giỏ
                            </button>
</div>
<h3 class="font-serif text-xl font-bold mb-1 group-hover:text-primary transition-colors">Tiếng Vọng Đỏ</h3>
<p class="text-on-surface-variant text-sm mb-3">Arthur Thorne</p>
<div class="flex items-center gap-2">
<span class="text-primary font-bold text-lg">210.000đ</span>
</div>
</div>
<!-- Book Card 4 -->
<div class="group">
<div class="aspect-[2/3] bg-surface-container-lowest rounded-lg overflow-hidden relative mb-6 book-card-shadow">
<img alt="Book cover" class="w-full h-full object-cover transition-transform duration-500 group-hover:scale-110" data-alt="illustration of a dense forest with a small cabin in the center on a book cover titled Into the Deep" src="https://lh3.googleusercontent.com/aida-public/AB6AXuA5kXl6rVkglyE2B1vNGxuH0boPFB1lKphMYLui5mVan22AXpAeQnmFSjCDavz779lS8FMn9VHzCg3-bFJQMI77q0-OUlGKjGecDBSSj0R51cBhl9y5Z5U_USdTnf5zBVPvftn4tQCUOUfZdytisg6lEwI9SgXkw742H6uWpepH6LwNLN8mVZ7GyXSnca1zRRh7keeJqwVoBcEVWDNqgJhkziqgop_TZsZEhP_4CFjvfXp5B6pAxQ5b-o16vbr9R17Yo5rwCDfxyzYb"/>
<button class="absolute bottom-4 left-4 right-4 bg-primary text-on-primary py-3 rounded-lg font-bold opacity-0 translate-y-4 group-hover:opacity-100 group-hover:translate-y-0 transition-all duration-300 flex items-center justify-center gap-2">
<span class="material-symbols-outlined text-sm">shopping_cart</span>
                                Thêm Vào Giỏ
                            </button>
</div>
<h3 class="font-serif text-xl font-bold mb-1 group-hover:text-primary transition-colors">Sâu Trong Khu Rừng</h3>
<p class="text-on-surface-variant text-sm mb-3">Linh Lan</p>
<div class="flex items-center gap-2">
<span class="text-primary font-bold text-lg">155.000đ</span>
</div>
</div>
</div>
</div>
</section>
<!-- Newsletter Section -->
<section class="max-w-[1440px] mx-auto px-12 py-24">
<div class="bg-primary-container rounded-lg p-16 flex items-center justify-between overflow-hidden relative">
<div class="relative z-10 max-w-lg">
<h2 class="font-serif text-4xl font-black text-on-primary-container mb-4">Gia Nhập Cộng Đồng Đọc Sách</h2>
<p class="text-on-primary-container/80 mb-8 font-body">Đăng ký nhận bản tin để cập nhật những đầu sách mới nhất và ưu đãi độc quyền hàng tháng.</p>
<div class="flex gap-2">
<input class="flex-1 px-6 py-4 rounded-lg bg-surface-container-lowest border-none focus:ring-2 focus:ring-primary font-body" placeholder="Email của bạn..." type="email"/>
<button class="bg-primary text-on-primary px-8 py-4 rounded-lg font-bold hover:bg-primary-dim transition-colors shadow-md">Đăng Ký</button>
</div>
</div>
<div class="absolute right-0 top-0 bottom-0 w-1/3 opacity-20 pointer-events-none">
<span class="material-symbols-outlined text-[300px] absolute -right-20 -top-20">history_edu</span>
</div>
</div>
</section>
</main>
<!-- Footer -->
<footer class="w-full mt-auto bg-[#fafcda] dark:bg-stone-900 border-t-0">
<div class="grid grid-cols-4 gap-12 px-12 py-16 max-w-[1440px] mx-auto">
<div class="col-span-1">
<a class="font-serif text-lg italic text-[#363b12] dark:text-stone-200 block mb-6" href="#">The Digital Atelier</a>
<p class="text-[#363b12]/70 dark:text-stone-400 font-sans text-sm leading-relaxed mb-6">Nơi hội tụ những tâm hồn yêu sách, lan tỏa tri thức và niềm đam mê văn chương qua những tác phẩm chọn lọc.</p>
<div class="flex gap-4">
<span class="material-symbols-outlined text-[#934b19] cursor-pointer">social_leaderboard</span>
<span class="material-symbols-outlined text-[#934b19] cursor-pointer">photo_camera</span>
<span class="material-symbols-outlined text-[#934b19] cursor-pointer">alternate_email</span>
</div>
</div>
<div class="col-span-1">
<h5 class="font-serif font-bold text-[#934b19] mb-6">Khám Phá</h5>
<ul class="space-y-4">
<li><a class="text-[#363b12]/70 dark:text-stone-400 hover:text-[#934b19] underline-offset-4 hover:underline transition-all duration-200 text-sm" href="#">Về Chúng Tôi</a></li>
<li><a class="text-[#363b12]/70 dark:text-stone-400 hover:text-[#934b19] underline-offset-4 hover:underline transition-all duration-200 text-sm" href="#">Hợp Tác</a></li>
<li><a class="text-[#363b12]/70 dark:text-stone-400 hover:text-[#934b19] underline-offset-4 hover:underline transition-all duration-200 text-sm" href="#">Tác Giả</a></li>
<li><a class="text-[#363b12]/70 dark:text-stone-400 hover:text-[#934b19] underline-offset-4 hover:underline transition-all duration-200 text-sm" href="#">Tin Tức</a></li>
</ul>
</div>
<div class="col-span-1">
<h5 class="font-serif font-bold text-[#934b19] mb-6">Hỗ Trợ</h5>
<ul class="space-y-4">
<li><a class="text-[#363b12]/70 dark:text-stone-400 hover:text-[#934b19] underline-offset-4 hover:underline transition-all duration-200 text-sm" href="#">Chính Sách Vận Chuyển</a></li>
<li><a class="text-[#363b12]/70 dark:text-stone-400 hover:text-[#934b19] underline-offset-4 hover:underline transition-all duration-200 text-sm" href="#">Điều Khoản Sử Dụng</a></li>
<li><a class="text-[#363b12]/70 dark:text-stone-400 hover:text-[#934b19] underline-offset-4 hover:underline transition-all duration-200 text-sm" href="#">Câu Hỏi Thường Gặp</a></li>
<li><a class="text-[#363b12]/70 dark:text-stone-400 hover:text-[#934b19] underline-offset-4 hover:underline transition-all duration-200 text-sm" href="#">Liên Hệ</a></li>
</ul>
</div>
<div class="col-span-1">
<h5 class="font-serif font-bold text-[#934b19] mb-6">Văn Phòng</h5>
<p class="text-[#363b12]/70 dark:text-stone-400 text-sm leading-relaxed mb-2">123 Đường Sách, Quận 1</p>
<p class="text-[#363b12]/70 dark:text-stone-400 text-sm leading-relaxed mb-2">Thành phố Hồ Chí Minh, Việt Nam</p>
<p class="text-[#363b12]/70 dark:text-stone-400 text-sm leading-relaxed">+84 (0) 28 3823 4567</p>
</div>
</div>
<div class="max-w-[1440px] mx-auto px-12 py-8 border-t border-[#363b12]/10 flex justify-between items-center">
<p class="text-[#363b12]/50 dark:text-stone-500 text-xs">© 2024 The Digital Atelier. Crafted for the curious mind.</p>
<div class="flex gap-6">
<span class="text-[#363b12]/50 text-xs">Privacy</span>
<span class="text-[#363b12]/50 text-xs">Cookies</span>
</div>
</div>
</footer>
</body></html>