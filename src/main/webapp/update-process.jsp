<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*, todo.db.*, todo.model.*"%>
<%
String id=request.getParameter("id");
String title=request.getParameter("title");
String description=request.getParameter("description");
try
{
DbConnection dbConnection2 = new DbConnection("jdbc:mysql://localhost:3306/thetododb","root","");
Statement statement = dbConnection2.connect().createStatement();
statement.executeUpdate("update todos set title = \""+title+"\", description = \""+description+"\" where id = "+id+";");
response.sendRedirect("todo.jsp");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
