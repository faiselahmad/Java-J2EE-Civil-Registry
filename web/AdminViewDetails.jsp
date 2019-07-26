<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page errorPage="Error.jsp" %>
<%
 String aname=(String)session.getAttribute("aname");
String sname=(String)session.getAttribute("sname");  

if(aname!=null || sname!=null){
    
    String departmenttype=(String)session.getAttribute("departmenttype");
     String status=(String)session.getAttribute("status");
      
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
            <div class="row">
       <div class="col-md-12 text-center">
            
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
                 
         HashMap sud =(HashMap)session.getAttribute("sud");//single user data
          
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
      
%>

	<div class="page-header">
            <h3 class="text-capitalize">View Candidate Details : <%=sud.get("name")%>&nbsp;&nbsp;&nbsp;
    <%=departmenttype%>&nbsp;(<%=status%>)&nbsp;applications</h3>
            </div>
            
            <div class="media">
  <div class="media-left media-middle">
   <img src='GetPic1?cid=<%=sud.get("cid")%>' class="media-object img-rounded"  alt="Candidate image" width="250" height="250"  >
 </div>
   
  <div class="media-body">
      <h4 class="media-heading text-capitalize text-center  text-primary">Candidate Id : <%=sud.get("cid")%></h4><br>
    <div class="row">
    <div class="col-md-2 col-lg-offset-">
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
                        <label><%=sud.get("name")%></label>
                </div>
               <div class="form-group">
                        <label><%=sud.get("fname")%></label>
                </div>
                <div class="form-group">
                        <label><%=sud.get("mname")%></label>
                </div>
               <div class="form-group">
                        <label><%=sud.get("gender")%></label>
                </div>
          
              <div class="form-group">
                 <label><%=sud.get("address")%></label>
                 <label><%=sud.get("city")%></label>
                 <label><%=sud.get("state")%></label>
                 <label><%=sud.get("pincode")%></label>
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
             <div class="form-group">
                        <label>Documents</label>
                </div>
               
               
        </div>
        
        <div class="col-md-2">
               
             <div class="form-group">
                        <label><%=sud.get("maritalstatus")%></label>
                </div>
            
                <div class="form-group">
                        <label><%=sud.get("dob")%></label>
                </div>
               <div class="form-group">
                        <label><%=sud.get("email")%></label>
                </div>
                  <div class="form-group">
                        <label><%=sud.get("phone")%></label>
                </div>
              <div class="form-group">
                   <%
                       ResultSet drs;
                       if(departmenttype.equalsIgnoreCase("AADHAR CARD"))
  {
                             
PreparedStatement getDocumentForAadharCard=(PreparedStatement)application.getAttribute("getDocumentForAadharCard");
getDocumentForAadharCard.setInt(1, (Integer)sud.get("cid"));
 drs=getDocumentForAadharCard.executeQuery();drs.next();
        }

else if(departmenttype.equalsIgnoreCase("VOTER CARD"))
  {
                             
PreparedStatement getDocumentForVoterCard=(PreparedStatement)application.getAttribute("getDocumentForVoterCard");
getDocumentForVoterCard.setInt(1, (Integer)sud.get("cid"));
 drs=getDocumentForVoterCard.executeQuery();drs.next();
      
  }
                       else if(departmenttype.equalsIgnoreCase("PANCARD"))
  {
                             
PreparedStatement getDocumentForPancard=(PreparedStatement)application.getAttribute("getDocumentForPancard");
getDocumentForPancard.setInt(1, (Integer)sud.get("cid"));
 drs=getDocumentForPancard.executeQuery();drs.next();
      
  }
                       else if(departmenttype.equalsIgnoreCase("PASSPORT"))
  {
                             
PreparedStatement getDocumentForPassport=(PreparedStatement)application.getAttribute("getDocumentForPassport");
getDocumentForPassport.setInt(1, (Integer)sud.get("cid"));
 drs=getDocumentForPassport.executeQuery();drs.next();
  }
                       else{
                                                  
PreparedStatement getDocumentForDL=(PreparedStatement)application.getAttribute("getDocumentForDL");
getDocumentForDL.setInt(1, (Integer)sud.get("cid"));
 drs=getDocumentForDL.executeQuery();drs.next();
                           
                       }           
                       
%>
<label>Downloadable file</label>
<label><%if(drs.getObject(5)!=null){%><a href="FileDownloads?cid=<%=(Integer)sud.get("cid")%>&no=5">ID Proof</a>&nbsp;<%}%></label> 
<label><%if(drs.getObject(8)!=null){%><a href="FileDownloads?cid=<%=(Integer)sud.get("cid")%>&no=8">Marksheet</a>&nbsp;<%}%></label>
<label><%if(drs.getObject(11)!=null){%><a href="FileDownloads?cid=<%=(Integer)sud.get("cid")%>&no=11">BirthCertificate</a>&nbsp;<%}%></label>

                </div>

        </div>

<div class="col-md-1 col-lg-offset-1">
        <%
        if(status.equalsIgnoreCase("Waiting") || status.equalsIgnoreCase("Update"))
        {
    if(status.equalsIgnoreCase("Waiting")){%>
    <div class="form-group">
    <a  href="DeptAcceptedProcess.jsp?cid=<%=(Integer)sud.get("cid")%>" class="btn btn-primary " role="button">Accept</a>   
    </div>
    <%
    }else{
        %>
    <div class="form-group">
  <a  href="DeptUpdateProcess.jsp?cid=<%=(Integer)sud.get("cid")%>" class="btn btn-primary " role="button">Update</a>   
   </div>
          
<%
}
        %>
        

     <div class="form-group">
    <a  href="DeptRejectedProcess.jsp?cid=<%=(Integer)sud.get("cid")%>" class="btn btn-success" role="button">Reject</a>
</div>

    
        
        <%
        }
        else if(status.equalsIgnoreCase("Accepted")){
%>
<div class="form-group">
<a  href="DeptGenerateProcess.jsp?cdname=<%=(String)sud.get("name")%>" class="btn btn-primary " role="button">Generate</a>   
  </div>
<div class="form-group">
    <a  href="DeptRejectedProcess.jsp?cid=<%=(Integer)sud.get("cid")%>" class="btn btn-success" role="button">Reject</a>
</div>
<%
       }
else if(status.equalsIgnoreCase("Rejected")){
        %>
        <div class="form-group">
            <button   type="button" class="btn btn-success disabled " role="button">Rejected</button>   
  </div>
        <%
            }
else{
%>
 <div class="form-group">
  <a  href="DeptViewCardProcess.jsp?cid=<%=(Integer)sud.get("cid")%>" class="btn btn-success" role="button">View Card</a>
 </div>

<%
}
        
        %>
</div>


    </div>
  </div>
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
