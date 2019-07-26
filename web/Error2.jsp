<%@page isErrorPage="true" %>
<%
 String aname=(String)session.getAttribute("aname");
String sname=(String)session.getAttribute("sname");  

if(aname!=null || sname!=null){
    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
<title>error2</title>

<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">

</head>

<body>
	
	<div class="row">
		<div class="col-md-10 col-lg-offset-2">
			<div class="panel panel-default">
				
				<div class="panel-body">
					
					<div class="error-container">
                            <div class="well">
                                    <h1 class="grey lighter smaller">
                                        <%=(String)session.getAttribute("error2")%>
                                        
                                    </h1>
                <div class="center">
                       <a href="index.jsp" class="btn btn-primary">
                                Go back
                        </a>
                </div>
                        </div>
                </div>
					
				</div>
			</div>
		</div><!-- /.col-->
	</div><!-- /.row -->	
	
                 <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
		

		
</body>

</html>
<% 
    }
else{
        response.sendRedirect("index.jsp");
}
   %>