<%--Document : StudentList--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="com.model.*"%>
<%@page import="com.db.Students"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Student List</title>
</head>
<body>
    <h3>
        <font color="blue">List of all Students</font>
    </h3>
    <table class="table table-bordered table-hover">
        <tr class="table-dark">
            <th>s no.</th>
            <th>User Id</th>
            <th>name</th>
            <th>password</th>
            <th>Update</th>
            <th>Delete</th>
        </tr>
        <tr>
            <%
               int i = 0;
               ArrayList<Students> allstudents = StudentsDao.getAllRecords();
              for(Students e : allstudents) {
            %>
            <tr>
                <td><%=i++%></td>
                <td><%=e.getUsername() %></td>
                <td><%=e.getName()%></td>
                <td><%=e.getPassword() %></td>
                <td><a href="updatestudent.jsp?username=<%=e.getUsername()%>">Update</a></td>
                <td><a href="deletestudent.jsp?username=<%=e.getUsername()%>">Delete</a></td>
            </tr>
            <%
              }
            %>
        <tr>
            <td colspan="2"><input type="button" value="Add Student" class="btn btn-outline-success" onclick="location.href='AddStudent.jsp'"></td>
            <td colspan="2"><input type="hidden"></td>
            <td colspan="2"><input type="button" class="btn btn-outline-danger" value="Back to Panel" onclick="location.href='AdminPanel.jsp'"></td>
        </tr>
    </table>
</body>
</html>
