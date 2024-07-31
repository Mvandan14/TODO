<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="P1.ConnectDemo" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Register</title>
</head>
<body>
<% 

try
{
	 Connection conn = null;
     PreparedStatement pstmt = null;
    String un= request.getParameter("t1");
    String pw=request.getParameter("t2");
    ConnectDemo.connect();

    conn = ConnectDemo.con;
    String sql = "INSERT INTO users (username, password) VALUES (?, ?)";
    PreparedStatement stmt = ConnectDemo.con.prepareStatement(sql);

    stmt.setString(1, un);
    stmt.setString(2, pw);	
    int a = stmt.executeUpdate();

    if (a> 0) {
    	response.sendRedirect("dashboard.html");
    } else {
        response.getWriter().println("Failed to insert user.");
    }
		
		
	
	
}
catch(Exception e)
{
    out.println(e);
}
%>
</body>
</html>