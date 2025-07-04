<%-- 
    Document   : viewCategories
    Created on : Jun 30, 2025, 7:05:33 PM
    Author     : huy25
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Exam Categories</title>
        <style>
            body {
                font-family: Arial;
                background-color: #f1f3f5;
                text-align: center;
            }
            table {
                margin: auto;
                margin-top: 30px;
                border-collapse: collapse;
                width: 70%;
            }
            th, td {
                border: 1px solid #aaa;
                padding: 10px;
            }
            th {
                background-color: #007bff;
                color: white;
            }
            a.button {
                display: inline-block;
                margin-top: 20px;
                padding: 10px 20px;
                background-color: #28a745;
                color: white;
                text-decoration: none;
                border-radius: 5px;
            }
            .button {
                background-color: #17a2b8;
                color: white;
                padding: 6px 12px;
                text-decoration: none;
                border-radius: 4px;
            }
        </style>
    </head>
    <body>
        <c:choose>
            <c:when test="${empty sessionScope.user}">
                <c:redirect url="MainController" />
            </c:when>
            <c:otherwise>
                <h2>Exam Categories</h2>
                <c:choose>
                    <c:when test="${not empty categoriesList}">
                        <table>
                            <tr>
                                <th>Category Name</th>
                                <th>Description</th>
                     
                                <th>View Exams</th>
                                
                            </tr>
                            <c:forEach var="cat" items="${categoriesList}">
                                <tr>
                                    <td>${cat.category_name}</td>
                                    <td>${cat.description}</td>
                                   
                                    <td>
                                        <a href="MainController?action=viewExams&categoryId=${cat.category_id}" class="button">
                                            View Exams
                                        </a>
                                    </td>
                                  
                                </tr>
                            </c:forEach>
                        </table>
                    </c:when>
                    <c:otherwise>
                        <div class="no-results" style="color: red">No list found.</div>
                    </c:otherwise>
                </c:choose>
                <a href="welcome.jsp" class="button">Back to Dashboard</a>
            </c:otherwise>
        </c:choose>
    </body>
</html>
