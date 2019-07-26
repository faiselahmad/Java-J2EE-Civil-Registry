
<%
String cname=(String)session.getAttribute("cname");
if(cname!=null){ 
    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
<title>error</title>

<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">

</head>

<body>
	
	<div class="row">
		<div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4">
			<div class="login-panel panel panel-default">
				
				<div class="panel-body">
					
                                    <div class="error-container">
                                    <div class="well">
                                    <h1 class="grey lighter smaller">
                                        <%
                                     String ex1=(String)session.getAttribute("ex");
                                     if(ex1!=null){
                                        %>
                                    <%=ex1%>
                                    <%
                                    }
                                    %>     
                                    </h1>
                                    <div class="center">


                                    <a href="index.jsp" class="btn btn-primary">
                                    <i class="ace-icon fa fa-tachometer"></i>
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