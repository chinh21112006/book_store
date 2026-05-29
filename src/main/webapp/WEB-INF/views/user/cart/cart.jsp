<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html class="light" lang="vi">
<head>
    <jsp:include page="/WEB-INF/jsp/common/head.jsp">
        <jsp:param name="title" value="Giỏ Hàng | The Digital Atelier"/>
    </jsp:include>
    <style>
            body { font-family: 'Be Vietnam Pro', sans-serif; }
            h1, h2, h3, h4, .font-serif { font-family: 'Noto Serif', serif; }
            .material-symbols-outlined { font-variation-settings: 'FILL' 0, 'wght' 300, 'GRAD' 0, 'opsz' 24; }
    </style>
</head>
<body class="bg-background text-on-surface min-h-screen flex flex-col selection:bg-primary-container selection:text-on-primary-container">
    <jsp:include page="/WEB-INF/jsp/common/header.jsp">
        <jsp:param name="currentPage" value="cart"/>
    </jsp:include>

    <!-- Main Content -->
    <main class="flex-grow max-w-[1440px] mx-auto w-full px-12 py-12">
        <header class="mb-12">
            <h1 class="text-5xl font-black tracking-tight text-on-surface mb-2">Giỏ Hàng</h1>
            <p class="text-on-surface-variant italic font-serif">Bạn đang có ${fn:length(cartItems)} ấn phẩm trong túi xách trí tuệ của mình.</p>
        </header>

        <%-- Display Flash Messages --%>
        <c:if test="${not empty successMessage}">
            <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded relative mb-4" role="alert">
                <span class="block sm:inline">${successMessage}</span>
            </div>
        </c:if>
        <c:if test="${not empty errorMessage}">
            <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative mb-4" role="alert">
                <span class="block sm:inline">${errorMessage}</span>
            </div>
        </c:if>
        <c:if test="${not empty infoMessage}">
            <div class="bg-blue-100 border border-blue-400 text-blue-700 px-4 py-3 rounded relative mb-4" role="alert">
                <span class="block sm:inline">${infoMessage}</span>
            </div>
        </c:if>

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

                    <c:set var="totalCartPrice" value="0.0"/>
                    <c:choose>
                        <c:when test="${not empty cartItems}">
                            <c:forEach items="${cartItems}" var="entry">
                                <c:set var="book" value="${entry.key}"/>
                                <c:set var="quantity" value="${entry.value}"/>
                                <c:set var="itemTotalPrice" value="${book.price * quantity}"/>
                                <c:set var="totalCartPrice" value="${totalCartPrice + itemTotalPrice}"/>

                                <div class="grid grid-cols-12 px-8 py-10 items-center hover:bg-surface-container-high/30 transition-colors">
                                    <div class="col-span-6 flex items-center gap-6">
                                        <div class="w-24 h-36 bg-surface-container-highest rounded shadow-sm overflow-hidden flex-shrink-0 relative">
                                            <img class="w-full h-full object-cover" src="${book.imageUrl}" alt="${book.title}"/>
                                        </div>
                                        <div>
                                            <h3 class="font-serif text-xl font-bold text-on-surface leading-tight mb-1">${book.title}</h3>
                                            <p class="text-sm text-on-surface-variant mb-3">Tác giả: ${book.author.name}</p>
                                            <form action="${pageContext.request.contextPath}/cart/remove" method="post">
                                                <input type="hidden" name="bookId" value="${book.id}"/>
                                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                                <button type="submit" class="flex items-center gap-1 text-xs font-semibold text-error/80 hover:text-error transition-colors uppercase tracking-wider">
                                                    <span class="material-symbols-outlined text-sm">delete</span>
                                                    Gỡ bỏ
                                                </button>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="col-span-2 text-center font-medium">
                                        <fmt:formatNumber value="${book.price}" type="number" groupingUsed="true"/>₫
                                    </div>
                                    <div class="col-span-2 flex justify-center">
                                        <form action="${pageContext.request.contextPath}/cart/update" method="post" class="flex items-center bg-surface-container-lowest rounded-full p-1 border border-outline-variant/15">
                                            <input type="hidden" name="bookId" value="${book.id}"/>
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                            <button type="submit" name="quantity" value="${quantity - 1}" class="w-8 h-8 flex items-center justify-center hover:bg-surface-container rounded-full transition-colors">
                                                <span class="material-symbols-outlined text-lg">remove</span>
                                            </button>
                                            <input type="number" name="quantity" value="${quantity}" min="1" class="w-10 text-center font-bold bg-transparent border-none focus:ring-0 p-0"/>
                                            <button type="submit" name="quantity" value="${quantity + 1}" class="w-8 h-8 flex items-center justify-center hover:bg-surface-container rounded-full transition-colors">
                                                <span class="material-symbols-outlined text-lg">add</span>
                                            </button>
                                        </form>
                                    </div>
                                    <div class="col-span-2 text-right font-serif font-bold text-lg text-primary">
                                        <fmt:formatNumber value="${itemTotalPrice}" type="number" groupingUsed="true"/>₫
                                    </div>
                                </div>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <div class="p-8 text-center text-on-surface-variant">
                                Giỏ hàng của bạn đang trống.
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="mt-8 flex justify-between items-center px-4">
                    <a class="group flex items-center gap-2 text-primary font-bold hover:gap-4 transition-all" href="${pageContext.request.contextPath}/home">
                        <span class="material-symbols-outlined">arrow_back</span>
                        Tiếp tục chọn sách
                    </a>
                    <c:if test="${not empty cartItems}">
                        <form action="${pageContext.request.contextPath}/cart/clear" method="post">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <button type="submit" class="text-on-surface-variant hover:text-primary transition-colors flex items-center gap-2 text-sm font-medium">
                                Làm trống giỏ hàng
                                <span class="material-symbols-outlined text-lg">delete_sweep</span>
                            </button>
                        </form>
                    </c:if>
                </div>
            </div>
            <!-- Summary Panel -->
            <aside class="col-span-4 sticky top-32">
                <div class="bg-surface-container p-8 rounded-xl shadow-sm space-y-8">
                    <h2 class="font-serif text-2xl font-bold text-on-surface">Tóm tắt đơn hàng</h2>
                    <div class="space-y-4">
                        <div class="flex justify-between items-center text-on-surface-variant">
                            <span>Tạm tính (<c:set var="totalItems" value="0"/><c:forEach items="${cartItems}" var="entry"><c:set var="totalItems" value="${totalItems + entry.value}"/></c:forEach>${totalItems} sản phẩm)</span>
                            <span class="font-medium text-on-surface">
                                <fmt:formatNumber value="${totalCartPrice}" type="number" groupingUsed="true"/>₫
                            </span>
                        </div>
                        <div class="flex justify-between items-center text-on-surface-variant">
                            <span>Phí vận chuyển</span>
                            <span class="font-medium text-on-surface">Miễn phí</span>
                        </div>
                        <div class="flex justify-between items-center text-on-surface-variant">
                            <span>Ưu đãi hội viên</span>
                            <span class="font-medium text-error">- 0₫</span> <%-- Placeholder for discount --%>
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
                            <span class="font-serif text-4xl font-black text-primary tracking-tight">
                                <fmt:formatNumber value="${totalCartPrice}" type="number" groupingUsed="true"/>₫
                            </span>
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

    <jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>
</body>
</html>
