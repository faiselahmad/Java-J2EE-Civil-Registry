<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page errorPage="Error.jsp" %>

<%

String departmenttype=(String)session.getAttribute("departmenttype"); 
    String did=request.getParameter("did");
String pass=new String(request.getParameter("dpass"));
ResultSet drs;


PreparedStatement checkDept=(PreparedStatement)application.getAttribute("checkDept");
checkDept.setString(1,did);
checkDept.setString(2,departmenttype);
checkDept.setString(3,pass);

 drs=checkDept.executeQuery(); 
          if(drs.next()){
           session.setAttribute("sid",drs.getInt(1));
          session.setAttribute("sname",drs.getString(2));
          HashMap dp=new HashMap();
                        dp.put("sid",drs.getString(1));
                        dp.put("sname",drs.getString(2));
                        dp.put("semail",drs.getString(3));
                        dp.put("sphone",drs.getString(4));
                        dp.put("sdob",drs.getString(5)); 
                        dp.put("sgender",drs.getString(6));
                        dp.put("sdept",drs.getString(7));
                        dp.put("saddress",drs.getString(8));
                        dp.put("scity",drs.getString(9));
                        dp.put("sstate",drs.getString(10));
                        dp.put("spincode",drs.getString(11)); 
                        
                        session.setAttribute("dp", dp);                        
                        drs.close();
          response.sendRedirect("DepartmentHomePage.jsp");               
                   }

            else{
        session.setAttribute("dmsg","Wrong Employee id and password");
       response.sendRedirect("Department.jsp");
                     }
          %>
        