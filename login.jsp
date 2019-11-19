
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"
	import="org.json.simple.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />
<link type="text/css" rel="stylesheet" href="css/style.css" />

<script>

	function validation() {

		var username = document.getElementById("username").value;
		var password = document.getElementById("password").value;

		if (!username.match(/\S/)) {
			alert("enter username");
			return false;
		} else if (!password.match(/\S/)) {
			alert("enter password");
			return false;
		}

		else {

			return true;
		}

	}
</script>
</head>

<body style="background-image: url(images/banner1.jpg)">
	<div class="loginLogoOuter row">
		<div class="loginLogo col-6" style="">
			<img src="images/logo-large.png">
				<h1
					class="text-success">
					<span class="text-danger">P</span>OCKET <span
						class="text-danger">R</span>ESTAURANT
				</h1>
		</div>
		<form class="col-6" action="loginaction.jsp" method="post"
			onsubmit="return validation()">
			
			<div class="loginOuterDiv p-5">
			<div class="alert alert-danger bg-transparent border-0" role="alert">
					<% 

	String responseval=request.getParameter("resp");
	if(null!=responseval)
	{
	
	if(responseval.equals("fail"))
	{
	
	out.println("Invalid Username or Password");
	
	}
	}
	else
	{

	}




	%>
				</div>
				<div class="loginRow form-group ">
					<label>Username</label>
					<input type="text"  id="username" name="username" class="form-control">
						
				</div>
				<div class="loginRow form-group ">
				<label>Password</label>
					<input type="password" placeholder="Password" id="password" name="password" class="form-control">
				</div>
				<div class="loginRow form-group ">
					<input type="submit" value="Login" class="btn btn-danger btn-block">
				</div>
				<br />
				
			</div>

		</form>

	</div>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>
