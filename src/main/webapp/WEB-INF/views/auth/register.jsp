<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đăng Ký | The Digital Atelier</title>
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
            <h2 class="font-serif text-3xl font-bold mb-6 text-[#363b12]">Tạo tài khoản mới</h2>

            <!-- Thông báo lỗi -->
            <c:if test="${error != null}">
                <div class="mb-4 p-3 bg-red-100 text-red-700 rounded-lg text-sm">
                    ${error}
                </div>
            </c:if>

            <form action="${pageContext.request.contextPath}/register" method="POST" class="space-y-6">
                <!-- CSRF Token (Bắt buộc) -->
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                <div>
                    <label for="fullName" class="block text-sm font-medium mb-2">Họ và tên</label>
                    <input id="fullName" name="fullName" type="text" required class="w-full px-4 py-3 bg-gray-50 border rounded-lg focus:ring-2 focus:ring-[#934b19]/20 outline-none">
                </div>

                <div>
                    <label for="email" class="block text-sm font-medium mb-2">Địa chỉ Email</label>
                    <input id="email" name="email" type="email" required class="w-full px-4 py-3 bg-gray-50 border rounded-lg focus:ring-2 focus:ring-[#934b19]/20 outline-none">
                </div>

                <div>
                    <label for="password" class="block text-sm font-medium mb-2">Mật khẩu</label>
                    <input id="password" name="password" type="password" required class="w-full px-4 py-3 bg-gray-50 border rounded-lg focus:ring-2 focus:ring-[#934b19]/20 outline-none">
                </div>

                <button type="submit" class="w-full py-4 bg-[#934b19] text-white font-bold rounded-lg hover:bg-[#843f0d] transition-all">
                    Đăng Ký
                </button>
            </form>
            <p class="mt-6 text-center text-sm text-gray-600">
                Đã có tài khoản? <a href="${pageContext.request.contextPath}/login" class="font-bold text-[#934b19] hover:underline">Đăng nhập ngay</a>
            </p>
        </div>
    </div>
</body>
</html>
