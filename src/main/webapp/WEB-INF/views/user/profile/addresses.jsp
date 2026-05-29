<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="light" lang="vi">
<head>
    <jsp:include page="/WEB-INF/jsp/common/head.jsp">
        <jsp:param name="title" value="Địa chỉ nhận hàng | The Digital Atelier"/>
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
                <jsp:param name="currentProfilePage" value="addresses"/>
                <jsp:param name="userProfileImageUrl" value="${loggedInUser.profileImageUrl}"/>
                <jsp:param name="userFirstName" value="${loggedInUser.firstName}"/>
                <jsp:param name="userLastName" value="${loggedInUser.lastName}"/>
            </jsp:include>

            <!-- Main Content -->
            <section class="col-span-9">
                <header class="mb-12 flex justify-between items-end">
                    <div>
                        <h1 class="text-4xl font-headline font-bold text-on-surface tracking-tight mb-2">Địa chỉ nhận hàng</h1>
                        <p class="text-on-surface-variant font-body">Quản lý thông tin giao hàng để có trải nghiệm mua sắm tốt nhất.</p>
                    </div>
                    <%-- Removed "Thêm địa chỉ mới" button from header --%>
                </header>

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

                <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
                    <c:choose>
                        <c:when test="${not empty addresses}">
                            <c:forEach items="${addresses}" var="address">
                                <div class="group bg-surface-container-lowest p-8 rounded-xl relative overflow-hidden flex flex-col border <c:if test="${address.getIsDefault()}">border-primary/40</c:if> hover:border-primary/20 transition-all duration-300">
                                    <c:if test="${address.getIsDefault()}">
                                        <div class="absolute top-0 right-0 p-2">
                                            <span class="bg-primary/10 text-primary text-[10px] font-bold uppercase tracking-widest px-3 py-1 rounded-bl-lg">Mặc định</span>
                                        </div>
                                    </c:if>
                                    <div class="flex items-start gap-4 mb-6">
                                        <div class="h-12 w-12 bg-primary/5 rounded-full flex items-center justify-center text-primary">
                                            <span class="material-symbols-outlined" data-icon="home" style="font-variation-settings: 'FILL' 1;">home</span>
                                        </div>
                                        <div>
                                            <h2 class="text-xl font-headline font-bold text-on-surface">${address.recipientName}</h2>
                                            <p class="text-sm font-medium text-on-surface-variant">${address.phoneNumber}</p>
                                        </div>
                                    </div>
                                    <div class="flex-1">
                                        <p class="text-on-surface font-body leading-relaxed mb-4">
                                            ${address.streetAddress}, ${address.city}<br/>
                                            ${address.state} ${address.zipCode}
                                        </p>
                                    </div>
                                    <div class="flex items-center gap-4 mt-8 pt-6 border-t border-stone-100">
                                        <a href="${pageContext.request.contextPath}/profile/addresses/edit/${address.id}" class="text-sm font-semibold text-primary flex items-center gap-1 hover:underline">
                                            <span class="material-symbols-outlined text-sm" data-icon="edit">edit</span> Chỉnh sửa
                                        </a>
                                        <form action="${pageContext.request.contextPath}/profile/addresses/delete/${address.id}" method="post" onsubmit="return confirm('Bạn có chắc chắn muốn xóa địa chỉ này không?');">
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                            <button type="submit" class="text-sm font-semibold text-stone-500 flex items-center gap-1 <c:if test="${address.getIsDefault()}">cursor-not-allowed</c:if> hover:text-error transition-colors" <c:if test="${address.getIsDefault()}">disabled</c:if>>
                                                <span class="material-symbols-outlined text-sm" data-icon="delete">delete</span> Xóa
                                            </button>
                                        </form>
                                        <c:if test="${!address.getIsDefault()}">
                                            <form action="${pageContext.request.contextPath}/profile/addresses/set-default/${address.id}" method="post" class="ml-auto">
                                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                                <button type="submit" class="text-[10px] text-stone-500 uppercase tracking-tighter hover:text-primary transition-colors">Thiết lập mặc định</button>
                                            </form>
                                        </c:if>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <div class="col-span-full text-center py-10 text-on-surface-variant">
                                Bạn chưa có địa chỉ nhận hàng nào.
                            </div>
                        </c:otherwise>
                    </c:choose>

                    <!-- Add New Address Placeholder -->
                    <a href="${pageContext.request.contextPath}/profile/addresses/add" class="group border-2 border-dashed border-stone-300 rounded-xl p-8 flex flex-col items-center justify-center gap-4 hover:border-primary/40 hover:bg-primary/5 transition-all cursor-pointer min-h-[250px]">
                        <div class="h-16 w-16 rounded-full bg-stone-100 flex items-center justify-center text-stone-400 group-hover:scale-110 group-hover:bg-primary/10 group-hover:text-primary transition-all duration-500">
                            <span class="material-symbols-outlined text-3xl" data-icon="add_circle">add_circle</span>
                        </div>
                        <div class="text-center">
                            <span class="block font-headline font-bold text-stone-500 group-hover:text-primary transition-colors">Thêm địa chỉ mới</span>
                            <span class="text-sm text-stone-400">Giao hàng đến nhà riêng hoặc nơi làm việc</span>
                        </div>
                    </a>
                </div>

                <!-- Helpful Tip Card -->
                <section class="mt-16 bg-[#934b19] rounded-2xl p-8 flex items-center justify-between text-white overflow-hidden relative">
                    <div class="relative z-10 max-w-md">
                        <h3 class="text-2xl font-headline font-bold mb-2">Giao hàng nhanh hơn?</h3>
                        <p class="text-primary-fixed-dim text-sm leading-relaxed">Đừng quên thiết lập địa chỉ mặc định để bước thanh toán diễn ra chỉ trong 1 lần nhấn chuột.</p>
                    </div>
                    <div class="relative z-10">
                        <span class="material-symbols-outlined text-6xl opacity-20" data-icon="local_shipping">local_shipping</span>
                    </div>
                    <!-- Abstract decorative shape -->
                    <div class="absolute -right-12 -bottom-12 w-48 h-48 bg-white/5 rounded-full blur-3xl"></div>
                </section>
            </section>
        </div>
    </main>

    <jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>
</body>
</html>