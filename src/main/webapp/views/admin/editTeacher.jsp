<%--
  Created by IntelliJ IDEA.
  User: Your PC
  Date: 03/01/2025
  Time: 23:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <title>Edit Teacher</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<style>
  .hh {
    background: #4cae4c;
    width: 100%;
    color: #fff;
    text-align: center;
  }
</style>
<div class="container mt-4">
  <h1 class="hh">Edit Teacher</h1>
  <form action="/admin/teachers?action=edit" method="post" class="mb-4">
    <input type="hidden" name="teacherId" value="${teacher.teacherId}">
    <div class="form-group">
      <label for="fullName">Full Name:</label>
      <input type="text" class="form-control" id="fullName" name="fullName" value="${teacher.fullName}" required>
    </div>
    <div class="form-group">
      <label for="email">Email:</label>
      <input type="email" class="form-control" id="email" name="email" value="${teacher.email}" required>
    </div>
    <div class="form-group">
      <label for="phoneNumber">Phone Number:</label>
      <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" value="${teacher.phoneNumber}" required>
    </div>
    <button type="submit" class="btn btn-primary">Update Teacher</button>
  </form>
  <a href="/admin/teachers" class="btn btn-secondary">Back to Teachers List</a>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>