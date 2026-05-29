<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="light" lang="vi">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>Trang Chủ | The Digital Atelier</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif:ital,wght@0,400;0,700;0,900;1,400&family=Be+Vietnam+Pro:wght@300;400;500;600;700&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <script id="tailwind-config">
          tailwind.config = {
            darkMode: "class",
            theme: {
              extend: {
                "colors": {
                        "primary": "#934b19",
                        "on-background": "#363b12",
                        "on-primary": "#fff6f2",
                        "surface": "#fefee5",
                        "background": "#fefee5",
                        "on-surface": "#363b12",
                        "inverse-on-surface": "#9e9e88",
                        "on-primary-fixed-variant": "#8f4816",
                        "primary-container": "#ffdbc9",
                        "secondary-fixed-dim": "#f0cfa5",
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
                        "surface-dim": "#e1e8a7",
                        "outline-variant": "#b8bd88",
                        "on-secondary-container": "#654e2d",
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
                        "body": ["Be Vietnam Pro"]
                }
              },
            },
          }
        </script>
    <style>
            body { font-family: 'Be Vietnam Pro', sans-serif; background-color: #fefee5; color: #363b12; }
            .font-serif { font-family: 'Noto Serif', serif; }
            .material-symbols-outlined { font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24; }
            .hero-gradient { background: linear-gradient(to right, #fefee5 20%, transparent 100%); }
            .book-card-shadow { box-shadow: 0 4px 20px -2px rgba(147, 75, 25, 0.08); }
    </style>
</head>
<body class="bg-background text-on-surface">
    <header class="w-full top-0 sticky z-50 bg-[#fefee5] shadow-sm">
        <nav class="flex justify-between items-center w-full px-12 py-6 max-w-[1440px] mx-auto">
            <div class="flex items-center gap-12">
                <a class="font-serif text-2xl font-black text-[#363b12]" href="${pageContext.request.contextPath}/home">The Digital Atelier</a>
                <div class="hidden md:flex gap-8">
                    <a class="text-[#363b12] hover:text-[#934b19] transition-colors font-serif font-bold text-xl cursor-pointer" href="#">Sách Mới</a>
                    <a class="text-[#363b12] hover:text-[#934b19] transition-colors font-serif font-bold text-xl cursor-pointer" href="${pageContext.request.contextPath}/bestsellers">Bán Chạy</a>
                    <a class="text-[#363b12] hover:text-[#934b19] transition-colors font-serif font-bold text-xl cursor-pointer" href="${pageContext.request.contextPath}/categories">Chủ Đề</a>
                    <a class="text-[#363b12] hover:text-[#934b19] transition-colors font-serif font-bold text-xl cursor-pointer" href="${pageContext.request.contextPath}/authors">Tác Giả</a> <%-- FIXED: Updated link --%>
                </div>
            </div>
            <div class="flex items-center gap-6">
                <div class="relative flex items-center bg-orange-50 px-4 py-2 rounded-lg">
                    <span class="material-symbols-outlined text-gray-500 mr-2">search</span>
                    <input class="bg-transparent border-none focus:ring-0 text-sm w-48 font-body" placeholder="Tìm kiếm sách..." type="text"/>
                </div>
                <a href="${pageContext.request.contextPath}/cart" class="hover:bg-orange-50 rounded-lg transition-all p-2 active:scale-95">
                    <span class="material-symbols-outlined text-[#934b19]">shopping_cart</span>
                </a>

                <div class="flex items-center gap-4">
                    <div class="flex flex-col items-end">
                        <span class="text-sm font-bold text-primary"><sec:authentication property="principal.username" /></span>
                        <form action="${pageContext.request.contextPath}/logout" method="POST" class="inline">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <button type="submit" class="text-xs text-red-600 hover:underline">Đăng xuất</button>
                        </form>
                    </div>
                    <span class="material-symbols-outlined text-[#934b19]">person</span>
                </div>
            </div>
        </nav>
    </header>

    <main>
        <section class="relative h-[600px] overflow-hidden bg-orange-50">
            <div class="absolute inset-0 z-0">
                <img alt="Atmospheric library" class="w-full h-full object-cover opacity-30 mix-blend-multiply" src="https://lh3.googleusercontent.com/aida-public/AB6AXuCVGbX4_IVAg_bnK9IE6a_tC3sq4wWIcMRYlTVpPGxbvOvz8AFqMi-N-9FhJGSjeuI8mBvO1J5sm97FYXqCqFcyyX3tNa5CkdYgZmSTZOj1pqv72c0LKOw_B_uMFYtG_TaipAEGgsG4a5UDaB2GfIvT4h7YBZo89OYANRCwT_8VmBJaSYX6SgEMu4C839MTjP_zwSB7FgeU2EnXeq4Qlg-3lDllSfrOi1lXw5uHrJF6YfhcrF4kviTmhqKoPSvtpV4obvwaa50lMNO3e2"/>
                <div class="absolute inset-0 hero-gradient"></div>
            </div>
            <div class="relative z-10 max-w-[1440px] mx-auto px-12 h-full flex flex-col justify-center items-start">
                <span class="text-primary font-body font-semibold tracking-widest uppercase mb-4">Bộ Sưu Tập Mùa Thu</span>
                <h1 class="font-serif text-7xl font-black text-on-surface leading-tight mb-6 max-w-2xl">Đánh Thức Tâm Hồn Qua Từng Trang Sách.</h1>
                <p class="font-body text-xl text-on-surface-variant mb-10 max-w-xl leading-relaxed">
                    Khám phá những tác phẩm văn học kinh điển và hiện đại được tuyển chọn kỹ lưỡng cho những tâm hồn tò mò.
                </p>
                <div class="flex gap-4">
                    <button class="bg-primary hover:bg-orange-800 text-on-primary px-10 py-4 rounded-lg font-body font-bold transition-all shadow-lg">Khám Phá Ngay</button>
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
                <c:if test="${not empty books and books.size() > 0}">
                    <div class="col-span-6 bg-surface-container-lowest rounded-lg overflow-hidden group cursor-pointer relative book-card-shadow">
                        <a href="${pageContext.request.contextPath}/books/${books[0].id}">
                            <img alt="${books[0].title}" class="w-full h-full object-cover transition-transform duration-700 group-hover:scale-105" src="${books[0].imageUrl}"/>
                            <div class="absolute bottom-0 left-0 right-0 p-8 bg-gradient-to-t from-black/80 to-transparent text-white">
                                <span class="bg-primary px-3 py-1 text-xs font-bold rounded mb-4 inline-block">SÁCH CỦA THÁNG</span>
                                <h3 class="font-serif text-3xl font-bold mb-2">${books[0].title}</h3>
                                <p class="text-white/80 mb-4 line-clamp-2">Tác giả: ${books[0].author}. Giá: <fmt:formatNumber value="${books[0].price}" type="number" groupingUsed="true"/>đ</p>
                                <button class="bg-white text-black px-6 py-2 rounded font-bold text-sm">Tìm Hiểu Thêm</button>
                            </div>
                        </a>
                    </div>
                </c:if>
                <c:if test="${empty books or books.size() == 0}">
                    <div class="col-span-6 bg-surface-container-lowest rounded-lg overflow-hidden relative book-card-shadow flex items-center justify-center">
                        <p class="text-on-surface-variant">Không có sách tiêu biểu nào.</p>
                    </div>
                </c:if>

                <!-- Secondary Featured Cards -->
                <div class="col-span-3 grid grid-rows-2 gap-8">
                    <div class="bg-surface-container-high rounded-lg p-6 flex flex-col justify-between hover:bg-surface-container-highest transition-colors cursor-pointer group">
                        <div>
                            <h4 class="font-serif text-xl font-bold text-on-surface mb-2">Văn Chương Cổ Điển</h4>
                            <p class="text-sm text-on-surface-variant font-body">Sống lại những giá trị vượt thời gian.</p>
                        </div>
                        <img alt="Classic books" class="w-32 self-end transform group-hover:rotate-12 transition-transform duration-500" src="https://lh3.googleusercontent.com/aida-public/AB6AXuDauhZI-y8LBW3lxJNGbBoW8DI32VxzS-pXLk2Oujvk-AcnCKGhvt0W6dLe54EHU9v6lG7GBykbZGuoadQTHZZPaEIr-R56RgG4qzAhzJcGXhn3vnWSXikFtv-irM5LgWN2ZFbTzYPcrBpPQBf1pI-LxXkqXgTLT9kEDSHoDqeBX7AldliGGls2OlKd7tB_ljEsIeXiF0ueHomqfd5AVHMYebAZ0mrgsvcqKyHBdGozvn6o_ZQNbOKEdY4wA9KT1zvM3bCPPAuiZnh"/>
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

        <section class="max-w-[1440px] mx-auto px-12 py-24">
            <div class="flex justify-between items-end mb-16">
                <div>
                    <h2 class="font-serif text-4xl font-bold text-on-surface mb-2">Sách Mới Về</h2>
                    <p class="font-body text-gray-600">Những tựa sách vừa cập bến Digital Atelier tuần này.</p>
                </div>
            </div>

            <!-- HIỂN THỊ SÁCH ĐỘNG TỪ DATABASE -->
            <div class="grid grid-cols-4 gap-10">
                <c:forEach items="${books}" var="book">
                    <div class="group">
                        <div class="aspect-[2/3] bg-white rounded-lg overflow-hidden relative mb-6 shadow-sm border border-gray-100">
                            <a href="${pageContext.request.contextPath}/books/${book.id}">
                                <img alt="${book.title}" class="w-full h-full object-cover transition-transform duration-500 group-hover:scale-110" src="${book.imageUrl}"/>
                            </a>
                            <form action="${pageContext.request.contextPath}/cart/add" method="post">
                                <input type="hidden" name="bookId" value="${book.id}"/>
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <button type="submit" class="absolute bottom-4 left-4 right-4 bg-primary text-on-primary py-3 rounded-lg font-bold opacity-0 translate-y-4 group-hover:opacity-100 group-hover:translate-y-0 transition-all duration-300 flex items-center justify-center gap-2">
                                    <span class="material-symbols-outlined text-sm">shopping_cart</span> Thêm Vào Giỏ
                                </button>
                            </form>
                        </div>
                        <a href="${pageContext.request.contextPath}/books/${book.id}">
                            <h3 class="font-serif text-xl font-bold mb-1 group-hover:text-primary transition-colors">${book.title}</h3>
                        </a>
                        <p class="text-gray-500 text-sm mb-3">${book.author.name}</p> <%-- Changed to book.author.name --%>
                        <div class="flex items-center gap-2">
                            <span class="text-primary font-bold text-lg">
                                <fmt:formatNumber value="${book.price}" type="number" groupingUsed="true"/>đ
                            </span>
                            <c:if test="${book.oldPrice != null}">
                                <span class="text-gray-300 line-through text-sm">
                                    <fmt:formatNumber value="${book.oldPrice}" type="number" groupingUsed="true"/>đ
                                </span>
                            </c:if>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </section>
    </main>

    <footer class="w-full mt-auto bg-orange-50 border-t border-orange-100">
        <div class="grid grid-cols-4 gap-12 px-12 py-16 max-w-[1440px] mx-auto">
            <div class="col-span-1">
                <a class="font-serif text-lg italic text-[#363b12] block mb-6" href="#">The Digital Atelier</a>
                <p class="text-gray-600 font-sans text-sm leading-relaxed mb-6">Nơi hội tụ những tâm hồn yêu sách, lan tỏa tri thức và niềm đam mê văn chương.</p>
            </div>
            <div class="col-span-1">
                <h5 class="font-serif font-bold text-[#934b19] mb-6">Khám Phá</h5>
                <ul class="space-y-4 text-sm text-gray-600">
                    <li><a class="hover:text-[#934b19]" href="#">Về Chúng Tôi</a></li>
                    <li><a class="hover:text-[#934b19]" href="#">Hợp Tác</a></li>
                </ul>
            </div>
            <div class="col-span-1">
                <h5 class="font-serif font-bold text-[#934b19] mb-6">Hỗ Trợ</h5>
                <ul class="space-y-4 text-sm text-gray-600">
                    <li><a class="hover:text-[#934b19]" href="#">Chính Sách Vận Chuyển</a></li>
                    <li><a class="hover:text-[#934b19]" href="#">Liên Hệ</a></li>
                </ul>
            </div>
            <div class="col-span-1">
                <h5 class="font-serif font-bold text-[#934b19] mb-6">Văn Phòng</h5>
                <p class="text-gray-600 text-sm mb-2">123 Đường Sách, Quận 1</p>
                <p class="text-gray-600 text-sm">TP. Hồ Chí Minh, Việt Nam</p>
            </div>
        </div>
        <div class="max-w-[1440px] mx-auto px-12 py-8 border-t border-orange-100 flex justify-between items-center text-xs text-gray-400">
            <p>© 2024 The Digital Atelier. Crafted for the curious mind.</p>
        </div>
    </footer>
</body>
</html>
