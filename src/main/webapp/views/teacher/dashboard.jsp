<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Student Details</title>
  <link rel="stylesheet" type="text/css" href="/styles/admin.css">
</head>
<body>
<header>
  <div class="header-container">
    <h1>Student Details</h1>
    <a href="/teacher/classes" class="back-button">Back to Classes</a>
  </div>
</header>

<main>
  <div class="content-container">
    <table>
      <tr>
        <th>Student ID</th>
        <td>${student.studentId}</td>
      </tr>
      <tr>
        <th>Full Name</th>
        <td>${student.fullName}</td>
      </tr>
      <tr>
        <th>Email</th>
        <td>${student.email}</td>
      </tr>
      <tr>
        <th>Date of Birth</th>
        <td>${student.dateOfBirth}</td>
      </tr>
      <tr>
        <th>Address</th>
        <td>${student.address}</td>
      </tr>
      <tr>
        <th>Phone Number</th>
        <td>${student.phoneNumber}</td>
      </tr>
      <tr>
        <th>Status</th>
        <td>${student.status}</td>
      </tr>
    </table>
  </div>
</main>
</body>
</html>