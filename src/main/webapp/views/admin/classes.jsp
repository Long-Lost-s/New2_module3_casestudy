<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Manage Classes</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
  <header class="bg-primary text-white p-3 mb-3">
    <div class="d-flex justify-content-between align-items-center">
      <h1>Manage Classes</h1>
      <a href="/views/admin/admin_dashboard.jsp" class="btn btn-danger">Back to Dashboard</a>
    </div>
  </header>

  <main>
    <div class="content-container">
      <h2>Class List</h2>
      <table class="table table-bordered table-striped">
        <thead class="thead-light">
        <tr>
          <th>Class ID</th>
          <th>Class Name</th>
          <th>Teacher ID</th>
          <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="cls" items="${classes}">
          <tr>
            <td>${cls.classId}</td>
            <td>${cls.className}</td>
            <td>${cls.teacherID}</td>
            <td>
              <a href="/admin/classes?action=edit&id=${cls.classId}" class="btn btn-warning btn-sm">Edit</a>
              <a href="/admin/classes?action=delete&id=${cls.classId}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this class?');">Delete</a>
              <a href="/admin/classes?action=listStudents&classId=${cls.classId}" class="btn btn-info btn-sm">View Students</a>
            </td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
      <a href="/admin/classes?action=add" class="btn btn-primary">Add New Class</a>
    </div>
  </main>
</div>
</body>
</html>