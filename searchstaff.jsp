<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"
	import="net.sf.json.JSONArray,org.json.simple.JSONObject"%>
<%

	String designation = request.getParameter("designation");
	String searchtype = request.getParameter("searchtype");
	String name = request.getParameter("name");
	Class.forName("com.mysql.jdbc.Driver");
	try {
		JSONObject jo = new JSONObject();
		JSONArray ja = new JSONArray();
		Connection con = DriverManager.getConnection(
				"Jdbc:mysql://localhost:3306/pocket_restaurant",
				"root", "sa");
		Statement stmt = con.createStatement();
		ResultSet rs=null;
		if(searchtype.equals("Name"))
				{
			
			 rs = stmt
					.executeQuery("select * from staff_register where name='"+name+"'");
				}
		else
		{
			 rs = stmt
						.executeQuery("select * from staff_register where mobile='"+name+"'");
		}
		
		
		while (rs.next()) {
			
			Statement stmt1 = con.createStatement();
			ResultSet rs1=stmt1
					.executeQuery("select * from staff_login where staff_login_id='"+rs.getString("staff_login_id")+"'");
			if(rs1.next())
			{
				
			String designationval=rs1.getString("designation");
			if(designationval.equals(designation))
			{
				
			jo = new JSONObject();
			jo.put("staff_login_id",""+rs.getString("staff_login_id"));
			System.out.println("hai");
			jo.put("name",""+rs.getString("name"));
			jo.put("status",""+rs1.getString("status"));
			jo.put("designation",""+rs1.getString("designation"));
			jo.put("mobile",""+rs.getString("mobile"));
			jo.put("address",""+rs.getString("address"));
			ja.add(jo);
			}
			}
		} 
		out.println(ja);

	} catch (Exception e) {

		System.out.print(e);
	}
%>
