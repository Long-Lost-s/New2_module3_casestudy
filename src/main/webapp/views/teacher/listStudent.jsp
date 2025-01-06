<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Management Application</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <div class="card">
        <div class="card-header d-flex justify-content-between align-items-center">
            <h2>Danh sách học viên</h2>
            <div>
                <label for="classId" class="mr-2">Lớp:</label>
                <select id="classId" name="classId" class="form-control d-inline-block w-auto" onchange="getStudentByClass()">
                    <option value=""></option>
                    <c:forEach var="classs" items="${classesList}">
                        <option value="${classs.getClassId()}">
                            <c:out value="${classs.getClassName()}"/>
                        </option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="card-body">
            <table class="table table-bordered table-striped">
                <thead class="thead-light">
                <tr>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone number</th>
                    <th>Status</th>
                    <th>Date of birth</th>
                    <th>Address</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="student" items="${studentList}">
                    <tr>
                        <td><a href="/teacher/dashboard?action=edit&studentId=${student.getStudentId()}">
                            <c:out value="${student.getFullName()}"/>
                        </a></td>
                        <td><c:out value="${student.getEmail()}"/></td>
                        <td><c:out value="${student.getPhoneNumber()}"/></td>
                        <td><c:out value="${student.getStatus().toString()}"/></td>
                        <td><c:out value="${student.getDateOfBirth()}"/></td>
                        <td><c:out value="${student.getAddress()}"/></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script>
    let elementSelectClass = document.getElementById("classId");

    function getStudentByClass() {
        let classId = elementSelectClass.value;
        window.location.href = "/teacher/dashboard?classId=" + classId;
    }

    function setSelectClassOption() {
        elementSelectClass.value = "<c:out value='${classId}'/>";
    }

    setSelectClassOption();
</script>
</body>
</html>