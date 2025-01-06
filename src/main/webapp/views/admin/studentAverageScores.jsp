<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Student Average Scores</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
<div class="container mt-4">
    <h1 class="text-center mb-4">Student Average Scores</h1>

    <form method="get" action="/admin/teachers" class="mb-4">
        <input type="hidden" name="action" value="viewStudentScores">
        <div class="form-group">
            <label for="classId">Select Class:</label>
            <select name="classId" id="classId" class="form-control" onchange="this.form.submit()">
                <option value="">--Select Class--</option>
                <c:forEach var="clazz" items="${classes}">
                    <option value="${clazz.classId}" ${param.classId == clazz.classId ? 'selected' : ''}>${clazz.className}</option>
                </c:forEach>
            </select>
        </div>
    </form>

    <div class="chart-container mb-4">
        <canvas id="averageScoresChart" width="400" height="200"></canvas>
    </div>

    <a href="/admin/teachers" class="btn btn-secondary">Back to Teachers List</a>
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
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>