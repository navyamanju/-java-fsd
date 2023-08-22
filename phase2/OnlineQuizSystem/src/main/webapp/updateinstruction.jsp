<%--Document : updateinstruction--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="com.model.InstructionsDao"%>
<%@page import="com.db.Instructions"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Update Instructions</title>
</head>
<body>
    <h3><font color="blue">List of all instructions</font></h3>
    <table class="table table-bordered table-hover">
        <tr class="table-dark">
            <th>s no.</th>
            <th>Instruction</th>
            <th>Operation</th>
            <th>Delete</th>
        </tr>
        <% 
            int i = 0;
            ArrayList<Instructions> allinsts = InstructionsDao.getAllRecords();
            for (Instructions e : allinsts) {   
                if (request.getParameter("inst").equals(e.getInstruction())) { 
        %>
        <tr class="table-primary">
           
                <form action="updateinstructionnow.jsp">
                    <input type="hidden" value="<%=e.getInstruction()%>" name="instoriginal">
                    <td><%=i++%></td>
            <td>
                   <input type="text" value="<%=e.getInstruction()%>" name="instmodified"></input>
                     
             </td>
           <td>
                <input type="submit" value="update">
              
            </td>
            <td><a href="deleteinstruction.jsp?inst=<%=e.getInstruction()%>">Delete</a></td>
            </form>
       
        </tr>
        <%	
            } else { 
        %>
        <tr>
            <td><%=i++%></td>
            <td><%=e.getInstruction()%></td>
            <td><a href="updateinstruction.jsp?inst=<%=e.getInstruction()%>">Update</a></td>
            <td><a href="deleteinstruction.jsp?inst=<%=e.getInstruction()%>">Delete</a></td>
        </tr>
        <%  }
        } %>
        <tr>
            <th colspan="1" rowspan="2"><input type="button" class="btn btn-outline-success" value="Add Instruction" onclick="location.href='AddInstruction.jsp'"></th>
            <th colspan="2"><input type="hidden"></th>
            <th colspan="1"><input type="button" class="btn btn-outline-danger" value="Back to Panel" onclick="location.href='AdminPanel.jsp'"></th>
        </tr>
    </table>
</body>
</html>
