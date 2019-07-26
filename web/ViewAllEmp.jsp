<%@page import="java.util.*"%>
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
<title>View All Employees</title>

<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/bootstrap-table.css" rel="stylesheet">
</head>

<body style="background-color: gainsboro">
	
    <%@ include file="HeaderA1.html" %>
		
	<br><br>
        <div class="container-fluid">
            
            
             <div class="text-center">
                <div class="btn-group" role="group"  >
  <a href="OfficialHomePage.jsp" type="button" class="btn btn-primary">Home</a>
                </div>
                <div class="btn-group" role="group"  >
  <a href="RegEmp.jsp" type="button" class="btn btn-primary">Register New Employee</a>
                </div>
                
                <div class="btn-group" role="group" >
  <a href="ViewAllEmp.jsp" type="button" class="btn btn-primary">Delete Employee</a>
</div>
                 <div class="btn-group" role="group" >
  <a href="ViewAllEmp.jsp" type="button" class="btn btn-primary">Update Employee</a>
</div>
                 <div class="btn-group" role="group" >
  <a href="ViewAllEmp.jsp" type="button" class="btn btn-primary">View All Employee</a>
</div>
        </div> 
            
	
            <% 
                 
          ArrayList ae=(ArrayList)session.getAttribute("ae");
           String delete=(String)session.getAttribute("delete");
                     if(delete!=null)
                     {
                     %><br><br>  
                      <div class="panel panel-warning">
                   <div class="panel-heading">
    <h4 class="panel-title text-center"> <%=delete%></h4> 
                </div>
                </div>
                     
                     <%
               session.setAttribute("delete", null);
                         }
else if(ae==null){ 
response.sendRedirect("ViewAllEmpProcess.jsp");

}
 else{
 int scount=(Integer)session.getAttribute("scount"); 

                     
             %>
    
            
            
            
            
            
            
            
            
            
<br><br>
         <div class="row">
        <div class="col-md-12">
        
          
 <div class="panel panel-primary">
      <%
        if(scount!=0){
            %> 
<div class="panel-heading"><h3 class="panel-title">
        Total Employee<span class="badge"><%=scount%></span> 
                     </h3>
</div>

            
            <%
        }else{
            %>
        <div class="panel-heading"><h3 class="panel-title">
        Total Employee<span class="badge">0</span>
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
                    <th data-field="EID" data-sortable="true">EID</th>
                   <th data-field="name"  data-sortable="true">Name</th>						       
                    <th data-field="Email" data-sortable="true">Email</th>
                   <th data-field="Phone" data-sortable="true">Phone</th>
                   <th data-field="Department" data-sortable="true">Department</th>
                   <th data-field="Date Of Birth" data-sortable="true">Date Of Birth</th>
                  <th data-field="city"  data-sortable="true">City</th>
                  <th data-field="state"  data-sortable="true">State</th>
                  <th data-field="pass"  data-sortable="true">password</th>
                  <th  data-sortable="true"></th>
               </tr>
		 </thead>
                 <tbody>  
                             <%
             
          
                        Iterator i=ae.iterator();
                        while(i.hasNext()){
                            HashMap ss=(HashMap)i.next();
                            
                        %>
          <tr>                
<td>
<img alt="citizen-image" src="GetEmpPic?eid=<%=ss.get("eid")%>" class="img-rounded" height="40" width="50">
</td>
                <td><%=ss.get("eid")%></td>
                <td><%=ss.get("ename")%></td>
                <td><%=ss.get("eemail")%></td>
                <td><%=ss.get("ephone")%></td> 
                <td><%=ss.get("edept")%></td>
                <td><%=ss.get("edob")%></td>
                <td><%=ss.get("ecity")%></td>
               <td> <%=ss.get("estate")%></td>
               <td> <%=ss.get("epass")%></td>
               
 <td><p><a href="ViewEmpDetailsProcess.jsp?eid=<%=ss.get("eid")%>" class="btn btn-primary" role="button">Edit</a>
    <a href="DeleteEmpProcess.jsp?eid=<%=ss.get("eid")%>" class="btn btn-primary" role="button">Delete</a></p>
     </td>
                   </tr>
            <%
                }
      session.setAttribute("ae", null);
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
        response.sendRedirect("Official.jsp");
}
   %>