<%-- 
    Document   : viewExamByCategory
    Created on : Jun 30, 2025, 11:09:30 PM
    Author     : huy25
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Exams by Category</title>
        <style>
            body {
                font-family: Arial;
                background-color: #f8f9fa;
                text-align: center;
            }
            table {
                margin: auto;
                margin-top: 30px;
                border-collapse: collapse;
                width: 80%;
            }
            th, td {
                border: 1px solid #aaa;
                padding: 10px;
            }
            th {
                background-color: #17a2b8;
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
        </style>
    </head>
    <body>
        <c:choose>
            <c:when test="${empty sessionScope.user}">
                <c:redirect url="MainController" /> 
            </c:when>
            <c:otherwise>
                <h2>Exams for Category: ${categoryName}</h2>
                <c:choose>
                    <c:when test="${not empty examsList}">
                        <table>
                            <tr>
                                <th>Exam Title</th>
                                <th>Subject</th>
                                <th>Total Marks</th>
                                <th>Duration (minutes)</th>
                            </tr>
                            <c:forEach var="exam" items="${examsList}">
                                <tr>
                                    <td>${exam.exam_title}</td>
                                    <td>${exam.subject}</td>
                                    <td>${exam.total_marks}</td>
                                    <td>${exam.duration}</td>
                                </tr>
                            </c:forEach>
                        </table>
                    </c:when>
                    <c:otherwise>
                        <div class="no-results" style="color: red">No list found.</div>
                    </c:otherwise>
                </c:choose>
                <a href="MainController?action=listCategory" class="button">Back to Categories</a>

            </c:otherwise>
        </c:choose>
    </body>
</html>
