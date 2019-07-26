<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%
    
    
     String departmenttype=(String)session.getAttribute("departmenttype"); 
     int cid=Integer.parseInt(request.getParameter("cid"));
     
  HashMap sud =(HashMap)session.getAttribute("sud"); //single user data
   

     
 if(departmenttype.equalsIgnoreCase("AADHAR CARD"))
  {                           
              PreparedStatement updateAGen=(PreparedStatement)application.getAttribute("updateAGen"); 
               
                  updateAGen.setString(1,"Generated"); 
                  updateAGen.setInt(2, cid);
   //.............................................................................................//                         
                        
      PreparedStatement updateCardInfo=(PreparedStatement)application.getAttribute("updateCardInfo"); 
                     
                  updateCardInfo.setString(1,(String)sud.get("name"));
                  updateCardInfo.setString(2,(String)sud.get("fname"));
                  updateCardInfo.setString(3,(String)sud.get("dob"));
                  updateCardInfo.setString(4,(String)sud.get("address"));
                  updateCardInfo.setString(5,(String)sud.get("city"));
                  updateCardInfo.setString(6,(String)sud.get("state"));
                  updateCardInfo.setString(7,(String)sud.get("pincode"));
                  updateCardInfo.setString(8,(String)sud.get("gender"));  
                  updateCardInfo.setBinaryStream(9,(InputStream)sud.get("photo"));
                  updateCardInfo.setInt(10,cid);
                  updateCardInfo.setString(11,departmenttype);
                  updateCardInfo.executeUpdate();
                               
  //...................................................................................................//                          
                   
                  updateAGen.executeUpdate();
                                                     
  }
  
  //............................................................................................................//
  
  else if(departmenttype.equalsIgnoreCase("VOTER CARD"))
  {
                            
PreparedStatement updateVGen=(PreparedStatement)application.getAttribute("updateVGen");  
               
                  updateVGen.setString(1,"Generated"); 
                  updateVGen.setInt(2, cid);
 //.................................................................................................
                   
                        
      PreparedStatement updateCardInfo=(PreparedStatement)application.getAttribute("updateCardInfo"); 
                     
                  
                  updateCardInfo.setString(1,(String)sud.get("name"));
                  updateCardInfo.setString(2,(String)sud.get("fname"));
                  updateCardInfo.setString(3,(String)sud.get("dob"));
                  updateCardInfo.setString(4,(String)sud.get("address"));
                  updateCardInfo.setString(5,(String)sud.get("city"));
                  updateCardInfo.setString(6,(String)sud.get("state"));
                  updateCardInfo.setString(7,(String)sud.get("pincode"));
                  updateCardInfo.setString(8,(String)sud.get("gender"));   
                  updateCardInfo.setBinaryStream(9,(InputStream)sud.get("photo"));
                  updateCardInfo.setInt(10,cid);
                  updateCardInfo.setString(11,departmenttype);
                  updateCardInfo.executeUpdate();
                        
 
 //..................................................................................................
                  
                  
                  updateVGen.executeUpdate(); 
  }
  
  //.............................................................................................................//
  
  else if(departmenttype.equalsIgnoreCase("PANCARD")){
  
      PreparedStatement updatePGen=(PreparedStatement)application.getAttribute("updatePGen"); 
               
                  updatePGen.setString(1,"Generated"); 
                  updatePGen.setInt(2, cid);
                            
 //.............................................................................................//                         
                                              
                        
      PreparedStatement updateCardInfo=(PreparedStatement)application.getAttribute("updateCardInfo"); 
                     
                  
                  updateCardInfo.setString(1,(String)sud.get("name"));
                  updateCardInfo.setString(2,(String)sud.get("fname"));
                  updateCardInfo.setString(3,(String)sud.get("dob"));
                  updateCardInfo.setString(4,(String)sud.get("address"));
                  updateCardInfo.setString(5,(String)sud.get("city"));
                  updateCardInfo.setString(6,(String)sud.get("state"));
                  updateCardInfo.setString(7,(String)sud.get("pincode"));
                  updateCardInfo.setString(8,(String)sud.get("gender"));  
                  updateCardInfo.setBinaryStream(9,(InputStream)sud.get("photo"));
                  updateCardInfo.setInt(10,cid);
                  updateCardInfo.setString(11,departmenttype);
                  updateCardInfo.executeUpdate();
                         
                             
  //...................................................................................................//                       
                 
                  updatePGen.executeUpdate();          
                            
  }
  //..........................................................................................................//
  else if(departmenttype.equalsIgnoreCase("PASSPORT")){
  
PreparedStatement updatePassGen=(PreparedStatement)application.getAttribute("updatePassGen");  
               
                  updatePassGen.setString(1,"Generated"); 
                  updatePassGen.setInt(2, cid);
 //.............................................................................................//                         
                                  
                        
      PreparedStatement updateCardInfo=(PreparedStatement)application.getAttribute("updateCardInfo"); 
                     
                  
                  updateCardInfo.setString(1,(String)sud.get("name"));
                  updateCardInfo.setString(2,(String)sud.get("fname"));
                  updateCardInfo.setString(3,(String)sud.get("dob"));
                  updateCardInfo.setString(4,(String)sud.get("address"));
                  updateCardInfo.setString(5,(String)sud.get("city"));
                  updateCardInfo.setString(6,(String)sud.get("state")+"(INDIA)");
                  updateCardInfo.setString(7,(String)sud.get("pincode"));
                  updateCardInfo.setString(8,(String)sud.get("gender"));   
                  updateCardInfo.setBinaryStream(9,(InputStream)sud.get("photo"));
                  updateCardInfo.setInt(10,cid);
                  updateCardInfo.setString(11,departmenttype);
                  updateCardInfo.executeUpdate();
                            
  //...................................................................................................//                             
                          
                  updatePassGen.executeUpdate();
  }
 //............................................................................................................// 
  else if(departmenttype.equalsIgnoreCase("DRIVING LICENCE")){
  
                PreparedStatement updateDLGen=(PreparedStatement)application.getAttribute("updateDLGen");  
               
                  updateDLGen.setString(1,"Generated"); 
                  updateDLGen.setInt(2, cid);
 //.............................................................................................//                         
                            
                                            
                        
      PreparedStatement updateCardInfo=(PreparedStatement)application.getAttribute("updateCardInfo"); 
                     
                  
                  updateCardInfo.setString(1,(String)sud.get("name"));
                  updateCardInfo.setString(2,(String)sud.get("fname"));
                  updateCardInfo.setString(3,(String)sud.get("dob"));
                  updateCardInfo.setString(4,(String)sud.get("address"));
                  updateCardInfo.setString(5,(String)sud.get("city"));
                  updateCardInfo.setString(6,(String)sud.get("state"));
                  updateCardInfo.setString(7,(String)sud.get("pincode"));
                  updateCardInfo.setString(8,(String)sud.get("gender"));   
                  updateCardInfo.setBinaryStream(9,(InputStream)sud.get("photo"));
                  updateCardInfo.setInt(10,cid);
                  updateCardInfo.setString(11,departmenttype);
                  updateCardInfo.executeUpdate();
                           
  //...................................................................................................// 
                          
                  updateDLGen.executeUpdate();
                           
                             }
  
            else{
    session.setAttribute("error2", "unidentified department");
  response.sendRedirect("Error2.jsp");
    
            }
  
   response.sendRedirect("AdminViewProcess.jsp");
  
%>