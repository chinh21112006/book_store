<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="light" lang="vi">
<head>
    <jsp:include page="/WEB-INF/jsp/common/head.jsp">
        <jsp:param name="title" value="Hồ sơ cá nhân | The Digital Atelier"/>
    </jsp:include>
    <style>
        .material-symbols-outlined {
            font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
            vertical-align: middle;
        }
        body { font-family: 'Be Vietnam Pro', sans-serif; }
        /* ĐỒNG BỘ FONT CHỮ: Ép tất cả h1, h2, h3 dùng Noto Serif giống hệt trang Đơn hàng */
        h1, h2, h3, .brand-font { font-family: 'Noto Serif', serif; }
    </style>
</head>
<body class="bg-background text-on-surface min-h-screen flex flex-col">
    <jsp:include page="/WEB-INF/jsp/common/header.jsp">
        <jsp:param name="currentPage" value="profile"/>
    </jsp:include>

    <!-- Thêm flex-grow để đẩy Footer luôn nằm sát đáy trang nếu nội dung ngắn -->
    <main class="flex-grow max-w-[1440px] w-full mx-auto px-12 py-12">
        <%-- Flash Messages --%>
        <c:if test="${not empty successMessage}">
            <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded relative mb-4" role="alert">
                <span class="block sm:inline">${successMessage}</span>
            </div>
        </c:if>
        <c:if test="${not empty errorMessage}">
            <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative mb-4" role="alert">
                <span class="block sm:inline">${errorMessage}</span>
            </div>
        </c:if>

        <div class="grid grid-cols-12 gap-12 items-start">
            <!-- Side Navigation (Web) -->
            <jsp:include page="/WEB-INF/jsp/common/profile-sidebar.jsp">
                <jsp:param name="currentProfilePage" value="personal-info"/>
                <jsp:param name="userProfileImageUrl" value="${user.profileImageUrl}"/>
                <jsp:param name="userFirstName" value="${user.firstName}"/>
                <jsp:param name="userLastName" value="${user.lastName}"/>
            </jsp:include>

            <!-- Main Content Area -->
            <section class="col-span-9 space-y-8">
                <!-- Header Section -->
                <div class="bg-surface-container-low p-8 rounded-2xl relative overflow-hidden">
                    <div class="relative z-10 flex flex-col md:flex-row items-center gap-6">
                        <div class="relative group">
                            <div class="w-32 h-32 rounded-full overflow-hidden border-4 border-surface-container-lowest shadow-sm">
                                <img class="w-full h-full object-cover" src="${user.profileImageUrl != null && user.profileImageUrl ne '' ? user.profileImageUrl : 'https://via.placeholder.com/128/FFDDC1/934B19?text=AVT'}" alt="${user.fullName}"/>
                            </div>
                            <button class="absolute bottom-1 right-1 bg-primary text-white p-2 rounded-full shadow-lg hover:bg-primary-dim transition-colors scale-90">
                                <span class="material-symbols-outlined text-sm" data-icon="edit">edit</span>
                            </button>
                        </div>
                        <div class="text-center md:text-left">
                            <h1 class="text-3xl font-bold text-on-surface">${user.firstName} ${user.lastName}</h1>
                            <p class="text-on-surface-variant font-medium">Thành viên Thân thiết (Silver)</p>
                            <div class="mt-3 flex gap-2 justify-center md:justify-start">
                                <span class="px-3 py-1 bg-secondary-container text-on-secondary-container rounded-full text-xs font-medium">Reading Progress: 75%</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Profile Form -->
                <div class="bg-surface-container-lowest p-8 rounded-2xl shadow-[0_4px_24px_-4px_rgba(54,59,18,0.04)]">
                    <form action="${pageContext.request.contextPath}/profile/update" method="post" class="space-y-8">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <input type="hidden" name="id" value="${user.id}"/>
                        <input type="hidden" name="email" value="${user.email}"/>
                        <input type="hidden" name="password" value="${user.password}"/>
                        <input type="hidden" name="role" value="${user.role}"/>

                        <div class="grid grid-cols-1 md:grid-cols-2 gap-x-8 gap-y-6">
                            <div class="space-y-2">
                                <label class="text-xs font-semibold text-on-surface-variant uppercase tracking-wider">Họ</label>
                                <input class="w-full bg-surface-container-high border-none rounded-lg px-4 py-3 text-on-surface focus:ring-2 focus:ring-primary/20 transition-all outline-none" type="text" name="lastName" value="${user.lastName != null ? user.lastName : ''}"/>
                            </div>
                            <div class="space-y-2">
                                <label class="text-xs font-semibold text-on-surface-variant uppercase tracking-wider">Tên</label>
                                <input class="w-full bg-surface-container-high border-none rounded-lg px-4 py-3 text-on-surface focus:ring-2 focus:ring-primary/20 transition-all outline-none" type="text" name="firstName" value="${user.firstName != null ? user.firstName : ''}"/>
                            </div>
                            <div class="space-y-2">
                                <label class="text-xs font-semibold text-on-surface-variant uppercase tracking-wider">Email liên hệ</label>
                                <input class="w-full bg-surface-container-high border-none rounded-lg px-4 py-3 text-on-surface focus:ring-2 focus:ring-primary/20 transition-all outline-none" type="email" name="email" value="${user.email}" readonly/>
                            </div>
                            <div class="space-y-2">
                                <label class="text-xs font-semibold text-on-surface-variant uppercase tracking-wider">Số điện thoại</label>
                                <input class="w-full bg-surface-container-high border-none rounded-lg px-4 py-3 text-on-surface focus:ring-2 focus:ring-primary/20 transition-all outline-none" type="tel" name="phoneNumber" value="${user.phoneNumber != null ? user.phoneNumber : ''}"/>
                            </div>
                            <div class="space-y-2">
                                <label class="text-xs font-semibold text-on-surface-variant uppercase tracking-wider">Ngày sinh</label>
                                <input class="w-full bg-surface-container-high border-none rounded-lg px-4 py-3 text-on-surface focus:ring-2 focus:ring-primary/20 transition-all outline-none" type="date" name="dateOfBirth" value="${user.dateOfBirth}"/>
                            </div>
                            <div class="md:col-span-2 space-y-2">
                                <label class="text-xs font-semibold text-on-surface-variant uppercase tracking-wider">Tiểu sử ngắn</label>
                                <textarea class="w-full bg-surface-container-high border-none rounded-lg px-4 py-3 text-on-surface focus:ring-2 focus:ring-primary/20 transition-all outline-none resize-none" rows="3" name="bio">${user.bio != null ? user.bio : ''}</textarea>
                            </div>
                            <div class="md:col-span-2 space-y-2">
                                <label class="text-xs font-semibold text-on-surface-variant uppercase tracking-wider">URL Ảnh đại diện</label>
                                <input class="w-full bg-surface-container-high border-none rounded-lg px-4 py-3 text-on-surface focus:ring-2 focus:ring-primary/20 transition-all outline-none" type="text" name="profileImageUrl" value="${user.profileImageUrl != null ? user.profileImageUrl : ''}"/>
                            </div>
                        </div>
                        <div class="flex flex-col sm:flex-row gap-4 pt-4">
                            <button class="flex-1 bg-primary text-on-primary font-semibold py-3 px-8 rounded-lg shadow-sm hover:bg-primary-dim transition-all active:scale-[0.98]" type="submit">
                                Cập nhật thông tin
                            </button>
                            <button class="flex-1 border-2 border-primary text-primary font-semibold py-3 px-8 rounded-lg hover:bg-primary/5 transition-all active:scale-[0.98]" type="button">
                                Thay đổi mật khẩu
                            </button>
                        </div>
                    </form>
                </div>

                <!-- Activity Bento Grid -->
                <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                    <div class="md:col-span-2 bg-surface-container-low p-6 rounded-2xl flex flex-col justify-between">
                        <div class="flex items-center justify-between mb-4">
                            <h3 class="font-bold text-lg">Đang đọc</h3>
                            <a class="text-primary text-xs font-bold uppercase" href="#">Xem tất cả</a>
                        </div>
                        <div class="flex gap-4">
                            <img class="w-20 h-28 object-cover rounded shadow-md" src="https://lh3.googleusercontent.com/aida-public/AB6AXuCkJvfJaT8pRZ2wFtIv2__pldUmz76Ped8SgB1r5AzdJbbaMs42tv015s7l9ksR3rWJ-fjLOxndINGA0b0rESJBNtSceNcbZk9oQgB_UWFlhjH53fwmCWiANhDZ2HScJGtn2iAk--hIi0ihDzGgV1xqa99bM3LyhITXgx-GIKu-Ab2zy7xmjP6PS67pEezPWevCmQMyIfoV2P1KywPUvsIKpHeLv2hLbg8dvP8VaCgwcGgt3pCSwNqCTiMYCnPksWggGwo3nMRC4Ril" alt="Book Cover"/>
                            <div class="flex-1 space-y-2">
                                <p class="font-bold text-sm leading-tight">Nghệ Thuật Của Sự Tối Giản</p>
                                <p class="text-xs text-on-surface-variant italic">Dominique Loreau</p>
                                <div class="w-full bg-surface-container-highest h-1.5 rounded-full mt-4">
                                    <div class="bg-primary h-full w-[65%] rounded-full"></div>
                                </div>
                                <p class="text-[10px] font-bold text-primary mt-1">65% đã hoàn thành</p>
                            </div>
                        </div>
                    </div>
                    <div class="bg-primary text-on-primary p-6 rounded-2xl flex flex-col justify-center items-center text-center space-y-2">
                        <span class="material-symbols-outlined text-4xl" data-icon="auto_stories">auto_stories</span>
                        <p class="text-3xl font-bold">24</p>
                        <p class="text-xs font-medium uppercase tracking-widest opacity-80">Cuốn sách đã đọc</p>
                    </div>
                </div>
            </section>
        </div>
    </main>

    <!-- BỔ SUNG: Phần Footer ở dưới cùng giống như trang đơn hàng -->
    <jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>

    <!-- BottomNavBar (Mobile Only) -->
    <nav class="md:hidden fixed bottom-0 left-0 w-full flex justify-around items-center px-4 pt-2 pb-6 bg-[#fefee5]/90 dark:bg-stone-950/90 backdrop-blur-xl rounded-t-2xl z-50 shadow-[0_-4px_24px_-4px_rgba(54,59,18,0.06)]">
        <a class="flex flex-col items-center justify-center text-[#363b12]/60 dark:text-[#fafcda]/60" href="#">
            <span class="material-symbols-outlined" data-icon="home">home</span>
            <span class="text-[10px] font-['Be_Vietnam_Pro'] font-medium">Home</span>
        </a>
        <a class="flex flex-col items-center justify-center text-[#363b12]/60 dark:text-[#fafcda]/60" href="#">
            <span class="material-symbols-outlined" data-icon="favorite">favorite</span>
            <span class="text-[10px] font-['Be_Vietnam_Pro'] font-medium">Wishlist</span>
        </a>
        <a class="flex flex-col items-center justify-center text-[#363b12]/60 dark:text-[#fafcda]/60" href="#">
            <span class="material-symbols-outlined" data-icon="auto_stories">auto_stories</span>
            <span class="text-[10px] font-['Be_Vietnam_Pro'] font-medium">My Library</span>
        </a>
        <a class="flex flex-col items-center justify-center bg-[#934b19]/10 dark:bg-[#f4a460]/20 text-[#934b19] dark:text-[#f4a460] rounded-xl px-4 py-1" href="#">
            <span class="material-symbols-outlined" data-icon="person">person</span>
            <span class="text-[10px] font-['Be_Vietnam_Pro'] font-medium">Profile</span>
        </a>
    </nav>
</body>
</html>