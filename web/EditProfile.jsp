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
<title>Edit Profile</title>

<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">

</head>

<body>   
    
	 <%@ include file="CHeader.html" %>

<br><br>
<div class="container-fluid"> 
     <%
           String msg=(String)session.getAttribute("msg"); //session from sendrqstprocess(catch block)
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
  <li role="presentation" class="active" ><a href="EditProfile.jsp">Edit Profile</a></li>
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
           <br><br>
           <div class="col-md-2 col-md-offset-1">
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
               
               </div> 
          
           
           
            <div class="col-md-2">
                <form action="EditProfileProcess.jsp"  method="post" >
               <div class="form-group">
                   <input type="text" name="name" value="<%=ud.get("name")%>" size="30">
                </div>
               <div class="form-group">
                   <input type="text" name="fname" value="<%=ud.get("fname")%>" size="30">
                        
                </div>
                <div class="form-group">
                    <input type="text" name="mname" value="<%=ud.get("mname")%>" size="30">
                        
                </div>
             
                     <%
                        if(ud.get("gender").equals("male")){
                         %>
                         <div class="form-group radio">
                        <label>
                        <input type="radio" name="gender" value="male" checked> Male<br>

                        </label>
              
                        <label>
                        <input type="radio" name="gender" value="female"> Female<br>
                        </label>
               
                        <label>
                         <input type="radio" name="gender" value="other"> Other 
                        </label>
                    </div>   
                            
                        <%
                        }else if(ud.get("gender").equals("female")){
                        %>
                        <div class="form-group radio">
                        <label>
                        <input type="radio" name="gender" value="male" > Male<br>

                        </label>
              
                        <label>
                        <input type="radio" name="gender" value="female" checked> Female<br>
                        </label>
               
                        <label>
                         <input type="radio" name="gender" value="other"> Other 
                        </label>
                    </div>
                        
                        <%
                        }
                        else{
                        %>

                        <div class="form-group radio">
                        <label>
                        <input type="radio" name="gender" value="male" > Male<br>

                        </label>
              
                        <label>
                        <input type="radio" name="gender" value="female"> Female<br>
                        </label>
               
                        <label>
                         <input type="radio" name="gender" value="other" checked> Other 
                        </label>
                    </div>
                        <%
                        }
                        %>
            <input type="hidden" name="type" value="editprofile" >
            
                <div class="form-group">
                   <button  type="submit" class="btn btn-primary">Save Changes</button>
                           </div>
                         </form>
                          </div>
                    
               <div class="col-md-2 col-md-offset-1">
                <div class="form-group">
        <label>
    <img src='GetPic?cid=<%=ud.get("cid")%>' alt="profile pic" height="200"  width="200" class="img-responsive img-rounded-">
        </label>
               </div>
        
              <div class="form-group">
                <form action="UpdatePic"  method="post" enctype="multipart/form-data">
             <input type="file" name="pic" required=""/><br>
        <button  type="submit" class="btn btn-primary">Change Profile</button>
         </form>
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