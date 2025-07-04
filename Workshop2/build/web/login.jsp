<%-- 
    Document   : login
    Created on : Jun 27, 2025, 8:53:34 AM
    Author     : huy25
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login Page</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #00c6ff, #0072ff);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .login-container {
            background-color: white;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.3);
            width: 350px;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0 15px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
        }

        input[type="submit"] {
            width: 100%;
            background-color: #0072ff;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #005ac1;
        }

        .error-message {
            color: red;
            text-align: center;
            margin-top: 10px;
        }
    </style>
</head>
<body>
<c:choose>
    <c:when test="${not empty sessionScope.user}">
        <c:redirect url="welcome.jsp"/>
    </c:when>
    <c:otherwise>
        <div class="login-container">
            <h1>Login</h1>
            <form action="MainController" method="post">
                <input type="hidden" name="action" value="login">
                <label>Username:</label>
                <input type="text" name="strUsername" required>
                <label>Password:</label>
                <input type="password" name="strPassword" required>
                <input type="submit" value="Login">
            </form>
            <c:if test="${not empty requestScope.message}">
                <div class="error-message">${requestScope.message}</div>
            </c:if>
        </div>
    </c:otherwise>
</c:choose>
</body>
</html>

