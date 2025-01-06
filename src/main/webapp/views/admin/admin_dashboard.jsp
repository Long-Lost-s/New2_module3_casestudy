<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Admin Dashboard</title>
  <link rel="stylesheet" type="text/css" href="/styles/admin.css">
</head>
<body>
<header>
  <div class="header-container">
    <h1>Admin Dashboard</h1>
    <a href="/logout" class="logout-button">Logout</a>
  </div>
</header>

<nav>
  <ul class="nav-menu">
    <li><a href="/admin/teachers">Manage Teachers</a></li>
    <li><a href="/admin/classes?action=list">Manage Classes</a></li>
    <li><a href="/admin/subjects">Manage Subjects</a></li>
    <li><a href="/admin/monthly_teacher_report">Monthly Teacher Reports</a></li>
  </ul>
</nav>

<main>
  <div class="content-container">
    <p>Select an option from the menu above to manage the system.</p>

    <!-- Success or Error Messages -->
    <c:if test="${param.success != null}">
      <p class="success">${param.success}</p>
    </c:if>
    <c:if test="${param.error != null}">
      <p class="error">${param.error}</p>
    </c:if>
  </div>
</main>
</body>
</html>