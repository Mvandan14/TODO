<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="P1.ConnectDemo" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Tasks</title>
</head>
<body>
<h1>View Tasks</h1>
<table border="1">
    <tr>
        <th>Title</th>
        <th>Description</th>
        <th>Completed</th>
    </tr>
    <% 
    try {
        ConnectDemo.connect();
        String username = (String) session.getAttribute("username");
        
        String sql = "SELECT title, description, completed FROM tasks WHERE username=?";
        PreparedStatement stmt = ConnectDemo.con.prepareStatement(sql);
        stmt.setString(1, username);
        ResultSet rs = stmt.executeQuery();
        
        while (rs.next()) {
            String title = rs.getString("title");
            String description = rs.getString("description");
            boolean completed = rs.getBoolean("completed");
            
            String dropdown = "<select>";
            dropdown += "<option value=\"0\"" + (completed ? "" : " selected") + ">No</option>";
            dropdown += "<option value=\"1\"" + (completed ? " selected" : "") + ">Yes</option>";
            dropdown += "</select>";
            
            out.println("<tr>");
            out.println("<td>" + title + "</td>");
            out.println("<td>" + description + "</td>");
            out.println("<td>" + dropdown + "</td>");
            out.println("</tr>");
        }
        
        rs.close();
        ConnectDemo.con.close();
    } catch (Exception e) {
        out.println(e);
    }
    %>
</table>
</body>
</html>
