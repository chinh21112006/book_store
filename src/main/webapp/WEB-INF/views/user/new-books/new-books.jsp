<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html class="light" lang="vi">
<head>
    <jsp:include page="/WEB-INF/jsp/common/head.jsp">
        <jsp:param name="title" value="Sách Mới | The Digital Atelier"/>
    </jsp:include>
    <style>
        .book-card-shadow { box-shadow: 0 4px 20px -2px rgba(147, 75, 25, 0.08); }
    </style>
</head>
<body class="bg-background text-on-surface">
    <jsp:include page="/WEB-INF/jsp/common/header.jsp">
        <jsp:param name="currentPage" value="new"/>
    </jsp:include>

    <main class="max-w-[1440px] mx-auto px-12 py-12">
        <header class="mb-12">
            <h1 class="font-serif text-4xl font-bold text-on-surface mb-2">Sách Mới Về</h1>
            <p class="font-body text-gray-600">Những tựa sách vừa cập bến Digital Atelier tuần này, được sắp xếp theo thời gian mới nhất.</p>
        </header>

        <div class="grid grid-cols-4 gap-10">
            <c:choose>
                <c:when test="${not empty newBooks}">
                    <c:forEach items="${newBooks}" var="book">
                        <c:set var="currentBook" value="${book}" scope="request"/> <%-- Set book as currentBook --%>
                        <c:set var="isFavorite" value="${favoriteBookIds.contains(book.id)}" scope="request"/>
                        <jsp:include page="/WEB-INF/jsp/common/book-card.jsp"/> <%-- Include without params --%>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <div class="col-span-4 text-center py-10 text-on-surface-variant">
                        Không có sách mới nào.
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </main>

    <jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>
</body>
</html>