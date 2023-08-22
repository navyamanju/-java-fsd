<%--Document : QuestionList--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="com.model.QuestionsDao"%>
<%@page import="com.db.*"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Question List</title>
</head>
<body>
    <h3 style="color: blue; text-align: center;">List of all questions</h3>
    <table border=2>
        <tr class="table-dark">
            <th>s no.</th>
            <th>Question</th>
            <th>Option A</th>
            <th>Option B</th>
            <th>Option C</th>
            <th>Option D</th>
            <th>Correct Answer</th>
            <th>Update</th>
            <th>Delete</th>
        </tr>
        <%-- Start loop to display questions --%>
        <% 
            int i = 1;
            ArrayList<Questions> allQuestions = QuestionsDao.getAllRecords();
            for(Questions e : allQuestions) {  
        %>
        <tr>
            <td><%= i++ %></td>
            <td><%= e.getQuestion() %></td>
            <td><%= e.getA() %></td>
            <td><%= e.getB() %></td>
            <td><%= e.getC() %></td>
            <td><%= e.getD() %></td>
            <td><%= e.getAnswer() %></td>
            <td><a href="updatequestion.jsp?ques=<%= e.getQuestion() %>">Update</a></td>
            <td><a href="deletequestion.jsp?ques=<%= e.getQuestion() %>">Delete</a></td>
        </tr>
        <% 
            }
        %>
        <%-- End loop --%>
 </table>
        <tr>
            <th colspan="4" style="text-align: center;"><input type="button" value="Add Question" class="btn btn-outline-success" onclick="location.href='AddQuestion.jsp'"></th>
            <th><input type="hidden"></th>
            <th colspan="4" style="text-align: center;"><input type="button" class="btn btn-outline-danger" value="Back to Panel" onclick="location.href='AdminPanel.jsp'"></th>
        </tr>
   
</body>
</html>
