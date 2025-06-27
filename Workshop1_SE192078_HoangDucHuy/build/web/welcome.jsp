<%-- 
    Document   : welcome
    Created on : Jun 25, 2025, 1:08:19 PM
    Author     : huy25
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Welcome Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #e6f7ff;
                padding: 40px;
            }
            .container {
                max-width: 600px;
                margin: auto;
                background: white;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0,0,0,0.1);
                text-align: center;
            }
            a.button{
                font-size: 15px;
            }
            h1 {
                color: #333;
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

            .button:hover {
                background-color: #45a049;
            }

            form {
                display: inline;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <c:choose>
                <c:when test="${not empty sessionScope.user}">
                    <h1>Welcome, <c:out value="${sessionScope.user.name}"/>!</h1>
                    <p>You have successfully logged in as <strong>${sessionScope.user.role}</strong>.</p>

                    <form action="MainController" method="post">
                        <input type="hidden" name="action" value="logout" />
                        <input type="submit" value="logout" class="button" style="margin-right: 30px;" />
                    </form>

                    <a href="MainController?action=listProject" class="button">View Projects</a>
                </c:when>

                <c:otherwise>
                    <h1>You are not logged in!</h1>
                    <a href="login.jsp" class="button">Go to Login Page</a>
                </c:otherwise>
            </c:choose>
        </div>
    </body>
</html>
