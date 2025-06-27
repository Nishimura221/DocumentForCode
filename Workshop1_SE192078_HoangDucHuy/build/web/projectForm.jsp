<%-- 
    Document   : projectForm
    Created on : Jun 26, 2025, 10:45:43 PM
    Author     : huy25
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create New Project</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #eef2f3;
            padding: 40px;
        }

        .form-container {
            max-width: 600px;
            margin: auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        h2 {
            color: #333;
            margin-bottom: 20px;
            text-align: center;
        }

        label {
            display: block;
            margin-top: 10px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="date"],
        textarea,
        select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            box-sizing: border-box;
        }

        .submit-btn {
            margin-top: 20px;
            width: 100%;
            padding: 10px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        .submit-btn:hover {
            background-color: #2980b9;
        }

        .error {
            color: red;
            margin-top: 15px;
            text-align: center;
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>Create New Startup Project</h2>

    <c:if test="${not empty error}">
        <div class="error">${error}</div>
    </c:if>

    <form action="MainController" method="post">
        <input type="hidden" name="action" value="addProject" />

        <label>Project Name:</label>
        <input type="text" name="projectName" required />

        <label>Description:</label>
        <textarea name="description" rows="4"></textarea>

        <label>Status:</label>
        <select name="status" required>
            <option value="Ideation">Ideation</option>
            <option value="Development">Development</option>
            <option value="Launch">Launch</option>
            <option value="Scaling">Scaling</option>
        </select>

        <label>Estimated Launch:</label>
        <input type="date" name="estimatedLaunch" required />

        <input type="submit" value="Create Project" class="submit-btn" />
    </form>
</div>

</body>
</html>

