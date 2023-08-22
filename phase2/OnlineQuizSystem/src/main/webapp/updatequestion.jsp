<%-- Document   : updatequestion --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.model.*" %>
<%@ page import="com.db.*" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
 
  <meta charset="ISO-8859-1">
  <title>Update Questions</title>
</head>
<body>
<h3><font color="blue">List of all questions</font></h3>
<table border=2>
  <tr class="table-dark">
    <th>s no.</th>
    <th>Ques Id</th>
    <th>Question</th>
    <th>Option A</th>
    <th>Option B</th>
    <th>Option C</th>
    <th>Option D</th>
    <th>Correct Answer</th>
    <th>Update</th>
    <th>Delete</th>
  </tr>
  <%
    int i = 0;
    ArrayList<Questions> allQuestions = QuestionsDao.getAllRecords();
    for (Questions e : allQuestions) {
      if (request.getParameter("ques").equals(e.getQuestion())) {
  %>
        <tr class="table-primary">
        <form action="updatequestionnow.jsp">
         
          <td><input type="hidden" value="<%=e.getQuestion()%>" type="text" name="quesoriginal"><%=e.getQuestion()%></td>
           <td><%=i++%></td>
          
       <td> <input type="text" value="<%=e.getQuestion()%>" name="quesmodified"></input> </td>
          <td><input type="text" value="<%=e.getA()%>" name="opta"></td>
          <td><input type="text" value="<%=e.getB()%>" name="optb"></td>
          <td><input type="text" value="<%=e.getC()%>" name="optc"></td>
          <td><input type="text" value="<%=e.getD()%>" name="optd"></td>
          <td><input type="text" value="<%=e.getAnswer()%>" name="ans"></td>
          <td><input type="submit" value="update"></td>
          <td><a href="deletequestion.jsp?ques=<%=e.getQuestion()%>">Delete</a></td>
          </form>
        </tr>
  <%
      } else {
  %>
        <tr>
          <td><%=i++%></td>
          <td><%=e.getQuestion()%></td>
          <td><%=e.getA()%></td>
          <td><%=e.getB()%></td>
          <td><%=e.getC()%></td>
          <td><%=e.getD()%></td>
          <td><%=e.getAnswer()%></td>
          <td><a href="updatequestion.jsp?ques=<%=e.getQuestion()%>">Update</a></td>
          <td><a href="deletequestion.jsp?ques=<%=e.getQuestion()%>">Delete</a></td>
        </tr>
  <%
      }
    }
  %>
</table>
<div>
  <input type="button" class="btn btn-outline-success" value="Add Question" onclick="location.href='AddQuestion.jsp'">
  <input type="hidden">
  <input type="button" class="btn btn-outline-danger" value="Back to Panel" onclick="location.href='AdminPanel.jsp'">
</div>

</body>
</html>
