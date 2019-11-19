<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<link type="text/css" rel="stylesheet" href="css/admin.css">
	<script type="text/javascript" src="js/jquery-1.7.1.js">
		
	</script>
	<script type="text/javascript">
		$(document).ready(function() {
			
			
			$("#search").click(function()
					
					{
					 var designation=$('#designation').val();
					 var searchtype= $('input:radio[name=r1]:checked').val();
				
				if(searchtype=="Name")
				{
					 var name=$('#nameval').val().trim();
					 if(name=="")
						 {
						 alert("Enter the name to search");
						 }
					 else
						 {
						 $('#details').empty();
						 $.getJSON("http://localhost:8051/PocketRestaurantServer/searchstaff.jsp?designation="+designation+"&searchtype="+searchtype+"&name="+name, function(json){
							var i=0;
						 while(json[i]!=null)
						 {
							 var statusval=json[i].status;
								var buttonval="";
								if(statusval=="allow")
								{
								buttonval="Block";
								}
							else
								{
								buttonval="Un Block";
								}
						 $('#details').append('<div class="approveHeadingRow" style="margin: 0; background: #CCC"><div class="approveContent">'+json[i].name+'</div><div class="approveContent">'+json[i].designation+'</div><div class="approveContent">'+json[i].mobile+'</div><div class="approveContent">'+json[i].address+'</div><a href="deleteaction.jsp?blockval='+buttonval+'&id='+json[i].staff_login_id+'"> <div class="button">	Delete</div></a><a href="blockaction.jsp?blockval='+buttonval+'&id='+json[i].staff_login_id+'"><div class="button">'+buttonval+'	</div></a></div>');
						 i++;
						 }
						
						 }); 
						 }
				}
			else
				{
				 var mobile=$('#mobileval').val().trim();
				 if(mobile=="")
				 {
					 alert("Enter the number to search");
				 }
				 else
					 {
					 $('#details').empty();
					 $.getJSON("http://localhost:8051/PocketRestaurantServer/searchstaff.jsp?designation="+designation+"&searchtype="+searchtype+"&name="+mobile, function(json){
						 var i=0;
						 while(json[i]!=null)
						 {
						var statusval=json[i].status;
						var buttonval="";
						if(statusval=="allow")
							{
							buttonval="Block";
							}
						else
							{
							buttonval="Un Block";
							}
							 $('#details').append('<div class="approveHeadingRow" style="margin: 0; background: #CCC"><div class="approveContent">'+json[i].name+'</div><div class="approveContent">'+json[i].designation+'</div><div class="approveContent">'+json[i].mobile+'</div><div class="approveContent">'+json[i].address+'</div> <a href="deleteaction.jsp?blockval='+buttonval+'&id='+json[i].staff_login_id+'"> <div class="button">	Delete</div></a><a href="blockaction.jsp?blockval='+buttonval+'&id='+json[i].staff_login_id+'"><div class="button">'+buttonval+'	</div></a></div>');
						
						i++;
						 }
						
						 }); 
					 }
				}
					});
		});
		function isNumberKey(evt){
		    var charCode = (evt.which) ? evt.which : event.keyCode;
		    if (charCode > 31 && (charCode < 48 || charCode > 57))
		        return false;
		    return true;
		};
	</script>
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
		</a> <!-- <a href="approveuser.jsp">
			<div class="leftContentRow">Approve User</div>
		</a> <a href="addstaff.jsp">
			<div class="leftContentRow">Add Staff</div>
		</a> <a href="viewstaff.jsp">
			<div class="leftContentRow" id="active">View Staff</div>
		</a> <a href="adddishes.jsp">
			<div class="leftContentRow">Add Dishes</div>
		</a> -->
	</div>
	<div class="rightContainer" style="padding-bottom: 10px;">
		<div class="rightContentDiv" style="padding-bottom: 10px;">
			<div class="approveHeadingRow">
				<h2 style="color: #444444; float: left">View Staff</h2>
			</div>
			<div class="approveHeadingRow">
				<span style="text-indent: 10px;">Select Designation</span> <select id="designation" name="designation">
					<option value="Manager">Manager</option>
					<option value="Cook">Cook</option>
				</select>
			</div>
			<div class="approveHeadingRow">
				<span style="text-indent: 10px;">Search By</span>
			</div>
			<div class="approveHeadingRow">
				<input type="radio" name="r1" value="Name" checked="checked" >Name <input type="text" name="nameval" id="nameval">
			</div>
			<div class="approveHeadingRow">
				<input type="radio" name="r1" value="Mobile">Mobile No: <input type="text" name="mobileval" onkeypress="return isNumberKey(event)" id="mobileval">
			</div>
			<div class="approveHeadingRow">
				<input type="button" name="search" value="Search" id="search">
			</div>
			<div class="approveHeadingRow">
				<div class="approveHeadingContent">Name</div>
				<div class="approveHeadingContent">Designation</div>
				<div class="approveHeadingContent">Mobile no:</div>
				<div class="approveHeadingContent">Address</div>
			</div>
			<div id="details" name="details"></div>
			
			
			
			
			
		</div>
	</div>
</body>
</html>
