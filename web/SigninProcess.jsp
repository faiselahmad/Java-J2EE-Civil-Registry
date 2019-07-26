<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page errorPage="Error.jsp" %>
<%
       
    String email = request.getParameter("email");
    String pass  =  request.getParameter("pass");

   PreparedStatement checkUser=(PreparedStatement)application.getAttribute("checkUser");
     
checkUser.setString(1, email);
checkUser.setString(2, pass);
ResultSet prs=checkUser.executeQuery();
if(prs.next()){
    
session.setAttribute("cid",prs.getInt(1));
session.setAttribute("cname",prs.getString(2));
       
            HashMap ud=new HashMap(); // ud= User Data
            ud.put("cid",prs.getInt(1));
            ud.put("name",prs.getString(2));
            ud.put("fname",prs.getString(3));
            ud.put("mname",prs.getString(4)); 
            ud.put("gender",prs.getString(5));
            ud.put("maritalstatus",prs.getString(6));
            ud.put("email",prs.getString(7));
            ud.put("phone",prs.getString(8));
            ud.put("address",prs.getString(9));
            ud.put("city",prs.getString(10));
            ud.put("state",prs.getString(11));
            ud.put("pincode",prs.getString(12));
            ud.put("dob",prs.getString(13)); 
            session.setAttribute("ud", ud); 
                        prs.close();
        
response.sendRedirect("index.jsp");
}
else{
session.setAttribute("imsg", "user does not exist");
response.sendRedirect("index.jsp");
}
%>