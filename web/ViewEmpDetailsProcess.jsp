 <%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page errorPage="Error.jsp" %>

<%
 int eid=Integer.parseInt(request.getParameter("eid"));    
 PreparedStatement getEmpRecord=(PreparedStatement)application.getAttribute("getEmpRecord");    
 getEmpRecord.setInt(1, eid); 
          ResultSet gER=  getEmpRecord.executeQuery();
         if(gER.next()){
            HashMap edata=new HashMap(); 
    edata.put("eid", gER.getInt(1)); 
    edata.put("ename", gER.getString(2));
    edata.put("eemail", gER.getString(3));
    edata.put("ephone", gER.getString(4));
    edata.put("edob",gER.getString(5));
    edata.put("egender",gER.getString(6)); 
    edata.put("edept",gER.getString(7));
    edata.put("eaddress",gER.getString(8));
    edata.put("ecity",gER.getString(9));
    edata.put("estate",gER.getString(10)); 
    edata.put("epincode",gER.getString(11));
    edata.put("epass",gER.getString(12));
    
session.setAttribute("edata", edata);
gER.close();
response.sendRedirect("EmpDetails.jsp"); 
             
             
         }else{
         
session.setAttribute("notfound", "no data found");
gER.close();
response.sendRedirect("EmpDetails.jsp"); 
             
         
         }

    %>