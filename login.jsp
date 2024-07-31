<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="P1.ConnectDemo" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Login</title>
</head>
<body>
<% 

try
{
	ConnectDemo.connect();
	String un= request.getParameter("username");
	String pw=request.getParameter("password");
	int i=ConnectDemo.stmt.executeUpdate("update users set username='"+un+"' where username='"+un+"'&&password='"+pw+"'");
	if(i>0){
		session.setAttribute("username", un); 
		response.sendRedirect("dashboard.html");
		response.sendRedirect("dashboard.html");
		}
	else{
		out.println("Invalid Credentials");
	}
	}
catch(Exception e)
{
	out.println(e);
}%>
</body>
</html>