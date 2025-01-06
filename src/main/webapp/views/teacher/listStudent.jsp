<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Management Application</title>
    <style>
        #data {
            margin: 20px auto;
            width: fit-content;
            box-shadow: 0 0 10px rgba(60, 60, 150, 0.75);
            padding: 10px;
            border-radius: 10px;
        }

        #table {
            margin: auto;
            border-collapse: collapse;
            font-size: 15px;
        }

        #table td, th {
            border-style: solid;
            border-width: 2px;
            border-color: blue;
            padding: 15px 20px;
        }

        #table th {
            background-color: #a5a0ff;
        }

        #table tr:nth-child(odd) {
            background-color: #d7e3ff;
        }
        caption h2{
            float: left;
        }
        .select-container {
            float: right;
            background-color: white;
            padding: 10px;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        select {
            width: 100%;
            max-width: 100px;
            padding: 5px;
            font-size: 12px;
            outline: none;
            cursor: pointer;
        }
        select h2 {
            margin: 0;
            white-space: nowrap;
        }
    </style>
</head>
<body>
    <div id="data">
        <table id="table">
            <caption>
                <h2>Danh sách học viên</h2>
                <div class="select-container">
                    <p>Lớp: </p>
                    <select id="classId" name="classId" onchange="getStudentByClass()">
                        <option value="%"></option>
                        <c:forEach var="classs" items="${classesList}">
                            <option value="${classs.getClassId()}">
                                <c:out value="${classs.getClassName()}"/>
                            </option>
                        </c:forEach>
                    </select>
                </div>
                <div class="select-container">
                    <p>Trạng thái: </p>
                    <select id="status" name="status" onchange="getStudentByClass()">
                        <option value="%"></option>
                        <option value="Thôi học">Thôi học</option>
                        <option value="Đình chỉ">Đình chỉ</option>
                        <option value="Chờ chuyển lớp">Chờ chuyển lớp</option>
                        <option value="Đang học">Đang học</option>
                    </select>
                </div>
            </caption>
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Phone number</th>
                <th>Status</th>
                <th>Date of birth</th>
                <th>Address</th>
            </tr>
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
        </table>
    </div>
    <script>
        let elementSelectClass = document.getElementById("classId");
        let elementSelectStatus = document.getElementById("status")

        function getStudentByClass() {
            let classId = elementSelectClass.value;
            let studentStatus = elementSelectStatus.value;
            window.location.href = "/teacher/dashboard?classId=" + classId + "&status=" + studentStatus;
        }

        function setSelectClassOption() {
            elementSelectClass.value = "<c:out value="${classId}"/>";
            elementSelectStatus.value = "<c:out value="${status}"/>";
        }

        setSelectClassOption();
    </script>
</body>
</html>