  <%@page import="java.util.*"%>
<%@page errorPage="Error.jsp" %>
<%
    try{
String aname=(String)session.getAttribute("aname");
if(aname!=null){
    String aid=(String)session.getAttribute("aid");
    HashMap ap =(HashMap)session.getAttribute("ap");
 
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
    
	   <!--Fixed Top Navbar-->
    <nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
        <a class="navbar-brand" href="OfficialHomePage.jsp"><img alt="Brand" src="img/logo.png" height="70"></a>
     <a class="navbar-brand" href="OfficialHomePage.jsp">Civil Registration</a>
             </div>
 <button type="button" class="navbar-toggle collapsed" data-target="#mainnavbar" data-toggle="collapse"  >
       <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
    <!-- Collect the nav links, forms, and other content for toggling -->
    <%
    java.util.Date d=new java.util.Date();
     %>
    <p class=" navbar-text navbar-right"> <%=aname%> </p> 
    <p class=" navbar-text navbar-right"><%=d%></p>
       
       <div class="collapse navbar-collapse" id="mainnavbar">
     <ul class="nav navbar-nav navbar-right">
          
<li class="dropdown">
  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> 
 <img  src='GetPic?aid=<%=aid%>' alt="citizen-image" class="img-rounded" height="40" width="50"><span class="caret "></span>
 </a>
 <ul class="dropdown-menu">
           <li><a href="AdminProfile.jsp">Profile</a></li>
            <li><a href="Logout.jsp">Logout</a></li>
          </ul>
        </li>
            
         </ul>
       </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav><!--end navbar-->
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
  <li role="presentation"  class="active"  ><a data-toggle="tab" href="AdminProfile.jsp">View Pofile </a></li>
  <li role="presentation" ><a data-toggle="tab" href="">Edit Profile</a></li>
  <li role="presentation"  ><a data-toggle="tab" href="ChangePassword.jsp">Change Password</a></li>
  
</ul> 
          
        </div><br><br><hr>
        
         <div class="row"> 
         <div class="tab-content">
       
        <div id="PRE" class="tab-pane active" >
         
           <div class="col-md-2 col-md-offset-2">
               <div class="form-group">
                        <label>AdminId</label>
                </div>
               <div class="form-group">
                        <label>Name</label>
                </div>
               
               <div class="form-group">
                        <label>gender</label>
                </div>
               
               <div class="form-group">
                        <label>Email</label>
                </div>
                  <div class="form-group">
                        <label>phone</label>
                </div>
               
               </div> 
           
            <div class="col-md-2">
                <div class="form-group">
                   <label><%=(String)ap.get("aid")%> </label>
                </div>
               <div class="form-group">
                   <label><%=(String)ap.get("aname")%> </label>
                </div>
               <div class="form-group">
                        <label><%=(String)ap.get("agen")%></label>
                </div>
                <div class="form-group">
                        <label><%=(String)ap.get("aemail")%></label>
                </div>
               <div class="form-group">
                        <label><%=(String)ap.get("aphone")%></label>
                </div>
              

               </div>
            
            <div class="col-md-2 col-md-offset-1">
               <div class="form-group">
        <label><img src='GetPic?aid=<%=(String)ap.get("aid")%>' alt="profile pic" height="200"  width="200" class="img-responsive img-rounded"></label>
              </div>
         </div>
     
     </div>      
             
       
         
     <div id="EP" class="tab-pane" >
        
           <div class="col-md-2 col-md-offset-2">
            <div class="form-group">
                        <label>Name</label>
                </div>
               
               <div class="form-group">
                        <label>gender</label>
                </div>
               
               <div class="form-group">
                        <label>Email</label>
                </div>
                  <div class="form-group">
                        <label>phone</label>
                </div>
               
               </div> 
            <div class="col-md-3">
                <form action="AdminProfileUdateProcess.jsp"  method="post" >
               <div class="form-group">
                   <input type="text" name="aname" value="<%=(String)ap.get("aname")%>" size="30">
                </div>
              
             
                  <%
                        if(ap.get("agen").equals("male")){
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
                        }else if(ap.get("agen").equals("female")){
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
                
                 <div class="form-group">
                   <input type="text" name="aemail" value="<%=(String)ap.get("aemail")%>" size="30">
                        
                </div>
                <div class="form-group">
                    <input type="text" name="aphone" value="<%=(String)ap.get("aphone")%>" maxlength="10"  size="30"> 
                        
                </div>
            <input type="hidden" name="type" value="editprofile" >
            
                <div class="form-group">
                   <button  type="submit" class="btn btn-primary">Save Changes</button>
                           </div>
                         </form>
                          </div>
            
            <div class="col-md-2 col-md-offset-1">
                <div class="form-group">
        <label>
    <img src='GetPic?aid=<%=(String)ap.get("aid")%>' alt="profile pic" height="200"  width="200" class="img-responsive img-rounded-">
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
                
                <form action="AdminProfileUdateProcess.jsp"  role="form">
       
          
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
}
catch(Exception ex)
{
    ex.printStackTrace();
}
   %>