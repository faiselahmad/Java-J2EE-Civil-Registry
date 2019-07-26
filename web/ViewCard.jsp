<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
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
<title>View Details</title>

<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/bootstrap-table.css" rel="stylesheet">
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
                  <div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Candidate Card Details</h1>
			</div>
               	</div>      
        
         <div class="row">
            <div class="col-md-12">
                    <div class="panel panel-default">
              
                            <div class="panel-body">
                            
 <%
         HashMap sud =(HashMap)session.getAttribute("vud");    // view user data      
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
        
      if(departmenttype.equalsIgnoreCase("AADHAR CARD")) {          
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
                    </div>
       
                    <div class="col-md-6">
                               
                                    
                                        
                                        <div class="form-group">
                                         <label for="name"><%=(String)sud.get("name") %></label>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label for="dob"><%=(String)sud.get("dob")%></label>
                                        </div>
                
                                        <div class="form-group">
                                           <label for="gender"><%=(String)sud.get("gender")%></label>
                                        </div>
                                        
                                        <div class="form-group">
                                         <label for="unique number"><%=(String)sud.get("cardno") %>  </label>
                                        </div>

                           <div class="form-group">
                     <label for="address"><%=(String)sud.get("address")%> <%=(String)sud.get("city")%>(<%=(String)sud.get("state")%>)<%=(String)sud.get("pincode")%></label>
                     
                                        </div>

                </div>
                     <div class="col-md-2">
				<div class="form-group">
     <img src='GetGenPic?cid=<%=(Integer)sud.get("cid")%>&documentname=<%=(String)sud.get("cardname")%>' height="100px" width="100px"/>
								</div> 
								</div>
                                                                
                                                                
                             
  
  <%
  
  } 
      
     
  
else if(departmenttype.equalsIgnoreCase("VOTER CARD")){
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
          
  </div>
  
  <div class="col-md-6">
                               
                                    <div class="form-group">
                         <label for="votercardno"> <%=(String)sud.get("cardno") %> </label>
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
          <img src='GetGenPic?cid=<%=(Integer)sud.get("cid")%>&documentname=<%=(String)sud.get("cardname")%>' height="100px" width="100px"/>
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
                         <label for="unique number">  <%=(String)sud.get("cardno") %></label>
                                        </div>

                          

                </div>
      <div class="col-md-2">
				<div class="form-group">
        <img src='GetGenPic?cid=<%=(Integer)sud.get("cid")%>&documentname=<%=(String)sud.get("cardname")%>' height="100px" width="100px"/>
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
      
          
  </div>
  <div class="col-md-6">
                               
                                    <div class="form-group">
                         <label for="unique number"> <%=(String)sud.get("cardno") %>   </label>
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
                               <label for="dob"><%=sud.get("issuedate")%></label>
                                        </div>
                                        
                                         <div class="form-group">
                               <label for="dob"><%=sud.get("validtill")%></label>
                                        </div>
                                                                              
                                 
                           <div class="form-group">
                     <label for="address"><%=(String)sud.get("address")%> <%=(String)sud.get("city")%><%=(String)sud.get("pincode")%>(<%=(String)sud.get("state")%>)</label>
                          </div>

                </div>
     <div class="col-md-2">
				<div class="form-group">
          <img src='GetGenPic?cid=<%=(Integer)sud.get("cid")%>&documentname=<%=(String)sud.get("cardname")%>' height="100px" width="100px"/>
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
          
                        </div>			
                      <div class="col-md-4">
                               
                                    <div class="form-group">
                         <label for="unique number"> <%=(String)sud.get("cardno") %> </label>
                                        </div>
                                        
                        <div class="form-group">
                        <label for="name"><%=(String)sud.get("name") %></label>
                                        </div>
                <div class="form-group">
                    <label for="father's name"><%=(String)sud.get("fname")%></label>
            </div>
                
              
                <div class="form-group">
                               <label for="dob"><%=sud.get("dob")%></label>
                                        </div>
                                     
                 <div class="form-group">
                     
                               <label for="issuedon"><%=sud.get("issuedate")%></label>  
                                        </div> 
                                        
                                <div class="form-group">
                      <label for="valid till" ><%=sud.get("validtill")%></label>
                        </div>
                            <div class="form-group">
                     <label for="address"><%=(String)sud.get("address")%> <%=(String)sud.get("city")%>(<%=(String)sud.get("state")%>)<%=(String)sud.get("pincode")%></label>
                     
                                        </div>

                </div>
                                 <div class="col-md-4">
				<div class="form-group">
         <img src='GetGenPic?cid=<%=(Integer)sud.get("cid")%>&documentname=<%=(String)sud.get("cardname")%>' height="100px" width="100px"/>
                                </div>
                                </div>    
     
     
     <%
         }

}

%>
                            
</div>
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