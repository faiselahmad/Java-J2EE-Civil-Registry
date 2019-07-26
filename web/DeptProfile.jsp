  <%@page import="java.util.*"%>
<%@page errorPage="Error.jsp" %>
<%
String sname=(String)session.getAttribute("sname");
if(sname!=null){
String departmenttype=(String)session.getAttribute("departmenttype");
 int sid=(Integer)session.getAttribute("sid");
    HashMap dp =(HashMap)session.getAttribute("dp");
      java.util.Date d=new java.util.Date();
%>
   
   
   
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
<title>Profile</title>

<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">

</head>

<body>   
    <%@ include file="HeaderD.html" %>
    
	  
<br><br>


<div class="container-fluid"> 
      <%
           String doneprof=(String)session.getAttribute("doneprof");
            if(doneprof!=null){
               %>   
               <div class="panel panel-primary">
                   <div class="panel-heading">
    <h4 class="panel-title text-center"> <%=doneprof%></h4>
                </div>
                </div>
               
                <%
                session.setAttribute("doneprof",null);
                }
            %>
    
	<div class="row">
          <div class="col-md-4 col-md-offset-4">
            
	<ul class="nav nav-pills ">
  <li role="presentation"  class="active"  ><a data-toggle="tab" href="#PRE">View Pofile </a></li>
  <li role="presentation"  ><a data-toggle="tab" href="#CP">Change Password</a></li>
  <li role="presentation"  ><a href="DepartmentHomePage.jsp"><span class="glyphicon glyphicon-home" aria-hidden="true"></span></a></li>
  
</ul> 
          
        </div><br><br><hr>
        
         <div class="row"> 
         <div class="tab-content">
       
        <div id="PRE" class="tab-pane active" >
         
           <div class="col-md-2 col-md-offset-2">
               <div class="form-group">
                        <label>EMP ID</label>
                </div>
               <div class="form-group">
                        <label>Name</label>
                </div>
               
               <div class="form-group">
                        <label>Email</label>
                </div>
               
               <div class="form-group">
                        <label>Phone</label>
                </div>
                  <div class="form-group">
                        <label>Dob</label>
                </div>
               <div class="form-group">
                        <label>Gender</label>
                </div>
               <div class="form-group">
                        <label>Dept</label>
                </div>
               <div class="form-group">
                        <label>address</label>
                </div>
               <div class="form-group">
                        <label>City</label>
                </div>
               <div class="form-group">
                        <label>State</label>
                </div>
               <div class="form-group">
                        <label>Pincode</label>
                </div>
               
               </div> 
           
            <div class="col-md-2">
                <div class="form-group">
                   <label><%=(String)dp.get("sid")%> </label>
                </div>
               <div class="form-group">
                   <label><%=(String)dp.get("sname")%> </label>
                </div>
               <div class="form-group">
                        <label><%=(String)dp.get("semail")%></label>
                </div>
                <div class="form-group">
                        <label><%=(String)dp.get("sphone")%></label>
                </div>
               <div class="form-group">
                        <label><%=(String)dp.get("sdob")%></label>
                </div>
                <div class="form-group">
                        <label><%=(String)dp.get("sgender")%></label>
                </div>
                <div class="form-group">
                        <label><%=(String)dp.get("sdept")%></label>
                </div>
                <div class="form-group">
                        <label><%=(String)dp.get("saddress")%></label>
                </div>
                <div class="form-group">
                        <label><%=(String)dp.get("scity")%></label>
                </div>
                <div class="form-group">
                        <label><%=(String)dp.get("sstate")%></label>
                </div>
                <div class="form-group">
                        <label><%=(String)dp.get("spincode")%></label>
                </div>
              

               </div>
            
            <div class="col-md-2 col-md-offset-1">
                <div class="form-group">
        <label>
    <img src='GetPic?sid=<%=sid%>' alt="profile pic" height="200"  width="200" class="img-responsive img-rounded-">
        </label>
               </div>
        
              <div class="form-group">
                <form action="UpdatePic"  method="post" enctype="multipart/form-data">
             <input type="file" name="pic" required=""/><br>
        <button  type="submit" class="btn btn-primary">Change Profile</button>
         </form>
               </div>
                </div>
     
     </div>      
             
       
        
         
        <div id="CP" class="tab-pane" >
            
             <div class="col-md-3 col-md-offset-4">
                
                 <form action="EditProfileProcess.jsp"  role="form" method="post">
       
          
                      <div class="form-group">
     <label>New Password</label>
       <input type="password" name="np" class="form-control" placeholder="New Password" required="">
</div>
                      <div class="form-group">
     <label>Confirm Password</label>
       <input type="password" name="cp" class="form-control" placeholder="Confirm Password" required="">
</div>
               <input type="hidden" name="type" value="spassword" >
               
               <button type="submit" class=" btn btn-primary">Save Changes</button>
		
         </form>
            </div>
        </div> 
        
     
       
            
            
  </div>         
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