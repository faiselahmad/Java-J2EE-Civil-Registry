<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page errorPage="Error.jsp" %>
<%
 String aname=(String)session.getAttribute("aname");
String sname=(String)session.getAttribute("sname");  

if(aname!=null || sname!=null){
   String departmenttype=(String)session.getAttribute("departmenttype");
   String status=(String)session.getAttribute("status");
    session.setAttribute("hide", null);// for generate button
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
<title>View Applications</title>

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
                 
          ArrayList sd=(ArrayList)session.getAttribute("sd");
           String data=(String)session.getAttribute("data");
                     if(data!=null)
                     {
                     %><br><br>  
                      <div class="panel panel-warning">
                   <div class="panel-heading">
    <h4 class="panel-title text-center"> <%=data%></h4>
    <%=departmenttype%>&nbsp;(<%=status%>)&nbsp;applications
                </div>
                </div>
                     
                     <%
                         session.setAttribute("data", null);
                         }
else if(sd==null){ 
response.sendRedirect("AdminViewProcess.jsp");

}
 else{
 int count=(Integer)session.getAttribute("count"); 

                     
             %>
   
             <br><br>  
            <div class="row">
        <div class="col-md-12">
    
<div class="panel panel-danger">
    <%
        if(count!=0){
            %> 
<div class="panel-heading"><h3 class="panel-title">
        <%=departmenttype%>&nbsp;(<%=status%>)application<span class="badge"><%=count%></span>
                     </h3>
</div>

            
            <%
        }else{
            %>
        <div class="panel-heading"><h3 class="panel-title">
        <%=departmenttype%>&nbsp;(<%=status%>)application<span class="badge">0</span>
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
                    <th data-field="app no" data-sortable="true">Application no</th>
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
             
          
                        Iterator i=sd.iterator();
                        while(i.hasNext()){
                            HashMap ud=(HashMap)i.next();
                            
                        %>
          <tr>
   <td>
<img  src='GetPic1?cid=<%=ud.get("cid")%>' alt="candidate image" class="img-rounded" height="75" width="75" class="pull-right">
</td>
                <td><%=ud.get("applno")%></td>
                <td><%=ud.get("cid")%></td>
                <td><%=ud.get("name")%></td>
                <td><%=ud.get("gender")%></td>
                <td><%=ud.get("email")%></td>
                <td><%=ud.get("phone")%></td>
                <td><%=ud.get("dob")%></td>
                <td><%=ud.get("city")%></td>
                <td> <%=ud.get("state")%></td>
<td><a href="AdminGetUserDetails.jsp?cid=<%=ud.get("cid")%>" class="btn btn-primary" role="button">View Details</a></td>
     
                   </tr>
            
     
           <%
           }

  session.setAttribute("sd", null); 
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

