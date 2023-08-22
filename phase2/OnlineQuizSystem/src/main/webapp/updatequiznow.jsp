<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.model.CreateDao" %>
<%@ page import="com.db.Quizs" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Updating Quiz</title>
</head>
<body>
<%
    String newQuizTitle = request.getParameter("quizTitle");
    String newCategory = request.getParameter("category");
    String originalQuizId = request.getParameter("quizId");

    // Create a new Quizs object and set its properties
    Quizs quiz = new Quizs();
    quiz.setId(Integer.parseInt(originalQuizId));
    quiz.setQuizTitle(newQuizTitle);
    quiz.setCategory(newCategory);

    //int status = CreateDao.updateQuiz(quiz);
   // if (status > 0) {
       // response.sendRedirect("quizlist.jsp");
   // } else {
   //     out.print("Failed to update quiz information.");
  //  }
%>
</body>
</html>