<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Teachers List</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

<style>
    .btn-custom1 {
        background-color: #007bff; /* Change to your desired color */
        color: white;
    }
    .btn-custom2 {
        background-color: #28a745; /* Change to your desired color */
        color: white;
    }

    .div_footer {
        margin: 20px 0;
    }

    .hh {
        background: #4cae4c;
        width: 100%;
        color: #fff;
    }

     .back-to-dashboard {
         color: #007bff;
         text-decoration: none;
         font-weight: bold;
     }
    .back-to-dashboard:hover {
        text-decoration: underline;
    }

</style>


<div class="container mt-5">
    <a class="back-to-dashboard" href="/views/admin/admin_dashboard.jsp">Back to Dashboard</a>

    <h1 class="text-center mb-4 hh">Teachers List</h1>


    <!-- Form for adding a new teacher -->
    <h2 class="text-center mb-4">Add Teacher</h2>
    <form action="/admin/teachers?action=add" method="post" accept-charset="UTF-8" class="mb-5">
        <div class="form-row">
            <div class="form-group col-md-4">
                <label for="addFullName">Full Name:</label>
                <input type="text" class="form-control" id="addFullName" name="fullName" required>
            </div>
            <div class="form-group col-md-4">
                <label for="addEmail">Email:</label>
                <input type="email" class="form-control" id="addEmail" name="email" required>
            </div>
            <div class="form-group col-md-4">
                <label for="addPhoneNumber">Phone Number:</label>
                <input type="text" class="form-control" id="addPhoneNumber" name="phoneNumber" required>
            </div>
        </div>
        <button type="submit" class="btn btn-primary btn-block">Add Teacher</button>
    </form>

    <!-- Form for searching teachers -->
    <h2 class="text-center mb-4">Search Teacher</h2>
    <form action="/admin/teachers" method="get" class="mb-5">
        <input type="hidden" name="action" value="search">
        <div class="form-group">
            <label for="searchName">Name:</label>
            <input type="text" class="form-control" id="searchName" name="name" placeholder="Enter teacher name">
        </div>
        <button type="submit" class="btn btn-primary btn-block">Search</button>
    </form>

    <!-- Table displaying the list of teachers -->
    <h2 class="text-center mb-4">Teachers List</h2>
    <table class="table table-bordered text-center">
        <thead class="thead-dark">
        <tr>
            <th>Teacher ID</th>
            <th>Full Name</th>
            <th>Email</th>
            <th>Phone Number</th>
            <th>Total Students</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="teacher" items="${teachers}">
            <tr>
                <td>${teacher.teacherId}</td>
                <td>${teacher.fullName}</td>
                <td>${teacher.email}</td>
                <td>${teacher.phoneNumber}</td>
                <td>${teacher.totalStudents}</td>
                <td>
                    <a href="/admin/teachers?action=view&id=${teacher.teacherId}" class="btn btn-info btn-sm">View</a>
                    <a href="/admin/teachers?action=edit&id=${teacher.teacherId}" class="btn btn-warning btn-sm">Edit</a>
                    <a href="/admin/teachers?action=delete&id=${teacher.teacherId}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this teacher?');">Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <!-- Form for editing a teacher (only visible when editing) -->
    <c:if test="${not empty teacher}">
        <h2 class="text-center mb-4">Edit Teacher</h2>
        <form action="/admin/teachers?action=edit" method="post" accept-charset="UTF-8" class="mb-5">
            <input type="hidden" name="teacherId" value="${teacher.teacherId}">
            <div class="form-group">
                <label for="editFullName">Full Name:</label>
                <input type="text" class="form-control" id="editFullName" name="fullName" value="${teacher.fullName}" required>
            </div>
            <div class="form-group">
                <label for="editEmail">Email:</label>
                <input type="email" class="form-control" id="editEmail" name="email" value="${teacher.email}" required>
            </div>
            <div class="form-group">
                <label for="editPhoneNumber">Phone Number:</label>
                <input type="text" class="form-control" id="editPhoneNumber" name="phoneNumber" value="${teacher.phoneNumber}" required>
            </div>
            <button type="submit" class="btn btn-primary btn-block">Update Teacher</button>
        </form>
    </c:if>

    <div class="div_footer btn-group mt-4 d-flex justify-content-center" role="group">
        <a href="/admin/teachers?action=averageScores" class="btn btn-custom1 mx-2">View Class Average Scores</a>
        <a href="/admin/teachers?action=viewStudentScores" class="btn btn-custom2 mx-2">View Student Average Scores</a>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>