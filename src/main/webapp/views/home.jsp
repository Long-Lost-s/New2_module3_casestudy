<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Center Manager</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .navbar {
            padding: 15px 0;
            background-color: #1a1a1a;
        }
        .navbar-brand {
            font-size: 24px;
            color: #4158D0 !important;
            font-weight: bold;
        }
        .nav-link {
            color: #fff !important;
            margin: 0 10px;
            font-weight: 500;
        }
        .nav-link:hover {
            color: #4158D0 !important;
        }
        .dropdown-menu {
            background-color: #1a1a1a;
            border: 1px solid #333;
        }
        .dropdown-item {
            color: #fff;
        }
        .dropdown-item:hover {
            background-color: #333;
            color: #4158D0;
        }
        .btn-register {
            background-color: #4158D0;
            color: #fff;
            border: none;
            padding: 8px 20px;
            border-radius: 5px;
        }
        .btn-register:hover {
            background-color: #3448b0;
            color: #fff;
        }
        .language-select {
            background: transparent;
            border: 1px solid #333;
            color: #fff;
            padding: 5px;
            border-radius: 5px;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container">
        <!-- Logo -->
        <a class="navbar-brand" href="#">
            ILA
        </a>

        <!-- Toggle Button for Mobile -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <!-- Navigation Items -->
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link" href="#">Giới thiệu</a>
                </li>
            </ul>

            <!-- Authentication Buttons -->
            <div class="d-flex align-items-center">
                <a href="/views/login.jsp" class="nav-link">Đăng nhập</a>
                <a href="/views/register.jsp" class="btn btn-register ms-3">Đăng ký ngay</a>

                <!-- Language Selector -->
                <select class="language-select ms-3">
                    <option value="vi">🇻🇳 VN</option>
                    <option value="en">🇺🇸 EN</option>
                </select>
            </div>
        </div>
    </div>
</nav>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>