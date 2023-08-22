<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.model.CreateDao" %>
<%@ page import="com.db.Quizs" %>

<%
    if (request.getMethod().equalsIgnoreCase("post")) {
        String quizTitle = request.getParameter("quizTitle");
        String category = request.getParameter("category");

        // Create a new Quizs object and set its properties
        Quizs quiz = new Quizs();
        quiz.setQuizTitle(quizTitle);
        quiz.setCategory(category);

        // Save the quiz details to the database using CreateDao
        if (CreateDao.insertQuiz(quiz)) {
            out.println("<p>Quiz created successfully!</p>");
            // Redirect to the QuestionList.jsp page after successful quiz creation
           
        } else {
            out.println("<p>Failed to create the quiz. Please try again.</p>");
        }
    }
%>
