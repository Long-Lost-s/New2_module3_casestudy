<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Manage Subjects</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
  <header class="bg-primary text-white p-3 mb-3">
    <div class="d-flex justify-content-between align-items-center">
      <h1>Manage Subjects</h1>
      <a href="/views/admin/admin_dashboard.jsp" class="btn btn-danger">Back to Dashboard</a>
    </div>
  </header>

  <main>
    <div class="content-container">
      <h2>Subject List</h2>
      <table class="table table-bordered table-striped">
        <thead class="thead-light">
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
              <a href="/admin/subjects?action=edit&id=${subject.subjectId}" class="btn btn-warning btn-sm">Edit</a>
              <a href="/admin/subjects?action=delete&id=${subject.subjectId}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this subject?');">Delete</a>
            </td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
      <a href="/admin/subjects?action=add" class="btn btn-primary">Add New Subject</a>
    </div>
  </main>
</div>
</body>
</html>