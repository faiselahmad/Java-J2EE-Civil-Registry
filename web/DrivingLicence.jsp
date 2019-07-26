 <%@page import="java.sql.*"%>
<%@page errorPage="Error.jsp" %>
<%
String cname=(String)session.getAttribute("cname");
if(cname!=null){
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
<title>DrivingLicence</title>

<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">

</head>

<body>
	<%@ include file="CHeader.html" %>
        
<div class="container-fluid">       
            
<div class="row" align="center">
        <div class="col-lg-12">
            <h3 class="page-header">Driving Licence Portal</h3>
        </div>
      </div>
          
</div><!--/.row-->
<div class="row">
    <div class="col-md-12">
     <ul class="nav nav-tabs">
  <li role="presentation" ><a href="AadharCard.jsp">AADHAR CARD</a></li>
  <li role="presentation" ><a href="VoterCard.jsp">VOTER CARD</a></li>
  <li role="presentation"><a href="Passport.jsp">PASSPORT</a></li>
  <li role="presentation" class="active" ><a href="DrivingLicence.jsp">DRIVING LICENCE</a></li>
  <li role="presentation"><a href="Pancard.jsp">PANCARD</a></li>
</ul>   
    </div>
</div>
<br>
 <!--couresel -->
    
     <div class ="row">
       <div class=" col-md-5 col-md-offset-4">
<div id="myCarousel" class="carousel slide">
        <ol class="carousel-indicators">
          <li data-target="#myCarousel" data-slide-to="0"></li>
          <li data-target="#myCarousel" data-slide-to="1"></li>
          <li data-target="#myCarousel" data-slide-to="2"></li>
          <li data-target="#myCarousel" data-slide-to="3"></li>
          
        </ol>
        <div class="carousel-inner">
          <div class="item active">
            <img src="dlimg/dl1.jpg" class="img-responsive">
          </div>

          <div class="item">
              <img src="dlimg/dl2.jpg" class="img-responsive">
          </div>
        <div class="item">
              <img src="dlimg/dl3.jpg" class="img-responsive">
          </div>
            <div class="item">
              <img src="dlimg/dl4.jpg" class="img-responsive">
          </div>

        </div>
      <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="icon-prev"></span></a>
      <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="icon-next"></span></a>
</div>
    </div>
  </div>
    
    <!--End couresel -->
<br>
      
<hr>	

	
 <div class="row">
     <div class="col-md-12">
         <img src="img/service.jpg" class="img-responsive" alt="service">
         
         <div class="carousel-caption">
       <div class="panel panel-primary">
         <div class="panel-heading"><h3 class="panel-title text-center ">DRIVING LICENCE ONLINE SERVICES :-</h3></div>
                 </div>
            <div class=" text-center">
                <%
    PreparedStatement checkDLUserCid=(PreparedStatement)application.getAttribute("checkDLUserCid");
checkDLUserCid.setInt(1,cid);

ResultSet rs=checkDLUserCid.executeQuery();

                if(rs.next()){
                  if(rs.getString(4).equalsIgnoreCase("Generated")){
        session.setAttribute("documentname", "DL");
               %>
 <button class="btn btn-info disabled ">Applied</button>
              <a  href="ApplyDL.jsp" class="btn btn-success ">Check Status</a>
             <a  href="Profile.jsp" class="btn btn-warning ">Update Driving Licence</a>
 
 <%
     }else{
 %>
        <button class="btn btn-info disabled ">Applied</button>
              <a  href="ApplyDL.jsp" class="btn btn-success ">Check Status</a>
        
   <%
         }
     }else{
%>
             <a  href="ApplyDL.jsp" class="btn btn-info ">Apply For Driving Licence</a>
             <%
}%>
            
             </div>
       </div>
     </div>
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

<!--
<div class="row">
      <div class="col-md-6">
           <img src="img/service.jpg" class="img-responsive" alt="service">
        </div>
     
        <div class="col-md-6">
          
           <div class="panel panel-default">
         <div class="panel-heading"><h3 class="panel-title text-center ">DRIVING LICENCE ONLINE SERVICES :-</h3></div>
               </div>
            <div class="row">
                <div class="col-md-12 text-center">
             <a  href="ApplyDL.html" class="btn btn-primary ">Apply For Driving Licence</a>
             <button class="btn btn-primary disabled ">Applied</button>
             <a  href="ApplyDL.html" class="btn btn-success ">Check Status</a>
             <a  href="#" class="btn btn-warning ">Update Driving Licence</a>
               
             </div>
           </div>
            </div>
        </div>
-->