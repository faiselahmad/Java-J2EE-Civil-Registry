<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page errorPage="Error.jsp" %>
<%
    
  String departmenttype=(String)session.getAttribute("departmenttype"); 
   String status=(String)session.getAttribute("status");
    if(departmenttype!=null && status!=null){ 
    ArrayList sd=new ArrayList();
 ResultSet rs;
 int count=0;   
 int f=0; 

if(departmenttype.equalsIgnoreCase("AADHAR CARD"))
  {
   PreparedStatement aadhar=(PreparedStatement)application.getAttribute("aadhar");     
         aadhar.setString(1, status);
       rs=  aadhar.executeQuery();
      
        
         while(rs.next())
       {
            f=1;count++; 
            HashMap ud=new HashMap();
            ud.put("applno",rs.getInt(1));
            ud.put("cid",rs.getInt(2));
            ud.put("aadharstatus",rs.getString(4));
            ud.put("name",rs.getString(15));
            ud.put("fname",rs.getString(16));
            ud.put("mname",rs.getString(17)); 
            ud.put("gender",rs.getString(18));
            ud.put("maritalstatus",rs.getString(19));
            ud.put("email",rs.getString(20));
            ud.put("phone",rs.getString(21));
            ud.put("address",rs.getString(22));
            ud.put("city",rs.getString(23));
            ud.put("state",rs.getString(24));
            ud.put("pincode",rs.getString(25));
            ud.put("dob",rs.getString(26));  
            sd.add(ud); 
            
        }
       
       
         }

else if(departmenttype.equalsIgnoreCase("VOTER CARD"))
  {
   PreparedStatement voter=(PreparedStatement)application.getAttribute("voter");     
         voter.setString(1, status);
       rs=  voter.executeQuery();
      
         while(rs.next())
       {    HashMap ud=new HashMap();
            f=1;count++;
            ud.put("applno",rs.getInt(1));
            ud.put("cid",rs.getInt(2));
            ud.put("aadharstatus",rs.getString(4));
            ud.put("name",rs.getString(15));
            ud.put("fname",rs.getString(16));
            ud.put("mname",rs.getString(17)); 
            ud.put("gender",rs.getString(18));
            ud.put("maritalstatus",rs.getString(19));
            ud.put("email",rs.getString(20));
            ud.put("phone",rs.getString(21));
            ud.put("address",rs.getString(22));
            ud.put("city",rs.getString(23));
            ud.put("state",rs.getString(24));
            ud.put("pincode",rs.getString(25));
            ud.put("dob",rs.getString(26)); 
            sd.add(ud); 
            
        }
        
         }

else if(departmenttype.equalsIgnoreCase("PANCARD"))
  {
   PreparedStatement pancard=(PreparedStatement)application.getAttribute("pancard");     
         pancard.setString(1, status);
       rs=  pancard.executeQuery();
       
         while(rs.next())
       {    HashMap ud=new HashMap();
            f=1;count++; 
            ud.put("applno",rs.getInt(1));
            ud.put("cid",rs.getInt(2));
            ud.put("aadharstatus",rs.getString(4));
            ud.put("name",rs.getString(15));
            ud.put("fname",rs.getString(16));
            ud.put("mname",rs.getString(17)); 
            ud.put("gender",rs.getString(18));
            ud.put("maritalstatus",rs.getString(19));
            ud.put("email",rs.getString(20));
            ud.put("phone",rs.getString(21));
            ud.put("address",rs.getString(22));
            ud.put("city",rs.getString(23));
            ud.put("state",rs.getString(24));
            ud.put("pincode",rs.getString(25));
            ud.put("dob",rs.getString(26)); 
            sd.add(ud); 
            
        }
       
         }


else if(departmenttype.equalsIgnoreCase("PASSPORT"))
  {
   PreparedStatement passport=(PreparedStatement)application.getAttribute("passport");     
         passport.setString(1, status);
       rs=  passport.executeQuery();
     
         while(rs.next())
       {    HashMap ud=new HashMap();
            f=1;count++;
            ud.put("applno",rs.getInt(1));
            ud.put("cid",rs.getInt(2));
            ud.put("aadharstatus",rs.getString(4));
            ud.put("name",rs.getString(15));
            ud.put("fname",rs.getString(16));
            ud.put("mname",rs.getString(17)); 
            ud.put("gender",rs.getString(18));
            ud.put("maritalstatus",rs.getString(19));
            ud.put("email",rs.getString(20));
            ud.put("phone",rs.getString(21));
            ud.put("address",rs.getString(22));
            ud.put("city",rs.getString(23));
            ud.put("state",rs.getString(24));
            ud.put("pincode",rs.getString(25));
            ud.put("dob",rs.getString(26)); 
            sd.add(ud); 
            
        }
       
         }


else 
  {
   PreparedStatement dl=(PreparedStatement)application.getAttribute("dl");     
         dl.setString(1, status);
       rs=  dl.executeQuery();
     
         while(rs.next())
       {    HashMap ud=new HashMap();
            f=1;count++;
            ud.put("applno",rs.getInt(1));
            ud.put("cid",rs.getInt(2));
            ud.put("aadharstatus",rs.getString(4));
            ud.put("name",rs.getString(15));
            ud.put("fname",rs.getString(16));
            ud.put("mname",rs.getString(17)); 
            ud.put("gender",rs.getString(18));
            ud.put("maritalstatus",rs.getString(19));
            ud.put("email",rs.getString(20));
            ud.put("phone",rs.getString(21));
            ud.put("address",rs.getString(22));
            ud.put("city",rs.getString(23));
            ud.put("state",rs.getString(24));
            ud.put("pincode",rs.getString(25));
            ud.put("dob",rs.getString(26)); 
            sd.add(ud); 
            
        }
        
         }

 


 if(f==1){
           
            session.setAttribute("sd", sd);
            session.setAttribute("count", count);
             rs.close(); 
            response.sendRedirect("AdminViewPage.jsp");
        }
      else
        {
            session.setAttribute("data","No Data Found!!");
            response.sendRedirect("AdminViewPage.jsp");
        } 
      }
    
     
    else{
                    
            String sname=(String)session.getAttribute("sname");   
                if(sname!=null){   
                response.sendRedirect("DepartmentHomePage.jsp");
                    }
                 else{  
                  response.sendRedirect("OfficialHomePage.jsp");
                   }
    }


%>