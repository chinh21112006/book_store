<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="light" lang="vi">
<head>
    <jsp:include page="/WEB-INF/jsp/common/head.jsp">
        <jsp:param name="title" value="${book.title} | The Digital Atelier"/>
    </jsp:include>
    <style>
        body { font-family: 'Be Vietnam Pro', sans-serif; background-color: #fefee5; color: #363b12; }
        .font-serif { font-family: 'Noto Serif', serif; }
        .material-symbols-outlined { font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24; }
    </style>
</head>
<body class="bg-background text-on-surface selection:bg-primary-container selection:text-on-primary-container">
    <jsp:include page="/WEB-INF/jsp/common/header.jsp">
        <jsp:param name="currentPage" value="book-detail"/>
    </jsp:include>

    <main class="max-w-[1440px] mx-auto px-12 py-12">
        <!-- Breadcrumb -->
        <nav class="flex items-center gap-2 text-sm mb-12 opacity-70">
            <a class="hover:text-primary" href="${pageContext.request.contextPath}/home">Trang chủ</a>
            <span class="material-symbols-outlined text-xs">chevron_right</span>
            <c:if test="${not empty book.category}">
                <a class="hover:text-primary" href="${pageContext.request.contextPath}/categories/${book.category.id}">${book.category.name}</a>
                <span class="material-symbols-outlined text-xs">chevron_right</span>
            </c:if>
            <span class="font-semibold">${book.title}</span>
        </nav>
        <!-- Product Section: Editorial Layout -->
        <section class="grid grid-cols-12 gap-16 items-start mb-24">
            <!-- Left: Large Book Cover with Asymmetric shadow -->
            <div class="col-span-12 lg:col-span-5 relative group">
                <div class="absolute -top-4 -left-4 w-full h-full bg-surface-container-low rounded-lg -z-10 transition-transform group-hover:translate-x-2 group-hover:translate-y-2"></div>
                <img class="w-full aspect-[3/4] object-cover rounded-lg shadow-2xl transition-transform duration-700 hover:scale-[1.02]" src="${book.imageUrl}" alt="${book.title}"/>
                <div class="absolute top-6 right-6 flex flex-col gap-3">
                    <sec:authorize access="isAuthenticated()">
                        <c:set var="isFavorite" value="${isFavorite != null ? isFavorite : false}"/>
                        <button type="button" onclick="toggleFavorite(this, ${book.id})"
                           class="bg-surface-container-lowest/80 backdrop-blur-md p-3 rounded-full text-primary hover:bg-primary hover:text-on-primary transition-all shadow-lg"
                           title="${isFavorite ? 'Xóa khỏi danh sách yêu thích' : 'Thêm vào danh sách yêu thích'}"
                           data-book-id="${book.id}" data-is-favorite="${isFavorite}">
                            <span class="material-symbols-outlined" style="font-variation-settings: 'FILL' ${isFavorite ? 1 : 0};">favorite</span>
                        </button>
                    </sec:authorize>
                    <button class="bg-surface-container-lowest/80 backdrop-blur-md p-3 rounded-full text-primary hover:bg-primary hover:text-on-primary transition-all shadow-lg">
                        <span class="material-symbols-outlined">share</span>
                    </button>
                </div>
            </div>
            <!-- Right: Detailed Information -->
            <div class="col-span-12 lg:col-span-7 flex flex-col">
                <span class="text-primary font-bold tracking-widest text-xs uppercase mb-4">Tuyển Tập Đặc Biệt</span>
                <h1 class="font-serif text-5xl md:text-6xl font-black text-on-surface leading-tight mb-4">${book.title}</h1>
                <div class="flex items-center gap-4 mb-8">
                    <span class="font-serif italic text-xl opacity-80">Tác giả:</span>
                    <a class="font-serif italic text-xl text-primary hover:underline decoration-primary/30" href="${pageContext.request.contextPath}/authors/${book.author.id}">${book.author.name}</a>
                    <div class="h-4 w-px bg-outline-variant mx-2"></div>
                    <div class="flex items-center text-secondary">
                        <span class="material-symbols-outlined text-sm" style="font-variation-settings: 'FILL' 1;">star</span>
                        <span class="material-symbols-outlined text-sm" style="font-variation-settings: 'FILL' 1;">star</span>
                        <span class="material-symbols-outlined text-sm" style="font-variation-settings: 'FILL' 1;">star</span>
                        <span class="material-symbols-outlined text-sm" style="font-variation-settings: 'FILL' 1;">star</span>
                        <span class="material-symbols-outlined text-sm" style="font-variation-settings: 'FILL' 0;">star</span>
                        <span class="ml-2 text-sm font-medium">(128 đánh giá)</span>
                    </div>
                </div>
                <div class="flex items-baseline gap-6 mb-10">
                    <span class="text-4xl font-bold text-primary"><fmt:formatNumber value="${book.price}" type="number" groupingUsed="true"/>đ</span>
                    <c:if test="${book.oldPrice != null}">
                        <span class="text-xl text-on-surface-variant line-through decoration-error/30 opacity-60"><fmt:formatNumber value="${book.oldPrice}" type="number" groupingUsed="true"/>đ</span>
                        <c:set var="discount" value="${((book.oldPrice - book.price) / book.oldPrice) * 100}"/>
                        <span class="bg-error-container text-on-error-container text-xs font-bold px-2 py-1 rounded">-<fmt:formatNumber value="${discount}" type="number" maxFractionDigits="0"/>%</span>
                    </c:if>
                </div>
                <div class="bg-surface-container-low p-8 rounded-xl mb-10 leading-relaxed border-l-4 border-primary">
                    <h3 class="font-serif font-bold text-lg mb-3">Tóm lược nội dung</h3>
                    <p class="text-on-surface-variant text-base">
                        ${book.description}
                    </p>
                    <button class="mt-4 text-primary font-bold flex items-center gap-1 hover:gap-2 transition-all">
                        Xem chi tiết <span class="material-symbols-outlined text-sm">arrow_forward</span>
                    </button>
                </div>
                <div class="grid grid-cols-2 gap-4 mb-12">
                    <div class="flex items-center gap-3 p-4 bg-surface-container-highest/30 rounded-lg">
                        <span class="material-symbols-outlined text-primary">menu_book</span>
                        <div>
                            <p class="text-xs opacity-60">Số trang</p>
                            <p class="font-bold">452 trang</p>
                        </div>
                    </div>
                    <div class="flex items-center gap-3 p-4 bg-surface-container-highest/30 rounded-lg">
                        <span class="material-symbols-outlined text-primary">translate</span>
                        <div>
                            <p class="text-xs opacity-60">Ngôn ngữ</p>
                            <p class="font-bold">Tiếng Việt</p>
                        </div>
                    </div>
                </div>
                <div class="flex flex-col sm:flex-row gap-4 mt-auto">
                    <form action="${pageContext.request.contextPath}/cart/add" method="post" class="flex-1">
                        <input type="hidden" name="bookId" value="${book.id}"/>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <button type="submit" class="w-full bg-primary hover:bg-primary-dim text-on-primary py-5 px-8 rounded-lg font-bold text-lg shadow-xl shadow-primary/20 transition-all active:scale-[0.98] flex items-center justify-center gap-3">
                            <span class="material-symbols-outlined">shopping_cart</span>
                            Thêm vào giỏ hàng
                        </button>
                    </form>
                    <button class="flex-1 border-2 border-primary text-primary hover:bg-primary/5 py-5 px-8 rounded-lg font-bold text-lg transition-all active:scale-[0.98]">
                        Đọc thử chương 1
                    </button>
                </div>
            </div>
        </section>
        <!-- Reader Reviews: Bento-inspired Layout -->
        <section class="mb-24">
            <div class="flex justify-between items-end mb-12">
                <div>
                    <h2 class="font-serif text-3xl font-black mb-2">Độc giả nói gì?</h2>
                    <p class="text-on-surface-variant">Những chia sẻ chân thực từ những người yêu sách</p>
                </div>
                <button class="text-primary font-bold flex items-center gap-2 hover:underline">
                    Viết đánh giá của bạn <span class="material-symbols-outlined">edit</span>
                </button>
            </div>
            <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                <!-- Review Card 1 -->
                <div class="bg-surface-container-lowest p-8 rounded-xl shadow-sm border border-outline-variant/10 flex flex-col h-full">
                    <div class="flex items-center gap-4 mb-6">
                        <img class="w-12 h-12 rounded-full object-cover" data-alt="Portrait of a young woman with a warm smile, professional lighting, outdoor autumn setting" src="https://lh3.googleusercontent.com/aida-public/AB6AXuANHXIA-S1lNVyGT8ospUl0G0-9FHrlMDbm70kbGso2Ps6Jpiort1bF2VAMMwjKy_lV5Y0iQjV5tammBfcoq1K_3Kv1sMfoZXCMxcn9B5AkB0JO68qbuIAUw-0UHjJ8YjMTmfSZUhxx9PYBcfea291WjMk4Bo9Yu2f0NggJ3I3bWz-6EwxG7UATyUITtst8cVr4lIq4U6tTeigP734lhRumpI2wOx6uWixlxAtsOh3fShTKCx3ZXNuR-4zz7FgeU2EnXeq4Qlg-3lDllSfrOi1lXw5uHrJF6YfhcrF4kviTmhqKoPSvtpV4obvwaa50lMNO3e2"/>
                        <div>
                            <p class="font-bold">Khánh Linh</p>
                            <p class="text-xs opacity-60">2 ngày trước</p>
                        </div>
                    </div>
                    <div class="flex text-secondary mb-4">
                        <span class="material-symbols-outlined text-xs" style="font-variation-settings: 'FILL' 1;">star</span>
                        <span class="material-symbols-outlined text-xs" style="font-variation-settings: 'FILL' 1;">star</span>
                        <span class="material-symbols-outlined text-xs" style="font-variation-settings: 'FILL' 1;">star</span>
                        <span class="material-symbols-outlined text-xs" style="font-variation-settings: 'FILL' 1;">star</span>
                        <span class="material-symbols-outlined text-xs" style="font-variation-settings: 'FILL' 1;">star</span>
                    </div>
                    <p class="italic text-on-surface-variant flex-grow leading-relaxed">
                        "Một cuốn sách tuyệt vời để nhâm nhi bên tách cà phê nóng vào những ngày mưa. Văn phong của tác giả vô cùng mượt mà và giàu hình ảnh."
                    </p>
                </div>
                <!-- Review Card 2 (Large Highlight) -->
                <div class="bg-primary text-on-primary p-8 rounded-xl shadow-lg md:col-span-1 flex flex-col justify-center">
                    <span class="material-symbols-outlined text-5xl mb-6 opacity-30">format_quote</span>
                    <p class="text-xl font-serif italic mb-8 leading-relaxed">
                        "Tôi đã không thể rời mắt khỏi những trang cuối cùng. Một kết thúc đầy ám ảnh và đẹp đẽ đến nao lòng."
                    </p>
                    <div class="flex items-center gap-4">
                        <img class="w-10 h-10 rounded-full object-cover border-2 border-on-primary/30" data-alt="Portrait of a sophisticated middle-aged man with glasses, library background, soft bokeh" src="https://lh3.googleusercontent.com/aida-public/AB6AXuDRgZf4CbtKIKnsGcWRxJ5u9tXui34lNg6XY8us4AtPCTJewD-ZX9qRafcEDMX6uGmAjBnekO53lmzb3r7LgT36GM_PqSc3OpDptfpTPqlynXR5UX9ZNZEXAICBoQvVLhpV_g2Hy2ds6OBiwoDK1gSLx59Ghojd99f8jADueWTqkISZLprjRrRrrcUz_Wl_rkiw3yCzbdUHxMm8-kBRB5zkdTrhSLEVHSG0E4C-F0xpyA6qJku3L6R9bcGAc1JK1WQvY2nP-Lxc_OBs"/>
                        <div>
                            <p class="font-bold">Minh Trí</p>
                            <p class="text-xs opacity-70">Tuần trước</p>
                        </div>
                    </div>
                </div>
                <!-- Review Card 3 -->
                <div class="bg-surface-container-low p-8 rounded-xl flex flex-col h-full border border-primary/5">
                    <div class="flex items-center gap-4 mb-6">
                        <img class="w-12 h-12 rounded-full object-cover" data-alt="Portrait of a creative professional woman, minimalist studio lighting, warm skin tones" src="https://lh3.googleusercontent.com/aida-public/AB6AXuD6ITJtrpkhAkSojSIk8wHYKSC3jlWriih8_YpaG6f7HWQuW2zMJqtS-5R5N9st2-QnLGIq8jWfz5KNhyIQdsRypjivqPHiC-BQXGlBVxmEuWj-4lIJ8m_QNK1GtBET_TpEBVCOwPOaL-cahkbu6dZ8432Podakeo0ZHiPCnPCEMZU9uQrhkmcFcybnEbafTmQZlM3iGg9fN59D2SjCP-GbiDpmCby_YA0OhhSI4CI0YlXLYJ06jIEjwAwcPdn4oZaO9vig8aRYmo4Y_n"/>
                        <div>
                            <p class="font-bold">Thùy Dương</p>
                            <p class="text-xs opacity-60">1 tháng trước</p>
                        </div>
                    </div>
                    <div class="flex text-secondary mb-4">
                        <span class="material-symbols-outlined text-xs" style="font-variation-settings: 'FILL' 1;">star</span>
                        <span class="material-symbols-outlined text-xs" style="font-variation-settings: 'FILL' 1;">star</span>
                        <span class="material-symbols-outlined text-xs" style="font-variation-settings: 'FILL' 1;">star</span>
                        <span class="material-symbols-outlined text-xs" style="font-variation-settings: 'FILL' 1;">star</span>
                        <span class="material-symbols-outlined text-xs" style="font-variation-settings: 'FILL' 1;">star</span>
                    </div>
                    <p class="text-on-surface-variant flex-grow leading-relaxed">
                        "Bản in cực kỳ chất lượng, giấy thơm và dày dặn. Nội dung sâu sắc, rất đáng để sưu tầm trong tủ sách gia đình."
                    </p>
                </div>
            </div>
        </section>
        <!-- Related Books: Grid Layout -->
        <section class="mb-24">
            <div class="flex justify-between items-center mb-12">
                <h2 class="font-serif text-3xl font-black">Có thể bạn sẽ thích</h2>
                <div class="flex gap-4">
                    <button class="w-10 h-10 rounded-full border border-outline flex items-center justify-center hover:bg-primary/5 transition-all">
                        <span class="material-symbols-outlined">chevron_left</span>
                    </button>
                    <button class="w-10 h-10 rounded-full border border-outline flex items-center justify-center hover:bg-primary/5 transition-all">
                        <span class="material-symbols-outlined">chevron_right</span>
                    </button>
                </div>
            </div>
            <div class="grid grid-cols-2 md:grid-cols-4 gap-8">
                <%-- Placeholder for related books --%>
                <c:forEach items="${relatedBooks}" var="relatedBook">
                    <div class="group cursor-pointer">
                        <div class="relative mb-6 overflow-hidden rounded-lg">
                            <img class="w-full aspect-[2/3] object-cover transition-transform duration-500 group-hover:scale-105" src="${relatedBook.imageUrl}" alt="${relatedBook.title}"/>
                            <div class="absolute bottom-0 left-0 right-0 p-4 translate-y-full group-hover:translate-y-0 transition-transform duration-300 bg-gradient-to-t from-primary/90 to-transparent">
                                <a href="${pageContext.request.contextPath}/books/${relatedBook.id}" class="w-full bg-on-primary text-primary py-2 rounded-lg font-bold text-sm flex items-center justify-center">Xem ngay</a>
                            </div>
                        </div>
                        <h3 class="font-serif font-bold text-lg mb-1 group-hover:text-primary transition-colors">${relatedBook.title}</h3>
                        <p class="text-sm opacity-60 italic mb-2">${relatedBook.author.name}</p>
                        <p class="text-primary font-bold"><fmt:formatNumber value="${relatedBook.price}" type="number" groupingUsed="true"/>đ</p>
                    </div>
                </c:forEach>
            </div>
        </section>
    </main>
    <jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>
</body>
</html>