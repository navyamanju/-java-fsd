<%--Document : InstructionList--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="com.model.InstructionsDao"%>
<%@page import="com.db.Instructions"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Instructions List</title>
</head>
<body>
    <h3 style="color: blue; text-align: center;">List of all instructions</h3>
    <table class="table table-bordered table-hover">
        <tr class="table-dark">
            <th>s no.</th>
            <th>Instruction</th>
            <th>Operation</th>
            <th>delete</th>
        </tr>
        <tr>
        <%
           int i = 0;
           ArrayList<Instructions> allinsts = InstructionsDao.getAllRecords();
          for(Instructions e : allinsts) {
        %>
           <tr>
              <td><%=i++%></td>
              <td><%=e.getInstruction()%></td>
              <td><a href="updateinstruction.jsp?inst=<%=e.getInstruction()%>">Update</a></td>
              <td><a href="deleteinstruction.jsp?inst=<%=e.getInstruction()%>">Delete</a></td>
           </tr>
        <%
          }
        %>
        <tr>
            <th colspan="1" rowspan="2" style="text-align: center;"><input type="button" class="btn btn-outline-success" value="Add Instruction" onclick="location.href='AddInstruction.jsp'"></th>
            <th colspan="2"><input type="hidden"></th>
            <th colspan="1" style="text-align: center;"><input type="button" class="btn btn-outline-danger" value="Back to Panel" onclick="location.href='AdminPanel.jsp'"></th>
        </tr>
    </table>
</body>
</html>
