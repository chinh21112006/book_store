<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="light" lang="vi">
<head>
    <jsp:include page="/WEB-INF/jsp/common/head.jsp">
        <jsp:param name="title" value="Trang Chủ | The Digital Atelier"/>
    </jsp:include>
</head>
<body class="bg-background text-on-surface">
    <jsp:include page="/WEB-INF/jsp/common/header.jsp">
        <jsp:param name="currentPage" value="home"/>
    </jsp:include>

    <main>
        <section class="relative h-[600px] overflow-hidden bg-orange-50">
            <div class="absolute inset-0 z-0">
                <img alt="Atmospheric library" class="w-full h-full object-cover opacity-30 mix-blend-multiply" src="https://lh3.googleusercontent.com/aida-public/AB6AXuCVGbX4_IVAg_bnK9IE6a_tC3sq4wWIcMRYlTVPPGxbvOvz8AFqMi-N-9FhJGSjeuI8mBvO1J5sm97FYXqCqFcyyX3tNa5CkdYgZmSTZOj1pqv72c0LKOw_B_uMFYt_TaipAEGgsG4a5UDaB2GfIvT4h7YBZo89OYANRCwT_8VmBJaSYX6SgEMu4C839MTjP_zwSB7FgeU2EnXeq4Qlg-3lDllSfrOi1lXw5uHrJF6YfhcrF4kviTmhqKoPSvtpV4obvwaa50lMNO3e2"/>
                <div class="absolute inset-0 hero-gradient"></div>
            </div>
            <div class="relative z-10 max-w-[1440px] mx-auto px-12 h-full flex flex-col justify-center items-start">
                <span class="text-primary font-body font-semibold tracking-widest uppercase mb-4">Bộ Sưu Tập Mùa Thu</span>
                <h1 class="font-serif text-7xl font-black text-on-surface leading-tight mb-6 max-w-2xl">Đánh Thức Tâm Hồn Qua Từng Trang Sách.</h1>
                <p class="font-body text-xl text-on-surface-variant mb-10 max-w-xl leading-relaxed">
                    Khám phá những tác phẩm văn học kinh điển và hiện đại được tuyển chọn kỹ lưỡng cho những tâm hồn tò mò.
                </p>
                <div class="flex gap-4">
                    <button class="bg-primary hover:bg-orange-800 text-on-primary px-10 py-4 rounded-lg font-body font-bold transition-all shadow-lg">Khám Phá Ngay</button>
                </div>
            </div>
        </section>

        <!-- Featured Section (Bento Grid) -->
        <section class="max-w-[1440px] mx-auto px-12 py-24">
            <div class="flex justify-between items-end mb-12">
                <div>
                    <h2 class="font-serif text-4xl font-bold text-on-surface mb-2">Tác Phẩm Tiêu Biểu</h2>
                    <div class="h-1 w-20 bg-primary"></div>
                </div>
                <a class="text-primary font-body font-semibold flex items-center gap-2 hover:underline underline-offset-4" href="#">
                    Xem tất cả <span class="material-symbols-outlined text-sm">arrow_forward</span>
                </a>
            </div>
            <div class="grid grid-cols-12 gap-8 h-[700px]">
                <!-- Main Featured Card -->
                <c:if test="${not empty books and books.size() > 0}">
                    <div class="col-span-6 bg-surface-container-lowest rounded-lg overflow-hidden group cursor-pointer relative book-card-shadow">
                        <a href="${pageContext.request.contextPath}/books/${books[0].id}">
                            <img alt="${books[0].title}" class="w-full h-full object-cover transition-transform duration-700 group-hover:scale-110" src="${books[0].imageUrl}"/>
                            <div class="absolute bottom-0 left-0 right-0 p-8 bg-gradient-to-t from-black/80 to-transparent text-white">
                                <span class="bg-primary px-3 py-1 text-xs font-bold rounded mb-4 inline-block">SÁCH CỦA THÁNG</span>
                                <h3 class="font-serif text-3xl font-bold mb-2">${books[0].title}</h3>
                                <p class="text-white/80 mb-4 line-clamp-2">Tác giả: ${books[0].author.name}. Giá: <fmt:formatNumber value="${books[0].price}" type="number" groupingUsed="true"/>đ</p>
                                <button class="bg-white text-black px-6 py-2 rounded font-bold text-sm">Tìm Hiểu Thêm</button>
                            </div>
                        </a>
                    </div>
                </c:if>
                <c:if test="${empty books or books.size() == 0}">
                    <div class="col-span-6 bg-surface-container-lowest rounded-lg overflow-hidden relative book-card-shadow flex items-center justify-center">
                        <p class="text-on-surface-variant">Không có sách tiêu biểu nào.</p>
                    </div>
                </c:if>

                <!-- Secondary Featured Cards -->
                <div class="col-span-3 grid grid-rows-2 gap-8">
                    <div class="bg-surface-container-high rounded-lg p-6 flex flex-col justify-between hover:bg-surface-container-highest transition-colors cursor-pointer group">
                        <div>
                            <h4 class="font-serif text-xl font-bold text-on-surface mb-2">Văn Chương Cổ Điển</h4>
                            <p class="text-sm text-on-surface-variant font-body">Sống lại những giá trị vượt thời gian.</p>
                        </div>
                        <img alt="Classic books" class="w-32 self-end transform group-hover:rotate-12 transition-transform duration-500" src="https://lh3.googleusercontent.com/aida-public/AB6AXuDauhZI-y8LBW3lxJNGbBoW8DI32VxzS-pXLk2Oujvk-AcnCKGhvt0W6dLe54EHU9v6lG7GBykbZGuoadQTHZZPaEIr-R56RgG4qzAhzJcGXhn3vnWSXikFtv-irM5LgWN2ZFbTzYPcrBpPQBf1pI-LxXkqXgTLT9kEDSHoDqeBX7AldliGGls2OlKd7tB_ljEsIeXiF0ueHomqfd5AVHMYebAZ0mrgsvcqKyHBdGozvn6o_ZQNbOKEdY4wA9KT1zvM3bCPPAuiZnh"/>
                    </div>
                    <div class="bg-tertiary-container rounded-lg p-6 flex flex-col justify-between hover:opacity-90 transition-opacity cursor-pointer group">
                        <div>
                            <h4 class="font-serif text-xl font-bold text-on-tertiary-container mb-2">Tư Duy Đột Phá</h4>
                            <p class="text-sm text-on-tertiary-container/70 font-body">Mở rộng tầm nhìn và kiến thức.</p>
                        </div>
                        <span class="material-symbols-outlined text-6xl text-on-tertiary-container/20 self-end">lightbulb</span>
                    </div>
                </div>
                <div class="col-span-3 bg-surface-container rounded-lg p-8 flex flex-col items-center text-center justify-center border-2 border-dashed border-outline-variant/30">
                    <span class="material-symbols-outlined text-5xl text-primary mb-4">auto_stories</span>
                    <h4 class="font-serif text-2xl font-bold mb-4">Gói Hội Viên Thân Thiết</h4>
                    <p class="text-on-surface-variant text-sm mb-6 leading-relaxed">Nhận ưu đãi 20% cho tất cả đơn hàng và truy cập thư viện ebook độc quyền.</p>
                    <button class="w-full py-3 border-2 border-primary text-primary font-bold rounded-lg hover:bg-primary hover:text-white transition-all">Tham Gia Ngay</button>
                </div>
            </div>
        </section>

        <section class="max-w-[1440px] mx-auto px-12 py-24">
            <div class="flex justify-between items-end mb-16">
                <div>
                    <h2 class="font-serif text-4xl font-bold text-on-surface mb-2">Sách Mới Về</h2>
                    <p class="font-body text-gray-600">Những tựa sách vừa cập bến Digital Atelier tuần này.</p>
                </div>
            </div>

            <!-- HIỂN THỊ SÁCH ĐỘNG TỪ DATABASE -->
            <div class="grid grid-cols-4 gap-10">
                <c:forEach items="${books}" var="book">
                    <c:set var="currentBook" value="${book}" scope="request"/>
                    <c:set var="isFavorite" value="${favoriteBookIds.contains(book.id)}" scope="request"/>
                    <jsp:include page="/WEB-INF/jsp/common/book-card.jsp"/>
                </c:forEach>
            </div>
        </section>
    </main>

    <jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>
</body>
</html>