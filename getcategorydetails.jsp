<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"
	import="net.sf.json.JSONArray,org.json.simple.JSONObject"%>
<%
	
	Class.forName("com.mysql.jdbc.Driver");
	try {
		JSONObject jo;
		JSONArray ja = new JSONArray();
		Connection con = DriverManager.getConnection(
				"Jdbc:mysql://localhost:3306/pocket_restaurant",
				"root", "sa");
		Statement stmt = con.createStatement();
		ResultSet rs = stmt
				.executeQuery("select * from category ");
		
		while (rs.next()) 
		{
			jo = new JSONObject();
			jo.put("category",""+rs.getString("category_name"));
			jo.put("id",""+rs.getString("category_id"));
			ja.add(jo);
		} 
		
		out.println(ja);
		

	} catch (Exception e) {

		System.out.print(e);
	}
%>
