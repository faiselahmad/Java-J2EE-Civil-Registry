 <%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page errorPage="Error.jsp" %>
<%
String cname=(String)session.getAttribute("cname");
if(cname!=null){
    int cid =(Integer)session.getAttribute("cid"); 
   String documentname=(String)session.getAttribute("documentname"); 
    HashMap ud =(HashMap)session.getAttribute("ud");   
    
%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
<title>Personal Information</title>

<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/bootstrap-table.css" rel="stylesheet">

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
          <div class="col-md-2">
            
	<ul class="nav nav-pills nav-stacked">
  <li role="presentation"  ><a href="Profile.jsp">View Profile</a></li>
  <li role="presentation"  ><a href="EditProfile.jsp">Edit Profile</a></li>
  <li role="presentation" class="active" ><a href="PI.jsp">Personal Information</a></li>
  <li role="presentation"  ><a href="ChangeAddress.jsp">Change Address</a></li>
   <%
      if(documentname!=null){ 
  %> 
  <li role="presentation"  ><a href="UpdateDoc.jsp">Upload Documents</a></li>
  <% }
  %>
  
  
</ul> 
          </div>
           <br><br>
                    
             <div class="col-md-2 col-md-offset-1">
             
                <div class="form-group">
                        <label>Date of birth</label>
                </div>
               <div class="form-group">
                        <label>Email</label>
                </div>
                  <div class="form-group">
                        <label>phone</label>
                </div>
                  <div class="form-group">
                  <label>Marital Status</label>
                </div>
               
               </div> 
           
            <div class="col-md-3">
                <form action="EditProfileProcess.jsp"  method="post" >
                    
               
               <div class="form-group">
                   <input type="date" name="dob" value="<%=ud.get("dob")%>" >                        
                   </div>
                   
                <div class="form-group">
                    <input type="email" name="email" value=" <%=ud.get("email")%>" >
                       
                </div>
               <div class="form-group">
                   <input type="text" name="phone" value=" <%=ud.get("phone")%>"   maxlength="10">    
                </div>
                    
<%
         if(ud.get("maritalstatus").equals("Married"))
         {
             %>
                <div class="form-group radio">
                <label>
                <input type="radio" name="mstatus" value="Married" checked >Married
                </label>
                <label>
                <input type="radio" name="mstatus" value="Unmarried">Unmarried	
                </label>
                </div>   
                       
        <% 
            }
         else{
         %>
                     <div class="form-group radio">
                     <label>
                     <input type="radio" name="mstatus" value="Unmarried" checked >Unmarried
                     </label>
                     <label>
                     <input type="radio" name="mstatus" value="Married">Married
                     </label>
                     </div>      
        <%
        }
        %>
                
             <input type="hidden" name="type" value="pi" >
                    
                    <div class="form-group">
        <button  type="submit" class="btn btn-primary">Save Changes</button>
                </div>
              </form>
               </div>
        
        <div class="col-md-1 col-md-offset-3">
            
            <%@ include file="Menu.html"%>
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


           

