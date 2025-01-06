<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Monthly Teacher Report</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
  <header class="bg-primary text-white p-3 mb-3">
    <div class="d-flex justify-content-between align-items-center">
      <h1>Monthly Teacher Report</h1>
      <a href="/views/admin/admin_dashboard.jsp" class="btn btn-danger">Back to Dashboard</a>
    </div>
  </header>

  <main>
    <c:if test="${param.success != null}">
      <div class="alert alert-success">${param.success}</div>
    </c:if>
    <c:if test="${param.error != null}">
      <div class="alert alert-danger">${param.error}</div>
    </c:if>

    <table class="table table-bordered table-striped">
      <thead class="thead-light">
      <tr>
        <th>Teacher ID</th>
        <th>Full Name</th>
        <th>Total Classes</th>
        <th>Total Students</th>
        <th>Report Date</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach var="report" items="${reports}">
        <tr>
          <td>${report.teacherId}</td>
          <td>${report.fullName}</td>
          <td>${report.totalClasses}</td>
          <td>${report.totalStudents}</td>
          <td>${report.reportDate}</td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
  </main>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>