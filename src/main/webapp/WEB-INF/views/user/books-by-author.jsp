<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="light" lang="vi">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>Sách của ${author.name} | The Digital Atelier</title>
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
                    <a class="text-[#934b12] border-b-2 border-[#934b19] pb-1 font-serif font-bold text-xl cursor-pointer" href="${pageContext.request.contextPath}/authors">Tác Giả</a>
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

    <main class="max-w-[1440px] mx-auto px-12 py-12">
        <!-- Breadcrumb -->
        <nav class="flex items-center gap-2 text-sm mb-12 opacity-70">
            <a class="hover:text-primary" href="${pageContext.request.contextPath}/home">Trang chủ</a>
            <span class="material-symbols-outlined text-xs">chevron_right</span>
            <a class="hover:text-primary" href="${pageContext.request.contextPath}/authors">Tác giả</a>
            <span class="material-symbols-outlined text-xs">chevron_right</span>
            <span class="font-semibold">${author.name}</span>
        </nav>

        <header class="mb-12 flex items-center gap-6">
            <div class="relative w-32 h-32 p-1 border-2 border-primary-container rounded-full overflow-hidden flex-shrink-0">
                <img alt="${author.name}" class="w-full h-full object-cover rounded-full" src="${author.imageUrl}"/>
            </div>
            <div>
                <h1 class="font-serif text-4xl font-bold text-on-surface mb-2">Tác phẩm của: ${author.name}</h1>
                <p class="font-body text-gray-600">${author.bio}</p>
                <div class="mt-4 flex items-center space-x-2 text-primary">
                    <span class="material-symbols-outlined text-sm">book</span>
                    <span class="text-label-md font-bold uppercase tracking-wider">${author.books.size()} Tác phẩm</span>
                </div>
            </div>
        </header>

        <div class="grid grid-cols-4 gap-10">
            <c:choose>
                <c:when test="${not empty books}">
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
                            <p class="text-gray-500 text-sm mb-3">${book.author.name}</p> <%-- Changed to author.name --%>
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
                </c:when>
                <c:otherwise>
                    <div class="col-span-4 text-center py-10 text-on-surface-variant">
                        Không có sách nào của tác giả này.
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
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
