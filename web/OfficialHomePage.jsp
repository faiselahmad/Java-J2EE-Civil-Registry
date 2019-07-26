 <%@page import="java.sql.*"%>
<%@page errorPage="Error.jsp" %>
<%
String aname=(String)session.getAttribute("aname");
if(aname!=null){ 
String aid=(String)session.getAttribute("aid");
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
<title>Official Home</title>

<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">

</head>

<body>
<%@ include file="HeaderA1.html" %>
		  
		<br><br>
                <div class="container-fluid">
                    <div class="row">
                    <div class="col-md-12 text-center">
                        
      <%@ include file="HeaderMenuA.html" %>           
                        


                    
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
        response.sendRedirect("Official.jsp");
}
   %>