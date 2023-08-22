<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.model.CreateDao" %>
<%@ page import="com.db.Quizs" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Quiz</title>
</head>
<body>
    <h1>Create Quiz</h1>

   

    <form action="createquizaction.jsp" method="post">
        <label for="quizTitle">Quiz Title:</label>
        
        <input type="text" id="quizTitle" name="quizTitle" required><br>

        <label for="category">Category:</label>
       
        <input type="text" id="category" name="category" required><br>

        <input type="submit" value="Create Quiz">
    </form>

    
    
</body>
</html>
