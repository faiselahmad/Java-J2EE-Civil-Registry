
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
<title>Aadhar card</title>

<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">

</head>

<body>   
     
    <%@ include file="CHeader.html" %>
      <div class="container-fluid">       
            
<div class="row" align="center">
        <div class="col-lg-12">
            <h3 class="page-header">Aadhar Card Portal</h3></div>
          </div>
          
</div><!--/.row-->
<div class="row">
    <div class="col-md-12">
     <ul class="nav nav-tabs">
  <li role="presentation" class="active"><a href="AadharCard.jsp">AADHAR CARD</a></li>
  <li role="presentation"><a href="VoterCard.jsp">VOTER CARD</a></li>
  <li role="presentation"><a href="Passport.jsp">PASSPORT</a></li>
  <li role="presentation"><a href="DrivingLicence.jsp">DRIVING LICENCE</a></li>
  <li role="presentation"><a href="Pancard.jsp">PANCARD</a></li>
</ul>   
    </div>
</div>
<br>

             <!--couresel -->
    
    <div class ="row">
        <div class=" col-md-12 ">
<div id="myCarousel" class="carousel slide">
        <ol class="carousel-indicators">
          <li data-target="#myCarousel" data-slide-to="0"></li>
          <li data-target="#myCarousel" data-slide-to="1"></li>
          <li data-target="#myCarousel" data-slide-to="2"></li>
          <li data-target="#myCarousel" data-slide-to="3"></li>
        </ol>
        <div class="carousel-inner">
          <div class="item active">
            <img src="Aadharcardimg/a1.jpg" class="img-responsive">
          </div>

          <div class="item">
              <img src="Aadharcardimg/a2.jpg" class="img-responsive">
          </div>
          <div class="item">
            <img src="Aadharcardimg/a3.jpg" class="img-responsive">
          </div>

          <div class="item">
              <img src="Aadharcardimg/a4.jpg" class="img-responsive">
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
    <!--feture content-->
    
    
       <div class="row">
<div class="col-md-12">  
  <div class="panel panel-default">
  <div class="panel-body">
  
    <ul class="nav nav-tabs">
       <li class ="active" ><a data-toggle="tab" href="#about">About Aadhar</a></li>
       <li><a data-toggle="tab" href="#vision">Vision</a></li>
       <li><a data-toggle="tab" href="#mission">Mission</a></li>
       <li><a data-toggle="tab" href="#core">Core Values</a></li>
     </ul>
			
 <div class="tab-content">
 
	          <div id="about" class="tab-pane active" >
	            <div class="panel panel-primary">
                <div class="panel-heading"><h3 class="panel-title">About AADHAR</h3></div>
                <div class="panel-body">
           <p>Aadhaar is a 12-digit unique identification number issued by the Indian government 
         to every individual resident of India. The Unique Identification Authority of India (UIDAI),
         which functions under the Planning Commission of India, is responsible for managing Aadhaar numbers and Aadhaar 
         identification cards.The Aadhaar project was initiated as an attempt towards having a single,
         unique identification document or number that would capture all the details, including demographic 
         and biometric information, of every resident Indian individual. Currently there are a plethora of identity
         documents in India including passports, permanent account numbers (PANs), driving licenses and ration cards. 
         The Aadhaar card / UID will not replace these identification documents but can be used as the sole identification
         proof when applying for other things. It will also serve as the basis for Know Your Customer (KYC) norms used by 
         banks, financial institutions, telecom firms and other businesses that maintain customer profiles.
         Aadhaar numbers will eventually serve as the basis for a database with which disadvantaged Indian residents
         can access services that have been denied to them due to lack of identification documents.</p>
          
                </div>
            </div>
		</div>
       
      
	            <div id="vision" class="tab-pane ">
	            <div class="panel panel-primary">
                <div class="panel-heading"><h3 class="panel-title">Vision</h3></div>
                <div class="panel-body">
           <p> To empower residents of India with a unique identity and a digital platform to authenticate anytime, anywhere.</p>
        
                </div>
            </div>
		</div> 
		
     
	            <div id="mission" class="tab-pane ">
	            <div class="panel panel-primary">
                <div class="panel-heading"><h3 class="panel-title">Vision</h3></div>
                <div class="panel-body">
                    <ul>
<li>Deliver Aadhaar numbers universally to residents with a well defined turnaround time and adhering to stringent quality metrics.
</li>
  <li> Collaborate with partners and service providers in leveraging Aadhaar to serve residents effectively, efficiently and equitably.
</li>
   <li>Encourage innovation and provide a platform for public and private agencies to develop Aadhaar linked applications.
</li> 
   <li>Ensure availability, scalability and resilience of the technology infrastructure.
</li> 
   <li>Build a long term sustainable organization to carry forward the vision and values of the UIDAI.
</li>
    <li>Make it attractive for the best global expertise in different fields to collaborate and provide valuable insights to the UIDAI organization.
</li>
 </ul>
                </div>
            </div>
		</div>   
		
       
        
	            <div id="core" class="tab-pane ">
	            <div class="panel panel-primary">
                <div class="panel-heading"><h3 class="panel-title">Vision</h3></div>
                <div class="panel-body">
                    <ul>
                        <li>We value integrity</li>
                        <li>We are committed to inclusive nation building</li>
                        <li>We pursue a collaborative approach and value our partners</li>
                        <li>We will strive towards excellence in services to residents and service providers</li>
                        <li>We will always focus on continuous learning and quality improvements</li>
                        <li>We are driven by innovation and provide a platform for our partners to innovate</li>
                        <li>We believe in a transparent and open organization</li>
                    </ul>
                </div>
            </div>
		</div> 
	
		 </div>
   </div>
  
  </div>
  </div>
</div> <!--end feture content-->
      
<hr>	

<div class="row">
     <div class="col-md-12">
         <img src="img/service.jpg" class="img-responsive" alt="service">
         
         <div class="carousel-caption">
       <div class="panel panel-primary">
         <div class="panel-heading"><h3 class="panel-title text-center ">AADHAR ONLINE SERVICES :-</h3></div>
                 </div>
             <div class=" text-center">
                 
                 <%                   
PreparedStatement checkAadharUserCid=(PreparedStatement)application.getAttribute("checkAadharUserCid");
checkAadharUserCid.setInt(1,cid);

 ResultSet rs=checkAadharUserCid.executeQuery();

if(rs.next()){
    if(rs.getString(4).equalsIgnoreCase("Generated")){
        session.setAttribute("documentname", "AADHARCARD");
                 %>
    <button class="btn btn-info disabled ">Applied</button>
 <a  href="ApplyAadharCard.jsp" class="btn btn-success ">Check Status</a>    
        <a  href="Profile.jsp" class="btn btn-warning ">Aadhar Data Update</a>
 <%   }
    else{
 %>
    
    <button class="btn btn-info disabled ">Applied</button>
 <a  href="ApplyAadharCard.jsp" class="btn btn-success ">Check Status</a>
    
    <%  
    
    }

  }  
else{
       %>
  <a  href="ApplyAadharCard.jsp" class="btn btn-info ">Apply For Aadhar</a>      
 <%
}
%>
            
        
               
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
         <div class="panel-heading"><h3 class="panel-title text-center ">AADHAR ONLINE SERVICES :-</h3></div>
               </div>
            <div class="row">
                <div class="col-md-12 text-center">
             <a  href="ApplyAadharCard.html" class="btn btn-primary ">Apply For Aadhar</a>
             <button class="btn btn-primary disabled ">Applied</button>
             <a  href="ApplyAadharCard.html" class="btn btn-success ">Check Status</a>
             <a  href="#" class="btn btn-warning ">Aadhar Data Update</a>
               
             </div>
           </div>
            </div>
        </div>



-->