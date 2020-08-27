<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="todo.db.*" %>
<%@page import="todo.*" %>
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<title>Todos</title>
</head>
<body>
 <%@ include file="./page/navbar.jsp" %><br>
	<table class = "table table-bordered table-stripped table-condensed" align = "center">
		<tr>
		    <thead class="thead-dark">
                <th scope="col">No</th>
                <th scope="col">Title</th>
                <th scope="col">Description</th>
                <th scope="col">Action</th>
            </thead>
		</tr>
		            <a href="add.jsp"><button type="button"  class="btn btn-primary" onclick="return confirm('Are you sure you want to add a new todo?')" >Add To Do Task</button></a><br><br>
            <%
            try
            {
                DbConnection dbConnection2 = new DbConnection("jdbc:mysql://localhost:3306/thetododb","root","");
                String query = "Select * from todos";
                Statement statement = dbConnection2.connect().createStatement();
                ResultSet result = statement.executeQuery(query);
                int count = 0;
                while(result.next())
                {
                count += 1;
                %>


                <tr>
                <td><%=count%></td>
                <td><%=result.getString("title")%></td>
                <td><%=result.getString("description")%></td>
                <td>
                    <a href="update.jsp?id=<%=result.getString("id") %>"><button type="button"  class="btn btn-primary" onclick="return confirm('Are you sure you want to edit this record?')">Edit</button></a>
                    <a href="delete.jsp?id=<%=result.getString("id") %>"><button type="button" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete?')">Delete</button></a>
                </td>

                </tr>
                <%

                }
            }
            catch(Exception ex)
            {
                out.println("Exception:" +ex.getMessage());
                ex.printStackTrace();
            }

            %>


	</table>

</body>
</html>





























