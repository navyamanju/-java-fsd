<%--Document   : Result--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="com.model.QuestionsDao"%>
<%@page import="com.db.*"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String[] dbans = new String[100];
ArrayList<Questions> allQuestions = QuestionsDao.getAllRecords();
int i = 0;
int size = allQuestions.size();
for(Questions e : allQuestions)
{   
	dbans[i] = e.getAnswer();
	  i++;
}
String[] userans = new String[100];
for(int j = 0 ; j < size ; j++)
{
	userans[j] = request.getParameter(Integer.toString(j));
}
int correctanswer=0;
int unattempted = 0;
int wronganswer=0;
for(int k = 0 ; k< size;k++)
{
	if(userans[k].equalsIgnoreCase(dbans[k]))
	{
		correctanswer++;
	}
	else if(userans[k].equals("e"))
	{
		unattempted++;
	}
	else
	{
		wronganswer++;
	}
}
int attemped = size - unattempted;
%>
<div >
    <h1 style="color: green; ">Results</h1>
</div>

<table class="table table-hover">
    <thead>
        <tr class="table-warning">
            <th colspan="3" scope="col">
               
                    <h4>
                        Name: <%=session.getAttribute("name") %> || Userid: <%=session.getAttribute("username") %>
                    </h4>
               
            </th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <th scope="row">1</th>
            <td>Total no. of Questions</td>
            <td><%=size %></td>
        </tr>
        <tr>
            <th scope="row">2</th>
            <td>Number Of Questions Attempted</td>
            <td><%=attemped %></td>
        </tr>
        <tr>
            <th scope="row">3</th>
            <td>Number of Correct Answers</td>
            <td style="color: green;"><%=correctanswer %></td>
        </tr>
        <tr>
            <th scope="row">4</th>
            <td>Number of Wrong Answers</td>
            <td style="color: red;"><%=attemped-correctanswer %></td>
        </tr>
    </tbody>
</table>

    <input onclick="location.href='com.controller.LogoutStudent'" type="button" value="Exit" class="btn btn-outline-danger btn-lg">


</body>
</html>
