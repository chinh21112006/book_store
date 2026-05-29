<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<header class="w-full top-0 sticky z-50 bg-[#fefee5] shadow-sm">
    <nav class="flex justify-between items-center w-full px-12 py-6 max-w-[1440px] mx-auto">
        <div class="flex items-center gap-12">
            <a class="font-serif text-2xl font-black text-[#363b12]" href="${pageContext.request.contextPath}/home">The Digital Atelier</a>
            <div class="hidden md:flex gap-8">
                <a class="font-serif font-bold text-xl cursor-pointer transition-colors
                   <c:choose>
                       <c:when test="${param.currentPage == 'new'}">text-[#934b19] border-b-2 border-[#934b19] pb-1</c:when>
                       <c:otherwise>text-[#363b12] hover:text-[#934b19]</c:otherwise>
                   </c:choose>" href="#">Sách Mới</a>
                <a class="font-serif font-bold text-xl cursor-pointer transition-colors
                   <c:choose>
                       <c:when test="${param.currentPage == 'bestsellers'}">text-[#934b19] border-b-2 border-[#934b19] pb-1</c:when>
                       <c:otherwise>text-[#363b12] hover:text-[#934b19]</c:otherwise>
                   </c:choose>" href="${pageContext.request.contextPath}/bestsellers">Bán Chạy</a>
                <a class="font-serif font-bold text-xl cursor-pointer transition-colors
                   <c:choose>
                       <c:when test="${param.currentPage == 'categories'}">text-[#934b19] border-b-2 border-[#934b19] pb-1</c:when>
                       <c:otherwise>text-[#363b12] hover:text-[#934b19]</c:otherwise>
                   </c:choose>" href="${pageContext.request.contextPath}/categories">Chủ Đề</a>
                <a class="font-serif font-bold text-xl cursor-pointer transition-colors
                   <c:choose>
                       <c:when test="${param.currentPage == 'authors'}">text-[#934b19] border-b-2 border-[#934b19] pb-1</c:when>
                       <c:otherwise>text-[#363b12] hover:text-[#934b19]</c:otherwise>
                   </c:choose>" href="${pageContext.request.contextPath}/authors">Tác Giả</a>
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
