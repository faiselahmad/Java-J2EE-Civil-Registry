<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<% 
    
     
        
    int ucount=0,f=0;
     ArrayList au=new ArrayList(); //au= all users
     
 PreparedStatement getCitizenRecords=(PreparedStatement)application.getAttribute("getCitizenRecords");   
 ResultSet getRs=getCitizenRecords.executeQuery(); 
            while(getRs.next())
            {
               ucount++; f=1;
 
                HashMap sau=new HashMap(); //single all users
     
                sau.put("cid",getRs.getInt(1));
		sau.put("name",getRs.getString(2));
                //sau.put("fname",getRs.getString(3));
               // sau.put("mname",getRs.getString(4)); 
		sau.put("gender",getRs.getString(5));
	       // sau.put("maritalstatus",getRs.getString(6));
	        sau.put("email",getRs.getString(7));
                sau.put("phone",getRs.getString(8));
		//sau.put("address",getRs.getString(9));
		sau.put("city",getRs.getString(10));
		sau.put("state",getRs.getString(11));
		//sau.put("pincode",getRs.getString(12));
                sau.put("dob",getRs.getString(13)); 
                 au.add(sau);
                
 
                }
            if(f==1){
                           session.setAttribute("ucount", ucount);  
                           session.setAttribute("au", au); 
                           getRs.close();
                           response.sendRedirect("ViewAllUsers.jsp");

            }
           else{

               session.setAttribute("nodata", "No User Data"); 
               response.sendRedirect("ViewAllUsers.jsp");
           }





%>