<%--Document : Exam--%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="com.model.QuestionsDao"%>
 <%@page import="com.model.CreateDao"%>
 <%@page import="com.db.*"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>


<HTML>
    <HEAD>
        <TITLE>Examination </TITLE>
        

      <script>
      <%
      String clock = request.getParameter("clock");
      if(clock == null)
    	  clock = "60";
      %>
      var timeout = <%=clock %>
      function timer()
      {
    	  if( timeout > 0)
    		  {
    		  timeout--;
    		  document.forma.clock.value ="Time Over";
    	      document.forma.clock.value = timeout;
    		  window.setTimeout("timer()", 1000 );
    		  }
    	  else
    		  {
    		  document.forma.clock.value ="Time Over";
    		  formb.submit();
    		  }
      }
      </script>


    </HEAD>
    <BODY onload="timer()">
        <form name="forma" action="<%=request.getRequestURL()%>">

     <font color="green">Time Left <input size="1" name="clock" id="fno" value="<%=clock%>" style="background: #ffcdd2" readonly></font>
  
    </form>
    
    <form action="Result.jsp" name="formb">
<font color="red">Questions Left</font>
 
                    
    <table class="table table-hover">
    <thead>
<tr class="table-warning">
 <th>User Id</th>
 
 <th>Question</th>
 <th>Option A </th>
 <th>Option B </th>
 <th>Option C </th>
 <th>Option D </th>
</tr>
</thead>
 <tbody>           
                
 <%
   int i = 1;
  
   int radioname = 0;
   ArrayList<Questions> allQuestions = QuestionsDao.getAllRecords();
  for(Questions e : allQuestions)
  {   
	  %><%=i%><%  
  
  %>
    
   <tr>
   
  <td><%=i++%></td>
  <td><%=e.getQuestion() %></td>
  <td><input type="radio" value="a" name="<%=radioname%>"><%=e.getA()%></td>
  <td><input type="radio" value="b" name="<%=radioname%>"><%=e.getB()%></td>
  <td><input type="radio" value="c" name="<%=radioname%>"><%=e.getC()%></td>
  <td><input type="radio" value="d" name="<%=radioname%>"><%=e.getD()%></td>
  

  
  
  </tr>

  <%
  radioname++;
  }
  %>
  </tbody>
  </table>
  <input type="radio" value="e" name="<%=radioname %>" checked="checked" name=<%=radioname %>>
 
  
  <input class="btn btn-outline-success btn-lg" type="submit" value="submit">
 
  </form>
    </BODY>
</HTML>
