
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Vaccination Center Dashboard</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        .center {
            text-align: center;
        }
        .table {
            margin: 20px auto;
            border-collapse: collapse;
            width: 80%;
        }
        .table th,
        .table td {
            padding: 10px;
            border: 1px solid #ddd;
        }
        .table th {
            background-color: #f2f2f2;
        }
        .btn {
            display: inline-block;
            padding: 5px 10px;
            text-decoration: none;
            color: #fff;
            background-color: #333;
            border-radius: 3px;
        }
        .btn-view {
            background-color: #337ab7;
        }
        .btn-edit {
            background-color: #5cb85c;
        }
        .btn-delete {
            background-color: #d9534f;
        }
        .btn-add {
            background-color: #337ab7;
            float: right;
            margin-top: -40px;
        }
    </style>
</head>
<body>
    <h1 class="center">Vaccination Center Dashboard</h1>

    <div class="center">
        <a href="/citizens" class="btn">Citizens</a>
        <a href="/vaccinationcentre" class="btn">Vaccination Centers</a>
        <a href="/login" class="btn">Logout</a>
    </div>

    <h2 class="center">Centers</h2>
<a href="/add-centre" class="btn btn-add">Add new Center</a>
    <table class="table center">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>City</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${vaccinecentre}" var="centre">
                <tr>
                    <td>${centre.id}</td>
                    <td>${centre.name}</td>
                    <td>${centre.city}</td>
                    <td>
                        <a href="/view-centre/${centre.id}" class="btn btn-view">View</a>
                        <a href="/edit-centre/${centre.id}" class="btn btn-edit">Edit</a>
                        <a href="/delete-centre/${centre.id}" class="btn btn-delete">Delete</a>
                    </td>
                </tr>
            </c:forEach>
            <tr>
                <td colspan="3" style="text-align: right;"><b>Total Centers Available:</b></td>
                <td>${vaccinecentre.size()}</td>
            </tr>
        </tbody>
    </table>
 
    
</body>
</html>
