<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
<title>Official</title>

<link href="css/bootstrap.css" rel="stylesheet">

</head>

<body style=" background-color:  #5c8a8a">  
 
    <div class="container-fluid">
      
    
    <div class="panel panel-default">
        <div class="panel-body"><%
    java.util.Date d=new java.util.Date();
     %> 
    <p class=" navbar-text navbar-right"><%=d%></p>
        
       <header class="page-header">
           <div class="row">
               <div class="col-md-1">
                   <a href="index.jsp" class="navbar-brand"> <img alt="Brand" src="img/logo.png" height="70"></a>
           </div>
               <div class="col-md-3">
                   <a href="index.jsp"><h2>Civil Registration</h2></a>
           </div>
               
                <div class="col-md-8">
                   
                    <form  action="OfficialLoginProcess.jsp" class="form-horizontal">
  <div class="form-group">
    <label for="inputEmail" class="col-md-2 control-label">Id</label>
    <div class="col-md-5">
        <input type="text" name="aid" class="form-control" id="inputEmail3" placeholder="id" required>
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-md-2 control-label">Password</label>
    <div class="col-md-5">
        <input type="password"  name="apass"  class="form-control" id="inputPassword3" placeholder="Password" required>
    </div>
  </div>
 
  <div class="form-group">
    <div class="col-md-offset-2 col-md-10">
      <button type="submit" class="btn btn-success">Sign in</button>
      <a href="index.jsp" class="btn btn-warning">Back</a>
    </div>
     
  </div>
</form> 
                    
           </div>
               
    
            
           </div>
        
           
        
      </header>
     <%
           String amsg=(String)session.getAttribute("amsg"); 
            if(amsg!=null){
               %>   
               <div class="panel panel-primary">
                   <div class="panel-heading">
    <h4 class="panel-title text-center"> <%=amsg%></h4>
                </div>
                </div>
               
                <%
                session.setAttribute("amsg",null);
                }
            %>
      </div>
     
    </div>
  </div><!-- /.container-fluid -->

    
   
 

 <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>

</html>