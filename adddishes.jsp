<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"
	import="org.json.simple.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<link type="text/css" rel="stylesheet" href="css/admin.css">
	<link type="text/css" rel="stylesheet" href="css/modal.css">

		<script type="text/javascript" src="js/jquery-1.7.1.js">
			
		</script>
		<script type="text/javascript">
			$(document).ready(function() {

				
				 var i=0;
				 $.getJSON("http://localhost:8051/PocketRestaurantServer/getcategorydetails.jsp", function(json){
					 $('#category_details').append('<option value=select>Select Category</option>');
				 while(json[i]!=null)
				 {
				
				 $('#category_details').append('<option value='+json[i].id+'>'+json[i].category+'</option>');
				
				 i++;
				 }
				
				 }); 
				 
				 
				 
				 $("#submit").click(function()
							{
					 $("#uploadPicture").hide();
					 var category=$("#category_details").val();
					 var name=$("#dishname").val().trim();
					 var description=$("#dishdescription").val().trim();
					 var price=$("#dishprice").val().trim();
					
					 if(category=="select")
						 {
						 alert("Please select category");
						 }
					 else if(name.length==0)
						 {
						 alert("Please enter the name");
						 }
					 else if(description.length==0)
					 {
					 alert("Please enter the description");
					 }
					 else if(price.length==0)
					 {
					 alert("Please enter the price");
					 }
					 else
						 {
						 
						 $.getJSON("http://localhost:8051/PocketRestaurantServer/adddishesaction.jsp?category="+category+"&name="+name+"&description="+description+"&price="+price, function(json){
							 
						 if(json[0]!=null)
						 {
							
							 if(json[0].resp=="success")
								 {
								
								 $("#uploadPicture").show();
								 }
							 else
								 {
								 alert("Dish already added");
								 }
							
					
						 }
						
						 }); 
						
						 
						 
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
			<div class="leftContentRow">View Staff</div>
		</a> <a href="adddishes.jsp">
			<div class="leftContentRow" id="active">Add Dishes</div>
		</a> -->
	</div>
	<div class="rightContainer">
		<h2
			style="margin-left: 100px; color: #444444; margin-top: 40px; float: left">Add
			Dishes</h2>
		<div class="addStaffContentDiv">
			<div class="addDishesRow">
				<a href="#openModal"> <input type="button"
					value="Add New Category"
					style="border: none; background: #ff9900; height: 50px; font-size: 18px; cursor: pointer; color: #ededee; float: right"></a>
			</div>

			<form ACTION="addcategoryaction.jsp" METHOD=POST>
				<div id="openModal" class="modalDialog">
					<div>
						<a href="#close" title="Close" class="close">X</a>
						<div class="addDishesRow"
							style="text-align: center; margin-top: 100px;">
							<input type="text" name="category" id="category"
								placeholder="Dish Group Name"
								style="width: 200px; height: 30px;">
						</div>
						<div class="addDishesRow"
							style="text-align: center; margin-top: 80px;">
							<input type="submit" value="OK"
								style="width: 70px; height: 40px; border: none; background: white; font-size: 18px; cursor: pointer; color: 444444;">
						</div>
					</div>
				</div>
			</form>

			<div class="addDishesRow" style="margin-top: 100px;">
				<div class="addDishesRowSub" style="text-align: right">Select
					food Category</div>
				<div class="addDishesRowSub"
					style="text-align: left; text-indent: 10px;">
					<select id="category_details" name="category_details">
					

					</select>
				</div>
			</div>
			<div class="addDishesRow">
				<div class="addDishesRowSub" style="text-align: right">Dish
					Name</div>
				<div class="addDishesRowSub"
					style="text-align: left; text-indent: 10px;">
					<input type="text" id="dishname">
				</div>
			</div>
			<div class="addDishesRow">
				<div class="addDishesRowSub" style="text-align: right">
					Description</div>
				<div class="addDishesRowSub"
					style="text-align: left; text-indent: 10px;">
					<textarea id="dishdescription"></textarea>
				</div>
			</div>
			<div class="addDishesRow" style="margin-top: 15px;">
				
			</div>
			<div class="addDishesRow">
				<div class="addDishesRowSub" style="text-align: right">Price</div>
				<div class="addDishesRowSub"
					style="text-align: left; text-indent: 10px;">
					<input type="text" id="dishprice" onkeypress="return isNumberKey(event)">
				</div>
			</div>
			<div class="addDishesRow" style="text-align: center">
				<a href="#uploadPicture"> 
					<input type="button" value="Submit" id="submit" name="submit"
						style="border: none; background: #ff9900; height: 50px; font-size: 18px; cursor: pointer; color: #ededee;">
				</input>	</a>	
			</div>
			
			
			 <form ENCTYPE="multipart/form-data" ACTION="imageupload.jsp" METHOD=POST>
			<div id="uploadPicture" class="modalDialog">
					<div>
						
						<div class="addDishesRow"
							style="text-align: center; margin-top: 100px;">
							<h2 style="color:white">Upload Picture</h2><br>
							<input type="file" name="file">
						</div>
						<div class="addDishesRow"
							style="text-align: center; margin-top: 80px;">
							<input type="submit" value="OK" name="sub" id="b"
								style="width: 70px; height: 40px; border: none; background: white; font-size: 18px; cursor: pointer; color: 444444;">
						</div>
					</div>
				</div>
				</form>
				
		</div>
	</div>
</body>
</html>
