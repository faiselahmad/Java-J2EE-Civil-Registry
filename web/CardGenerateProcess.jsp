<%@page import="java.io.InputStream"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Calendar"%> 
<%@page import="java.text.*"%>
<%@page errorPage="Error.jsp" %>
<%     try{ 
     Calendar date = Calendar.getInstance(); 
     Date currentdate = date.getTime();      
     java.sql.Date scd=new java.sql.Date(currentdate.getTime());//scd=sqlcurrentdate
   
   
     String departmenttype=(String)session.getAttribute("departmenttype"); 
     System.out.println("zz");
     int cid=Integer.parseInt(request.getParameter("cid"));
     System.out.println(cid);
     
  HashMap sud =(HashMap)session.getAttribute("sud");  
  
  if(departmenttype.equalsIgnoreCase("AADHAR CARD"))
  {                           
                            long ano=0;
                            ano=(Long)session.getAttribute("ano"); 
                            PreparedStatement updateAadharno=(PreparedStatement)application.getAttribute("updateAadharno"); 
                            updateAadharno.setLong(1,ano);
                            updateAadharno.setString(2,"Generated"); 
                            updateAadharno.setInt(3, cid);
                            
   //.............................................................................................//                         
                           
        PreparedStatement insertGeneratedUser=(PreparedStatement)application.getAttribute("insertGeneratedUser"); 
                          
                  insertGeneratedUser.setInt(1,(Integer)sud.get("cid"));
                  insertGeneratedUser.setString(2,(String)sud.get("name"));
                  insertGeneratedUser.setString(3,(String)sud.get("fname"));
                  insertGeneratedUser.setString(4,departmenttype);
                  insertGeneratedUser.setLong(5,ano);
                  insertGeneratedUser.setString(6,(String)sud.get("dob"));
                  insertGeneratedUser.setDate(7,scd); 
                  insertGeneratedUser.setString(8,(String)sud.get("address"));
                  insertGeneratedUser.setString(9,(String)sud.get("city"));
                  insertGeneratedUser.setString(10,(String)sud.get("state"));
                  insertGeneratedUser.setString(11,(String)sud.get("pincode"));
                  insertGeneratedUser.setString(12,null);   
                  insertGeneratedUser.setString(13,(String)sud.get("gender"));    
                  insertGeneratedUser.setBinaryStream(14,(InputStream)sud.get("photo")); 
                  insertGeneratedUser.executeUpdate();
                          
  //...................................................................................................//                          
                   updateAadharno.executeUpdate();
                    session.setAttribute("done", "Aadhar Card generate successful "); 
                                                     
  }
  
  //............................................................................................................//
  
  else if(departmenttype.equalsIgnoreCase("VOTER CARD"))
  {
       date.add(Calendar.YEAR,5);
    Date validdate = date.getTime();  
     java.sql.Date svd=new java.sql.Date(validdate.getTime());//svd=sqlvaliddate
    
                            
                            String vno=(String)session.getAttribute("vno"); 
                            PreparedStatement updateVotercardno=(PreparedStatement)application.getAttribute("updateVotercardno"); 
                            updateVotercardno.setString(1,vno);  
                            updateVotercardno.setString(2,"Generated");
                            updateVotercardno.setInt(3, cid);
                            
             //.............................................................................................//                         
                               
        PreparedStatement insertGeneratedUser=(PreparedStatement)application.getAttribute("insertGeneratedUser"); 
                          
                  insertGeneratedUser.setInt(1,(Integer)sud.get("cid"));
                  insertGeneratedUser.setString(2,(String)sud.get("name"));
                  insertGeneratedUser.setString(3,(String)sud.get("fname"));
                  insertGeneratedUser.setString(4,departmenttype);
                  insertGeneratedUser.setString(5,vno);
                  insertGeneratedUser.setString(6,(String)sud.get("dob"));
                  insertGeneratedUser.setDate(7,scd);
                  insertGeneratedUser.setString(8,(String)sud.get("address"));
                  insertGeneratedUser.setString(9,(String)sud.get("city"));
                  insertGeneratedUser.setString(10,(String)sud.get("state"));
                  insertGeneratedUser.setString(11,(String)sud.get("pincode"));
                  insertGeneratedUser.setDate(12,svd);
                  insertGeneratedUser.setString(13,(String)sud.get("gender"));
                insertGeneratedUser.setBinaryStream(14,(InputStream)sud.get("photo"));
                insertGeneratedUser.executeUpdate();
                            
  //...................................................................................................//                          
                            
                            
                            updateVotercardno.executeUpdate();
                            session.setAttribute("done", "Voter Card generate successful");
  }
  
  //.............................................................................................................//
  
  else if(departmenttype.equalsIgnoreCase("PANCARD")){
  
               String panno=(String)session.getAttribute("panno"); 
                            PreparedStatement updatePancardno=(PreparedStatement)application.getAttribute("updatePancardno"); 
                            updatePancardno.setString(1,panno);
                            updatePancardno.setString(2,"Generated");
                            updatePancardno.setInt(3, cid);
                            
 //.............................................................................................//                         
                             
        PreparedStatement insertGeneratedUser=(PreparedStatement)application.getAttribute("insertGeneratedUser"); 
                          
                  insertGeneratedUser.setInt(1,(Integer)sud.get("cid"));
                  insertGeneratedUser.setString(2,(String)sud.get("name"));
                  insertGeneratedUser.setString(3,(String)sud.get("fname"));
                  insertGeneratedUser.setString(4,departmenttype);
                  insertGeneratedUser.setString(5,panno);
                  insertGeneratedUser.setString(6,(String)sud.get("dob"));
                  insertGeneratedUser.setDate(7,scd);
                  insertGeneratedUser.setString(8,(String)sud.get("address"));
                  insertGeneratedUser.setString(9,(String)sud.get("city"));
                  insertGeneratedUser.setString(10,(String)sud.get("state"));
                  insertGeneratedUser.setString(11,(String)sud.get("pincode"));
                  insertGeneratedUser.setString(12,null);  
                  insertGeneratedUser.setString(13,(String)sud.get("gender"));
                  insertGeneratedUser.setBinaryStream(14,(InputStream)sud.get("photo"));
                insertGeneratedUser.executeUpdate();
                           
  //...................................................................................................//                       
                            updatePancardno.executeUpdate();
                             session.setAttribute("done", "Pancard generate successful");
                            
  }
  //..........................................................................................................//
  else if(departmenttype.equalsIgnoreCase("PASSPORT")){
      
       date.add(Calendar.YEAR,10);
    Date validdate = date.getTime();  
     java.sql.Date svd=new java.sql.Date(validdate.getTime());//svd=sqlvaliddate
    
  
               StringBuffer pno=(StringBuffer)session.getAttribute("pno"); 
                            PreparedStatement updatePassportno=(PreparedStatement)application.getAttribute("updatePassportno"); 
                            updatePassportno.setString(1,pno+"");  
                            updatePassportno.setString(2,"Generated");
                            updatePassportno.setInt(3, cid);
 //.............................................................................................//                         
                            
        PreparedStatement insertGeneratedUser=(PreparedStatement)application.getAttribute("insertGeneratedUser"); 
                          
                  insertGeneratedUser.setInt(1,(Integer)sud.get("cid"));
                  insertGeneratedUser.setString(2,(String)sud.get("name"));
                  insertGeneratedUser.setString(3,(String)sud.get("fname"));
                  insertGeneratedUser.setString(4,departmenttype);
                  insertGeneratedUser.setString(5,pno+""); 
                  insertGeneratedUser.setString(6,(String)sud.get("dob"));
                  insertGeneratedUser.setDate(7,scd);
                  insertGeneratedUser.setString(8,(String)sud.get("address"));
                  insertGeneratedUser.setString(9,(String)sud.get("city"));
                  insertGeneratedUser.setString(10,(String)sud.get("state")+"(INDIA)");
                  insertGeneratedUser.setString(11,(String)sud.get("pincode"));
                  insertGeneratedUser.setDate(12,svd);
                  insertGeneratedUser.setString(13,(String)sud.get("gender"));
                  insertGeneratedUser.setBinaryStream(14,(InputStream)sud.get("photo"));
                insertGeneratedUser.executeUpdate();
                             
  //...................................................................................................//                             
                            updatePassportno.executeUpdate();
                            session.setAttribute("done", "Passport generate successful");
  }
 //............................................................................................................// 
  else if(departmenttype.equalsIgnoreCase("DRIVING LICENCE")){
     
      date.add(Calendar.YEAR,18);
    Date validdate = date.getTime();  
     java.sql.Date svd=new java.sql.Date(validdate.getTime());//svd=sqlvaliddate
    
  
                String dlno=(String)session.getAttribute("dlno"); 
                            PreparedStatement updateDLIdno=(PreparedStatement)application.getAttribute("updateDLIdno"); 
                            updateDLIdno.setString(1,dlno); 
                            updateDLIdno.setString(2,"Generated");
                            updateDLIdno.setInt(3, cid);
 //.............................................................................................//                         
                            
        PreparedStatement insertGeneratedUser=(PreparedStatement)application.getAttribute("insertGeneratedUser"); 
                          
                  insertGeneratedUser.setInt(1,(Integer)sud.get("cid"));
                  insertGeneratedUser.setString(2,(String)sud.get("name"));
                  insertGeneratedUser.setString(3,(String)sud.get("fname"));
                  insertGeneratedUser.setString(4,departmenttype);
                  insertGeneratedUser.setString(5,dlno); 
                  insertGeneratedUser.setString(6,(String)sud.get("dob"));
                  insertGeneratedUser.setDate(7,scd); 
                  insertGeneratedUser.setString(8,(String)sud.get("address"));
                  insertGeneratedUser.setString(9,(String)sud.get("city"));
                  insertGeneratedUser.setString(10,(String)sud.get("state"));
                  insertGeneratedUser.setString(11,(String)sud.get("pincode"));
                  insertGeneratedUser.setDate(12,svd);
                  insertGeneratedUser.setString(13,(String)sud.get("gender"));
                  insertGeneratedUser.setBinaryStream(14,(InputStream)sud.get("photo"));
                  insertGeneratedUser.executeUpdate();
                            
  //...................................................................................................// 
                            updateDLIdno.executeUpdate();
                            session.setAttribute("done", "DRIVING LICENCE generate successful");
                           
                             }
  
  else{
  response.sendRedirect("Error2.jsp");  
  }
  
   session.setAttribute("hide", "hidebutton");
   response.sendRedirect("CardGeneratePage.jsp");
}
catch(Exception ex)
{
    ex.printStackTrace();
}
  
%>