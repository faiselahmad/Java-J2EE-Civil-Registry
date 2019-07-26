 <%@page import="java.sql.*"%>
<%@page errorPage="Error.jsp" %>
<%
String sname=(String)session.getAttribute("sname");
if(sname!=null){
 int sid=(Integer)session.getAttribute("sid");
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
<title>Department Home</title>

<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
</head>

<body>
    <%@ include file="HeaderD.html" %>
		
	<br><br>

        <%@ include file="HeaderMenuD.html" %>      
              
   
	 <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
			
</body>

</html> 
 <% 
    }
else{
session.setAttribute("msg", "please Login First");
        response.sendRedirect("Department.jsp");
}
   %>





