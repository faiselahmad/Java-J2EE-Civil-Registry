<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
<title>Department</title>

<link href="css/bootstrap.css" rel="stylesheet">

</head>

<body style=" background-color:  #5c8a8a">  
 
    <div class="container-fluid">
       <div class="panel panel-default">
        <div class="panel-body">
            <%
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
               
                <div class="col-md-6">
                   
                    <form  action="DepartmentLoginProcess.jsp" method="post" class="form-horizontal">

<div class="form-group">
                
                <%               
String departmenttype=(String)session.getAttribute("departmenttype"); 
                %>
                <label>Your Department &nbsp;&nbsp;<%=departmenttype%></label>
        </div>

<div class="form-group">
                <label>User Name</label>
                <input type ="text" name="did" class="form-control" placeholder="User Name" required>
        </div>

        <div class="form-group">
                <label>Password</label>
                <input type ="Password" name="dpass" class="form-control" placeholder="Password"  required>
        </div>
        
        
        <div class="form-group ">
<a  href="Department1.jsp" class="btn btn-primary " role="button">Switch Account</a>  
      <button type="submit" class="btn btn-success">Sign in</button>
    
     </div>
        
</form> 
                    
           </div>
           </div>
         <%
           String dmsg=(String)session.getAttribute("dmsg"); 
            if(dmsg!=null){
               %>   
               <div class="panel panel-primary">
                   <div class="panel-heading">
    <h4 class="panel-title text-center"> <%=dmsg%></h4>
                </div>
                </div>
               
                <%
                session.setAttribute("dmsg",null);
                }
            %>
           
        
      </header>
      </div>
     
    </div>
  </div><!-- /.container-fluid -->

 <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>

</html> 






