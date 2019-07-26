<%@page errorPage="Error.jsp"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
<title>Civil Registration</title>

<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">

</head>

<body>
    
    <%
String cname=(String)session.getAttribute("cname");
if(cname!=null)
{
  int cid=(Integer)session.getAttribute("cid");
%>
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
     
        <a href="#contact"  class="navbar-link navbar-right">Contact us</a>
        <a href="#aboutus"  class="navbar-link navbar-right">About us</a>
        <a href="#who"  class="navbar-link navbar-right">Who we are</a>
        <a href="#portal"  class="navbar-link navbar-right">About Portal</a>
    <%
    java.util.Date d=new java.util.Date();
     %>
    <p class=" navbar-text navbar-right"> <%=cname%> </p> 
    <p class=" navbar-text navbar-right"><%=d%></p>
        
       <div class="collapse navbar-collapse" id="mainnavbar">
     <ul class="nav navbar-nav navbar-right">
       
         <li><a href="#sigments">Our Sigments</a></li>
           <li><a href="#service">Services</a></li>  
      
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

<br>

<%
}
else{
%>
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
    
      <a href="Official.jsp"  class="navbar-link navbar-right">Official</a>
        <a href="Department1.jsp"  class="navbar-link navbar-right">Department</a>
        <a href="#contact"  class="navbar-link navbar-right">Contact us</a>
        <a href="#aboutus"  class="navbar-link navbar-right">About us</a>
        <a href="#who"  class="navbar-link navbar-right">Who we are</a>
        <a href="#portal"  class="navbar-link navbar-right">About Portal</a>
       <%
    java.util.Date d=new java.util.Date();
     %>
    <p class=" navbar-text navbar-right"><%=d%></p>
      
        
       <div class="collapse navbar-collapse" id="mainnavbar">
     <ul class="nav navbar-nav navbar-right">
         <li><a href="#sigments">Our Sigments</a></li>
           <li><a href="#service">Services</a></li>
           <li ><a  href="#" data-target="#signin" data-toggle="modal">Signin/Signup</a></li>
            <li><a href="#"></a></li>
         </ul>
       </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav><!--end navbar-->



<%
}
%>
    
       
 <div class="container-fluid">
     <br>
     
    <%
                   String msg=(String)session.getAttribute("msg");
                   if(msg!=null)
                   {%>
                   <div class="alert alert-info text-capitalize text-center  " role="alert">
                    <p> 
                <%=msg%>
                    </p>
                </div>
               <%
                    session.setAttribute("msg",null);
                   }
              %>
                <div class="jumbotron">
                <div class="panel panel-primary">
					
          <div class="panel-heading"><h2><b>
          WELCOME TO CIVIL REGISTRATION PORTAL</b></h2>
      </div>
            </div>
    <p>CIVIL REGISTRATION, first online system or agency to help the 
        INDIAN citizens easy to apply and updation for there government records and cards like Passport, 
        Driving License, Voter ID card, PAN card and Aadhar card.
    
    <a  href="#" class="btn btn-default btn-lg">read more</a>
    </p>
    </div>   
              
     
     <div class="panel  ">
<div class="panel-heading"><a id="sigments"><h1 class=" text-center" style="color: #354c6d"><b><u>Our Sigments</u></b></h1></a>
      </div>
            </div> 
  <%
 cname=(String)session.getAttribute("cname");
if(cname!=null){
        %>
<div class="row">
     
  <div class="col-md-4">
    <div class="thumbnail">
       <a href="AadharCard.jsp"><img src="indexpic/aadhar.jpg" alt="aadhar card" class="img-responsive "></a>
      <div class="caption">
          <p class="text-center">
             <a href="AadharCard.jsp" class="btn btn-primary " role="button">APPLY HERE</a>
          </p>
        
      </div>
      </div>
   </div>
    
    
   <div class="col-md-4">
    <div class="thumbnail">
      <a href="VoterCard.jsp"><img src="indexpic/voter.png" alt="voter card" class="img-responsive "></a>
      <div class="caption">
          <p class="text-center"><a href="VoterCard.jsp" class="btn btn-primary " role="button">APPLY HERE</a></p>
        
      </div>
    </div>
  </div>
    <div class="col-md-4">
    <div class="thumbnail">
     <a href="DrivingLicence.jsp"> <img src="indexpic/dl.jpg" alt="driving licence" class="img-responsive "></a>
      <div class="caption">
          <p class="text-center"><a href="DrivingLicence.jsp" class="btn btn-primary " role="button">APPLY HERE</a></p>
        
      </div>
    </div>
  </div>
    <div class="col-md-4">
    <div class="thumbnail">
    <a href="Passport.jsp">  <img src="indexpic/passport.jpg" alt="passport" class="img-responsive "></a>
      <div class="caption">
          <p class="text-center"><a href="Passport.jsp" class="btn btn-primary " role="button">APPLY HERE</a></p>
        
      </div>
    </div>
  </div>
    <div class="col-md-4">
    <div class="thumbnail">
     <a href="Pancard.jsp"> <img src="indexpic/pancard.jpg" alt="pancard" class="img-responsive "></a>
      <div class="caption">
          <p class="text-center"><a href="Pancard.jsp" class="btn btn-primary " role="button">APPLY HERE</a></p>
        
      </div>
    </div>
  </div>
  
   <div class="col-md-4">
    <div class="thumbnail">
      <div class="caption">
         <h2  class="text-center">FEW MORE SIGMENTS </h2>   
        <h3  class="text-center">COMING SOON...</h3>
         
        </div>
    </div>
  </div>
    
</div>
     <%
}
else{%>

<div class="row">
     
  <div class="col-md-4">
    <div class="thumbnail">
       
        
<a href="#" data-target="#signin" data-toggle="modal">
    <img src="indexpic/aadhar.jpg" alt="aadhar card" class="img-responsive "></a>
      <div class="caption">
          <p class="text-center">
              <a href="#"  data-target="#signin" data-toggle="modal" class="btn btn-primary " role="button">APPLY HERE</a>
          </p>
        
      </div>

        
    </div>
  </div>  
   <div class="col-md-4">
    <div class="thumbnail">
      <a  href="#" data-target="#signin" data-toggle="modal" ><img src="indexpic/voter.png" alt="voter card" class="img-responsive "></a>
      <div class="caption">
          <p class="text-center"><a  href="#" data-target="#signin" data-toggle="modal" class="btn btn-primary " role="button">APPLY HERE</a></p>
        
      </div>
    </div>
  </div>
    <div class="col-md-4">
    <div class="thumbnail">
     <a  href="#" data-target="#signin" data-toggle="modal"> <img src="indexpic/dl.jpg" alt="driving licence" class="img-responsive "></a>
      <div class="caption">
          <p class="text-center"><a  href="#" data-target="#signin" data-toggle="modal"class="btn btn-primary " role="button">APPLY HERE</a></p>
        
      </div>
    </div>
  </div>
    <div class="col-md-4">
    <div class="thumbnail">
    <a  href="#" data-target="#signin" data-toggle="modal">  <img src="indexpic/passport.jpg" alt="passport" class="img-responsive "></a>
      <div class="caption">
          <p class="text-center"><a  href="#" data-target="#signin" data-toggle="modal" class="btn btn-primary " role="button">APPLY HERE</a></p>
        
      </div>
    </div>
  </div>
    <div class="col-md-4">
    <div class="thumbnail">
     <a  href="#" data-target="#signin" data-toggle="modal"> <img src="indexpic/pancard.jpg" alt="pancard" class="img-responsive "></a>
      <div class="caption">
          <p class="text-center"><a  href="#" data-target="#signin" data-toggle="modal" class="btn btn-primary " role="button">APPLY HERE</a></p>
        
      </div>
    </div>
  </div>
  
   <div class="col-md-4">
    <div class="thumbnail">
      <div class="caption">
         <h2  class="text-center">FEW MORE SIGMENTS </h2>   
        <h3  class="text-center">COMING SOON...</h3>
         
        </div>
    </div>
  </div>
    
</div>

      <%
}
   %>
    <div class="panel  panel-primary col-md-8 col-md-offset-2">
          <div class="panel-heading"><h2 class=" text-center" style="color: #e8eaed"><b>WHY CIVIL REGISTRY</b></h2>
      </div>
            </div> 
    
    <div class ="row">
<div  class="col-md-6">
    <p> In these times it is very difficult to apply for government papers and cards easily and swiftly.
    If we wish to apply for a passport there is a thousand procedures in front of us, we have to visit the 
    concerned office many times and this will be extremely difficult and tedious for busy persons. 
    Moreover it is important that we have to be in a good terms with the authorities for the smooth 
    procedures of getting a license or any other cards such as AADHAR card, voter’s identity card etc.
    Civil Registry system is a perfect remedial solution for all the disadvantage of the present system.
    Presently all the registrations are done manually.  If a person wants to make registrations like AADHAR CARD, PAN CARD etc  he should directly contact the corresponding office.  The main disadvantage is that there will be lot of difficulties for the citizens. So, all these procedures will be a 
    time consuming one and more sufficient word i would like to propose to say,
    “Government work like a headache in existing world” . 
    </p>
</div>
        
        <div class="col-md-6 ">
<div id="myCarousel1" class="carousel slide">  <!--couresel -->
        <ol class="carousel-indicators">
          <li data-target="#myCarousel1" data-slide-to="0"></li>
          <li data-target="#myCarousel1" data-slide-to="1"></li>
          <li data-target="#myCarousel1" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
          <div class="item active">
            <img src="indexpic/i1.jpg" class="img-responsive" alt="use"> <div class="carousel-caption">
      <h4> Anywhere perpetually use </h4>
      </div>
          </div>

          <div class="item">
              <img src="indexpic/i2.jpg" class="img-responsive" alt="digital">
               <div class="carousel-caption">
      <h4 > Connect with your device</h4>
      </div>
          </div>
          <div class="item">
              <img src="indexpic/i3.jpg" class="img-responsive" alt="application">
             <div class="carousel-caption">
      <h4>Things that we make digital</h4>
      </div>
          </div>


        </div>
      <a class="left carousel-control" href="#myCarousel1" data-slide="prev">
      <span class="icon-prev"></span></a>
      <a class="right carousel-control" href="#myCarousel1" data-slide="next">
      <span class="icon-next"></span></a>
</div>
    </div> <!--End couresel -->
     
</div>
    <!--feture content-->
    
  
      <div class="row">
        <div class="col-md-12">
            <h3><b><a id="portal">ABOUT PORTAL</a></b></h3>
           <p>
               
  The website is to give awareness about the government or legal documents and its registration details as well as 
  to help to register or apply for those documents. This also acts as a consultancy agency to assist the public.
  The main purpose of the web site is to reduce the effort by the candidate and save his time and avoid unwanted 
  rushes at the government offices and assure a smooth working schedule at government offices.


           </p>  
           <div class="row">
             <div class="col-md-6">
             <img src="indexpic/portal.jpg" alt="aboutportal" class="img-responsive">
               
             </div>
             <div class="col-md-6">
                 <p>
                     Civil Registry is the online system or agency to help the Indian citizens to apply for there government records
                     like passport, driving license, voter’s ID card, PAN card etc.
                 </p>
             <p>The project Civil Registry still requires more development of IT solutions and its applications to improve 
the issuance of copies of government certificates and legal documents. Now civil registry team acting as a agency
to help the public.</p>
            
               
             </div>
           </div>    
        </div>
      
      </div>
      
       <div class="media">
  
  <div class="media-body">
      <h4 class="media-heading"><b>To Overcome Rush</b></h4>
      <p>
      Online civil registration portal which helps the citizens of this county to connect with major
   government departments. Registered users can apply for the cards issued by various departments 
   through this site. Users can also keep track of their application status on a button click instead 
   of dragging through government office corridors. Civil registry acts as an online consulting agency 
   which provides legal assistance while applying various cards and documents. Application to various 
   public departments such as AAdhar card, passport etc. can be submitted or applied online for further 
   processing. 
       </p>
       
</div>
            
            <div class="media-right">
      <a id="digital">
   <img class="media-object" src="indexpic/rush.jpg" alt="Reduce Rush" ></a>
   </div>
</div>
      
      <div class="media">
  <div class="media-left">
      <a id="aboutus">
  <img class="media-object" src="indexpic/aboutus.jpg" alt="aboutus" >
  </a>
  </div>
 </div> 
      <div class="panel">
	 <div class="panel-heading">
              <p>The registration records are primarily useful for their value as legal documents and
secondarily as the source of vital statistics. Civil registration as a source of vital statistics is relatively
less expensive, as the statistics generated from the registration records are the by-products of an
essential administrative process. The registration records can also generate current and continuous
statistics, which can be more accurate than any other method of data collection. However, the
reliability of the statistics obtained through the registration system depends much on the
completeness and promptness with which events are registered and the accuracy of the information
in the registration records. The improvement in the system of registration of government papers 
critically dependent on how much importance is attached to the data on government papers  by the
respective States and District administrations. Besides, the level of awareness among the public
about the utility of government papers also plays a crucial role and issue a card according to the system..</p>
              <p>And the CIVIL REGISTRY always with you in term of :-</p>
      </div>
            </div>  
      
      <div class="row">
          <div class="col-md-5">
              
              <div id="myCarousel" class="carousel slide">  <!--couresel -->
        <ol class="carousel-indicators">
          <li data-target="#myCarousel" data-slide-to="0"></li>
          <li data-target="#myCarousel" data-slide-to="1"></li>
          <li data-target="#myCarousel" data-slide-to="2"></li>
           <li data-target="#myCarousel" data-slide-to="3"></li>
        </ol>
        <div class="carousel-inner">
          <div class="item active">
            <img src="indexpic/connect.jpg" alt="connect" class="img-responsive">
            <div class="carousel-caption">
         <h2>CONNECT WITH YOU</h2> 
      </div>
          </div>

          <div class="item">
              <img src="indexpic/online.jpg" alt="online" class="img-responsive">
              <div class="carousel-caption">
      <h2>24*7 ONLINE</h2>
      </div>
          </div>
          <div class="item">
            <img src="indexpic/customer.jpg" alt="customer" class="img-responsive">
            <div class="carousel-caption">
      <h2 >CUSTOMER SERVICE</h2>
      </div>
          </div>
            
            <div class="item">
            <img src="indexpic/people.jpg" alt="people" class="img-responsive">
            <div class="carousel-caption">
      <h2>ALWAYS FOR THE PEOPLE</h2>
      </div>
          </div>

        </div>
      <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="icon-prev"></span></a>
      <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="icon-next"></span></a>
</div>
    </div> <!--End couresel -->
    
    
    <div class="col-md-7">
    <div class="panel panel-success">
					
          <div class="panel-heading"> Our key features :- </div>
              <ul>
                  <li>Our team till now, work on 5 segments of government papers</li>
                  <li>civil registration is to create a legal document 
                      that can be used to establish and protect the rights of individuals.</li>
                  <li>civil registration collects this information on a continuous basis and is the only
                      source that provides individuals with a legal document.</li>
                  <li> Efforts to improve the quality of vital statistics will therefore be 
                      closely related to the development of civil registration systems in country.</li>
                  <li>civil status events pertaining to the population as provided by decree,
                      law or regulation, in accordance with the legal requirements in country.</li>
                  
              </ul>
    
            </div> 
    </div>
    
    
          </div>
      
       <hr>
    <footer>
		<div class="panel ">
<div class="panel-body">
            <div class="row">
              
	<div class="col-md-8">
            <div class="row">
            <div class="col-md-3"> 
                <a id="contact">
            <img src="indexpic/contact.jpg" class="img-responsive" alt="contact" width="200" height="200">
            </a></div>
          <div class="col-md-3">
                     <p> Email : faiselahmad78@gmail.com</p>
                     <p>Phone : +91 9891813725</p>
                  <p> Address : Ratan Singh Boys Hostel Pari Chowk Greater Noida Gautam Buddha Nagar UP 201310</p>
                
          </div></div>
          </div>
                  
                <div class="col-md-4">
	<ul  style="list-style-type:none">
             <li><a href="#"  >Help </a></li>
             <li><a href="#aboutus" >About us</a></li>
              <li><a href="#" >Follow us</a></li>
             
		
			
	  </ul>
	</div>
            </div>
            <!-- /.row -->
			</div>
			</div>
			<div class="row">
                <div class="col-md-12">
                    <p class ="text-center">Design and Developed By<b> <i>FAISEL AHMAD KHAN</i></b></p>
                </div>
            </div>
        </footer>
 </div>		

<!---------------------------------Modal for signin.............................................-->

<div class="modal" id="signin" tabindex="-1" data-backdrop="static"><!--data-keyboard="false" for prevent esc button to dissmiss -->
    <div class="modal-dialog">
       <div class="modal-content">
        <div class="modal-header">
     <button class="close" data-dismiss="modal">&times;</button>
     <h3 class="modal-title">Sign in</h3>
    </div>
           <form action="SigninProcess.jsp"   method="post" role="form">
           <div class="modal-body">
              
                        <div class="form-group">
                         <label>Email Id</label>
                                    <input type ="text" name="email" class="form-control" placeholder="Email" required>
                            </div>

                            <div class="form-group">
                                    <label>Password</label>
                                    <input type ="Password" name="pass" class="form-control" placeholder="Password" required>
                            </div>
        
              
               
           </div>
           <div class="modal-footer">
               <button type="submit" class="btn btn-primary pull-left">Signin</button>
               <button type="reset" class="btn btn-default pull-left">Reset</button>
	   <div class="form-group pull-right">
            <a  href="#" class=" btn btn-primary"   data-target="#forget" data-toggle="modal" data-dismiss="modal">Forget password</a>
		
            <a  href="#" class=" btn btn-primary" data-target="#signup" data-toggle="modal" data-dismiss="modal" >Signup here</a>
		</div>
           </div>
            </form>
          
           
    </div> 
        
    </div>
</div>

<!---------------------------------Modal for signup.................................-->
		

<div class=" modal" id="signup" tabindex="-1" data-backdrop="static"><!--data-keyboard="false" for prevent esc button to dissmiss -->
    <div class="modal-dialog">
       <div class="modal-content">
        <div class="modal-header">
          
     <button class="close" data-dismiss="modal">&times;</button>
     <h3 class="modal-title">Signup here</h3>
    </div>
           
               
         <form action="RegisterProcess" method ="post" role="form" enctype="multipart/form-data" >
             
              <div class="modal-body"> 
               <div class="row">
                  <div class="col-md-4">
                      
                        <div class="form-group">
                        <label>Name</label>
                        <input type ="text" name="name" class="form-control" placeholder="Name" required>
                </div>
                <div class="form-group">
                        <label>Father's Name</label>
                        <input type ="text"  name="fname" class="form-control" placeholder="Father's Name" required>
                </div>


        <div class="form-group">
                        <label>Mother's Name</label>
                        <input type ="text" name="mname" class="form-control" placeholder="Mother's Name" required>
                </div>
								
                            <div class="form-group">
                                    <label>Email</label>
                                    <input type ="text" name="email" class="form-control" placeholder="Email" required>
                            </div>

                      
                       </div>
                  
    <div class="col-md-4">
                      
<div class="form-group">
                      <label>Phone</label>
                      <input type ="text" name="phone"   maxlength="10" class="form-control" placeholder="Phone" required>
              </div>

                        <div class="form-group">
    <label>Date of birth</label>
    <input type="Date" name="dob" placeholder="Date-of-birth" class="form-control" required>
     </div>
							
                <div class="form-group">
                                <label>Password</label>
                                <input type="password" name="pass" class="form-control" required>
                        </div>

                       
            
            <div class="form-group">
                <label>Upload your Photo</label>
                 <p class="help-block">(This photo will use as a on document) </p>
                 <input type="file" name="fil" required="" >

                        </div>
    
         </div>
                  
    <div class="col-md-4">
        
 <div class="form-group">
                        <label>I am </label>
                        <div class="radio">
                                <label>
                                <input type="radio" name="gender" value="male" checked> Male<br>

                                </label>
                        </div>
                        <div class="radio">
                                <label>
                                <input type="radio" name="gender" value="female"> Female<br>
                                </label>
                        </div>
                        <div class="radio">
                                <label>
                                 <input type="radio" name="gender" value="other"> Other 
                                </label>
                        </div>

                </div>


        <div class="form-group">
                                    <label>I am </label>
                                    <div class="radio">
                                            <label>
                          <input type="radio" name="mstatus" value="Unmarried" checked >Unmarried
                                         </label>
                                    </div>
                                    <div class="radio">
                                            <label>
                                               <input type="radio" name="mstatus" value="Married"  >Married      	
                                                    </label>
                                    </div>
                                    <div class="radio">
                                            <label>
                                                    <input type="radio" name="mstatus"  value="Other">Other

                                            </label>
                                    </div>

                            </div>
         </div></div>
                  
    <div class="row">
          
							
<div class="col-md-12">

  <div class="form-group">
                            <label>Address</label>
                            <input type ="text" name="address" class="form-control" placeholder="Address" required>
                </div>
    
    <script>
function populate(s1,s2){
	var s1 = document.getElementById(s1);
	var s2 = document.getElementById(s2);
	s2.innerHTML = "";
	if(s1.value == "Madhya Pradesh"){
		var optionArray = ["|","Morena|Morena","Bhopal|Bhopal","Gwalior|Gwalior","Indor|Indor"];
	}
        else if(s1.value == "Uttar Pradesh"){
		var optionArray = ["|","Agra|Agra","Kanpur|Kanpur","Noida|Noida","Lucknow|Lucknow"];
	} 
	for(var option in optionArray){
		var pair = optionArray[option].split("|");
		var newOption = document.createElement("option");
		newOption.value = pair[0];
		newOption.innerHTML = pair[1];
		s2.options.add(newOption);
	}
}
</script>   
    
<div class="form-group">
<label>state</label>
<select name="state" class="form-control"  id="state"  onchange="populate(this.id,'city')" required>
<option value=""></option> 
<option value="Madhya Pradesh">Madhya Pradesh</option> 
<option value="Uttar Pradesh">Uttar Pradesh</option>
<!--
 <option value="Andhra Pradesh">Andhra Pradesh</option>
  <option value="Arunachal Pradesh">Arunachal Pradesh</option>
 <option value="Assam">Assam</option>
<option value="Bihar">Bihar</option>
<option value="Chhattisgarh">Chhattisgarh</option>	
<option value="Goa">Goa</option>
<option value="Gujarat">Gujarat</option>
 <option value="Haryana">Haryana</option>
 <option value="Himachal Pradesh">Himachal Pradesh</option>
<option value="Jharkhand">Jharkhand</option>
<option value="Karnataka">Karnataka</option>	
<option value="Kerala">Kerala</option>
<option value="Maharashtra">Maharashtra</option>-->
 </select>
</div>

<div class="form-group">
<label>City</label>
<select id="city" name="city" class="form-control" required></select>                          
</div>

    <div class="form-group">
        <label>pincode</label>
        <input type="text" name="pincode" placeholder="pincode" class="form-control" maxlength="6" required  >
    </div>


</div>
       
              </div> 
                  
      <div class="modal-footer ">
               <button type="submit" class="btn btn-primary pull-left">Sign Up</button>
               <button type="reset" class="btn btn-default  pull-left " >Reset</button>
	   <div class="form-group pull-right">
            	
      <a  href="#" class=" btn btn-primary" data-target="#signin" data-toggle="modal" data-dismiss="modal" >Signin here</a>
		</div>
           </div>              
                  
        </div>
</form>   

</div> 

</div>
</div>


<!-----------------------------Modal for forget password.............................................-->

<div class="modal" id="forget" tabindex="-1" data-backdrop="static"><!--data-keyboard="false" for prevent esc button to dissmiss -->
    <div class="modal-dialog">
       <div class="modal-content">
        <div class="modal-header">
      <button class="close" data-dismiss="modal">&times;</button>
            <h4>Forget password</h4>
    </div>
           <form action="ForgotPassProcess.jsp" class= "form-inline" role="form">
           <div class="modal-body">
               
    
            <div class="form-group">
                <input type ="email" name="email" class="form-control" placeholder="Your Email"  size="30" required>
           </div>
 <button type="submit" class=" btn btn-primary">Send</button>
		  </div>
         </form>
           </div> 
        
    </div>
</div>



<!-- /.container-fluid -->
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>

</html>


