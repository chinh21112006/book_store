<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="light" lang="vi">
<head>
    <jsp:include page="/WEB-INF/jsp/common/head.jsp">
        <jsp:param name="title" value="Sách của ${author.name} | The Digital Atelier"/>
    </jsp:include>
</head>
<body class="bg-background text-on-surface">
    <jsp:include page="/WEB-INF/jsp/common/header.jsp">
        <jsp:param name="currentPage" value="authors"/>
    </jsp:include>

    <main class="max-w-[1440px] mx-auto px-12 py-12">
        <!-- Breadcrumb -->
        <nav class="flex items-center gap-2 text-sm mb-12 opacity-70">
            <a class="hover:text-primary" href="${pageContext.request.contextPath}/home">Trang chủ</a>
            <span class="material-symbols-outlined text-xs">chevron_right</span>
            <a class="hover:text-primary" href="${pageContext.request.contextPath}/authors">Tác giả</a>
            <span class="material-symbols-outlined text-xs">chevron_right</span>
            <span class="font-semibold">${author.name}</span>
        </nav>

        <header class="mb-12 flex items-center gap-6">
            <div class="relative w-32 h-32 p-1 border-2 border-primary-container rounded-full overflow-hidden flex-shrink-0">
                <img alt="${author.name}" class="w-full h-full object-cover rounded-full" src="${author.imageUrl}"/>
            </div>
            <div>
                <h1 class="font-serif text-4xl font-bold text-on-surface mb-2">Tác phẩm của: ${author.name}</h1>
                <p class="font-body text-gray-600">${author.bio}</p>
                <div class="mt-4 flex items-center space-x-2 text-primary">
                    <span class="material-symbols-outlined text-sm">book</span>
                    <span class="text-label-md font-bold uppercase tracking-wider">${author.books.size()} Tác phẩm</span>
                </div>
            </div>
        </header>

        <div class="grid grid-cols-4 gap-10">
            <c:choose>
                <c:when test="${not empty books}">
                    <c:forEach items="${books}" var="book">
                        <c:set var="currentBook" value="${book}" scope="request"/> <%-- Set book as currentBook --%>
                        <c:set var="isFavorite" value="${favoriteBookIds.contains(book.id)}" scope="request"/>
                        <jsp:include page="/WEB-INF/jsp/common/book-card.jsp"/> <%-- Include without params --%>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <div class="col-span-4 text-center py-10 text-on-surface-variant">
                        Không có sách nào của tác giả này.
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </main>

    <jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>
</body>
</html>