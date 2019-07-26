<%@page import="java.sql.*"%>
<%@page errorPage="Error.jsp" %>
<%
 String departmenttype=(String)session.getAttribute("departmenttype"); 
     int cid=Integer.parseInt(request.getParameter("cid"));
 
  
  if(departmenttype.equalsIgnoreCase("AADHAR CARD"))
  {
  
PreparedStatement updateAadharStatus=(PreparedStatement)application.getAttribute("updateAadharStatus"); 
                            
                updateAadharStatus.setString(1,"Accepted");
                updateAadharStatus.setInt(2, cid);
                updateAadharStatus.executeUpdate();
                                   
 }
  
  //............................................................................................................//
  
  else if(departmenttype.equalsIgnoreCase("VOTER CARD"))
  {
  
PreparedStatement updateVotercardStatus=(PreparedStatement)application.getAttribute("updateVotercardStatus");
  
                            updateVotercardStatus.setString(1,"Accepted");
                            updateVotercardStatus.setInt(2, cid);
                            updateVotercardStatus.executeUpdate();
         
  }
  
  //.............................................................................................................//
  
  else if(departmenttype.equalsIgnoreCase("PANCARD")){
  
PreparedStatement updatePancardStatus=(PreparedStatement)application.getAttribute("updatePancardStatus");
  
                            updatePancardStatus.setString(1,"Accepted");
                            updatePancardStatus.setInt(2, cid);
                            updatePancardStatus.executeUpdate();
                                                
  }
  
  else if(departmenttype.equalsIgnoreCase("PASSPORT")){
 
PreparedStatement updatePassportStatus=(PreparedStatement)application.getAttribute("updatePassportStatus");
  
                            updatePassportStatus.setString(1,"Accepted");
                            updatePassportStatus.setInt(2, cid);
                            updatePassportStatus.executeUpdate();
                                                   
  }
  
  else if(departmenttype.equalsIgnoreCase("DRIVING LICENCE")){
  
PreparedStatement updateDLStatus=(PreparedStatement)application.getAttribute("updateDLStatus");
                            updateDLStatus.setString(1,"Accepted");
                            updateDLStatus.setInt(2, cid);
                            updateDLStatus.executeUpdate();
                                 
    }
  
  else{
      
    session.setAttribute("error2", "unidentified department");
  response.sendRedirect("Error2.jsp");
  
  }
  
 response.sendRedirect("AdminViewProcess.jsp");
         
  
  
%>