<%@page import="java.text.*"%>
<%@page import="java.util.*"%>
<%@page errorPage="Error.jsp" %>
<!DOCTYPE html>
<%
String aname=(String)session.getAttribute("aname");
String sname=(String)session.getAttribute("sname");  

if(aname!=null || sname!=null){    
String departmenttype=(String)session.getAttribute("departmenttype");
 java.util.Date d=new java.util.Date();
    %>
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
<title>Card</title>

<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">

</head>

<body>
	 <%
   
    
        if(aname!=null){
String aid=(String)session.getAttribute("aid");
         %>
          <%@ include file="HeaderA.html" %> 
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
            <div class="form-group">
          <a  href="AdminViewPage.jsp" class="btn btn-primary " role="button">Back</a>   
                    </div>
             
   <%
           String done=(String)session.getAttribute("done"); 
           
                   if(done!=null){
               %>   
               <div class="panel panel-primary">
                   <div class="panel-heading">
    <h4 class="panel-title text-center"> <%=done%>  </h4>
                </div>
                </div>
               
                <%
               session.setAttribute("done", null); 
                }
            %>
		
	<div class="row">
			<div class="col-md-12">
				<h1 class="page-header">Candidate Card Details</h1>
			</div>
		</div><!--/.row-->
                <div class="row">
                    <div class="panel panel-default">
                            <div class="panel-body">
                                
                                    
                                        
	       
            
 <%
         HashMap sud =(HashMap)session.getAttribute("sud");            
 if(sud==null)
{
                if(sname!=null){   
                response.sendRedirect("DepartmentHomePage.jsp");
                    }
                 else{  
                response.sendRedirect("OfficialHomePage.jsp");
                   }
}
 
else{
                            
      if(departmenttype.equalsIgnoreCase("AADHAR CARD"))
  {          
       %>
                        
         
  <div class="col-md-2">
  

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
                        <label></label>
                        </div>

                        <div class="form-group">
                        <label>Address</label>
                        </div>
                                <%
              String hide=(String)session.getAttribute("hide"); 
           
                   if(hide==null){
                       %>
                        <div class="form-group">
<a  href="CardGenerateProcess.jsp?cid=<%=sud.get("cid")%>" class="btn btn-primary " role="button">Generate</a>   
  </div> 
                      <%
                   }
                    %>
         
  </div>
  <div class="col-md-6">
                               
                                        
                                    <div class="form-group">
                                            <label for="name"><%=(String)sud.get("name") %></label>
                                    </div>
                              
                                    <div class="form-group">
                                            <label for="dob"><%=(String)sud.get("dob")%></label>
                                    </div>
                                    <div class="form-group">
                                            <label for="dob"><%=(String)sud.get("gender")%></label>
                                    </div>
                                    
                                    <div class="form-group">
                                            <label for="unique number"> 
                                                   <% 
                                             long ano=(Long)session.getAttribute("ano");
                                                   %>      
                                                   <%= ano%>   

                                            </label>
                                    </div>

                                    <div class="form-group">
            <label for="address"><%=(String)sud.get("address")%> <%=(String)sud.get("city")%>(<%=(String)sud.get("state")%>)<%=(String)sud.get("pincode")%></label>
                                     </div>

                                     </div>
                                     
                     <div class="col-md-2">
				<div class="form-group">
          <img src='GetPic1?cid=<%=sud.get("cid")%>' height="100px" width="100px"/>
                                </div>
                    </div>
                                                                
                                                                
                             
  
  <%
  
  } 
      
     
  
else if(departmenttype.equalsIgnoreCase("VOTER CARD"))
  {
      %>
  <div class="col-md-2">
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
           <%
              String hide=(String)session.getAttribute("hide"); 
           
                   if(hide==null){
                       %>
                       
                        <div class="form-group">
<a  href="CardGenerateProcess.jsp?cid=<%=sud.get("cid")%>" class="btn btn-primary " role="button">Generate</a>   
                         </div> 
                      <%
                   }
                    %>
  </div>
  
  <div class="col-md-6">
                               
                            <div class="form-group">
                             <label for="votercardno"> 
                                <% 
                String vno=(String)session.getAttribute("vno");
                                %>      
                                <%= vno%>   
                                
                             </label>
                            </div>
                                        
                            <div class="form-group">
                               <label for="name"><%=(String)sud.get("name") %></label>
                            </div>
                            
                            <div class="form-group">
                                <label for="father's name"><%=(String)sud.get("fname")%></label>
                            </div>                
              
                            <div class="form-group">
                                <label for="gender"><%=(String)sud.get("gender")%></label>
                            </div>
                            
                            <div class="form-group">
                                <label for="dob"><%=(String)sud.get("dob")%></label>
                            </div>

                           <div class="form-group">
                     <label for="address"><%=(String)sud.get("address")%> <%=(String)sud.get("city")%>(<%=(String)sud.get("state")%>)<%=(String)sud.get("pincode")%></label>
                         </div>

                </div>
                <div class="col-md-2">
				<div class="form-group">
         <img src='GetPic1?cid=<%=sud.get("cid")%>' height="100px" width="100px"/>
                                </div>
                </div>
					
    
  
  <%
}
else if(departmenttype.equalsIgnoreCase("PANCARD")){
  %>    

  <div class="col-md-2">
    

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

                             
          <%
              String hide=(String)session.getAttribute("hide"); 
           
                   if(hide==null){
                       %>
                        <div class="form-group">
<a  href="CardGenerateProcess.jsp?cid=<%=sud.get("cid")%>" class="btn btn-primary " role="button">Generate</a>   
  </div> 
                      <%
                   }
                    %> 
  </div>
  <div class="col-md-6">
                               
                            
                                        
                                      <div class="form-group">
                        <label for="name"><%=(String)sud.get("name") %></label>
                                        </div>
                <div class="form-group">
                    <label for="father's name"><%=(String)sud.get("fname")%></label>
            </div>
                
              
                <div class="form-group">
                               <label for="dob"><%=(String)sud.get("dob")%></label>
                                        </div>
                                        <div class="form-group">
                         <label for="unique number"> 
                                <% 
               String panno=(String)session.getAttribute("panno");
                                %>      
                                <%= panno%>   
                                
                             </label>
                                        </div>


                </div>
      <div class="col-md-2">
				<div class="form-group">
         <img src='GetPic1?cid=<%=sud.get("cid")%>' height="100px" width="100px"/>
								</div>
								</div>

  
  
  

  
<%
}
else if(departmenttype.equalsIgnoreCase("PASSPORT")){
      
 %> 
	
 
  <div class="col-md-2">
                        
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
      
                       
          <%
              String hide=(String)session.getAttribute("hide"); 
           
                   if(hide==null){
                       %>
                        <div class="form-group">
<a  href="CardGenerateProcess.jsp?cid=<%=sud.get("cid")%>" class="btn btn-primary " role="button">Generate</a>   
  </div> 
                      <%
                   }
                    %>
  </div>
  <div class="col-md-6">
                               
                                    <div class="form-group">
                                        <label for="passport no"> 
                                               <% 
                               StringBuffer pno=(StringBuffer)session.getAttribute("pno");
                                               %>      
                                               <%= pno%>   

                                        </label>
                                    </div>
                                        
                                    <div class="form-group">
                                        <label for="name"><%=(String)sud.get("name") %></label>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label for="father's name"><%=(String)sud.get("fname")%></label>
                                      </div>
                
              
                <div class="form-group">
                               <label for="dob"><%=(String)sud.get("dob")%></label>
                                        </div>
                                          <div class="form-group">
                     <%
                         SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-yyyy");
                         
                         %>
                               <label for="issuedon"><%=sdf.format(d)%></label>  
                                        </div> 
                                        
                                <div class="form-group">
                                    <%
                  Calendar date = Calendar.getInstance();
                                date.add(Calendar.YEAR,10); 
    
                                        %>
                 <label for="valid till" ><%=sdf.format(date.getTime())%></label>
                        </div>

                           <div class="form-group">
                     <label for="address"><%=(String)sud.get("address")%> <%=(String)sud.get("city")%>(<%=(String)sud.get("state")%>)<%=(String)sud.get("pincode")%></label>
                          <label>INDIA</label>
                                        </div>

                </div>
                          
     <div class="col-md-2">
				<div class="form-group">
          <img src='GetPic1?cid=<%=sud.get("cid")%>' height="100px" width="100px"/>
                            </div>
                            </div> 
 
                            
                            
 <%
     }
else if(departmenttype.equalsIgnoreCase("DRIVING LICENCE")){
      
     %>
     <div class="col-md-2">
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
           <%
              String hide=(String)session.getAttribute("hide"); 
           
                   if(hide==null){
                       %>
                        <div class="form-group">
<a  href="CardGenerateProcess.jsp?cid=<%=sud.get("cid")%>" class="btn btn-primary " role="button">Generate</a>   
  </div> 
                      <%
                   }
                    %>
  </div>			
<div class="col-md-6">
                               
                                    <div class="form-group">
                         <label for="unique number"> 
                                <% 
                String dlno=(String)session.getAttribute("dlno");
                                %>      
                                <%= dlno%>   
                                
                             </label>
                                        </div>
                                        
                        <div class="form-group">
                        <label for="name"><%=(String)sud.get("name") %></label>
                                        </div>
                <div class="form-group">
                    <label for="father's name"><%=(String)sud.get("fname")%></label>
            </div>
                
              
                <div class="form-group">
                               <label for="dob"><%=(String)sud.get("dob")%></label>
                                        </div>
                                     
                 <div class="form-group">
                     <%
                         SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-yyyy");
                         
                         %>
                               <label for="issuedon"><%=sdf.format(d)%></label>  
                                        </div> 
                                        
                                <div class="form-group">
                                    <%
                  Calendar date = Calendar.getInstance();
                                date.add(Calendar.YEAR,18); 
    
                                        %>
                 <label for="valid till" ><%=sdf.format(date.getTime())%></label>
                        </div>
                            <div class="form-group">
                     <label for="address"><%=(String)sud.get("address")%> <%=(String)sud.get("city")%>(<%=(String)sud.get("state")%>)<%=(String)sud.get("pincode")%></label>
                     
                                        </div>

                </div>
     <div class="col-md-2">
				<div class="form-group">
       <img src='GetPic1?cid=<%=sud.get("cid")%>' height="100px" width="100px"/>
								</div>
								</div>  
     
     
     <%
         }
%>
                            
</div>

</div>
</div><!-- /.row -->
</div>
 <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
			
</body>

</html>
<% 
    

}
}

else{
session.setAttribute("msg", "please Login First");
        response.sendRedirect("index.jsp");
}
   %>