<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"
	import="net.sf.json.JSONArray,org.json.simple.JSONObject"%>
<%
	String category = request.getParameter("category");
	String firstLetter = category.substring(0, 1).toUpperCase();
	String restLetters = category.substring(1).toLowerCase();
	category = firstLetter + restLetters;

	Class.forName("com.mysql.jdbc.Driver");
	try {
		JSONObject jo = new JSONObject();
		JSONArray ja = new JSONArray();
		Connection con = DriverManager.getConnection(
				"Jdbc:mysql://localhost:3306/pocket_restaurant",
				"root", "sa");
		Statement stmt = con.createStatement();
		ResultSet rs = stmt
				.executeQuery("select * from category where category_name='"
						+ category + "'  ");
		if (rs.next()) {

		} else {
			System.out.println(category);
			Statement stmt1 = con.createStatement();
			stmt1.executeUpdate("insert into  category(category_name) values('"
					+ category + "') ");

		}

		response.sendRedirect("adddishes.jsp?resp=success");

	} catch (Exception e) {

		System.out.print(e);
	}
%>
