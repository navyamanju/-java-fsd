<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	li {
		float: left;
	}
	ul {
		list-style-type: none;
		margin: 0;
		padding: 0;
		overflow: hidden;
		background-color: #333; 
	}
	li a {
		display: inline-block;
		color: white;
		text-align: center;
		padding: 14px 16px;
		text-decoration: none; 
	}
	li a:hover {
		background-color: aqua;
	}
	.center-content {
		text-align: center;
		color: blue;
	}
	.error-msg {
		color: red;
	}
	.success-msg {
		color: green;
	}
</style>
<title>Admin Login</title>
</head>
<body>
	<div class="center-content">
		<h1>Admin Login</h1>
	</div>
	<div class="error-msg">
		<%
			if(request.getParameter("msg2") != null)
				out.print(request.getParameter("msg2"));
		%>
	</div>
	<div class="success-msg">
		<%
			if(request.getParameter("msg1") != null)
				out.print(request.getParameter("msg1"));
		%>
	</div>
	<form action="com.controller.ValidateAdmin" method="post">
		<pre>
			                                          Username : <input type="text" name="uname">	 
			                                            
			                                          Password : <input type="password" name="pass">	 
			                         
			                                                <input onclick="location.href='index.html'" type="button" value="Exit" class="btn btn-outline-primary">    <input type="submit" value="Login" class="btn btn-outline-primary">						
		</pre>
	</form>
</body>
</html>
