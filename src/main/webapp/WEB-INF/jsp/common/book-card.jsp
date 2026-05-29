<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%--
    This fragment displays a single book card.
    Parameters:
    - currentBook: The Book object to display. (Changed from 'book' to 'currentBook')
    - isFavorite: A boolean indicating if the book is in the user's favorite list.
    - showRemoveButton: A boolean indicating if the remove button should be shown (e.g., for wishlist page).
--%>

<div class="group book-card-item"> <%-- Added book-card-item class for easier DOM manipulation in JS --%>
    <div class="aspect-[2/3] bg-white rounded-lg overflow-hidden relative mb-6 shadow-sm border border-gray-100">
        <a href="${pageContext.request.contextPath}/books/${currentBook.id}">
            <img alt="${currentBook.title}" class="w-full h-full object-cover transition-transform duration-500 group-hover:scale-110" src="${currentBook.imageUrl}"/>
        </a>
        <sec:authorize access="isAuthenticated()">
            <button type="button" onclick="toggleFavorite(this, ${currentBook.id})"
               class="absolute top-4 right-4 z-10 bg-white/90 backdrop-blur p-2 rounded-full text-primary hover:text-error transition-colors shadow-sm"
               title="${isFavorite ? 'Xóa khỏi danh sách yêu thích' : 'Thêm vào danh sách yêu thích'}"
               data-book-id="${currentBook.id}" data-is-favorite="${isFavorite}">
                <span class="material-symbols-outlined text-xl" style="font-variation-settings: 'FILL' ${isFavorite ? 1 : 0};">favorite</span>
            </button>
        </sec:authorize>
        <form action="${pageContext.request.contextPath}/cart/add" method="post">
            <input type="hidden" name="bookId" value="${currentBook.id}"/>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <button type="submit" class="absolute bottom-4 left-4 right-4 bg-primary text-on-primary py-3 rounded-lg font-bold opacity-0 translate-y-4 group-hover:opacity-100 group-hover:translate-y-0 transition-all duration-300 flex items-center justify-center gap-2">
                <span class="material-symbols-outlined text-sm">shopping_cart</span> Thêm Vào Giỏ
            </button>
        </form>
    </div>
    <a href="${pageContext.request.contextPath}/books/${currentBook.id}">
        <h3 class="font-serif text-xl font-bold mb-1 group-hover:text-primary transition-colors">${currentBook.title}</h3>
    </a>
    <p class="text-gray-500 text-sm mb-3">${currentBook.author.name}</p>
    <div class="flex items-center gap-2">
        <span class="text-primary font-bold text-lg">
            <fmt:formatNumber value="${currentBook.price}" type="number" groupingUsed="true"/>đ
        </span>
        <c:if test="${currentBook.oldPrice != null}">
            <span class="text-gray-300 line-through text-sm">
                <fmt:formatNumber value="${currentBook.oldPrice}" type="number" groupingUsed="true"/>đ
            </span>
        </c:if>
    </div>
    <c:if test="${showRemoveButton}">
        <button type="button" onclick="removeFromWishlist(this, ${currentBook.id})"
           class="mt-4 w-full bg-error text-on-error py-2 rounded-lg font-bold text-sm hover:bg-error-dim transition-colors">
            Xóa khỏi danh sách yêu thích
        </button>
    </c:if>
</div>