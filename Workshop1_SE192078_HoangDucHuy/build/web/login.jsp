<%-- 
    Document   : login
    Created on : Jun 20, 2025, 8:46:31 AM
    Author     : DELL
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #83a4d4, #b6fbff);
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            margin-top: 60px;
            color: #333;
            font-size: 36px;
        }

        form {
            width: 300px;
            margin: 30px auto;
            padding: 20px;
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.2);
        }

        input[type="text"], input[type="password"] {
            width: 95%;
            padding: 10px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
        }

        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background: #4CAF50;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        input[type="submit"]:hover {
            background: #45a049;
        }

        span {
            display: block;
            text-align: center;
            margin-top: 10px;
            color: red;
            font-weight: bold;
        }
    </style>
    </head>
    <body>
        <c:choose>
            <c:when test="${not empty sessionScope.user}">
                <c:redirect url="welcome.jsp"/>
            </c:when>
            <c:otherwise>
                <h1>Login</h1>
                <form action="MainController" method="post">
                    <input type="hidden" name="action" value="login" />
                    Username: <input type="text" name="strUsername" /> <br/>
                    Password: <input type="password" name="strPassword" /> <br/> 
                    <input type="Submit" value="Login" />
                </form>
                
                <c:if test="${not empty requestScope.message}">
                    <span style="color:red">${requestScope.message}</span> 
                </c:if>
            </c:otherwise>
        </c:choose>

       
    </body>
</html>
