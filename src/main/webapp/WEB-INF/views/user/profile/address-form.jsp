<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html class="light" lang="vi">
<head>
    <jsp:include page="/WEB-INF/jsp/common/head.jsp">
        <jsp:param name="title" value="${address.id != null ? 'Chỉnh sửa địa chỉ' : 'Thêm địa chỉ mới'} | The Digital Atelier"/>
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
                <header class="mb-10">
                    <h1 class="text-4xl font-headline font-bold text-on-surface tracking-tight mb-2">
                        ${address.id != null ? 'Chỉnh sửa địa chỉ' : 'Thêm địa chỉ mới'}
                    </h1>
                    <p class="text-on-surface-variant font-body">
                        ${address.id != null ? 'Cập nhật thông tin địa chỉ nhận hàng của bạn.' : 'Thêm một địa chỉ nhận hàng mới vào tài khoản của bạn.'}
                    </p>
                </header>

                <%-- Construct URLs using c:url for better parsing --%>
                <c:url var="addAddressAction" value="/profile/addresses/add"/>
                <c:url var="editAddressAction" value="/profile/addresses/edit/${address.id}"/>

                <form:form action="${address.id != null ? editAddressAction : addAddressAction}" method="post" modelAttribute="address" class="bg-surface-container-lowest p-8 rounded-xl shadow-sm">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-6">
                        <div>
                            <label for="recipientName" class="block text-sm font-medium text-on-surface-variant mb-2">Tên người nhận</label>
                            <form:input path="recipientName" id="recipientName" class="w-full px-4 py-2 border border-outline-variant rounded-lg focus:ring-primary focus:border-primary" required="true"/>
                            <form:errors path="recipientName" cssClass="text-error text-sm mt-1"/>
                        </div>
                        <div>
                            <label for="phoneNumber" class="block text-sm font-medium text-on-surface-variant mb-2">Số điện thoại</label>
                            <form:input path="phoneNumber" id="phoneNumber" class="w-full px-4 py-2 border border-outline-variant rounded-lg focus:ring-primary focus:border-primary" required="true"/>
                            <form:errors path="phoneNumber" cssClass="text-error text-sm mt-1"/>
                        </div>
                    </div>

                    <div class="mb-6">
                        <label for="streetAddress" class="block text-sm font-medium text-on-surface-variant mb-2">Địa chỉ đường</label>
                        <form:input path="streetAddress" id="streetAddress" class="w-full px-4 py-2 border border-outline-variant rounded-lg focus:ring-primary focus:border-primary" required="true"/>
                            <form:errors path="streetAddress" cssClass="text-error text-sm mt-1"/>
                    </div>

                    <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-6">
                        <div>
                            <label for="city" class="block text-sm font-medium text-on-surface-variant mb-2">Thành phố/Tỉnh</label>
                            <form:input path="city" id="city" class="w-full px-4 py-2 border border-outline-variant rounded-lg focus:ring-primary focus:border-primary" required="true"/>
                            <form:errors path="city" cssClass="text-error text-sm mt-1"/>
                        </div>
                        <div>
                            <label for="state" class="block text-sm font-medium text-on-surface-variant mb-2">Phường/Xã</label>
                            <form:input path="state" id="state" class="w-full px-4 py-2 border border-outline-variant rounded-lg focus:ring-primary focus:border-primary" required="true"/>
                            <form:errors path="state" cssClass="text-error text-sm mt-1"/>
                        </div>
                        <div>
                            <label for="zipCode" class="block text-sm font-medium text-on-surface-variant mb-2">Mã bưu chính (nếu có)</label>
                            <form:input path="zipCode" id="zipCode" class="w-full px-4 py-2 border border-outline-variant rounded-lg focus:ring-primary focus:border-primary"/>
                            <form:errors path="zipCode" cssClass="text-error text-sm mt-1"/>
                        </div>
                    </div>

                    <div class="flex items-center mb-6">
                        <form:checkbox path="isDefault" id="isDefault" class="h-4 w-4 text-primary border-outline-variant rounded focus:ring-primary"/>
                        <label for="isDefault" class="ml-2 block text-sm text-on-surface-variant">Đặt làm địa chỉ mặc định</label>
                    </div>

                    <div class="flex gap-4">
                        <button type="submit" class="bg-primary text-on-primary px-6 py-2.5 rounded-lg font-medium shadow-sm hover:bg-primary-dim transition-colors active:scale-95">
                            ${address.id != null ? 'Cập nhật địa chỉ' : 'Xác nhận'}
                        </button>
                        <a href="${pageContext.request.contextPath}/profile/addresses" class="bg-surface-container-high text-on-surface-variant px-6 py-2.5 rounded-lg font-medium shadow-sm hover:bg-surface-container-highest transition-colors active:scale-95">
                            Hủy
                        </a>
                    </div>
                </form:form>
            </section>
        </div>
    </main>

    <jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>
</body>
</html>