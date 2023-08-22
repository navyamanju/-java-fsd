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
    <h1>Quiz List</h1>

     <table border=2>
        <tr class="table-dark">
            <th>Quiz ID</th>
            <th>Quiz Title</th>
            <th>Category</th>
            <th>Update</th>
        </tr>
        <% 
            ArrayList<Quizs> allQuizzes = CreateDao.getAllQuizzes();
            for (Quizs quiz : allQuizzes) {  
            	 if (request.getParameter("id").equals(quiz.getId())) {
        %>
         <tr class="table-primary">
        <form action="updatequiznow.jsp">
        <td><input type="hidden" value="<%=quiz.getId()%>" type="text" name="idoriginal"><%=quiz.getId()%></td>
          
          
          <td> <input type="text" value="<%=quiz.getId()%>" name="idmodified"></input> </td>
          <td> <input type="text" value="<%=quiz.getQuizTitle()%>" name="na"></input> </td>
          <td><input type="text" value="<%=quiz.getCategory()%>" name="na1"></td>
           <td><a href="deletequiz.jsp?quz=<%=quiz.getId()%>">Delete</a></td>
          </form>
          </tr>
           <%
      } else {
  %>
        <tr>
      
            <td><%= quiz.getId() %></td>
            <td><%= quiz.getQuizTitle() %></td>
            <td><%= quiz.getCategory() %></td>
            <td><a href="updatequiz.jsp?id=<%= quiz.getId() %>">Update</a></td>
            <td><a href="deletequiz.jsp?id=<%= quiz.getId() %>">delete</a></td>
        </tr>
       <%
      }
    }
  %>
</table>
<div>
    
    <input type="button" class="btn btn-outline-danger" value="Back" onclick="location.href='quizlist.jsp'">
    </div>
</body>
</html>
