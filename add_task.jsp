<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="P1.ConnectDemo" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Add Task</title>
</head>
<body>
<% 

try
{
	ConnectDemo.connect();
	String username = (String) session.getAttribute("username");
	String title = request.getParameter("title");
	String description = request.getParameter("description");
	ConnectDemo.stmt.executeUpdate("INSERT INTO tasks VALUES ( '"+username+"','" + title + "', '" + description + "', 0)");
	ConnectDemo.con.close();
	response.sendRedirect("dashboard.html");
}
catch(Exception e)
{
	out.println(e);
}%>
</body>
</html>