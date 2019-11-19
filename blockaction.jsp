<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" import="net.sf.json.JSONArray,org.json.simple.JSONObject"%>
 <%

 String blockval=request.getParameter("blockval");
 String id=request.getParameter("id");
 String val="";
if(blockval.equals("Block"))
		{
	val="block";
		}
else
{
	val="allow";
}

	Class.forName("com.mysql.jdbc.Driver");
	try {
		JSONObject jo = new JSONObject();
		JSONArray ja = new JSONArray();
		Connection con = DriverManager.getConnection(
				"Jdbc:mysql://localhost:3306/pocket_restaurant", "root", "sa");
		Statement stmt = con.createStatement();
		stmt.executeUpdate("update staff_login set status='"+val+"' where staff_login_id='"+id+"' ");
		
		
			response.sendRedirect("viewstaff.jsp?resp=success");
		
			
		
		
	} catch (Exception e) {

		out.print(e);
	}
	
	
%>
    