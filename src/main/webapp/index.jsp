<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="light" lang="vi">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>The Digital Atelier - Trang chủ</title>
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
                <!-- Cập nhật link dẫn đến trang đăng nhập -->
                <a href="${pageContext.request.contextPath}/login" class="hover:bg-[#fafcda] dark:hover:bg-stone-800 rounded-lg transition-all duration-300 p-2 cursor-pointer active:scale-95">
                    <span class="material-symbols-outlined text-[#934b19] dark:text-[#d27d42]">person</span>
                </a>
            </div>
        </nav>
    </header>

    <main>
        <!-- Hero Section -->
        <section class="relative h-[600px] overflow-hidden bg-surface-container-low">
            <div class="absolute inset-0 z-0">
                <img alt="Atmospheric library" class="w-full h-full object-cover opacity-30 mix-blend-multiply" src="https://lh3.googleusercontent.com/aida-public/AB6AXuCVGbX4_IVAg_bnK9IE6a_tC3sq4wWIcMRYlTVpPGxbvOvz8AFqMi-N-9FhJGSjeuI8mBvO1J5sm97FYCqFcyyX3tNa5CkdYgZmSTZOj1pqv72c0LKOw_B_uMFYtG_TaipAEGgsG4a5UDaB2GfIvT4h7YBZo89OYANRCwT_8VmBJaSYX6SgEMu4C839MTjP_zwSB7FgeU2EnXeq4Qlg-3lDllSfrOi1lXw5uHrJF6YfhcrF4kviTmhqKoPSvtpV4obvwaa50lMNO3e2"/>
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

        <!-- Các Section khác giữ nguyên nội dung của bạn... -->
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
        <!-- Nội dung Footer giữ nguyên... -->
        <div class="max-w-[1440px] mx-auto px-12 py-8 border-t border-[#363b12]/10 flex justify-between items-center">
            <p class="text-[#363b12]/50 dark:text-stone-500 text-xs">© 2024 The Digital Atelier. Crafted for the curious mind.</p>
            <div class="flex gap-6">
                <span class="text-[#363b12]/50 text-xs">Privacy</span>
                <span class="text-[#363b12]/50 text-xs">Cookies</span>
            </div>
        </div>
    </footer>
</body>
</html>