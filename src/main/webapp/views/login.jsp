<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 1/2/2025
  Time: 9:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head><!DOCTYPE html>
  <html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="/styles/auth.css">
  </head>
  <body>
  <div class="container">
    <h1>Login</h1>

    <!-- Success/Error Messages -->
    <c:if test="${param.success != null}">
      <p class="success">${param.success}</p>
    </c:if>
    <c:if test="${param.error != null}">
      <p class="error">${param.error}</p>
    </c:if>

    <form action="/login" method="post">
      <label for="username">Username</label>
      <input type="text" id="username" name="username" required>

      <label for="password">Password</label>
      <input type="password" id="password" name="password" required>

      <button type="submit">Login</button>
    </form>

    <a href="/register">Don't have an account? Register here</a>
  </div>
  </body>
  </html>
</html>

