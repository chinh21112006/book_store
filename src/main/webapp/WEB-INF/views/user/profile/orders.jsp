<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html class="light" lang="vi">
<head>
    <jsp:include page="/WEB-INF/jsp/common/head.jsp">
        <jsp:param name="title" value="Đơn hàng của tôi | The Digital Atelier"/>
    </jsp:include>
    <style>
        .material-symbols-outlined {
            font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
            vertical-align: middle;
        }
        body { font-family: 'Be Vietnam Pro', sans-serif; }
        h1, h2, h3, .brand-font { font-family: 'Noto Serif', serif; }
    </style>
</head>
<body class="bg-background text-on-surface min-h-screen flex flex-col">
    <jsp:include page="/WEB-INF/jsp/common/header.jsp">
        <jsp:param name="currentPage" value="profile"/>
    </jsp:include>

    <main class="flex-grow max-w-[1440px] w-full mx-auto px-12 py-12">
        <div class="grid grid-cols-12 gap-12 items-start">
            <!-- Left Navigation Sidebar -->
            <jsp:include page="/WEB-INF/jsp/common/profile-sidebar.jsp">
                <jsp:param name="currentProfilePage" value="orders"/>
                <jsp:param name="userProfileImageUrl" value="${loggedInUser.profileImageUrl}"/>
                <jsp:param name="userFirstName" value="${loggedInUser.firstName}"/>
                <jsp:param name="userLastName" value="${loggedInUser.lastName}"/>
            </jsp:include>

            <!-- Right Content Area -->
            <section class="col-span-9 space-y-8">
                <!-- Stats Bento Grid -->
                <div class="grid grid-cols-3 gap-6">
                    <div class="bg-surface-container-lowest p-6 rounded-xl border-l-4 border-primary shadow-sm">
                        <div class="flex justify-between items-start mb-4">
                            <span class="material-symbols-outlined text-primary text-3xl" data-icon="menu_book">menu_book</span>
                            <span class="text-xs font-bold text-on-surface-variant tracking-wider uppercase">Tổng số sách</span>
                        </div>
                        <div class="text-3xl font-black text-on-surface brand-font">42</div>
                        <div class="text-sm text-on-surface-variant mt-1">Cuốn sách đã sở hữu</div>
                    </div>
                    <div class="bg-surface-container-lowest p-6 rounded-xl border-l-4 border-tertiary shadow-sm">
                        <div class="flex justify-between items-start mb-4">
                            <span class="material-symbols-outlined text-tertiary text-3xl" data-icon="loyalty">loyalty</span>
                            <span class="text-xs font-bold text-on-surface-variant tracking-wider uppercase">Điểm tích lũy</span>
                        </div>
                        <div class="text-3xl font-black text-on-surface brand-font">1,250</div>
                        <div class="text-sm text-on-surface-variant mt-1">Điểm thưởng Atelier</div>
                    </div>
                    <div class="bg-surface-container-lowest p-6 rounded-xl border-l-4 border-secondary shadow-sm">
                        <div class="flex justify-between items-start mb-4">
                            <span class="material-symbols-outlined text-secondary text-3xl" data-icon="pending_actions">pending_actions</span>
                            <span class="text-xs font-bold text-on-surface-variant tracking-wider uppercase">Đang xử lý</span>
                        </div>
                        <div class="text-3xl font-black text-on-surface brand-font">${orders.size()}</div> <%-- Dynamic count --%>
                        <div class="text-sm text-on-surface-variant mt-1">Đơn hàng đang giao</div>
                    </div>
                </div>
                <!-- Order History Section -->
                <div class="bg-surface-container-low rounded-xl p-8">
                    <div class="flex justify-between items-end mb-8">
                        <div>
                            <h1 class="text-3xl font-black brand-font text-on-surface mb-2">Đơn hàng của tôi</h1>
                            <p class="text-on-surface-variant">Theo dõi tình trạng các tác phẩm đang trên đường đến với bạn.</p>
                        </div>
                        <div class="flex gap-4">
                            <button class="px-4 py-2 text-sm font-bold text-primary hover:bg-primary/5 rounded-lg transition-all">Tất cả</button>
                            <button class="px-4 py-2 text-sm font-medium text-on-surface-variant hover:text-primary rounded-lg transition-all">Chờ thanh toán</button>
                            <button class="px-4 py-2 text-sm font-medium text-on-surface-variant hover:text-primary rounded-lg transition-all">Đang giao</button>
                            <button class="px-4 py-2 text-sm font-medium text-on-surface-variant hover:text-primary rounded-lg transition-all">Đã hoàn thành</button>
                        </div>
                    </div>
                    <!-- Order Items -->
                    <div class="space-y-6">
                        <c:choose>
                            <c:when test="${not empty orders}">
                                <c:forEach items="${orders}" var="order">
                                    <div class="bg-surface-container-lowest rounded-xl p-6 transition-all hover:shadow-md">
                                        <div class="flex justify-between items-center mb-6 pb-4 border-b border-surface-container">
                                            <div class="flex gap-4 items-center">
                                                <span class="text-sm font-bold text-on-surface">Mã Đơn: #${order.id}</span>
                                                <span class="text-outline-variant">|</span>
                                                <span class="text-sm text-on-surface-variant">Ngày đặt: <spring:eval expression="T(java.time.format.DateTimeFormatter).ofPattern('dd/MM/yyyy').format(order.orderDate)"/></span>
                                            </div>
                                            <span class="px-3 py-1 rounded-full text-xs font-bold bg-primary-container text-on-primary-container uppercase tracking-tight">${order.status}</span>
                                        </div>
                                        <c:forEach items="${order.orderItems}" var="item">
                                            <div class="flex gap-6 mb-4">
                                                <div class="w-24 h-32 flex-shrink-0 bg-surface-container-low rounded-lg overflow-hidden shadow-sm">
                                                    <img class="w-full h-full object-cover" src="${item.book.imageUrl}" alt="${item.book.title}"/>
                                                </div>
                                                <div class="flex-grow py-1">
                                                    <h3 class="text-lg font-bold brand-font mb-1">${item.book.title}</h3>
                                                    <p class="text-on-surface-variant text-sm mb-4">Tác giả: ${item.book.author.name}</p>
                                                    <div class="flex justify-between items-end">
                                                        <div class="text-primary font-bold">
                                                            <fmt:formatNumber value="${item.price}" type="number" groupingUsed="true"/>đ
                                                            <span class="text-on-surface-variant font-normal text-xs ml-2">x ${item.quantity}</span>
                                                        </div>
                                                        <div class="flex gap-3">
                                                            <a href="${pageContext.request.contextPath}/books/${item.book.id}" class="px-6 py-2 rounded-lg text-sm font-bold border border-outline-variant/30 text-on-surface hover:bg-surface-container-low transition-all">Xem Chi Tiết</a>
                                                            <button class="px-6 py-2 rounded-lg text-sm font-bold bg-primary text-on-primary hover:bg-primary-dim transition-all">Mua Lại</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <div class="text-center py-10 text-on-surface-variant">
                                    Bạn chưa có đơn hàng nào.
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <!-- Pagination -->
                    <div class="mt-10 flex justify-center gap-2">
                        <button class="w-10 h-10 flex items-center justify-center rounded-lg bg-surface-container-highest text-primary font-bold">1</button>
                        <button class="w-10 h-10 flex items-center justify-center rounded-lg hover:bg-surface-container-highest transition-all">2</button>
                        <button class="w-10 h-10 flex items-center justify-center rounded-lg hover:bg-surface-container-highest transition-all">3</button>
                        <button class="w-10 h-10 flex items-center justify-center rounded-lg hover:bg-surface-container-highest transition-all">
                            <span class="material-symbols-outlined" data-icon="chevron_right">chevron_right</span>
                        </button>
                    </div>
                </div>
            </section>
        </div>
    </main>

    <jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>
</body>
</html>
