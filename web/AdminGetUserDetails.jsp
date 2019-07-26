<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%
 int cid=Integer.parseInt(request.getParameter("cid"));   
 
   PreparedStatement getStatuswiseCitizenInfo=(PreparedStatement)application.getAttribute("getStatuswiseCitizenInfo"); 
getStatuswiseCitizenInfo.setInt(1, cid);
ResultSet grs=getStatuswiseCitizenInfo.executeQuery();
            HashMap sud=new HashMap(); // sud=single User Data
 
         if(grs.next())
       {
         
            sud.put("cid",grs.getInt(1));
            sud.put("name",grs.getString(2));
            sud.put("fname",grs.getString(3));
            sud.put("mname",grs.getString(4)); 
            sud.put("gender",grs.getString(5));
            sud.put("maritalstatus",grs.getString(6));
            sud.put("email",grs.getString(7));
            sud.put("phone",grs.getString(8));
            sud.put("address",grs.getString(9));
            sud.put("city",grs.getString(10));
            sud.put("state",grs.getString(11));
            sud.put("pincode",grs.getString(12));
            sud.put("dob",grs.getString(13));
            sud.put("photo",grs.getBinaryStream(14));   
            session.setAttribute("sud", sud);
               grs.close();
            response.sendRedirect("AdminViewDetails.jsp");         
         }
               
        
       

%>