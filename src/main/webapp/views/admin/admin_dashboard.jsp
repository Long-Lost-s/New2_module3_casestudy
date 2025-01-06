<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Admin Dashboard</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <style>
    body {
      background-image: url('/views/img/background(1).jpg');
      background-size: cover;
      background-repeat: no-repeat;
      background-attachment: fixed;
    }
    .highlight {
      font-weight: bold;
      color: #ff5722;
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
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link highlight" href="/admin/teachers">Manage Teachers</a>
        </li>
        <li class="nav-item">
          <a class="nav-link highlight" href="/admin/classes?action=list">Manage Classes</a>
        </li>
        <li class="nav-item">
          <a class="nav-link highlight" href="/admin/subjects">Manage Subjects</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/admin/monthly_teacher_report">Monthly Teacher Reports</a>
        </li>
      </ul>
    </div>
  </div>

</nav>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>