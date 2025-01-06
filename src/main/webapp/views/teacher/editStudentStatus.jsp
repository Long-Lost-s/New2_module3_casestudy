<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sửa trạng thái học viên</title>
<<<<<<< HEAD
</head>
<body>
    <h2>
        <a href="teacher/dashboard">Quay lại danh sách</a>
    </h2>
    <form method="post">
        <fieldset>
            <legend>Thông tin học viên</legend>
            <p>Tên học viên: <c:out value="${student.getFullName()}"/></p>
            <p>Email: <c:out value="${student.getEmail()}"/></p>
            <p>Số điện thoại: <c:out value="${student.getPhoneNumber()}"/></p>
            <p>Ngày sinh: <c:out value="${student.getDateOfBirth()}"/></p>
            <p>Địa chỉ: <c:out value="${student.getAddress()}"/></p>
            <p>Mã lớp: <c:out value="${student.getClassId()}"/></p>
            <c:if test="${student != null}">
                <input type="hidden" name="studentId" value="<c:out value='${student.getStudentId()}' />"/>
            </c:if>
            <div>Trạng thái:
                <select name="status" id="status">
                    <option value="Thôi học">Thôi học</option>
                    <option value="Đình chỉ">Đình chỉ</option>
                    <option value="Chờ chuyển lớp">Chờ chuyển lớp</option>
                    <option value="Đang học">Đang học</option>
                </select>
                <input type="submit" value="submit"/>
            </div>
        </fieldset>
    </form>
    <script>
        let ele = document.getElementById("status");
        ele.value = "<c:out value="${student.getStatus().toString()}"/>";
    </script>
</body>
</html>
=======
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 20px;
        }
        h2 a {
            text-decoration: none;
            color: #007bff;
        }
        h2 a:hover {
            text-decoration: underline;
        }
        form {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            margin: auto;
        }
        fieldset {
            border: 1px solid #ddd;
            padding: 10px;
            border-radius: 8px;
        }
        legend {
            font-weight: bold;
        }
        p {
            margin: 10px 0;
        }
        select, input[type="submit"] {
            padding: 10px;
            border-radius: 4px;
            border: 1px solid #ddd;
            margin-top: 10px;
        }
        input[type="submit"] {
            background-color: #007bff;
            color: white;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<h2>
    <a href="/teacher/dashboard">Quay lại danh sách</a>
</h2>
<form method="post">
    <fieldset>
        <legend>Thông tin học viên</legend>
        <p>Tên học viên: <c:out value="${student.getFullName()}"/></p>
        <p>Email: <c:out value="${student.getEmail()}"/></p>
        <p>Số điện thoại: <c:out value="${student.getPhoneNumber()}"/></p>
        <p>Ngày sinh: <c:out value="${student.getDateOfBirth()}"/></p>
        <p>Địa chỉ: <c:out value="${student.getAddress()}"/></p>
        <p>Mã lớp: <c:out value="${student.getClassId()}"/></p>
        <c:if test="${student != null}">
            <input type="hidden" name="studentId" value="<c:out value='${student.getStudentId()}' />"/>
        </c:if>
        <div>Trạng thái:
            <select name="status" id="status">
                <option value="Thôi học">Thôi học</option>
                <option value="Đình chỉ">Đình chỉ</option>
                <option value="Chờ chuyển lớp">Chờ chuyển lớp</option>
                <option value="Đang học">Đang học</option>
            </select>
            <input type="submit" value="submit"/>
        </div>
    </fieldset>
</form>
<script>
    let ele = document.getElementById("status");
    ele.value = "<c:out value="${student.getStatus().toString()}"/>";
</script>
</body>
</html>
>>>>>>> 579e11e9e99cf35bd66e7da29a44e687175e2e83
