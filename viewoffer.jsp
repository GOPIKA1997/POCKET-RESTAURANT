<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="css/admin.css">
<link href="css/datepicker.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="j6.js"></script>
<script src="j7.js"></script>
<script src="js/bootstrap.min.js" ></script>
<script src="js/bootstrap-datepicker.js"></script>

</head>

<body style="background:#ff9900">
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
<div class="container">
  <a class="navbar-brand" href="#"><img src="images/logo.png"></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav ml-auto">
      <li class="nav-item ">
        <a class="nav-link" href="home.jsp">Home</a>
      </li>
      <li class="nav-item ">
        <a class="nav-link" href="viewpayment.jsp">View Payment</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          View Orders
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="bookrest.jsp">Book on Restaurant</a>
          <a class="dropdown-item" href="wayrest.jsp">Way on Restaurant</a>
          <a class="dropdown-item" href="homedelivery.jsp">Home Delivery</a>
          <a class="dropdown-item" href="catering.jsp">Catering</a>
        </div>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="viewoffer.jsp">View Offer</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="logout_action.jsp">Logout</a>
      </li>
    </ul>
  </div>
  </div>
</nav>
<section class="banner">
	<div class="container">
		<h2>View Offer</h2>
	</div>
</section>
<section class="my-5">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-sm-9 bg-white p-4">
				<table class="table table-bordered">
				<thead>
					<tr>
						<th>Sl No</th>
						<th>Category  Name</th>
						<th>Dish Name </th>
						<th>Date</th>
						<th>Offer Name</th>
						<th>Discount (in %)</th>
					</tr>
				</thead>
				<tbody>
				
				<%
				Class.forName("com.mysql.jdbc.Driver");
				String category="",foodname="";
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pocketrestorent_nfc","root","sa");
				Statement st=con.createStatement();
				ResultSet res=st.executeQuery("select * from offers order by offers_id DESC");
				if(!(res.next())){
					%>	
					<tr><td  colspan="6"><h2 class="text-danger text-center">No Records Found ......!!</h2></td></tr>
				<% }else{
					int i=1;
				do
				{
				
				int offer_id = res.getInt("offers_id");
				int dish_category_id=res.getInt("dish_category_id");
				Statement st1=con.createStatement();
				ResultSet res1=st1.executeQuery("select * from dish_category where dish_category_id="+dish_category_id+"");
				if(res1.next())
				{
					 category=res1.getString("category");
					
				}
				int dish_name_id=res.getInt("dish_name_id");
				Statement st2=con.createStatement();
				ResultSet res2=st2.executeQuery("select * from dish_name where dish_name_id="+dish_name_id+"");
				if(res2.next())
				{
					 foodname=res2.getString("foodname");
					
				}
				int discount=res.getInt("discount");
				String offers=res.getString("offers");
				String currentdate=res.getString("currentdate");
%>
<tr>
<td><%=i %></td>
<td><%=category %></td>
<td><%=foodname %></td>
<td><%=currentdate %></td>
<td><%=offers %></td>
<td><%=discount %></td>
</tr>
<%

i++;
	}while(res.next());
		}

%>
				</tbody>
			</table>
			</div>
			</div>
			</div>
</section>  	
</body>
</html>
