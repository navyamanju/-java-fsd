<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        .center {
            text-align: center;
        }
    </style>
</head>
<body>
    <h1 class="center">Login</h1>
    
    <c:if test="${not empty message}">
        <p class="center">${message}</p>
    </c:if>
    <c:if test="${not empty error}">
        <p class="center">${error}</p>
    </c:if>
    
    <form action="/login" method="POST" class="center">
        <label for="email">Username/Email:</label>
        <input type="email" id="email" name="email" required><br><br>
        
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br><br>
        
        <input type="submit" value="Login">
    </form>

    <form action="/registration" method="GET" class="center">
        <input type="submit" value="Register">
    </form>
</body>
</html>
