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
                        <c:set var="currentBook" value="${book}" scope="request"/>
                        <c:set var="isFavorite" value="${favoriteBookIds.contains(book.id)}" scope="request"/>
                        <jsp:include page="/WEB-INF/jsp/common/book-card.jsp"/>
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