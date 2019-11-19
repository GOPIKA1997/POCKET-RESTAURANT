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
<script>
$(document).ready(function() {
	$('#approveHeadingRow').html("");$("#total").text("");
	$( "#datepicker1" ).datepicker({format: 'dd/mm/yyyy'});
	$('#okbutton').click(function(){
		$('#approveHeadingRow').html("");$("#total").text("");
		var sel_date =$('#datepicker1').val();
		
	
		if(sel_date=="")
			{
				alert("please enter date");
			}
	
		else
			{
			  		//alert("getpaymentdetails_json.jsp?sel_date="+sel_date)
					$.getJSON("getpaymentdetails_json.jsp?sel_date="+sel_date,function(json){
						
						var i=0;
						if(json.length==0)
							{
								alert("No result");
							}
						else
							{
								var sum=0;
								 while(i<json.length)
								{
									var foodname=json[i].foodname;
									var name=json[i].name;
									var total_price=json[i].total_price;
									 sum+=total_price;
									$('#approveHeadingRow').append('<tr><td>'+(i+1)+'</td><td>'+foodname+'</td><td>'+name+'</td><td>'+total_price+'</td></tr>');

									i++;
								}
								
								 $("#total").text(sum);
								
							}
						
					});
			}
		

	});
});
</script>
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
      <li class="nav-item active">
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
		<h2>View Payment</h2>
	</div>
</section>
<section class="my-5">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-sm-9 bg-white p-4">
				<div class="row justify-content-center">
					<div class="col-7 my-3">
					<div class="input-group mb-3 p-2 bg-secondary">
					  <input type="text" class="form-control" placeholder="Search by date" id="datepicker1" aria-describedby="button-addon2">
					  <div class="input-group-append">
					    <button class="btn btn-danger" type="button" id="okbutton">Button</button>
					  </div>
					</div>
					</div>
				</div>
				<table class="table table-bordered">
					<thead>
					<tr>
						<th>Sl No</th>
						<th>Dish Name</th>
						<th>Customer Name</th>
						<th>Price</th>
					</tr>
					</thead>
					<tbody id="approveHeadingRow">
					
					</tbody>
					<tfoot>
						<tr class="bg-secondary">
							<td colspan="3" class="text-right">Grand Total</td>
							<td id="total"></td>
						</tr>
					</tfoot>
				</table>
		</div></div></div>	
</section>  	
</body>
</html>
