<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Danh sách điểm học viên</title>
    <style>
        body {
            position: relative;
            background-image: url('/views/img/background(1).jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
        }
        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(255, 255, 255, 0.7); /* Increased opacity */
            z-index: -1;
        }
        .header {
            font-family: Arial, sans-serif;
            background-color: #007bff;
            color: white;
            padding: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .header h1 {
            margin: 0;
            font-size: 24px;
        }
        .header .logout {
            font-size: 16px;
            text-decoration: none;
            color: white;
            background-color: #0056b3;
            padding: 10px 20px;
            border-radius: 4px;
            transition: background-color 0.3s;
        }
        .header .logout:hover {
            background-color: #003f8a;
        }
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
        select p {
            margin: 0;
            white-space: nowrap;
        }
        .editable:hover {
            background-color: wheat;
            cursor: pointer;
        }
    </style>
</head>
<body>
<div class="overlay"></div>
<header class="header">
    <h1>Academic Dashboard</h1>
    <a href="/logout" class="logout">Logout</a>
</header>
<div id="data">
    <table id="table">
        <caption>
            <h2>Danh sách điểm học viên</h2>
            <div class="select-container">
                <p>Môn: </p>
                <select id="subjectId" name="subjectId" onchange="getStudentScoreBySubject()">
                    <option value="-1" disabled></option>
                    <c:forEach var="subject" items="${subjects}">
                        <option value="${subject.getSubjectId()}">
                            <c:out value="${subject.getSubjectName()}"/>
                        </option>
                    </c:forEach>
                </select>
            </div>
        </caption>
        <tr>
            <th>Tên học viên</th>
            <th>Lớp</th>
            <th>Điểm lý thuyết</th>
            <th>Điểm thực hành</th>
            <th>Điểm trung bình</th>
        </tr>
        <c:forEach var="studentScore" items="${studentScores}">
            <tr>
                <td><a href="/academic_staff/dashboard?action=edit&subjectId=${studentScore.getSubjectId()}&studentId=${studentScore.getStudentId()}">
                    <c:out value="${studentScore.getStudentName()}"/>
                </a></td>
                <td><c:out value="${studentScore.getClassId()}"/></td>
                <td class="editable"><c:out value="${studentScore.getTheoryScore()}"/></td>
                <td class="editable"><c:out value="${studentScore.getPracticeScore()}"/></td>
                <td><c:out value="${studentScore.getAverageScore()}"/></td>
            </tr>
        </c:forEach>
    </table>
</div>
<script>
    let elementSelectClass = document.getElementById("subjectId");
    function setSelectSubjectOption() {
        elementSelectClass.value = "<c:out value="${subjectId}"/>";
    }
    setSelectSubjectOption();

    function getStudentScoreBySubject() {
        let subjectId = elementSelectClass.value;
        window.location.href = "/academic_staff/dashboard?subjectId=" + subjectId;
    }
</script>
</body>
</html>