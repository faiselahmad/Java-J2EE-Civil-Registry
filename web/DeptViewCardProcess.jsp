<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%
    
 int cid=Integer.parseInt(request.getParameter("cid")); 
  String cardname=(String)session.getAttribute("departmenttype"); 
  PreparedStatement getGenUser=(PreparedStatement)application.getAttribute("getGenUser"); 
getGenUser.setInt(1, cid);
getGenUser.setString(2, cardname);
ResultSet guserrs=getGenUser.executeQuery();

         if(guserrs.next())
       {
          
            HashMap vud=new HashMap(); // vud=view User Data
            vud.put("cid",guserrs.getInt(2));
            vud.put("name",guserrs.getString(3)); 
            vud.put("fname",guserrs.getString(4));
            vud.put("cardname",guserrs.getString(5));
            vud.put("cardno",guserrs.getString(6));
            vud.put("dob",guserrs.getString(7));
            vud.put("issuedate",guserrs.getDate(8));
            vud.put("address",guserrs.getString(9));
            vud.put("city",guserrs.getString(10));
            vud.put("state",guserrs.getString(11));
            vud.put("pincode",guserrs.getString(12));
            vud.put("validtill",guserrs.getDate(13));            
            vud.put("gender",guserrs.getString(14));
            vud.put("photo",guserrs.getString(15));
             
            session.setAttribute("vud", vud);
             guserrs.close();
            response.sendRedirect("ViewCard.jsp");
        }
        
            

%>