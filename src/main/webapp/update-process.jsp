<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*, todo.db.*"%>
<%
String id=request.getParameter("id");
String title=request.getParameter("title");
String description=request.getParameter("description");
try
{
DbConnection dbConnection2 = new DbConnection("jdbc:mysql://localhost:3306/thetododb","root","");
String query = "Update todos set title=?,description=? where id="+id;
PreparedStatement statement = dbConnection2.connect().prepareStatement(query);
statement.setString(1,title);
statement.setString(2, description);
statement.executeUpdate();

}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>