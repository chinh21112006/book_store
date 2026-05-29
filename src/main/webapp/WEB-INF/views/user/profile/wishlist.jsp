<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html class="light" lang="vi">
<head>
    <jsp:include page="/WEB-INF/jsp/common/head.jsp">
        <jsp:param name="title" value="Danh sách yêu thích | The Digital Atelier"/>
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
                <jsp:param name="currentProfilePage" value="wishlist"/>
                <jsp:param name="userProfileImageUrl" value="${loggedInUser.profileImageUrl}"/>
                <jsp:param name="userFirstName" value="${loggedInUser.firstName}"/>
                <jsp:param name="userLastName" value="${loggedInUser.lastName}"/>
            </jsp:include>

            <!-- Wishlist Content Area -->
            <section class="col-span-9">
                <div class="mb-10">
                    <h1 class="font-headline text-4xl font-bold text-on-surface tracking-tight mb-3">Danh sách yêu thích</h1>
                    <p class="text-on-surface-variant font-light max-w-2xl">Lưu giữ những tác phẩm bạn mong muốn sở hữu. Chúng tôi sẽ thông báo cho bạn khi có ưu đãi đặc biệt.</p>
                </div>
                <!-- Bento-style Grid -->
                <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-8 wishlist-grid">
                    <c:choose>
                        <c:when test="${not empty favoriteBooks}">
                            <c:forEach items="${favoriteBooks}" var="book">
                                <c:set var="currentBook" value="${book}" scope="request"/>
                                <c:set var="isFavorite" value="true" scope="request"/>
                                <%-- Removed showRemoveButton as per user request --%>
                                <jsp:include page="/WEB-INF/jsp/common/book-card.jsp"/>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <div class="col-span-full text-center py-10 text-on-surface-variant">
                                Bạn chưa có sách nào trong danh sách yêu thích.
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </section>
        </div>
    </main>

    <jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>
</body>
</html>