<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<link type="text/css" rel="stylesheet" href="css/admin.css">
<script>



	function validation() {

		var name = document.getElementById("name").value;
		var mobile = document.getElementById("mobile").value;
		var address = document.getElementById("address").value;
		var username = document.getElementById("username").value;
		var password = document.getElementById("password").value;

		if (!name.match(/\S/)) {
			alert("enter name");
			return false;
		} else if (!mobile.match(/\S/)) {
			alert("enter mobile number");
			return false;
		}
		else if (!address.match(/\S/)) {
			alert("enter address");
			return false;
		}
		else if (!username.match(/\S/)) {
			alert("enter username");
			return false;
		}
		else if (!password.match(/\S/)) {
			alert("enter password");
			return false;
		}
		else {

			return true;
		}

	}
	
	
	function isNumberKey(evt){
	    var charCode = (evt.which) ? evt.which : event.keyCode;
	    if (charCode > 31 && (charCode < 48 || charCode > 57))
	        return false;
	    return true;
	};
</script>
</head>

<body style="background:#ff9900">
	<div class="navStrip">
    	<a href="home.jsp">
            <div class="logo">
                <img src="images/landing-page.png" style="">
            </div>
            <h2 style="letter-spacing:2px;float:left;line-height:70px;"><span style="color:#444444">P</span>OCKET <span style="color:#444444">R</span>ESTAURANT</h2>
    	</a>
    </div>
    <div class="leftContainer">
    	<a href="viewpayment.jsp">
            <div class="leftContentRow">
                View Payment
            </div>
        </a>
        <a href="vieworders.jsp">
            <div class="leftContentRow">
                    View Orders
            </div>
        </a>        
       <!--  <a href="approveuser.jsp">
            <div class="leftContentRow">
                Approve User
            </div>
        </a> 
        <a href="addstaff.jsp">   
            <div class="leftContentRow" id="active">
                Add Staff
            </div>
        </a>
        <a href="viewstaff.jsp">
            <div class="leftContentRow">
                View Staff
            </div>
        </a>    
        <a href="adddishes.jsp">
            <div class="leftContentRow">
                Add Dishes
            </div>
        </a>     -->
    </div>
    <div class="rightContainer">
    	<div class="addStaffContentDiv">
    	
    	
    		<form action="addstaffaction.jsp" method="post"
			onsubmit="return validation()">
        	<div class="addStaffUpperContent">
            	<div class="addStaffContentRow">
            		<h2 style="color:#444444;">Add Staff</h2>
                </div>    
                <div class="addStaffContentRow">
                    <input type="text" id="name" name="name" placeholder="Name" style="width:250px;height:30px;">
                </div>
                <div class="addStaffContentRow">
                    <select id="designation" name="designation"
				style="width: 260px; height: 30px; padding-top: 3px; text-indent: 2px; padding-right: 5px;">
				<option value="Manager">Manager</option>
				<option value="Cook">Cook</option>
				
			</select>
                </div>
                <div class="addStaffContentRow">
                    <input type="text" id="mobile" name="mobile" placeholder="Mobile No:" onkeypress="return isNumberKey(event)" style="width:250px;height:30px;">
                </div>
                <div class="addStaffContentRow">
                   <span style="color:#999">Address</span> 
                   <textarea id="address" name="address" placeholder="Address" style="width:250px;height:70px;text-indent:1px;"></textarea>
                </div>
            </div>
            <div class="addStaffLowerContent">    
                <div class="addStaffContentRow">
                    <input type="text" id="username" name="username" placeholder="Username" style="width:250px;height:30px;">
                    
                    <% 
try{
	


String val=request.getParameter("resp");
if(val.equals("fail"))
{
	out.println("username exist");
%>

<%

}
else
{
%>
 
 <%
}
}
catch(Exception e)
{
	
}


 %>
                </div>
                <div class="addStaffContentRow">
                    <input type="password" id="password" name="password" placeholder="Password" style="width:250px;height:30px;">
                </div>
                <div class="addStaffContentRow">
                    <input type="submit" value="Submit" style="border:none;background:#ff9900;width:100px;height:50px;font-size:18px;cursor:pointer;color:#ededee">
                </div>
            </div>    
            
            </form>
        </div>
    </div>
</body>
</html>
