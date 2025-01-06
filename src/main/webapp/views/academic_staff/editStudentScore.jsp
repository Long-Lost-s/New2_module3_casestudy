<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sửa điểm học viên</title>
<<<<<<< HEAD
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
>>>>>>> 579e11e9e99cf35bd66e7da29a44e687175e2e83
</head>
<body>
    <h2>
        <a href="/academic_staff/dashboard">Quay lại danh sách</a>
    </h2>
    <form method="post">
        <fieldset>
            <legend>Điểm học viên</legend>
            <p>Tên học viên: <c:out value="${studentScore.getStudentName()}"/></p>
            <c:if test="${studentScore != null}">
                <input type="hidden" name="studentId" value="<c:out value='${studentScore.getStudentId()}' />"/>
                <input type="hidden" name="subjectId" value="<c:out value='${studentScore.getSubjectId()}' />"/>
            </c:if>
            <table>
                <tr>
                    <td>Điểm lý thuyết</td>
                    <td><input type="number" name="theoryScore" step="0.01"
                               value="<c:out value="${studentScore.getTheoryScore()}"/>"></td>
                </tr>
                <tr>
                    <td>Điểm thực hành</td>
                    <td><input type="number" name="practicalScore" step="0.01"
                               value="<c:out value="${studentScore.getPracticeScore()}"/>"></td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" value="submit"/>
                    </td>
                </tr>
            </table>
        </fieldset>
    </form>
</body>
</html>
