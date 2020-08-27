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
            <%
            String id=request.getParameter("id");
            try
            {
                DbConnection dbConnection2 = new DbConnection("jdbc:mysql://localhost:3306/thetododb","root","");
                String query = "Select * from todos where id ="+id;
                Statement statement = dbConnection2.connect().createStatement();
                ResultSet result = statement.executeQuery(query);
                while(result.next())
                {

                %>
                <div class = "container">
                   <h1 align="center"> Edit A To Do<h1><br>
                   <form method="post" action="update-process.jsp">
                        <input type="text" hidden=true class="form-control" name="id" value="<%=result.getString("id") %>">

                        <div class="form-group">
                          <label for="InputTitle" class="grey-text font-weight-light">Title</label>
                          <input type="text" class="form-control" name="title" value="<%=result.getString("title") %>">
                        </div>

                        <div class="form-group">
                            <label for="InputTitle" class="grey-text font-weight-light">Description</label>
                            <input type="text" class="form-control" name="description" value="<%=result.getString("description") %>">
                        </div>

                         <button type="submit" class="btn btn-primary">Submit</button>
                         <a href="index.jsp"><button type="button"  class="btn btn-success"> Return Home</button></a>
                      </form>
                   </div>
                <%

                }
            }
            catch(Exception ex)
            {
                out.println("Exception:" +ex.getMessage());
                ex.printStackTrace();
            }

            %>

</body>
</html>