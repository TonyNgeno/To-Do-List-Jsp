<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
 <%@ include file="./page/navbar.jsp" %><br>
   <form method="post" action="uploadServlet">
     <div class="form-group">
       <label for="InputTitle">Title</label>
       <input type="text" class="form-control" name="title" placeholder="Enter title">
     </div>

     <div class="form-group">
       <label for="InputDescription">Description</label>
       <input type="text" class="form-control" name="description" placeholder="Enter Description">
     </div>
     <button type="submit" class="btn btn-primary">Submit</button>
   </form>
</body>
</html>