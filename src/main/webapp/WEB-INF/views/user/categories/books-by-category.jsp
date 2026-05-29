<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="light" lang="vi">
<head>
    <jsp:include page="/WEB-INF/jsp/common/head.jsp">
        <jsp:param name="title" value="${category.name} | The Digital Atelier"/>
    </jsp:include>
</head>
<body class="bg-background text-on-surface">
    <jsp:include page="/WEB-INF/jsp/common/header.jsp">
        <jsp:param name="currentPage" value="categories"/>
    </jsp:include>

    <main class="max-w-[1440px] mx-auto px-12 py-12">
        <!-- Breadcrumb -->
        <nav class="flex items-center gap-2 text-sm mb-12 opacity-70">
            <a class="hover:text-primary" href="${pageContext.request.contextPath}/home">Trang chủ</a>
            <span class="material-symbols-outlined text-xs">chevron_right</span>
            <a class="hover:text-primary" href="${pageContext.request.contextPath}/categories">Chủ đề</a>
            <span class="material-symbols-outlined text-xs">chevron_right</span>
            <span class="font-semibold">${category.name}</span>
        </nav>

        <header class="mb-12">
            <h1 class="font-serif text-4xl font-bold text-on-surface mb-2">Sách thuộc chủ đề: ${category.name}</h1>
            <p class="font-body text-gray-600">${category.description}</p>
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
                            <p class="text-gray-500 text-sm mb-3">${book.author.name}</p>
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
                        Không có sách nào thuộc chủ đề này.
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </main>

    <jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>
</body>
</html>
