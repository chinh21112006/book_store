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
    </style>
</head>
<body class="bg-background text-on-surface">
    <header class="w-full top-0 sticky z-50 bg-[#fefee5] shadow-sm">
        <nav class="flex justify-between items-center w-full px-12 py-6 max-w-[1440px] mx-auto">
            <div class="flex items-center gap-12">
                <a class="font-serif text-2xl font-black text-[#363b12]" href="${pageContext.request.contextPath}/home">The Digital Atelier</a>
                <div class="hidden md:flex gap-8">
                    <a class="text-[#934b19] border-b-2 border-[#934b19] pb-1 font-serif font-bold text-xl cursor-pointer" href="#">Sách Mới</a>
                    <a class="text-[#363b12] hover:text-[#934b19] transition-colors font-serif font-bold text-xl cursor-pointer" href="#">Bán Chạy</a>
                    <a class="text-[#363b12] hover:text-[#934b19] transition-colors font-serif font-bold text-xl cursor-pointer" href="#">Chủ Đề</a>
                    <a class="text-[#363b12] hover:text-[#934b19] transition-colors font-serif font-bold text-xl cursor-pointer" href="#">Tác Giả</a>
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
                    <button class="bg-primary hover:bg-orange-800 text-on-primary px-10 py-4 rounded-lg font-body font-bold transition-all shadow-lg">Khám Phá Ngay</button>
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
                            <img alt="${book.title}" class="w-full h-full object-cover transition-transform duration-500 group-hover:scale-110" src="${book.imageUrl}"/>
                            <button class="absolute bottom-4 left-4 right-4 bg-primary text-on-primary py-3 rounded-lg font-bold opacity-0 translate-y-4 group-hover:opacity-100 group-hover:translate-y-0 transition-all duration-300 flex items-center justify-center gap-2">
                                <span class="material-symbols-outlined text-sm">shopping_cart</span> Thêm Vào Giỏ
                            </button>
                        </div>
                        <h3 class="font-serif text-xl font-bold mb-1 group-hover:text-primary transition-colors">${book.title}</h3>
                        <p class="text-gray-500 text-sm mb-3">${book.author}</p>
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
