<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
  <title>Manage Subjects</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4">
  <h1 class="text-center mb-4">Manage Subjects</h1>

  <c:if test="${param.success != null}">
    <div class="alert alert-success">${param.success}</div>
  </c:if>
  <c:if test="${param.error != null}">
    <div class="alert alert-danger">${param.error}</div>
  </c:if>

  <!-- Add new subject -->
  <form action="/admin/subjects" method="post" class="mb-4">
    <input type="hidden" name="action" value="add">
    <div class="form-group">
      <label for="subjectName">Subject Name:</label>
      <input type="text" class="form-control" id="subjectName" name="subjectName" required>
    </div>
    <button type="submit" class="btn btn-primary">Add Subject</button>
  </form>

  <!-- Display subjects -->
  <table class="table table-bordered text-center">
    <thead class="thead-dark">
    <tr>
      <th>Subject ID</th>
      <th>Subject Name</th>
      <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="subject" items="${subjects}">
      <tr>
        <td>${subject.subjectId}</td>
        <td>${subject.subjectName}</td>
        <td>
          <a href="/admin/subjects?action=edit&id=${subject.subjectId}" class="btn btn-info btn-sm">Edit</a>
          <a href="/admin/subjects?action=delete&id=${subject.subjectId}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this subject?');">Delete</a>
        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>

  <a href="/views/admin/admin_dashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>