<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page errorPage="Error.jsp" %>
<%
String cname=(String)session.getAttribute("cname");
if(cname!=null){
    int cid =(Integer)session.getAttribute("cid"); 
    
%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
<title>Change Password</title>

<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">

</head>

<body>   
    <%@ include file="CHeader.html" %>

<br><br>
<div class="container-fluid">   
    <%
           String msg=(String)session.getAttribute("msg"); 
            if(msg!=null){
               %>   
               <div class="panel panel-primary">
                   <div class="panel-heading">
    <h4 class="panel-title text-center"> <%=msg%></h4>
                </div>
                </div>
               
                <%
                session.setAttribute("msg",null);
                }
                %>
                
	<div class="row">
          
           <br><br>
           
           <div class="col-md-3 col-md-offset-1">
                
                <form action="EditProfileProcess.jsp"  role="form">
       
          
                      <div class="form-group">
     <label>New Password</label>
       <input type="password" name="np" class="form-control" placeholder="New Password" required="">
</div>
                      <div class="form-group">
     <label>Confirm Password</label>
       <input type="password" name="cp" class="form-control" placeholder="Confirm Password" required="">
</div>
               <input type="hidden" name="type" value="password" >
               
               <button type="submit" class=" btn btn-primary">Save Changes</button>
		
         </form>
            </div>
          </div>
</div>


<script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/bootstrap-table.js"></script>
</body>
</html>
<% 
    }
else{
session.setAttribute("msg", "please Login First");
        response.sendRedirect("index.jsp");
}
   %>