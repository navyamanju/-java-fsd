<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.model.CreateDao" %>
<%@ page import="com.db.Quizs" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quiz List</title>
</head>
<body>
    <h1>Quiz Details</h1>

    <table class="table table-bordered table-hover">
         <table border=2>
            <th>Quiz ID</th>
            <th>Quiz Title</th>
            <th>Category</th>
            <th>View Questions</th>
            <th>Update</th>
            <th>Delete</th>
        </tr>
        <% 
            ArrayList<Quizs> allQuizzes = CreateDao.getAllQuizzes();
            for (Quizs quiz : allQuizzes) {  
        %>
        <tr>
            <td><%= quiz.getId() %></td>
            <td><%= quiz.getQuizTitle() %></td>
            <td><%= quiz.getCategory() %></td>
            <td><a href="viewquestions.jsp?quizId=<%= quiz.getId() %>">View Questions</a></td>
            <td><a href="updatequiz.jsp?id=<%= quiz.getId() %>">Update</a></td>
            <td><a href="deletequiz.jsp?id=<%= quiz.getId() %>">Delete</a></td>
        </tr>
        <% 
            }
        %>
    </table>

    <div>
        <input type="button" class="btn btn-outline-success" value="Add Quiz" onclick="location.href='createquiz.jsp'">
        <input type="button" class="btn btn-outline-danger" value="Back to Panel" onclick="location.href='AdminPanel.jsp'">
    </div>
</body>
</html>
