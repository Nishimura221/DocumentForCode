<%-- 
    Document   : welcome
    Created on : Jun 29, 2025, 3:28:42 PM
    Author     : huy25
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Welcome Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background: #f1f3f6;
                margin: 0;
                padding: 40px;
                text-align: center;
            }
            .container {
                display: inline-block;
                background: #fff;
                padding: 40px;
                border-radius: 12px;
                box-shadow: 0 4px 10px rgba(0,0,0,0.15);
            }
            h1 {
                color: #007bff;
            }
            .info {
                font-size: 18px;
                margin-bottom: 20px;
            }
            .menu a {
                display: inline-block;
                margin: 10px;
                padding: 10px 20px;
                background-color: #007bff;
                color: white;
                text-decoration: none;
                border-radius: 5px;
            }
            .menu a:hover {
                background-color: #0056b3;
            }
            .button {
                display: inline-block;
                padding: 10px 20px;
                margin-top: 20px;
                background-color: #4CAF50;
                color: white;
                text-decoration: none;
                border-radius: 5px;
                border: none;
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <c:choose>
                <c:when test="${not empty sessionScope.user}">
                    <h1>Welcome, ${sessionScope.name}!</h1>
                    <div class="info">
                        Username: <strong>${sessionScope.username}</strong><br>
                        Role: <strong>${sessionScope.role}</strong>
                    </div>


                    <div class="menu">
                        <a href="MainController?action=listCategory">View Exam Categories</a>


                        <a href="MainController?action=logout">Logout</a>
                    </div>
                </c:when>

                <c:otherwise>
                    <h1>You are not logged in!</h1>
                    <a href="login.jsp" class="button">Go to Login Page</a>
                </c:otherwise>
            </c:choose>
        </div>



    </body>
</html>

