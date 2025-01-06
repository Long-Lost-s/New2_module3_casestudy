<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 1/2/2025
  Time: 2:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Subject</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4">
    <h1>Edit Subject</h1>

    <!-- Display success or error messages -->
    <c:if test="${param.success != null}">
        <div class="alert alert-success">${param.success}</div>
    </c:if>
    <c:if test="${param.error != null}">
        <div class="alert alert-danger">${param.error}</div>
    </c:if>

    <!-- Back to Subjects List -->
    <a href="/admin/subjects" class="btn btn-secondary mb-4">Back to Subjects</a>

    <!-- Edit Subject Form -->
    <form action="/admin/subjects" method="post">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="id" value="${subject.subjectId}">

        <div class="form-group">
            <label for="subjectName">Subject Name:</label>
            <input type="text" class="form-control" id="subjectName" name="subjectName" value="${subject.subjectName}" required>
        </div>

        <button type="submit" class="btn btn-primary">Update Subject</button>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>