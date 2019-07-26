 <%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page errorPage="Error.jsp" %>

<%
 int eid=Integer.parseInt(request.getParameter("eid"));   
             String name=request.getParameter("name");	
            String email=request.getParameter("email");
            String phone=request.getParameter("phone");
            String dob=request.getParameter("dob");
            String gender=request.getParameter("gender");
            String departmenttype=request.getParameter("departmenttype");
             String address=request.getParameter("address");
            String city=request.getParameter("city");	
            String state=request.getParameter("state");
            String pincode=request.getParameter("pincode");
            String pass=request.getParameter("pass");
            
PreparedStatement updateEmp=(PreparedStatement)application.getAttribute("updateEmp");  

            updateEmp.setString(1,name);
            updateEmp.setString(2,email);
            updateEmp.setString(3,phone);
            updateEmp.setString(4,dob);
            updateEmp.setString(5,gender);
            updateEmp.setString(6,departmenttype);// now change in data base query
            updateEmp.setString(7,address);
            updateEmp.setString(8,city);
            updateEmp.setString(9,state);
            updateEmp.setString(10,pincode); 
            updateEmp.setString(11,pass);
            updateEmp.setInt(12, eid);
            updateEmp.executeUpdate();
            
            
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

session.setAttribute("notfound", "update successful");
response.sendRedirect("EmpDetails.jsp"); 
         }
    %>