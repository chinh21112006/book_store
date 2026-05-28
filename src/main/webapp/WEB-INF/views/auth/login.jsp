<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đăng Nhập | Bookstore</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif:wght@700&family=Be+Vietnam+Pro:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Be Vietnam Pro', sans-serif; background-color: #fefee5; }
        .font-serif { font-family: 'Noto Serif', serif; }
    </style>
</head>
<body class="min-h-screen flex items-center justify-center p-4">
    <div class="w-full max-w-[1000px] bg-white rounded-xl shadow-2xl overflow-hidden flex border border-gray-100">

        <!-- Left Side Image -->
        <div class="hidden md:block w-1/2 relative bg-gray-200">
            <img src="https://images.unsplash.com/photo-1507842217343-583bb7270b66?q=80&w=1000" class="absolute inset-0 w-full h-full object-cover">
            <div class="absolute inset-0 bg-black/30"></div>
        </div>

        <!-- Right Side Form -->
        <div class="w-full md:w-1/2 p-12">
            <h2 class="font-serif text-3xl font-bold mb-6 text-[#363b12]">Chào mừng trở lại</h2>

            <!-- Thông báo lỗi -->
            <c:if test="${param.error != null}">
                <div class="mb-4 p-3 bg-red-100 text-red-700 rounded-lg text-sm">
                    Email hoặc mật khẩu không đúng!
                </div>
            </c:if>

            <!-- Thông báo đăng ký thành công -->
            <c:if test="${param.registered != null}">
                <div class="mb-4 p-3 bg-green-100 text-green-700 rounded-lg text-sm">
                    Đăng ký thành công! Vui lòng đăng nhập.
                </div>
            </c:if>

            <form action="${pageContext.request.contextPath}/perform_login" method="POST" class="space-y-6">
                <!-- CSRF Token (Bắt buộc) -->
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                <div>
                    <label class="block text-sm font-medium mb-2">Địa chỉ Email</label>
                    <input name="username" type="email" required class="w-full px-4 py-3 bg-gray-50 border rounded-lg focus:ring-2 focus:ring-[#934b19]/20 outline-none">
                </div>

                <div>
                    <label class="block text-sm font-medium mb-2">Mật khẩu</label>
                    <input name="password" type="password" required class="w-full px-4 py-3 bg-gray-50 border rounded-lg focus:ring-2 focus:ring-[#934b19]/20 outline-none">
                </div>

                <button type="submit" class="w-full py-4 bg-[#934b19] text-white font-bold rounded-lg hover:bg-[#843f0d] transition-all">
                    Đăng Nhập
                </button>
            </form>

            <p class="mt-8 text-center text-sm text-gray-600">
                Chưa có tài khoản?
                <a href="${pageContext.request.contextPath}/register" class="text-[#934b19] font-bold hover:underline">Đăng ký ngay</a>
            </p>
        </div>
    </div>
</body>
</html>
