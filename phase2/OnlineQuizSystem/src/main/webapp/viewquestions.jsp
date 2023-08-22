<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.model.CreateDao" %>
<%@ page import="com.db.Quizs" %>
<%@ page import="com.db.Questions" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Questions</title>
</head>
<body>
    <h1>Quiz Questions</h1>
    <%
        int quizId = Integer.parseInt(request.getParameter("quizId"));
        Quizs quiz = CreateDao.getQuizById(quizId);
        ArrayList<Questions> questionsList = CreateDao.getQuestionsByQuizId(quizId);
    %>
    <h2>Quiz ID: <%= quiz.getId() %></h2>
    <h2>Quiz Title: <%= quiz.getQuizTitle() %></h2>
    <h2>Category: <%= quiz.getCategory() %></h2>

  <table border=2>
        <tr class="table-dark">
            
            <th>Question</th>
            <th>Option A</th>
            <th>Option B</th>
            <th>Option C</th>
            <th>Option D</th>
            <th>Correct Answer</th>
        </tr>
        <% 
            for (Questions question : questionsList) {  
        %>
        <tr>
            
            <td><%= question.getQuestion() %></td>
            <td><%= question.getA() %></td>
            <td><%= question.getB() %></td>
            <td><%= question.getC() %></td>
            <td><%= question.getD() %></td>
            <td><%= question.getAnswer() %></td>
        </tr>
        <% 
            }
        %>
    </table>

    <div>
        <input type="button" class="btn btn-outline-danger" value="Back to Quiz List" onclick="location.href='quizdetails.jsp'">
    </div>
</body>
</html>
