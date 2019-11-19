<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 

String id=session.getAttribute("id").toString();
	
	if(id!="")
	{	

	session.removeAttribute("id"); 
	response.sendRedirect("login.jsp");
	}
	

%>