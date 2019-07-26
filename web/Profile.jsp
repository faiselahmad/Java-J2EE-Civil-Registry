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
<title>View Profile</title>

<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">

</head>

<body>   
    
	<%@ include file="CHeader.html" %>


<br><br>
<div class="container-fluid">      
	<div class="row">
          <div class="col-md-2">
            
	<ul class="nav nav-pills nav-stacked">
  <li role="presentation" class="active" ><a href="Profile.jsp">View Profile</a></li>
  <li role="presentation" ><a href="EditProfile.jsp">Edit Profile</a></li>
  <li role="presentation" ><a href="PI.jsp">Personal Information</a></li>
  <li role="presentation"  ><a href="ChangeAddress.jsp">Change Address</a></li>

  <%
      if(documentname!=null){ 
  %> 
  <li role="presentation"  ><a href="UpdateDoc.jsp">Upload Documents</a></li>
  <% }
  %>
  
</ul> 
          </div>
           
           <div class="col-md-2 col-md-offset-1">
               
               <div class="form-group">
                        <label>Candidate id</label>
                </div>
               <div class="form-group">
                        <label>Name</label>
                </div>
               <div class="form-group">
                        <label>Father's Name</label>
                </div>
                <div class="form-group">
                        <label>Mother's Name</label>
                </div>
               <div class="form-group">
                        <label>gender</label>
                </div>
               <div class="form-group">
                        <label>Marital Status</label>
                </div>
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
                        <label>Address</label>
                </div>
               </div> 
          
            <div class="col-md-2">
                 <div class="form-group">
                   <label><%=ud.get("cid")%> </label>  
                </div>
               <div class="form-group">
                   <label><%=ud.get("name")%> </label>
                </div>
               <div class="form-group">
                        <label><%=ud.get("fname")%></label>
                </div>
                <div class="form-group">
                        <label><%=ud.get("mname")%></label>
                </div>
               <div class="form-group">
                        <label><%=ud.get("gender")%></label>
                </div>
               <div class="form-group">
                        <label><%=ud.get("maritalstatus")%></label>
                </div>
                <div class="form-group">
                        <label><%=ud.get("dob")%></label>
                </div>
               <div class="form-group">
                        <label><%=ud.get("email")%></label>
                </div>
                  <div class="form-group">
                        <label><%=ud.get("phone")%></label>
                </div>
                <div class="form-group">
                 <label><%=ud.get("address")%></label>
                 <label><%=ud.get("city")%></label>
                 <label><%=ud.get("state")%></label>
                 <label><%=ud.get("pincode")%></label>
              </div>

               </div>
                
            <div class="col-md-2 col-md-offset-1">
               <div class="form-group">
        <label><img src='GetPic?cid=<%=ud.get("cid")%>' alt="profile pic" height="200"  width="200" class="img-responsive img-rounded"></label>
              </div>
             
            </div>
              
              <div class="col-md-1 col-md-offset-1">
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