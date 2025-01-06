<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Admin Dashboard</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <style>
    body {
      background-image: url('/views/img/background.jpg');
      background-size: cover;
      background-repeat: no-repeat;
      background-attachment: fixed;
    }
  </style>
</head>
<body>
<header class="bg-primary text-white p-3 mb-3">
  <div class="container d-flex justify-content-between align-items-center">
    <h1>Admin Dashboard</h1>
    <a href="/logout" class="btn btn-danger">Logout</a>
  </div>
</header>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item"><a class="nav-link" href="/admin/teachers">Manage Teachers</a></li>
      <li class="nav-item"><a class="nav-link" href="/admin/classes?action=list">Manage Classes</a></li>
      <li class="nav-item"><a class="nav-link" href="/admin/subjects">Manage Subjects</a></li>
      <li class="nav-item"><a class="nav-link" href="/admin/monthly_teacher_report">Monthly Teacher Reports</a></li>
    </ul>
  </div>
</nav>

<main class="container mt-3">
  <div class="content-container">
    <p>Select an option from the menu above to manage the system.</p>

    <!-- Success or Error Messages -->
    <c:if test="${param.success != null}">
      <div class="alert alert-success">${param.success}</div>
    </c:if>
    <c:if test="${param.error != null}">
      <div class="alert alert-danger">${param.error}</div>
    </c:if>
  </div>
</main>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>