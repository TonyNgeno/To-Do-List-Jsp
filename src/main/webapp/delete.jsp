<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*, todo.db.*"%>
<%
String id=request.getParameter("id");
try
{
DbConnection dbConnection2 = new DbConnection("jdbc:mysql://localhost:3306/thetododb","root","");
String query = "Select * from todos";
Statement statement = dbConnection2.connect().createStatement();
int i=statement.executeUpdate("DELETE FROM todos WHERE id="+id);
out.println("Data Deleted Successfully!");
response.sendRedirect("index.jsp");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
