<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*, todo.db.*"%>
<%
String id=request.getParameter("id");
String title=request.getParameter("title");
String description=request.getParameter("description");
try
{
DbConnection dbConnection2 = new DbConnection("jdbc:mysql://localhost:3306/thetododb","root","");
PreparedStatement statement = dbConnection2.connect().prepareStatement("Update todos  set id =?, title=?,description=?  WHERE id="+id);
statement.setString(1,id);
statement.setString(2,title);
statement.setString(3,description);
statement.executeUpdate();
out.println("Data Updated Successfully!");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
