 <%@page import="java.sql.*"%>
<%@page errorPage="Error.jsp" %>

<%
 int eid=Integer.parseInt(request.getParameter("eid"));  

PreparedStatement deleteEmp=(PreparedStatement)application.getAttribute("deleteEmp");  
  deleteEmp.setInt(1, eid);
            deleteEmp.executeUpdate();
            
session.setAttribute("delete", "delete successful");
response.sendRedirect("ViewAllEmp.jsp"); 
    %>
%>