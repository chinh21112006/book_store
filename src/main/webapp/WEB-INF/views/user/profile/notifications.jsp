<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html class="light" lang="vi">
<head>
    <jsp:include page="/WEB-INF/jsp/common/head.jsp">
        <jsp:param name="title" value="Thông báo | The Digital Atelier"/>
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
                <jsp:param name="currentProfilePage" value="notifications"/>
                <jsp:param name="userProfileImageUrl" value="${loggedInUser.profileImageUrl}"/>
                <jsp:param name="userFirstName" value="${loggedInUser.firstName}"/>
                <jsp:param name="userLastName" value="${loggedInUser.lastName}"/>
            </jsp:include>

            <!-- Right Content Area -->
            <section class="col-span-9 space-y-8">
                <header class="mb-8">
                    <h1 class="text-4xl font-headline font-bold text-primary mb-2">Thông báo</h1>
                    <p class="text-on-surface-variant max-w-2xl">Cập nhật những tin tức mới nhất về đơn hàng, chương trình khuyến mãi và hoạt động từ Digital Atelier.</p>
                </header>
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                    <!-- Promo Hero Card -->
                    <div class="md:col-span-2 lg:col-span-2 bg-primary-container rounded-xl p-8 relative overflow-hidden flex flex-col justify-between group">
                        <div class="relative z-10">
                            <span class="inline-block bg-primary text-white text-[10px] px-3 py-1 rounded-full uppercase tracking-widest mb-4">Khuyến mãi mới</span>
                            <h3 class="text-3xl font-headline font-bold text-on-primary-container mb-2 leading-tight">Tuần lễ Văn học Cổ điển:<br/>Giảm đến 40%</h3>
                            <p class="text-on-primary-container/80 text-sm max-w-md">Khám phá lại những tác phẩm bất hủ từ Dickens, Dostoevsky và Nguyễn Du với ưu đãi đặc biệt dành riêng cho thành viên.</p>
                        </div>
                        <div class="mt-8 z-10">
                            <button class="bg-primary text-on-primary px-6 py-3 rounded-lg text-sm font-bold flex items-center gap-2 hover:bg-primary-dim transition-all">
                                Xem ngay <span class="material-symbols-outlined text-sm">arrow_forward</span>
                            </button>
                        </div>
                        <!-- Decorative element -->
                        <div class="absolute -right-12 -bottom-12 w-64 h-64 bg-primary/10 rounded-full blur-3xl group-hover:bg-primary/20 transition-all duration-500"></div>
                        <div class="absolute right-8 top-1/2 -translate-y-1/2 opacity-20 pointer-events-none">
                            <span class="material-symbols-outlined text-[120px]" style="font-variation-settings: 'wght' 100;">menu_book</span>
                        </div>
                    </div>
                    <!-- Order Status Small Card -->
                    <div class="bg-surface-container-lowest rounded-xl p-6 shadow-sm flex flex-col justify-between border-l-4 border-primary">
                        <div>
                            <div class="flex justify-between items-start mb-4">
                                <div class="bg-primary-container/30 p-2 rounded-lg text-primary">
                                    <span class="material-symbols-outlined">local_shipping</span>
                                </div>
                                <span class="text-[10px] text-stone-500 font-bold uppercase tracking-tighter">Hôm nay</span>
                            </div>
                            <h4 class="font-headline font-bold text-on-surface mb-1">Đơn hàng đang giao</h4>
                            <p class="text-xs text-on-surface-variant">Đơn hàng #DA-9921 của bạn đang được vận chuyển và dự kiến đến vào chiều nay.</p>
                        </div>
                        <a class="mt-6 text-xs font-bold text-primary flex items-center gap-1 hover:underline" href="#">
                            Theo dõi hành trình <span class="material-symbols-outlined text-xs">chevron_right</span>
                        </a>
                    </div>
                    <!-- System Update Card -->
                    <div class="bg-surface-container-low rounded-xl p-6 flex flex-col gap-4">
                        <div class="flex items-center gap-3">
                            <span class="material-symbols-outlined text-on-surface-variant" style="font-variation-settings: 'opsz' 20;">info</span>
                            <span class="text-xs text-stone-500 font-medium">12 Tháng 10, 2024</span>
                        </div>
                        <div>
                            <h4 class="font-headline font-bold text-on-surface mb-1 text-lg">Cập nhật điều khoản</h4>
                            <p class="text-sm text-on-surface-variant leading-relaxed">Chúng tôi vừa cập nhật chính sách bảo mật để tăng cường an toàn thông tin cho tài khoản của bạn.</p>
                        </div>
                    </div>
                    <!-- Another Notification Card -->
                    <div class="bg-surface-container-lowest rounded-xl p-6 shadow-sm">
                        <div class="flex justify-between items-start mb-4">
                            <div class="bg-secondary-container/30 p-2 rounded-lg text-secondary">
                                <span class="material-symbols-outlined">inventory_2</span>
                            </div>
                            <span class="text-[10px] text-stone-500 font-bold uppercase tracking-tighter">2 ngày trước</span>
                        </div>
                        <h4 class="font-headline font-bold text-on-surface mb-1">Hàng đã về kho!</h4>
                        <p class="text-sm text-on-surface-variant">Cuốn "Chiến Tranh và Hòa Bình" (Bản giới hạn) mà bạn quan tâm hiện đã có sẵn.</p>
                        <div class="mt-4 flex gap-2">
                            <button class="bg-secondary text-white px-4 py-2 rounded-lg text-xs font-medium flex-grow hover:opacity-90">Mua ngay</button>
                            <button class="p-2 border border-stone-200 rounded-lg text-stone-500 hover:bg-stone-50">
                                <span class="material-symbols-outlined text-sm">close</span>
                            </button>
                        </div>
                    </div>
                    <!-- Points Notification -->
                    <div class="bg-gradient-to-br from-surface-container-highest to-surface-container-low rounded-xl p-6 flex flex-col justify-center items-center text-center">
                        <div class="w-16 h-16 bg-white/50 backdrop-blur rounded-full flex items-center justify-center mb-4">
                            <span class="material-symbols-outlined text-3xl text-primary" style="font-variation-settings: 'FILL' 1;">star</span>
                        </div>
                        <h4 class="font-headline font-bold text-on-surface">Bạn đã nhận được 500 điểm!</h4>
                        <p class="text-xs text-on-surface-variant mt-2 px-4">Cảm ơn bạn đã hoàn thành đánh giá cho cuốn "Nhà Giả Kim". Điểm đã được cộng vào ví.</p>
                    </div>
                </div>
                <!-- Empty State / Pagination Logic Placeholder -->
                <div class="mt-12 text-center py-12 border-t border-stone-100">
                    <button class="text-sm font-bold text-stone-400 hover:text-primary transition-colors flex items-center gap-2 mx-auto">
                        Xem các thông báo cũ hơn <span class="material-symbols-outlined text-sm">history</span>
                    </button>
                </div>
            </section>
        </div>
    </main>

    <jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>
</body>
</html>