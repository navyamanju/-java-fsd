
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add New Vaccination Centre</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
<style>
        .center {
            text-align: center;
        }
    </style>
</head>
<body>
    <h1 class="center">Add New Vaccination Center</h1>
    <form action="add-centre" method="post" class="center" modelAttribute="centre">
        <label for="name">Centre Name:</label>
        <input type="text" id="name" name="name" required><br><br>

        <label for="city">Center City:</label>
        <select id="city" name="city" required>
            <%-- Populate the dropdown with cities from the database --%>
            <c:forEach items="${cities}" var="city">
                <option value="${city}">${city}</option>
            </c:forEach>
        </select><br><br>

        <input type="submit" value="Submit">
    </form>
</body>
</html>
