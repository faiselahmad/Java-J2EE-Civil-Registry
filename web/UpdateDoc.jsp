  <%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page errorPage="Error.jsp" %>
<%
String cname=(String)session.getAttribute("cname");
if(cname!=null){   
    int cid=(Integer)session.getAttribute("cid"); 
   String documentname=(String)session.getAttribute("documentname"); 
%>
   
   
   
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
<title>Update Aadhar Card</title>

<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">

</head>

<body>   
    
	   <!--Fixed Top Navbar-->
    <nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
        <a class="navbar-brand" href="index.jsp"><img alt="Brand" src="img/logo.png" height="70"></a>
     <a class="navbar-brand" href="index.jsp">Civil Registration</a>
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
    <p class=" navbar-text navbar-right"> <%=cname%> </p> 
    <p class=" navbar-text navbar-right"><%=d%></p>
       
       <div class="collapse navbar-collapse" id="mainnavbar">
     <ul class="nav navbar-nav navbar-right">
          <li><a href="AadharCard.jsp">AadharCard</a></li>
        <li><a href="VoterCard.jsp">VoterCard</a></li>
        <li><a href="Pancard.jsp">Pancard</a></li>
        <li><a href="Passport.jsp">Passport</a></li>
        <li><a href="DrivingLicence.jsp">Driving Licence</a></li>   
<li class="dropdown">
  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> 
 <img  src='GetPic?cid=<%=cid%>' alt="citizen-image" class="img-rounded" height="40" width="50"><span class="caret "></span>
 </a>
 <ul class="dropdown-menu">
           <li><a href="CStore.jsp">View Profile</a></li>            
           <li><a href="ChangePassword.jsp">Change Password</a></li>
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
     
         
        <div class="col-md-9 col-md-offset-1">
             <div class="alert alert-info text-capitalize text-center  " role="alert">
    <p>
<span class="glyphicon glyphicon-alert"></span>
<b>&nbsp;&nbsp;NOTE :</b> 
All the document should be verified first otherwise you won't be able to generate any ID 
    </p>
</div>
       
                    
                    
                    
       <%
      if(documentname.equalsIgnoreCase("AADHARCARD")){
  %>
  
               <div class="panel panel-default">
                <div class="panel-heading" align="center"><b><u>Upload Document For Aadhar Card</u></b></div>
                <div class="panel-body">      
         <form action="UpdateDocumentProcess" role="form" method="post" enctype="multipart/form-data">
                        <div class="col-md-6">
                                <div class="form-group">
                           
	 
                        <label>Upload Your Documents</label>
                         <p class="help-block">*ID proof(voter-ID Card /ration-card /ID proof letter) </p>
                         <input type="file" name="idproof" required>
                </div>
                <div class="form-group">
                         <p class="help-block">(if any)10<sup>th</sup> marksheet </p>
                        <input type="file" name="marksheet" >

                </div>
                <div class="form-group">
                         <p class="help-block">*Birth Certificate </p>
                        <input type="file" name="birthcertificate" required >
                </div>
                            
                                <br>
             <input type="hidden" name="documentname" value="aadharcard" ><!-- chk user send rqst which document (aadhar card,voter card etc)-->
                
                 <button type="submit" class="btn btn-primary">Upload</button>
               
                              </div>
					
                 <div class="col-md-3">
                                <div class="form-group">
   
                        <div class="form-group">
            <label> </label>
           <input type ="text" name="idproofno" class="form-control" placeholder="Id proof unique number" required>
               </div>  
                        <div class="form-group">
            <label></label>
        <input type ="text" name="marksheetno" class="form-control" placeholder="10th marksheet unique number" >
               </div>
                          <div class="form-group">
            <label></label>
         <input type ="text" name="birthcertificateno" class="form-control" placeholder="Birth-Certificate unique number" required>
               </div>
 </div>
	
</div> 
 </form>                 
</div>
</div>
  
  <% }
      else if(documentname.equalsIgnoreCase("VOTERCARD")){%>
      
   <div class="panel panel-default">
                <div class="panel-heading" align="center"><b><u>Upload Document for VoterCard</u></b></div>
                <div class="panel-body">
                    <form action="UpdateDocumentProcess" role="form" method="post" enctype="multipart/form-data">
                        <div class="col-md-6">
                                <div class="form-group">
                           
	 
                        <label>Upload Your Documents</label>
                         <p class="help-block">*ID proof(Aadhar Card) </p>
                         <input type="file" name="idproof" required>
                </div>
                <div class="form-group">
                         <p class="help-block">(if any)10<sup>th</sup> marksheet </p>
                        <input type="file" name="marksheet" >

                </div>
                <div class="form-group">
                         <p class="help-block">*Birth Certificate </p>
                        <input type="file" name="birthcertificate" required >
                </div>
                <br>
                   <input type="hidden" name="documentname" value="votercard" ><!-- chk whether user send rqst which document (aadhar card,voter card etc)-->
                
                 <button type="submit" class="btn btn-primary">Upload</button>
               
                              </div>
					
                 <div class="col-md-3">
                                <div class="form-group">

                        <div class="form-group">
            <label> </label>
            
              <input type ="text" name="idproofno" class="form-control" placeholder="Aadhar Card Number" required>
           
               </div>  
                        <div class="form-group">
            <label></label>
        <input type ="text" name="marksheetno" class="form-control" placeholder="10th marksheet unique number" >
               </div>
                          <div class="form-group">
            <label></label>
         <input type ="text" name="birthcertificateno" class="form-control" placeholder="Birth-Certificate unique number" required>
               </div>
 </div>
	
</div> 
 </form>
</div>
</div>
      
  <% }
  
       else if(documentname.equalsIgnoreCase("PANCARD")){%>
       
       <div class="panel panel-default">
                <div class="panel-heading" align="center"><b><u>Upload Document for Pancard</u></b></div>
                <div class="panel-body">
                    <form action="UpdateDocumentProcess" role="form" method="post" enctype="multipart/form-data" >
                        <div class="col-md-6">
                               
	 <div class="form-group">
                        <label>Upload Your Documents</label>
                         <p class="help-block">*ID proof(Aadhar Card) </p>
                        <input type="file" name="idproof" required>
                </div>
                <div class="form-group">
                         <p class="help-block">(if any)10<sup>th</sup> marksheet </p>
                        <input type="file" name="marksheet">

                </div>
                <div class="form-group">
                         <p class="help-block">*Birth Certificate </p>
                        <input type="file" name="birthcertificate" required>
                </div>
                <br>
                  <input type="hidden" name="documentname" value="pancard" ><!-- chk whether user send rqst which document (aadhar card,voter card etc)-->
               
                <button type="submit" class="btn btn-primary">Upload</button>
               </div>
                  <div class="col-md-3">
                                <div class="form-group">

                        <div class="form-group">
            <label> </label>
             <input type ="text" name="idproofno" class="form-control" placeholder="Aadhar Card Number" required>
               </div>  
                        <div class="form-group">
            <label></label>
        <input type ="text" name="marksheetno" class="form-control" placeholder="10th marksheet unique number" >
               </div>
                          <div class="form-group">
            <label></label>
         <input type ="text" name="birthcertificateno" class="form-control" placeholder="Birth-Certificate unique number" required>
               </div>
          </div>
	  </div>
</form>
</div>
</div>
       
      <% }
      
       else if(documentname.equalsIgnoreCase("PASSPORT")){%>
        <div class="panel panel-default">
                <div class="panel-heading" align="center"><b><u>Upload Document for Passport</u></b></div>
                <div class="panel-body">
                   
                   <form action="UpdateDocumentProcess" role="form" method="post" enctype="multipart/form-data" >
                        <div class="col-md-6">
                               
	 <div class="form-group">
                        <label>Upload Your Documents</label>
                         <p class="help-block">*ID proof(Aadhar Card) </p>
                        <input type="file" name="idproof" required>
                </div>
                <div class="form-group">
                         <p class="help-block">(if any)10<sup>th</sup> marksheet </p>
                        <input type="file" name="marksheet">

                </div>
                <div class="form-group">
                         <p class="help-block">*Birth Certificate </p>
                        <input type="file" name="birthcertificate" required>
                </div>
                <br>
                  <input type="hidden" name="documentname" value="passport" ><!-- chk whether  user send rqst which document (aadhar card,voter card etc)-->
            
                <button type="submit" class="btn btn-primary">Upload</button>
               </div>
                  <div class="col-md-3">
                                <div class="form-group">

                        <div class="form-group">
            <label> </label>
             <input type ="text" name="idproofno" class="form-control" placeholder="Aadhar Card Number" required>
               </div>  
                        <div class="form-group">
            <label></label>
        <input type ="text" name="marksheetno" class="form-control" placeholder="10th marksheet unique number" >
               </div>
                          <div class="form-group">
            <label></label>
         <input type ="text" name="birthcertificateno" class="form-control" placeholder="Birth-Certificate unique number" required>
               </div>
          </div>
	  </div>
                   </form>
		</div>
	</div>
       
  <% }
    else {%>
      
<div class="panel panel-default">
<div class="panel-heading" align="center"><b><u>Upload Document for DrivingLicence</u></b></div>
<div class="panel-body">
<form action="UpdateDocumentProcess" role="form" method="post" enctype="multipart/form-data" >
                <div class="col-md-6">

                        <div class="form-group">
                        <label>Upload Your Documents</label>
                         <p class="help-block">*ID proof(Aadhar Card) </p>
                        <input type="file" name="idproof" required>
                       </div>
                    
                       <div class="form-group">
                        <p class="help-block">(if any)10<sup>th</sup> marksheet </p>
                       <input type="file" name="marksheet">
                       </div>
                    
                       <div class="form-group">
                        <p class="help-block">*Birth Certificate </p>
                       <input type="file" name="birthcertificate" required>
                       </div>
                    
                       <br>
                        <input type="hidden" name="documentname" value="drivinglicence" ><!-- chk whetheruser send rqst which document (aadhar card,voter card etc)-->

                       <button type="submit" class="btn btn-primary">Upload</button>
                </div>
        
                <div class="col-md-3">

                        <div class="form-group">
                        <label> </label>
                        <input type ="text" name="idproofno" class="form-control" placeholder="Aadhar Card Number" required>
                        </div>  
                        
                        <div class="form-group">
                        <label></label>
                        <input type ="text" name="marksheetno" class="form-control" placeholder="10th marksheet unique number" >
                        </div>
                    
                        <div class="form-group">
                        <label></label>
                       <input type ="text" name="birthcertificateno" class="form-control" placeholder="Birth-Certificate unique number" required>
                        </div>
      
	        </div>
</form>
</div>
</div>

      <% }
       %>               
                    
                    
                    
                    
                    
                    
                    
  
</div><!-- /.col-->    
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