<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 1/2/2025
  Time: 9:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Register</title>
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background-image: url('/views/img/background(1).jpg');
      background-size: cover;
      background-repeat: no-repeat;
      background-attachment: fixed;
    }
    .container {
      max-width: 400px;
      background-color: rgba(255, 255, 255, 0.8); /* Make the background slightly transparent */
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      margin-top: 50px;
    }
    .btn-primary {
      background-color: #007bff;
      border-color: #007bff;
    }
  </style>
</head>
<body>
<nav class="navbar navbar-light" style="background-color: #e3f2fd;">
  <div class="container-fluid">
    <a class="navbar-brand" href="/home" style="color: #007bff;">Home</a>
  </div>
</nav>
<div class="container">
  <h1 class="text-center">Register</h1>

  <!-- Success/Error Messages -->
  <c:if test="${param.success != null}">
    <div class="alert alert-success">${param.success}</div>
  </c:if>
  <c:if test="${param.error != null}">
    <div class="alert alert-danger">${param.error}</div>
  </c:if>

  <form action="/register" method="post" class="mt-4">
    <div class="form-group">
      <label for="username">Username</label>
      <input type="text" id="username" name="username" class="form-control" required>
    </div>

    <div class="form-group mt-3">
      <label for="password">Password</label>
      <input type="password" id="password" name="password" class="form-control" required>
    </div>

    <div class="form-group mt-3">
      <label for="email">Email</label>
      <input type="email" id="email" name="email" class="form-control" required>
    </div>

    <div class="form-group mt-3">
      <label for="role">Role</label>
      <select id="role" name="role" class="form-control" required>
        <option value="admin">Admin</option>
        <option value="academic_staff">Academic Staff</option>
        <option value="teacher">Teacher</option>
        <option value="student">Student</option>
      </select>
    </div>

    <button type="submit" class="btn btn-primary mt-4">Register</button>
  </form>

  <div class="text-center mt-3">
    <a href="/login">Already have an account? Login here</a>
  </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>