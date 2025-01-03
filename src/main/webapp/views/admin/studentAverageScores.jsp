<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Student Average Scores</title>
    <link rel="stylesheet" type="text/css" href="/styles/studentAverageScores.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
<h1>Student Average Scores</h1>

<form method="get" action="/admin/teachers">
    <input type="hidden" name="action" value="viewStudentScores">
    <label for="classId">Select Class:</label>
    <select name="classId" id="classId" onchange="this.form.submit()">
        <option value="">--Select Class--</option>
        <c:forEach var="clazz" items="${classes}">
            <option value="${clazz.classId}" ${param.classId == clazz.classId ? 'selected' : ''}>${clazz.className}</option>
        </c:forEach>
    </select>
</form>

<div class="chart-container">
    <canvas id="averageScoresChart" width="400" height="200"></canvas>
</div>
<script>
    const ctx = document.getElementById('averageScoresChart').getContext('2d');
    const chartContainer = document.querySelector('.chart-container');

    function updateChart(data) {
        chartContainer.classList.add('hidden');
        setTimeout(() => {
            averageScoresChart.data.labels = data.labels;
            averageScoresChart.data.datasets[0].data = data.scores;
            averageScoresChart.update();
            chartContainer.classList.remove('hidden');
        }, 500);
    }

    const averageScoresChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: [
                <c:forEach var="score" items="${averageScores}">
                '${score.fullName}',
                </c:forEach>
            ],
            datasets: [{
                label: 'Average Score',
                data: [
                    <c:forEach var="score" items="${averageScores}">
                    ${score.averageScore},
                    </c:forEach>
                ],
                backgroundColor: 'rgba(75, 192, 192, 0.2)',
                borderColor: 'rgba(75, 192, 192, 1)',
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
</script>
<a href="/admin/teachers">Back to Teachers List</a>
</body>
</html>