<%@page import="java.util.*"%>
<%@page errorPage="Error.jsp" %>
<%
 String aname=(String)session.getAttribute("aname");
String sname=(String)session.getAttribute("sname");  

if(aname!=null || sname!=null){
    
    String departmenttype=(String)session.getAttribute("departmenttype");
      
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
<title>Generate User </title>

<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/bootstrap-table.css" rel="stylesheet">
</head>

<body>
	
      
   <%
        if(aname!=null){
String aid=(String)session.getAttribute("aid");
         %> 
  	 <%@ include file="HeaderA1.html" %>    
         
        <%
        }
    else{
 int sid=(Integer)session.getAttribute("sid");
    %>
        
    <%@ include file="HeaderD.html" %> 
    <%
    }
        %>
    
		
	<br><br>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-1 text-center">
                  <div class="form-group">
          <a  href="ViewAllUsersProcess.jsp" class="btn btn-primary " role="button">Back</a>   
                    </div>  
                </div>
       <div class="col-md-11 text-center">
            
                    <%
                 if(aname!=null)
                        {
                     %>
           <%@ include file="HeaderMenuA.html" %>
                       <%
                        }
                     else{
                        %>
           <%@ include file="HeaderMenuD.html" %>  
                    <%
                    }
                    %>
                </div>
                
                
                 
                </div>
                
                    <%                            
         HashMap ugd =(HashMap)session.getAttribute("ugd");//user get details
          
 if(ugd==null) 
{
                if(sname!=null){   
                response.sendRedirect("DepartmentHomePage.jsp");
                    }
                 else{  
                  response.sendRedirect("OfficialHomePage.jsp");
                   }
}
else{
      
%>

	<div class="page-header">
            <h3 class="text-capitalize">View Candidate Details : <%=ugd.get("name")%>&nbsp;&nbsp;&nbsp;</h3>
    
            </div>
            
            <div class="media">
  <div class="media-left media-middle">
   <img src='GetPic1?cid=<%=ugd.get("cid")%>' class="media-object img-rounded"  alt="Candidate image" width="250" height="250"  >
 </div>
   
  <div class="media-body">
      <h4 class="media-heading text-capitalize text-center  text-primary">Candidate Id : <%=ugd.get("cid")%></h4><br>
    <div class="row">
    <div class="col-md-2">
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
                        <label>Address</label>
               </div>
       
              </div>
        <div class="col-md-3">
             <div class="form-group">
                        <label><%=ugd.get("name")%></label>
                </div>
               <div class="form-group">
                        <label><%=ugd.get("fname")%></label>
                </div>
                <div class="form-group">
                        <label><%=ugd.get("mname")%></label>
                </div>
               <div class="form-group">
                        <label><%=ugd.get("gender")%></label>
                </div>
          
              <div class="form-group">
                 <label><%=ugd.get("address")%></label>
                 <label><%=ugd.get("city")%></label>
                 <label><%=ugd.get("state")%></label>
                 <label><%=ugd.get("pincode")%></label>
                </div>
            
              </div>
        <div class="col-md-2">
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
   
               
               
        </div>
        
        <div class="col-md-2">
               
             <div class="form-group">
                        <label><%=ugd.get("maritalstatus")%></label>
                </div>
            
                <div class="form-group">
                        <label><%=ugd.get("dob")%></label>
                </div>
               <div class="form-group">
                        <label><%=ugd.get("email")%></label>
                </div>
                  <div class="form-group">
                        <label><%=ugd.get("phone")%></label>
                </div>
             

        </div>



    </div>               
               
  </div>
</div>
	<%
    }

 %> 
 <hr>
 
 
 
 
 <%
    ArrayList sgd =(ArrayList)session.getAttribute("sgd");//user get details 
     if(sgd==null)
     {
         %>
 <div class="page-header">
     <h3 class="text-capitalize text-center"><%=(String)session.getAttribute("nogendata")%></h3>
</div>
 <%
     }
    else
     {  
                       
                              
    %>
   <div class="page-header">
     <h3 class="text-capitalize text-center">Issued Cards</h3>
</div> 
   
   <div class="row">
       
       
       <%
           
            Iterator i=sgd.iterator();
                        while(i.hasNext()){
                         HashMap sgud=(HashMap)i.next();
           
           if(sgud.get("cardname").equals("AADHAR CARD")){%>
           
           <div class="col-md-8">
       
       <div class="panel panel-primary">
     
     <div class="panel-heading"><h3 class="panel-title"><%=sgud.get("cardname")%></h3></div> 
     
 <div class="panel-body">

                        <div class="col-md-3">
                            
                                    <div class="form-group">
                                    <label>Name</label>
                                    </div>

                                    <div class="form-group">
                                            <label>Date Of Birth</label>
                                    </div>
                                    <div class="form-group">
                                            <label>Gender</label>
                                    </div>
                                   <div class="form-group">
                                    <label>Aadhar Card No.</label>
                                    </div>

                                    <div class="form-group">
                                    <label>Address</label>
                                    </div>

                        </div> 
     
     
     <div class="col-md-4">
         
                           <div class="form-group">
                             <label for="name"><%=(String)sgud.get("name") %></label>
                            </div>

                            <div class="form-group">
                                <label for="dob"><%=(String)sgud.get("dob")%></label>
                            </div>

                            <div class="form-group">
                               <label for="gender"><%=(String)sgud.get("gender")%></label>
                            </div>

                            <div class="form-group">
                             <label for="unique number"><%=(String)sgud.get("cardno") %>  </label>
                            </div>

                           <div class="form-group">
                     <label for="address"><%=(String)sgud.get("address")%> <%=(String)sgud.get("city")%>(<%=(String)sgud.get("state")%>)<%=(String)sgud.get("pincode")%></label>
                        </div>
         
                                 </div> 
                        
                        
    <div class="col-md-1 col-md-offset-1">

                 <div class="form-group">
       <img src='GetGenPic?cid=<%=(Integer)sgud.get("cid")%>&documentname=<%=(String)sgud.get("cardname")%>' height="100px" width="100px"/>
                 </div> 

       </div> 

     
 </div>
 </div> </div>
       
       <% }
       else if(sgud.get("cardname").equals("VOTER CARD")){%>
       
       <div class="col-md-8">
       
       <div class="panel panel-primary">
     
     <div class="panel-heading"><h3 class="panel-title"><%=sgud.get("cardname")%></h3></div> 
     
 <div class="panel-body">

                        <div class="col-md-3">
                            
                                   <div class="form-group">
                                         <label>IDENTITY CARD </label>
                                   </div>

                                   <div class="form-group">
                                           <label>Name</label>
                                   </div>

                                   <div class="form-group">
                                           <label>Father's Name</label>
                                   </div>
                                   <div class="form-group">
                                           <label>Gender</label>
                                   </div>

                                   <div class="form-group">
                                           <label>Date Of Birth</label>
                                   </div>

                                   <div class="form-group">
                                           <label>Address</label>
                                   </div>

                        </div> 
     
     
     <div class="col-md-4">
         
                           <div class="form-group">
                         <label for="votercardno"> <%=(String)sgud.get("cardno") %> </label>
                                        </div>
                                        
                                    <div class="form-group">
                        <label for="name"><%=(String)sgud.get("name") %></label>
                                        </div>
                <div class="form-group">
                    <label for="father's name"><%=(String)sgud.get("fname")%></label>
            </div>
                
            <div class="form-group">
                               <label for="gender"><%=(String)sgud.get("gender")%></label>
                                        </div>
                                        
              
                <div class="form-group">
                               <label for="dob"><%=(String)sgud.get("dob")%></label>
                                        </div>

                           <div class="form-group">
                     <label for="address"><%=(String)sgud.get("address")%> <%=(String)sgud.get("city")%>(<%=(String)sgud.get("state")%>)<%=(String)sgud.get("pincode")%></label>
                     
                                        </div>
              </div> 
                        
                        
    <div class="col-md-1 col-md-offset-1">

                 <div class="form-group">
          <img src='GetGenPic?cid=<%=(Integer)sgud.get("cid")%>&documentname=<%=(String)sgud.get("cardname")%>' height="100px" width="100px"/>
			</div>

       </div> 

     
 </div>
 </div>
       </div>
       
       <% }
else if(sgud.get("cardname").equals("PANCARD")){%>


           <div class="col-md-8">
       
       <div class="panel panel-primary">
     
     <div class="panel-heading"><h3 class="panel-title"><%=sgud.get("cardname")%></h3></div> 
     
 <div class="panel-body">

                        <div class="col-md-3">
                            
                                   <div class="form-group">
                                <label>Name</label>
                        </div>

                        <div class="form-group">
                                <label>Father's Name</label>
                        </div>

                        <div class="form-group">
                                <label>Date Of Birth</label>
                        </div>
                        <div class="form-group">
                                <label>PAN NUMBER</label>
                        </div>

                        </div> 
     
     
     <div class="col-md-4">
         
                              <div class="form-group">
                        <label for="name"><%=(String)sgud.get("name") %></label>
                                        </div>
                <div class="form-group">
                    <label for="father's name"><%=(String)sgud.get("fname")%></label>
            </div>
                
              
                <div class="form-group">
                               <label for="dob"><%=(String)sgud.get("dob")%></label>
                                        </div>
                            <div class="form-group">
                         <label for="unique number">  <%=(String)sgud.get("cardno") %></label>
                                        </div>
         
                                 </div> 
                        
                        
    <div class="col-md-1 col-md-offset-1">

                 <div class="form-group">
       <img src='GetGenPic?cid=<%=(Integer)sgud.get("cid")%>&documentname=<%=(String)sgud.get("cardname")%>' height="100px" width="100px"/>
                 </div> 

       </div> 

     
 </div>
 </div> </div>


       
       <% }
else if(sgud.get("cardname").equals("PASSPORT")){%>

           <div class="col-md-8">
       
       <div class="panel panel-primary">
     
     <div class="panel-heading"><h3 class="panel-title"><%=sgud.get("cardname")%></h3></div> 
     
 <div class="panel-body">

                        <div class="col-md-3">
                            <div class="form-group">
                            <label>PASSPORT NUMBER </label>
                        </div>

                        <div class="form-group">
                                <label>Name</label>
                        </div>

                        <div class="form-group">
                                <label>Father's Name</label>
                        </div>

                        <div class="form-group">
                                <label>Date Of Birth</label>
                        </div>
                        <div class="form-group">
                                <label>Issued on</label>
                        </div>
                        <div class="form-group">
                                <label>Valid till</label>
                        </div>

                        <div class="form-group">
                        <label>Address</label>
                        </div>
                                  

                        </div> 
     
     
     <div class="col-md-4">
             <div class="form-group">
                         <label for="unique number"> <%=(String)sgud.get("cardno") %>   </label>
                                        </div>
                                        
                                        <div class="form-group">
                        <label for="name"><%=(String)sgud.get("name") %></label>
                                        </div>
                <div class="form-group">
                    <label for="father's name"><%=(String)sgud.get("fname")%></label>
            </div>
                
              
                <div class="form-group">
                               <label for="dob"><%=(String)sgud.get("dob")%></label>
                                        </div>
                                        
                    <div class="form-group">
                               <label for="dob"><%=sgud.get("issuedate")%></label>
                                        </div>
                                        
                                         <div class="form-group">
                               <label for="dob"><%=sgud.get("validtill")%></label>
                                        </div>
                                                                              
                                 
                           <div class="form-group">
                     <label for="address"><%=(String)sgud.get("address")%> <%=(String)sgud.get("city")%><%=(String)sgud.get("pincode")%>(<%=(String)sgud.get("state")%>)</label>
                          </div>
                          
         
           </div> 
                        
                        
    <div class="col-md-1 col-md-offset-1">

           <div class="form-group">
          <img src='GetGenPic?cid=<%=(Integer)sgud.get("cid")%>&documentname=<%=(String)sgud.get("cardname")%>' height="100px" width="100px"/>
								</div>     

       </div> 

     
 </div>
 </div> </div>
       
       <% }
else{%>

           <div class="col-md-8">
       
       <div class="panel panel-primary">
     
     <div class="panel-heading"><h3 class="panel-title"><%=sgud.get("cardname")%></h3></div> 
     
 <div class="panel-body">

                        <div class="col-md-3">
                           <div class="form-group">
                               <label>Number </label>

                        </div>

                        <div class="form-group">
                                <label>Name</label>
                        </div>

                        <div class="form-group">
                                <label>Father's Name</label>
                        </div>

                        <div class="form-group">
                                <label>Date Of Birth</label>
                        </div>
                        <div class="form-group">
                                <label>Issued on</label>
                        </div>
                        <div class="form-group">
                                <label>Valid till</label>
                        </div>
                                <div class="form-group">
                                <label>Address</label>
                        </div>  
                                   

                        </div> 
     
     
     <div class="col-md-4">
          
                                    <div class="form-group">
                         <label for="unique number"> <%=(String)sgud.get("cardno") %> </label>
                                        </div>
                                        
                        <div class="form-group">
                        <label for="name"><%=(String)sgud.get("name") %></label>
                                        </div>
                <div class="form-group">
                    <label for="father's name"><%=(String)sgud.get("fname")%></label>
            </div>
                
              
                <div class="form-group">
                               <label for="dob"><%=sgud.get("dob")%></label>
                                        </div>
                                     
                 <div class="form-group">
                     
                               <label for="issuedon"><%=sgud.get("issuedate")%></label>  
                                        </div> 
                                        
                                <div class="form-group">
                      <label for="valid till" ><%=sgud.get("validtill")%></label>
                        </div>
                            <div class="form-group">
                     <label for="address"><%=(String)sgud.get("address")%> <%=(String)sgud.get("city")%>(<%=(String)sgud.get("state")%>)<%=(String)sgud.get("pincode")%></label>
                     
                                        </div>
                           
         
     </div> 
                        
                        
    <div class="col-md-1 col-md-offset-1">
                            <div class="form-group">
        <img src='GetGenPic?cid=<%=(Integer)sgud.get("cid")%>&documentname=<%=(String)sgud.get("cardname")%>' height="100px" width="100px"/>
			    </div>
                
    </div> 

     
 </div>
 </div> </div>
       
       <% } 
          
         }
         %>
     
  </div>
    
    
<%
}
     
 %>
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
