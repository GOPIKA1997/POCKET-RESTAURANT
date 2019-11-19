<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"
	import="net.sf.json.JSONArray,org.json.simple.JSONObject"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<link type="text/css" rel="stylesheet" href="css/admin.css">
</head>

<body style="background: #ff9900">
	<div class="navStrip">
		<a href="home.jsp">
			<div class="logo">
				<img src="images/landing-page.png" style="">
			</div>
			<h2 style="letter-spacing: 2px; float: left; line-height: 70px;">
				<span style="color: #444444">P</span>OCKET <span
					style="color: #444444">R</span>ESTAURANT
			</h2>
		</a>
	</div>
	<div class="leftContainer">
		<a href="viewpayment.jsp">
			<div class="leftContentRow">View Payment</div>
		</a> <a href="vieworders.jsp">
			<div class="leftContentRow">View Orders</div>
		</a><!--  <a href="approveuser.jsp">
			<div class="leftContentRow" id="active">Approve User</div>
		</a> <a href="addstaff.jsp">
			<div class="leftContentRow">Add Staff</div>
		</a> <a href="viewstaff.jsp">
			<div class="leftContentRow">View Staff</div>
		</a> <a href="adddishes.jsp">
			<div class="leftContentRow">Add Dishes</div>
		</a> -->
	</div>
	<div class="rightContainer" style="height: 600px;">
		<div class="rightContentDiv">
			<div class="approveHeadingRow">
				<h2 style="color: #444444; float: left">Approve User</h2>
			</div>
			<div class="approveHeadingRow">
				<div class="approveHeadingContent">Username</div>
				<div class="approveHeadingContent">Mobile number</div>
				<div class="approveHeadingContent">Email</div>
				<div class="approveHeadingContent">Location</div>
			</div>
<%
Class.forName("com.mysql.jdbc.Driver");
try {
	
	Connection con = DriverManager.getConnection(
			"Jdbc:mysql://localhost:3306/pocket_restaurant", "root", "sa");
	Statement stmt = con.createStatement();
	ResultSet rs=stmt.executeQuery("select * from user_login where status='no' ");
	while(rs.next())
	{
		String userid=rs.getString("user_login_id");
		Statement stmt1 = con.createStatement();
		ResultSet rs1=stmt1.executeQuery("select * from user_register where user_login_id='"+userid+"' ");
		if(rs1.next())
		{
			%>
			
				<div class="approveHeadingRow" style="margin: 0; background: #CCC;padding-bottom: 30px;">
				<div class="approveContent"><%=rs1.getString("name") %></div>
				<div class="approveContent"><%=rs1.getString("mobile") %></div>
				<div class="approveContent"><%=rs1.getString("email") %></div>
				<div class="approveContent" style="background: #ccc;padding-bottom: 30px;line-height:normal;"><%=rs1.getString("address") %> , <%=rs1.getString("city") %> , <%=rs1.getString("state") %></div>
				<a href="approveuseraction.jsp?user_login_id=<%=userid%>&button=reject"><div class="button">Reject</div></a>
				<a href="approveuseraction.jsp?user_login_id=<%=userid%>&button=approve"><div class="button">Approve</div></a>
			</div>
			
			<%
		}
	
	}
}
catch (Exception e) {

	out.print(e);
}
%>

		


		</div>
	</div>
</body>
</html>
