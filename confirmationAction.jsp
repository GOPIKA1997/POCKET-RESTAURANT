<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("Jdbc:mysql://localhost:3306/pocketrestorent_nfc","root", "sa");
Statement stmt = con.createStatement();

	String userreg_id=request.getParameter("userreg_id");
	String buy_id=request.getParameter("buy_id");
	String status1=request.getParameter("status1");
	
		String update_query="update buy set status=1 where user_id='"+userreg_id+"' and buy_id='"+buy_id+"' and status1='"+status1+"'";
		
		System.out.println(update_query);
		stmt.executeUpdate(update_query);
		response.sendRedirect("home.jsp");
	
%>