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
<title>All Users</title>

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
       <div class="col-md-12 text-center">
             <%
                 if(aname!=null){
                     %>
          <%@ include file="HeaderMenuA.html" %>                     
                     

                <% }
                 else{
                 %>
        <%@ include file="HeaderMenuD.html" %>     
        <%
        }
        %>
 </div>
 </div>
                  <% 
                 
          ArrayList au=(ArrayList)session.getAttribute("au");
           String nodata=(String)session.getAttribute("nodata");
                     if(nodata!=null)
                     {
                     %><br><br>  
                      <div class="panel panel-warning">
                   <div class="panel-heading">
    <h4 class="panel-title text-center"> <%=nodata%></h4> 
                </div>
                </div>
                     
                     <%
               session.setAttribute("nodata", null);
                         }
else if(au==null){ 
response.sendRedirect("ViewAllUsersProcess.jsp");

}
 else{
 int ucount=(Integer)session.getAttribute("ucount"); 

                     
             %>
   
             <br><br>  
            <div class="row">
        <div class="col-md-12">
    
<div class="panel panel-warning">
    <%
        if(ucount!=0){
            %> 
<div class="panel-heading"><h3 class="panel-title">
        Total Users<span class="badge"><%=ucount%></span> 
                     </h3>
</div>

            
            <%
        }else{
            %>
        <div class="panel-heading"><h3 class="panel-title">
        Total Users<span class="badge">0</span>
                     </h3>
</div>    
        <%
        }
        %>
   
    <div class="panel-body">
    
  
    <table data-toggle="table" data-url="tables/data1.json"  data-show-refresh="true" data-show-toggle="true" data-show-columns="true" data-search="true" data-select-item-name="toolbar1" data-pagination="true" data-sort-name="name" data-sort-order="desc">
                <thead>
                <tr>
                    <th data-field="pic" data-sortable="true">pic</th>
                    <th data-field="id" data-sortable="true">Candidate id</th>
                   <th data-field="name"  data-sortable="true">Name</th>
                   <th data-field="Gender"  data-sortable="true">Gender</th>						       
                    <th data-field="Email" data-sortable="true">Email</th>
                   <th data-field="Phone" data-sortable="true">Phone</th>
                   <th data-field="Date Of Birth" data-sortable="true">Date Of Birth</th>
                  <th data-field="city"  data-sortable="true">City</th>
                  <th data-field="state"  data-sortable="true">State</th>
                     <th  data-sortable="true"></th>
               </tr>
		 </thead> 
		<tbody> 
              <%
             
          
                        Iterator i=au.iterator();
                        while(i.hasNext()){
                            HashMap ud=(HashMap)i.next();
                            
                        %>
          <tr>
   <td>
<img  src='GetPic1?cid=<%=ud.get("cid")%>' alt="candidate image" class="img-rounded" height="75" width="75" class="pull-right">
</td>
               
                <td><%=ud.get("cid")%></td>
                <td><%=ud.get("name")%></td>
                <td><%=ud.get("gender")%></td>
                <td><%=ud.get("email")%></td>
                <td><%=ud.get("phone")%></td>
                <td><%=ud.get("dob")%></td>
                <td><%=ud.get("city")%></td>
                <td> <%=ud.get("state")%></td>
<td><a href="ViewUserDetailProcess.jsp?cid=<%=ud.get("cid")%>" class="btn btn-primary" role="button">View Details</a></td>
     
                   </tr>
            
     
           <%
           }

  session.setAttribute("au", null); 
           %>
 </tbody>
     </table>
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

