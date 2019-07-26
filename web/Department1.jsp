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
               
                <div class="col-md-4">
                   
                    <form  action="Department1Pro.jsp" method="post" class="form-horizontal">

<div class="form-group">
                <label>Select Department</label>
                <select name="departmenttype" class="form-control" required>
        <option  value="">select your department</option>
       <option value="AADHAR CARD">AADHAR CARD</option>
        <option value="DRIVING LICENCE">DRIVING LICENCE</option>
        <option value="PANCARD">PANCARD</option>
        <option value="VOTER CARD">VOTER CARD</option>
       <option value="PASSPORT">PASSPORT</option>
</select>
        </div>


 <div class="form-group ">
<a  href="index.jsp" class="btn btn-primary " role="button">Back</a>  
<button type="submit" class="btn btn-success">Continue</button>
    
     </div>
 
</form> 
                    
           </div>
           </div>
      
           
        
      </header>
      </div>
     
    </div>
  </div><!-- /.container-fluid -->

 <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>

</html> 






