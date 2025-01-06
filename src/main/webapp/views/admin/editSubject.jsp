<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Subject</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <header class="bg-primary text-white p-3 mb-3">
        <div class="d-flex justify-content-between align-items-center">
            <h1>Edit Subject</h1>
            <a href="/views/admin/admin_dashboard.jsp" class="btn btn-danger">Back to Dashboard</a>
        </div>
    </header>

    <main>
        <div class="content-container">
            <form action="/admin/subjects?action=update" method="post">
                <div class="form-group">
                    <label for="subjectId">Subject ID</label>
                    <input type="text" class="form-control" id="subjectId" name="subjectId" value="${subject.subjectId}" readonly>
                </div>
                <div class="form-group">
                    <label for="subjectName">Subject Name</label>
                    <input type="text" class="form-control" id="subjectName" name="subjectName" value="${subject.subjectName}">
                </div>
                <button type="submit" class="btn btn-primary">Update Subject</button>
            </form>
        </div>
    </main>
</div>
</body>
</html>