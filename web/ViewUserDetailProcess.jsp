<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page errorPage="Error.jsp" %>
<%
 int cid=Integer.parseInt(request.getParameter("cid"));   
            HashMap ugd=new HashMap(); // ugd=user get  details
 
 PreparedStatement getStatuswiseCitizenInfo=(PreparedStatement)application.getAttribute("getStatuswiseCitizenInfo"); 
getStatuswiseCitizenInfo.setInt(1, cid);
ResultSet grs=getStatuswiseCitizenInfo.executeQuery();
 
         while(grs.next())
       {
         
            ugd.put("cid",grs.getInt(1));
            ugd.put("name",grs.getString(2));
            ugd.put("fname",grs.getString(3));
            ugd.put("mname",grs.getString(4)); 
            ugd.put("gender",grs.getString(5));
            ugd.put("maritalstatus",grs.getString(6));
            ugd.put("email",grs.getString(7));
            ugd.put("phone",grs.getString(8));
            ugd.put("address",grs.getString(9));
            ugd.put("city",grs.getString(10));
            ugd.put("state",grs.getString(11));
            ugd.put("pincode",grs.getString(12));
            ugd.put("dob",grs.getString(13));
            
            session.setAttribute("ugd", ugd);
                   
         }
               
//.............................................................................................//        
     
 ArrayList sgd=new ArrayList(); // show generate details
 
int f=0; 
PreparedStatement getGenUserDetails=(PreparedStatement)application.getAttribute("getGenUserDetails"); 
getGenUserDetails.setInt(1, cid);
 ResultSet guserrs=getGenUserDetails.executeQuery();

while(guserrs.next())   
{
f=1;
    HashMap sgud=new HashMap(); // show generate user details
            sgud.put("cid",guserrs.getInt(2));
            sgud.put("name",guserrs.getString(3)); 
            sgud.put("fname",guserrs.getString(4));
            sgud.put("cardname",guserrs.getString(5));
            sgud.put("cardno",guserrs.getString(6));
            sgud.put("dob",guserrs.getString(7));
            sgud.put("issuedate",guserrs.getDate(8));
            sgud.put("address",guserrs.getString(9));
            sgud.put("city",guserrs.getString(10));
            sgud.put("state",guserrs.getString(11));
            sgud.put("pincode",guserrs.getString(12));
            sgud.put("validtill",guserrs.getDate(13));            
            sgud.put("gender",guserrs.getString(14));
            sgd.add(sgud); 
}
if(f==1)
{    
      session.setAttribute("sgd", sgd);
              guserrs.close();
            response.sendRedirect("ViewUserDetails.jsp");
}else{
    session.setAttribute("nogendata", "no card issue ");
            session.setAttribute("sgd", null);
            response.sendRedirect("ViewUserDetails.jsp");
}










%>