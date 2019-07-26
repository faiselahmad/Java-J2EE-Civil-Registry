<%
  String status;  
   String sname=(String)session.getAttribute("sname");
   String aname=(String)session.getAttribute("aname");

  if(sname!=null){  
 status =request.getParameter("status");  
  }
  else{
 
String departmenttype =request.getParameter("departmenttype");
 status =request.getParameter("status");  
session.setAttribute("departmenttype", departmenttype); 
  }

session.setAttribute("status", status); 
response.sendRedirect("AdminViewProcess.jsp"); 
%>