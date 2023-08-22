<%--Document:StudentLogin--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style type="text/css">
	li {
		float: left;
	}
	ul {
		list-style-type: none;
		margin: 0;
		padding: 0;
		overflow: hidden;
		background-color:#333; 
	}
	li a {
		display: inline-block;
		color: white;
		text-align: center;
		padding: 14px 16px;
		text-decoration: none; 
	}
	li a:HOVER {
		background-color: aqua;
	}
</style>
<title>Student Login</title>
</head>
<body>
	        <h1 style="color: blue; text-align: center;">User Login</h1>
	         <font color="red">
		<%
			if(request.getParameter("msg") != null)
				out.print(request.getParameter("msg"));
		%>
	</font>
	<font color="green">
		<%
			if(request.getParameter("msg1") != null)
				out.print(request.getParameter("msg1"));
		%>
	</font>
	<form action="com.controller.ValidateStudent" method="post">
		<pre>
			                                 User Id         :	<input type="text" name="uname">	 <br>
			                                 Password 	     :	<input type="password" name="pass">	 <br>
			            
			                                        <input  onclick="location.href='index.html'" type="button" value="Exit" class="btn btn-outline-primary">    <input type="submit" value="Login" class="btn btn-outline-primary">    <input type="button" onclick="location.href='AddStudent.jsp'" value="Sign Up" class="btn btn-outline-primary">
			                                        </pre>
	</form>
</body>
</html>
