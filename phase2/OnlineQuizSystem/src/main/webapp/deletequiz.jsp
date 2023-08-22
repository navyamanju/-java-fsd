<%-- Document: deletequiz --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.db.*" %>
<%@ page import="com.model.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Delete Quiz</title>
</head>
<body>
<%
    Quizs quiz = new Quizs();
    quiz.setId(Integer.parseInt(request.getParameter("quizId")));

    //int status = CreateDao.deleteQuiz(quiz.getId());
  //  if (status > 0) {
      //  response.sendRedirect("quizlist.jsp");
   // } else {
   //     out.print("Error deleting quiz.");
   // }
%>
</body>
</html>
