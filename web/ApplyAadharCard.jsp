<%@page import="java.sql.*"%>
<%@page errorPage="Error.jsp" %>
<%
String cname=(String)session.getAttribute("cname");
if(cname!=null)
{
    int cid=(Integer)session.getAttribute("cid");       
%>

<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
<title>Apply AadharCard</title>

<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">

</head>

<body>   
    <%@ include file="CHeader2.html" %>
 
      <div class="container-fluid">       
            
<div class="row">
        <div class="col-lg-12">
            <h3 class="page-header text-center">Aadhar Card Portal</h3></div>
          </div>
      
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
 <!-----------------------------------waiting---------------------------------> 
           <%
        
PreparedStatement checkAadharUserCid=(PreparedStatement)application.getAttribute("checkAadharUserCid");
checkAadharUserCid.setInt(1,cid);

ResultSet rs=checkAadharUserCid.executeQuery();

if(rs.next()){
    String aadharstatus =rs.getString(4);
    
       if(aadharstatus.equalsIgnoreCase("Waiting") || aadharstatus.equalsIgnoreCase("Update")){
       %>
         <div class="jumbotron text-capitalize text-center">
             <h2 class="panel-heading panel-primary">Aadhar Card Status</h2>
             <h2><span class="label label-primary text-capitalize">Your aadharcard is Waiting process yet...</span></h2>
                </div>
        
             <%
       
       }
else if(aadharstatus.equalsIgnoreCase("Accepted")){
 %>
                  <!----------accepted-------------->  
                  <div class="jumbotron text-capitalize text-center">
             <h2 class="panel-heading panel-primary">Aadhar Card Status</h2>
  <h2><span class="label label-primary text-capitalize">Well done! your request is accepted by our department  </span></h2>
                </div>
                
                     <%
}
else if(aadharstatus.equalsIgnoreCase("Generated")){
%>
                      
                          <!----------generated-------------->  
                             <div class="jumbotron text-capitalize text-center">
             <h2 class="panel-heading panel-primary">Aadhar Card Status</h2>
  <h2><span class="label label-primary text-capitalize">congratulation! your aadharcard hasbeen generated, to download  </span></h2>
  <a href="DownloadId?cid=<%=cid%>&documentname=AADHAR CARD" class=" btn btn-success">click here </a>
                </div>
                              
                              
                                
            <%
}

else{
%>
  <!-----------------------------rejected id apply again---------------------------------------------------------->
          
                <div class="alert alert-info text-capitalize text-center  " role="alert">
    <p>
<span class="glyphicon glyphicon-alert"></span>
<b>&nbsp;&nbsp;NOTE :</b> 
All the document should be verified first otherwise you won't be able to generate any ID 
    </p>
</div>
         
          <h2><span class="label label-warning">Your Aadhar-card has been rejected</span></h2>
            <div class="row" >
         <div class="col-lg-12">
        <div class="panel panel-default">
                <div class="panel-heading" align="center"><b><u>Apply for Aadhar Card</u></b></div>
                <div class="panel-body">
                    <form action="SendRequestProcess" role="form" method="post" enctype="multipart/form-data" >
                        <div class="col-md-6">
                               
	 <div class="form-group">
                        <label>Upload Your Documents</label>
                         <p class="help-block">*ID proof(Ration-card /ID proof letter/Any government id) </p>
                        <input type="file" name="idproof" required>
                </div>
                <div class="form-group">
                         <p class="help-block">(if any)10<sup>th</sup> marksheet </p>
                        <input type="file" name="marksheet">

                </div>
                <div class="form-group">
                         <p class="help-block">* Birth Certificate </p>
                        <input type="file" name="birthcertificate" required>
                </div>
                <br>
                <input type="hidden" name="documentname" value="aadharcard" ><!-- chk whether
                                                  user send rqst which document (aadhar card,voter card etc)-->
                <input type="hidden" name="status" value="rejected" >
                 <button type="submit" class="btn btn-primary">Send Request</button>
              
                        </div>
                 <div class="col-md-3">
                      <div class="form-group">
                  <div class="form-group">
            
              <input type ="text" name="idproofno" class="form-control" placeholder="Id proof unique number" required>
               </div>  
                        <div class="form-group">
           
        <input type ="text" name="marksheetno" class="form-control" placeholder="10th marksheet unique number" >
               </div>
                          <div class="form-group">
            
         <input type ="text" name="birthcertificateno" class="form-control" placeholder="Birth-Certificate unique number" required>
               </div>
          </div>
	  </div>
                   </form>
					</div>
				</div>
			</div><!-- /.col-->
		</div><!-- /.row -->         
            
                
                       
                <%

}
    
}

else{

   %>
        
   <!------------------------------------fresh apply------------------------------------------> 
     <div class="alert alert-info text-capitalize text-center  " role="alert">
    <p>
<span class="glyphicon glyphicon-alert"></span>
<b>&nbsp;&nbsp;NOTE :</b> 
All the document should be verified first otherwise you won't be able to generate any ID 
    </p>
</div>
            <div class="row" >
         <div class="col-lg-12">
        <div class="panel panel-default">
                <div class="panel-heading" align="center"><b><u>Apply for Aadhar Card</u></b></div>
                <div class="panel-body">
                    
         <form action="SendRequestProcess" role="form" method="post" enctype="multipart/form-data">
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
             <input type="hidden" name="documentname" value="aadharcard" ><!-- chk whether
                                                                       user send rqst which document (aadhar card,voter card etc)-->
                
            <input type="hidden" name="status" value="fresh" >
                 <button type="submit" class="btn btn-primary">Send Request</button>
               
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
			</div><!-- /.col-->
		</div><!-- /.row -->
   
          <%
   }
          %>
   
   
   
   
   
   
</div>

	 <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
	
</body>
</html>

<% 
    }
else{
session.setAttribute("msg", "please Login First");
        response.sendRedirect("index.jsp");
}
   %>