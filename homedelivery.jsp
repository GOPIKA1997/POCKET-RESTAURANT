<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"
	import="net.sf.json.JSONArray,org.json.simple.JSONObject"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="css/admin.css">
<link rel="stylesheet" href="styleCalender.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="j6.js"></script>
<script src="j7.js"></script>
<script src="js/bootstrap.min.js" ></script>
<script>
$(document).ready(function() {


		var curr_date=formatDate(new Date());
		$.getJSON("homedelivery_json.jsp?curr_date="+curr_date+"&status1=home", function(json){
			
			var len=json.length;
			
			var i=0;
			if(json.length==0)
				{
					alert("No result");
				}
			while(i<len)
				{
					var phone=json[i].phone;
					var name=json[i].name;
					var userreg_id=json[i].userreg_id;
					var addr=json[i].addr;
					var buy_id=json[i].buy_id;
					$("#approveHeadingRow").append('<tr><td>'+(i+1)+'</td><td>'+name+'</td><td>'+addr+'</td><td>'+phone+'</td><td><a href="homedelivery_more.jsp?userreg_id='+userreg_id+'&buy_id='+buy_id+'"><input type="submit" value="VIEW" id="view" class="btn btn-danger btn-sm" ></a></td></tr>');
					
					
					i++;
		 		}
			 	
		});
		
		
	
});
function formatDate(dt) {
    var dd = dt.getDate();
    var mm = dt.getMonth()+1;
    var yyyy = dt.getFullYear();
    if(dd<10) {
        dd='0'+dd
    } 

    if(mm<10) {
        mm='0'+mm
    } 

    return yyyy+"-"+mm+"-"+dd;
}
</script>
</head>
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
      <li class="nav-item dropdown active">
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
      <li class="nav-item">
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
		<h2>Home Delivery</h2>
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
						<th> Name</th>
						<th> Address</th>
						<th> Mobile No</th>
						<th>Action</th>
					</tr>
					</thead>
					<tbody id="approveHeadingRow">
					
					</tbody>
				</table>
		</div></div></div>	
</section>
</body>
</html>
