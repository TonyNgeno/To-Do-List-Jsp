<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
 <%@ include file="./page/navbar.jsp" %><br>
   <form method="post" action="uploadServlet">
   <div class = "container">
   <h1 align="center"> Add A To DO<h1><br>
     <div class="form-group">
       <label for="InputTitle" class="grey-text font-weight-light">Title</label>
       <input type="text" class="form-control" name="title" placeholder="Enter title">
     </div>

     <div class="form-group">
       <label for="InputDescription" class="grey-text font-weight-light">Description</label>
       <input type="text" class="form-control" name="description" placeholder="Enter Description">
     </div>
     <button type="submit" class="btn btn-primary">Submit</button>
     <a href="index.jsp"><button type="button"  class="btn btn-success"> Return Home</button></a>

   </form>
   </div>
</body>
</html>