<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html class="light" lang="vi">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>Giỏ Hàng | The Digital Atelier</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif:ital,wght@0,400;0,700;0,900;1,400&family=Be+Vietnam+Pro:wght@300;400;500;600;700&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
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
            body { font-family: 'Be Vietnam Pro', sans-serif; }
            h1, h2, h3, h4, .font-serif { font-family: 'Noto Serif', serif; }
            .material-symbols-outlined { font-variation-settings: 'FILL' 0, 'wght' 300, 'GRAD' 0, 'opsz' 24; }
    </style>
</head>
<body class="bg-background text-on-surface min-h-screen flex flex-col selection:bg-primary-container selection:text-on-primary-container">
    <!-- TopNavBar -->
    <nav class="w-full top-0 sticky z-50 bg-[#fefee5] dark:bg-stone-950 shadow-sm dark:shadow-none">
        <div class="flex justify-between items-center w-full px-12 py-6 max-w-[1440px] mx-auto">
            <div class="flex items-center gap-12">
                <a class="font-serif text-2xl font-black text-[#363b12] dark:text-stone-100 tracking-tight" href="${pageContext.request.contextPath}/home">The Digital Atelier</a>
                <div class="hidden md:flex items-center gap-8 font-serif font-bold tracking-tight text-xl">
                    <a class="text-[#363b12] dark:text-stone-400 hover:text-[#934b19] transition-colors" href="#">Sách Mới</a>
                    <a class="text-[#363b12] dark:text-stone-400 hover:text-[#934b19] transition-colors" href="#">Bán Chạy</a>
                    <a class="text-[#363b12] dark:text-stone-400 hover:text-[#934b19] transition-colors" href="#">Chủ Đề</a>
                    <a class="text-[#363b12] dark:text-stone-400 hover:text-[#934b19] transition-colors" href="#">Tác Giả</a>
                </div>
            </div>
            <div class="flex items-center gap-6">
                <div class="relative group">
                    <span class="material-symbols-outlined cursor-pointer text-[#363b12] p-2 hover:bg-[#fafcda] rounded-lg transition-all">search</span>
                </div>
                <div class="relative active:scale-95 transition-transform cursor-pointer">
                    <a href="${pageContext.request.contextPath}/cart">
                        <span class="material-symbols-outlined text-[#934b19] p-2 bg-[#fafcda] rounded-lg">shopping_cart</span>
                    </a>
                    <span class="absolute -top-1 -right-1 bg-primary text-on-primary text-[10px] w-4 h-4 flex items-center justify-center rounded-full font-bold">3</span>
                </div>

                <!-- Hiển thị tên người dùng và nút Đăng xuất -->
                <div class="flex items-center gap-4">
                    <div class="flex flex-col items-end">
                        <span class="text-xs font-bold text-primary"><sec:authentication property="principal.username" /></span>
                        <form action="${pageContext.request.contextPath}/logout" method="POST" class="inline">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <button type="submit" class="text-[10px] text-red-600 hover:underline">Đăng xuất</button>
                        </form>
                    </div>
                    <span class="material-symbols-outlined cursor-pointer text-[#363b12] p-2 hover:bg-[#fafcda] rounded-lg transition-all">person</span>
                </div>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <main class="flex-grow max-w-[1440px] mx-auto w-full px-12 py-12">
        <header class="mb-12">
            <h1 class="text-5xl font-black tracking-tight text-on-surface mb-2">Giỏ Hàng</h1>
            <p class="text-on-surface-variant italic font-serif">Bạn đang có 3 ấn phẩm trong túi xách trí tuệ của mình.</p>
        </header>
        <div class="grid grid-cols-12 gap-12 items-start">
            <!-- Cart Items Table -->
            <div class="col-span-8">
                <div class="bg-surface-container-low rounded-xl overflow-hidden">
                    <div class="grid grid-cols-12 px-8 py-6 border-b border-outline-variant/10 text-xs font-bold uppercase tracking-widest text-on-surface-variant">
                        <div class="col-span-6">Sản phẩm</div>
                        <div class="col-span-2 text-center">Đơn giá</div>
                        <div class="col-span-2 text-center">Số lượng</div>
                        <div class="col-span-2 text-right">Tổng cộng</div>
                    </div>
                    <!-- Item 1 -->
                    <div class="grid grid-cols-12 px-8 py-10 items-center hover:bg-surface-container-high/30 transition-colors">
                        <div class="col-span-6 flex items-center gap-6">
                            <div class="w-24 h-36 bg-surface-container-highest rounded shadow-sm overflow-hidden flex-shrink-0 relative">
                                <img class="w-full h-full object-cover" src="https://lh3.googleusercontent.com/aida-public/AB6AXuA_uZAh9Zdoc69m1OKT2ml7-oh4Ly5Ic7qP_tzHVRkUyPDTOL3spaOkX9LolSZrwWZ_CIFuJQhS0yXqjLPfYidTlNbIiVnpWI2fJyev31SZQjtpcxZ9Di8TcHOxK3sr2FREIZZDbjDAdQOBC8OkYgEnUzHciJDXigneGiGhZb1XPk2Tfk1pWO-b2CclC9bLxvTjaU_xnolEFRlsKNTYQ-imcA2uYMfA-2Rv7KLjZHH8HsIqHRLQ1W2NbLLPSbJd_sHBR0WcIqXrWh4I"/>
                            </div>
                            <div>
                                <h3 class="font-serif text-xl font-bold text-on-surface leading-tight mb-1">Kiến Trúc Của Sự Yên Lặng</h3>
                                <p class="text-sm text-on-surface-variant mb-3">Tác giả: Minh Triết</p>
                                <button class="flex items-center gap-1 text-xs font-semibold text-error/80 hover:text-error transition-colors uppercase tracking-wider">
                                    <span class="material-symbols-outlined text-sm">delete</span>
                                    Gỡ bỏ
                                </button>
                            </div>
                        </div>
                        <div class="col-span-2 text-center font-medium">245.000₫</div>
                        <div class="col-span-2 flex justify-center">
                            <div class="flex items-center bg-surface-container-lowest rounded-full p-1 border border-outline-variant/15">
                                <button class="w-8 h-8 flex items-center justify-center hover:bg-surface-container rounded-full transition-colors">
                                    <span class="material-symbols-outlined text-lg">remove</span>
                                </button>
                                <span class="w-10 text-center font-bold">1</span>
                                <button class="w-8 h-8 flex items-center justify-center hover:bg-surface-container rounded-full transition-colors">
                                    <span class="material-symbols-outlined text-lg">add</span>
                                </button>
                            </div>
                        </div>
                        <div class="col-span-2 text-right font-serif font-bold text-lg text-primary">245.000₫</div>
                    </div>
                    <!-- Item 2 -->
                    <div class="grid grid-cols-12 px-8 py-10 items-center hover:bg-surface-container-high/30 transition-colors">
                        <div class="col-span-6 flex items-center gap-6">
                            <div class="w-24 h-36 bg-surface-container-highest rounded shadow-sm overflow-hidden flex-shrink-0">
                                <img class="w-full h-full object-cover" src="https://lh3.googleusercontent.com/aida-public/AB6AXuBPy_S9Xawv7Elqy2LkqchQdS7Qmq6xsOEup-vK-7nbBVJu4HzakDC2anU0a1UfttQKcypqX16eQBP60Y0EiZcQ0oolgRCWLjKrRHDMzj2YunqFPvgTIG-DzO8BfvNb2wK41hF6VqsJNKu_EkRaSLlCOG3whI-ImrNNhl74-fXfMb0ROT4mmk185ZZB5EiGTVZh_kAtN4VXaTqhjzJvVaS4jaG7e1XM5Ad2Zs25yahpApMhTJ_5nNR17yFUa-4ta1aGFKGX307S5DkE"/>
                            </div>
                            <div>
                                <h3 class="font-serif text-xl font-bold text-on-surface leading-tight mb-1">Nghệ Thuật Thị Giác Hiện Đại</h3>
                                <p class="text-sm text-on-surface-variant mb-3">Tác giả: Elena V.</p>
                                <button class="flex items-center gap-1 text-xs font-semibold text-error/80 hover:text-error transition-colors uppercase tracking-wider">
                                    <span class="material-symbols-outlined text-sm">delete</span>
                                    Gỡ bỏ
                                </button>
                            </div>
                        </div>
                        <div class="col-span-2 text-center font-medium">320.000₫</div>
                        <div class="col-span-2 flex justify-center">
                            <div class="flex items-center bg-surface-container-lowest rounded-full p-1 border border-outline-variant/15">
                                <button class="w-8 h-8 flex items-center justify-center hover:bg-surface-container rounded-full transition-colors">
                                    <span class="material-symbols-outlined text-lg">remove</span>
                                </button>
                                <span class="w-10 text-center font-bold">2</span>
                                <button class="w-8 h-8 flex items-center justify-center hover:bg-surface-container rounded-full transition-colors">
                                    <span class="material-symbols-outlined text-lg">add</span>
                                </button>
                            </div>
                        </div>
                        <div class="col-span-2 text-right font-serif font-bold text-lg text-primary">640.000₫</div>
                    </div>
                    <!-- Item 3 -->
                    <div class="grid grid-cols-12 px-8 py-10 items-center hover:bg-surface-container-high/30 transition-colors">
                        <div class="col-span-6 flex items-center gap-6">
                            <div class="w-24 h-36 bg-surface-container-highest rounded shadow-sm overflow-hidden flex-shrink-0">
                                <img class="w-full h-full object-cover" src="https://lh3.googleusercontent.com/aida-public/AB6AXuABCE3T2RpjtAp111scXolKSu0x1DYMr7bIVnGpEseQXJVIiHbz52QFm_hVkzsjPqvwZ-quMQEdMFGIH5QOWgKYg2B1lmxzPdLdc_OumxPgmMs7vzp8R0MdcwDqc8vR9baaF-F0zJFEKq4bOHcfAN6_2R987ljaDJX8ZDrp9lGUiFNqhEWzaX8A60iXy6_exDwJe24V2apPbwXhFDrtMKwdwDyDKaYBLOaQtsJTbam9UiY_FBYEwdOGo_OkubPB6cR4boinhm3oKtwD"/>
                            </div>
                            <div>
                                <h3 class="font-serif text-xl font-bold text-on-surface leading-tight mb-1">Tuyển Tập Thơ Di Sản</h3>
                                <p class="text-sm text-on-surface-variant mb-3">Nhiều tác giả</p>
                                <button class="flex items-center gap-1 text-xs font-semibold text-error/80 hover:text-error transition-colors uppercase tracking-wider">
                                    <span class="material-symbols-outlined text-sm">delete</span>
                                    Gỡ bỏ
                                </button>
                            </div>
                        </div>
                        <div class="col-span-2 text-center font-medium">185.000₫</div>
                        <div class="col-span-2 flex justify-center">
                            <div class="flex items-center bg-surface-container-lowest rounded-full p-1 border border-outline-variant/15">
                                <button class="w-8 h-8 flex items-center justify-center hover:bg-surface-container rounded-full transition-colors">
                                    <span class="material-symbols-outlined text-lg">remove</span>
                                </button>
                                <span class="w-10 text-center font-bold">1</span>
                                <button class="w-8 h-8 flex items-center justify-center hover:bg-surface-container rounded-full transition-colors">
                                    <span class="material-symbols-outlined text-lg">add</span>
                                </button>
                            </div>
                        </div>
                        <div class="col-span-2 text-right font-serif font-bold text-lg text-primary">185.000₫</div>
                    </div>
                </div>
                <div class="mt-8 flex justify-between items-center px-4">
                    <a class="group flex items-center gap-2 text-primary font-bold hover:gap-4 transition-all" href="${pageContext.request.contextPath}/home">
                        <span class="material-symbols-outlined">arrow_back</span>
                        Tiếp tục chọn sách
                    </a>
                    <button class="text-on-surface-variant hover:text-primary transition-colors flex items-center gap-2 text-sm font-medium">
                        Làm trống giỏ hàng
                        <span class="material-symbols-outlined text-lg">delete_sweep</span>
                    </button>
                </div>
            </div>
            <!-- Summary Panel -->
            <aside class="col-span-4 sticky top-32">
                <div class="bg-surface-container p-8 rounded-xl shadow-sm space-y-8">
                    <h2 class="font-serif text-2xl font-bold text-on-surface">Tóm tắt đơn hàng</h2>
                    <div class="space-y-4">
                        <div class="flex justify-between items-center text-on-surface-variant">
                            <span>Tạm tính (4 sản phẩm)</span>
                            <span class="font-medium text-on-surface">1.070.000₫</span>
                        </div>
                        <div class="flex justify-between items-center text-on-surface-variant">
                            <span>Phí vận chuyển</span>
                            <span class="font-medium text-on-surface">Miễn phí</span>
                        </div>
                        <div class="flex justify-between items-center text-on-surface-variant">
                            <span>Ưu đãi hội viên</span>
                            <span class="font-medium text-error">- 50.000₫</span>
                        </div>
                    </div>
                    <div class="pt-6 border-t border-outline-variant/30">
                        <label class="block text-xs font-bold uppercase tracking-wider text-on-surface-variant mb-3">Mã giảm giá</label>
                        <div class="flex gap-2">
                            <input class="flex-grow bg-surface-container-high border-none rounded-lg px-4 py-3 text-sm focus:ring-1 focus:ring-primary/20 placeholder:text-on-surface-variant/40" placeholder="Nhập mã của bạn..." type="text"/>
                            <button class="px-6 py-3 bg-surface-container-highest text-primary font-bold text-sm rounded-lg hover:bg-white transition-colors">Áp dụng</button>
                        </div>
                    </div>
                    <div class="pt-6">
                        <div class="flex justify-between items-end mb-8">
                            <div>
                                <p class="text-xs font-bold uppercase tracking-widest text-on-surface-variant mb-1">Tổng cộng</p>
                                <p class="text-sm text-on-surface-variant italic">Bao gồm VAT</p>
                            </div>
                            <span class="font-serif text-4xl font-black text-primary tracking-tight">1.020.000₫</span>
                        </div>
                        <button class="w-full py-5 bg-gradient-to-r from-primary to-primary-dim text-on-primary rounded-lg font-bold text-lg shadow-lg hover:shadow-xl active:scale-[0.98] transition-all flex items-center justify-center gap-3">
                            Tiến Hành Thanh Toán
                            <span class="material-symbols-outlined">arrow_forward</span>
                        </button>
                        <div class="mt-6 flex flex-wrap justify-center gap-4 opacity-40">
                            <span class="material-symbols-outlined text-2xl">credit_card</span>
                            <span class="material-symbols-outlined text-2xl">account_balance</span>
                            <span class="material-symbols-outlined text-2xl">payments</span>
                        </div>
                    </div>
                </div>
                <!-- Reading Progress Tip -->
                <div class="mt-6 bg-secondary-container/30 p-6 rounded-xl flex items-center gap-4">
                    <div class="w-12 h-12 rounded-full bg-secondary-container flex items-center justify-center text-on-secondary-container">
                        <span class="material-symbols-outlined">auto_stories</span>
                    </div>
                    <div>
                        <p class="text-sm font-bold text-on-secondary-container">Đặc quyền hội viên</p>
                        <p class="text-xs text-on-secondary-container/80">Bạn còn thiếu 480.000₫ để nhận thêm bộ bookmark gỗ thủ công.</p>
                    </div>
                </div>
            </aside>
        </div>
    </main>

    <!-- Footer -->
    <footer class="w-full mt-auto bg-[#fafcda] dark:bg-stone-900 border-t-0">
        <div class="grid grid-cols-4 gap-12 px-12 py-16 max-w-[1440px] mx-auto">
            <div class="col-span-1">
                <a class="font-serif text-lg italic text-[#363b12] dark:text-stone-200 block mb-6" href="#">The Digital Atelier</a>
                <p class="font-sans text-sm leading-relaxed text-[#363b12]/70 dark:text-stone-400">© 2024 The Digital Atelier. Crafted for the curious mind. Nơi tri thức được trân trọng như một tác phẩm nghệ thuật.</p>
            </div>
            <div>
                <h4 class="font-serif font-bold text-[#934b19] mb-6">Khám Phá</h4>
                <ul class="space-y-3 font-sans text-sm leading-relaxed text-[#363b12]/70 dark:text-stone-400">
                    <li><a class="hover:text-[#934b19] underline-offset-4 hover:underline transition-all duration-200" href="#">Về Chúng Tôi</a></li>
                    <li><a class="hover:text-[#934b19] underline-offset-4 hover:underline transition-all duration-200" href="#">Hợp Tác</a></li>
                    <li><a class="hover:text-[#934b19] underline-offset-4 hover:underline transition-all duration-200" href="#">Câu Hỏi Thường Gặp</a></li>
                </ul>
            </div>
            <div>
                <h4 class="font-serif font-bold text-[#934b19] mb-6">Dịch Vụ</h4>
                <ul class="space-y-3 font-sans text-sm leading-relaxed text-[#363b12]/70 dark:text-stone-400">
                    <li><a class="hover:text-[#934b19] underline-offset-4 hover:underline transition-all duration-200" href="#">Chính Sách Vận Chuyển</a></li>
                    <li><a class="hover:text-[#934b19] underline-offset-4 hover:underline transition-all duration-200" href="#">Điều Khoản Sử Dụng</a></li>
                    <li><a class="hover:text-[#934b19] underline-offset-4 hover:underline transition-all duration-200" href="#">Liên Hệ</a></li>
                </ul>
            </div>
            <div>
                <h4 class="font-serif font-bold text-[#934b19] mb-6">Kết Nối</h4>
                <div class="flex gap-4">
                    <a class="w-10 h-10 rounded-full bg-surface-container-high flex items-center justify-center text-[#363b12] hover:bg-primary hover:text-on-primary transition-all" href="#">
                        <span class="material-symbols-outlined text-xl">share</span>
                    </a>
                    <a class="w-10 h-10 rounded-full bg-surface-container-high flex items-center justify-center text-[#363b12] hover:bg-primary hover:text-on-primary transition-all" href="#">
                        <span class="material-symbols-outlined text-xl">mail</span>
                    </a>
                </div>
                <div class="mt-8">
                    <p class="text-xs font-bold uppercase tracking-widest text-[#363b12]/40 mb-2">Đăng ký nhận tin</p>
                    <div class="flex border-b border-[#363b12]/10 pb-2">
                        <input class="bg-transparent border-none focus:ring-0 text-sm flex-grow p-0" placeholder="Email của bạn" type="email"/>
                        <span class="material-symbols-outlined cursor-pointer text-[#934b19]">arrow_forward</span>
                    </div>
                </div>
            </div>
        </div>
    </footer>
</body>
</html>
