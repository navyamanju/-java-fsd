<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="com.model.CreateDao" %>
<%@ page import="com.db.Quizs" %>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Quiz List</title>
</head>
<body>
    <h1>Quiz List</h1>
    <table border=2>
        <tr>
        <th>Quiz Id</th>
        
            <th>Quiz Title</th>
            <th>Category</th>
            <th>Action</th>
        </tr>
        <% 
            ArrayList<Quizs> allQuizzes = CreateDao.getAllQuizzes();
            for (Quizs quiz : allQuizzes) {  
        %>
        <tr>
       
         <td><%= quiz.getId() %></td>
            <td><%= quiz.getQuizTitle() %></td>
            <td><%= quiz.getCategory() %></td>
            <td><a href="updatequiz.jsp?id=<%= quiz.getQuizTitle() %>">Update</a></td>
            <td><a href="deletequiz.jsp?id=<%= quiz.getQuizTitle() %>">Delete</a></td>
           
        </tr>
        <% 
            }
        %>
    </table>
</body>
</html>
