<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<aside class="hidden md:flex flex-col col-span-3 h-fit space-y-6 bg-surface-container-low p-6 rounded-2xl shadow-sm">
    <div class="flex items-center gap-4 mb-6">
        <div class="w-14 h-14 rounded-full overflow-hidden border-2 border-primary-container flex-shrink-0">
            <img class="w-full h-full object-cover" src="${param.userProfileImageUrl != null && param.userProfileImageUrl ne '' ? param.userProfileImageUrl : 'https://via.placeholder.com/64/FFDDC1/934B19?text=AVT'}" alt="${param.userFirstName} ${param.userLastName}"/>
        </div>
        <div class="min-w-0"> <%-- Giúp text không bị tràn khi tên quá dài --%>
            <h2 class="text-on-surface font-bold text-base truncate">${param.userFirstName} ${param.userLastName}</h2>
            <p class="text-on-surface-variant text-xs truncate">Thành viên thân thiết</p>
        </div>
    </div>
    <nav class="space-y-1">
        <a class="flex items-center gap-4 px-4 py-3 rounded-lg transition-all
           <c:choose>
               <c:when test="${param.currentProfilePage == 'profile'}">bg-[#934b19] text-white shadow-sm font-medium translate-x-1</c:when>
               <c:otherwise>text-[#363b12] dark:text-[#fafcda] opacity-80 hover:bg-[#fefee5] dark:hover:bg-stone-800</c:otherwise>
           </c:choose>" href="${pageContext.request.contextPath}/profile">
            <span class="material-symbols-outlined" data-icon="person">person</span>
            <span class="text-sm">Thông tin cá nhân</span>
        </a>
        <a class="flex items-center gap-4 px-4 py-3 rounded-lg transition-all
           <c:choose>
               <c:when test="${param.currentProfilePage == 'orders'}">bg-[#934b19] text-white shadow-sm font-medium translate-x-1</c:when>
               <c:otherwise>text-[#363b12] dark:text-[#fafcda] opacity-80 hover:bg-[#fefee5] dark:hover:bg-stone-800</c:otherwise>
           </c:choose>" href="${pageContext.request.contextPath}/profile/orders">
            <span class="material-symbols-outlined" data-icon="list_alt">list_alt</span>
            <span class="text-sm">Đơn hàng của tôi</span>
        </a>
        <a class="flex items-center gap-4 px-4 py-3 rounded-lg transition-all
           <c:choose>
               <c:when test="${param.currentProfilePage == 'notifications'}">bg-[#934b19] text-white shadow-sm font-medium translate-x-1</c:when>
               <c:otherwise>text-[#363b12] dark:text-[#fafcda] opacity-80 hover:bg-[#fefee5] dark:hover:bg-stone-800</c:otherwise>
           </c:choose>" href="${pageContext.request.contextPath}/profile/notifications">
            <span class="material-symbols-outlined" data-icon="notifications">notifications</span>
            <span class="text-sm">Thông báo</span>
            <span class="ml-auto bg-error text-on-error text-xs px-2 py-0.5 rounded-full">2</span>
        </a>
        <a class="flex items-center gap-4 px-4 py-3 rounded-lg transition-all
           <c:choose>
               <c:when test="${param.currentProfilePage == 'wishlist'}">bg-[#934b19] text-white shadow-sm font-medium translate-x-1</c:when>
               <c:otherwise>text-[#363b12] dark:text-[#fafcda] opacity-80 hover:bg-[#fefee5] dark:hover:bg-stone-800</c:otherwise>
           </c:choose>" href="${pageContext.request.contextPath}/profile/wishlist">
            <span class="material-symbols-outlined" data-icon="favorite">favorite</span>
            <span class="text-sm">Danh sách yêu thích</span>
        </a>
        <a class="flex items-center gap-4 px-4 py-3 rounded-lg transition-all
           <c:choose>
               <c:when test="${param.currentProfilePage == 'addresses'}">bg-[#934b19] text-white shadow-sm font-medium translate-x-1</c:when>
               <c:otherwise>text-[#363b12] dark:text-[#fafcda] opacity-80 hover:bg-[#fefee5] dark:hover:bg-stone-800</c:otherwise>
           </c:choose>" href="${pageContext.request.contextPath}/profile/addresses">
            <span class="material-symbols-outlined" data-icon="location_on">location_on</span>
            <span class="text-sm">Địa chỉ nhận hàng</span>
        </a>
        <div class="pt-4 mt-4 border-t border-outline-variant/20">
            <form action="${pageContext.request.contextPath}/logout" method="POST">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <button type="submit" class="w-full flex items-center gap-4 px-4 py-3 rounded-lg text-error hover:bg-error-container/10 transition-all">
                    <span class="material-symbols-outlined" data-icon="logout">logout</span>
                    <span class="text-sm font-medium">Đăng xuất</span>
                </button>
            </form>
        </div>
    </nav>
</aside>