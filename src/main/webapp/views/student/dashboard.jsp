<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Student Dashboard</title>
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
<div class="container mt-5">
  <header class="bg-primary text-white p-3 mb-3">
    <div class="d-flex justify-content-between align-items-center">
      <h1>Student Dashboard</h1>
      <a href="/logout" class="btn btn-danger">Logout</a>
    </div>
  </header>

  <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item"><a class="nav-link" href="/viewAllStudentScores?username=${sessionScope.username}">View My Classes</a></li>
    </ul>
  </nav>

  <main class="mt-3">
    <p>Welcome, <c:out value="${sessionScope.username}" />!</p>
  </main>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>