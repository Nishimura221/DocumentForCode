<%-- 
    Document   : welcome2
    Created on : Jun 26, 2025, 11:05:01 PM
    Author     : huy25
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
    <title>Startup Project Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 30px;
            background-color: #f2f2f2;
        }

        .container {
            width: 90%;
            margin: 0 auto;
            background-color: #fff;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 0 10px #ccc;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        h1 {
            color: #333;
        }

        .logout-btn {
            background-color: #e74c3c;
            color: white;
            padding: 8px 14px;
            text-decoration: none;
            border-radius: 5px;
        }

        .search-section {
            margin: 25px 0;
        }

        .search-input {
            padding: 6px;
            width: 300px;
        }

        .search-btn {
            padding: 6px 12px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .add-btn {
            display: inline-block;
            background-color: #2ecc71;
            color: white;
            padding: 8px 14px;
            text-decoration: none;
            border-radius: 5px;
            margin-bottom: 15px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
        }

        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
        }

        th {
            background-color: #f7f7f7;
        }

        .no-results {
            color: red;
            margin-top: 20px;
        }
    </style>
</head>
<body>

<c:choose>
    <c:when test="${empty sessionScope.user}">
        <c:redirect url="MainController" />
    </c:when>
    <c:otherwise>
        <div class="container">
            <div class="header">
                <h1>Welcome, ${sessionScope.user.name}!</h1>
                <a href="MainController?action=logout" class="logout-btn">Logout</a>
            </div>
          

       
            <c:if test="${sessionScope.user.role eq 'Founder'}">
                <a href="projectForm.jsp" class="add-btn">+ Add New Project</a>
            </c:if>

            <c:choose>
                <c:when test="${not empty projectList}">
                    <table>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Project Name</th>
                                <th>Description</th>
                                <th>Status</th>
                                <th>Estimated Launch</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="project" items="${projectList}">
                                <tr>
                                    <td>${project.projectId}</td>
                                    <td>${project.projectName}</td>
                                    <td>${project.description}</td>
                                    <td>${project.status}</td>
                                    <td>${project.estimatedLaunch}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    <div class="no-results">No projects found.</div>
                </c:otherwise>
            </c:choose>
        </div>
    </c:otherwise>
</c:choose>

</body>
</html>



