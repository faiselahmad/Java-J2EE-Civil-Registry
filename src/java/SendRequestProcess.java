
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;


@MultipartConfig(maxFileSize = 16177215)
public class SendRequestProcess extends HttpServlet {

    
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session=request.getSession();
        ServletContext application=getServletContext();
        
        response.setContentType("text/html;charset=UTF-8");
        try {
            
          int cid=(Integer)session.getAttribute("cid"); //from Login session
          String documentname=request.getParameter("documentname");//from hidden field form
          String status=request.getParameter("status");
         
         InputStream idproof = null, marksheet = null, birthcertificate = null;  
           
         Part idproof1 = request.getPart("idproof");
             idproof = idproof1.getInputStream();
          String idprooffilename=idproof1.getSubmittedFileName();
 //...............................................................................................//
 
          Part marksheet1 = request.getPart("marksheet");
                marksheet = marksheet1.getInputStream();
           String marksheetfilename=marksheet1.getSubmittedFileName();
  //...............................................................................................//
  
           Part birthCertificate1 = request.getPart("birthcertificate");
                birthcertificate = birthCertificate1.getInputStream();
            String birthcertificatefilename=birthCertificate1.getSubmittedFileName();
  //................................................................................................// 
           String idproofno=request.getParameter("idproofno");
          String marksheetno=request.getParameter("marksheetno");	
          String birthcertificateno=request.getParameter("birthcertificateno");
  //.................................................................................................//
  
 //......................... for aadhar card query insertion.............................................................//
  
  if(documentname.equalsIgnoreCase("aadharcard")){
 
   
                     if(status.equalsIgnoreCase("Rejected")){
                                          
                                           
                                      PreparedStatement updateAadharCardUser=(PreparedStatement)application.getAttribute("updateAadharCardUser");
                                      updateAadharCardUser.setString(1,"Waiting");
                                      updateAadharCardUser.setBinaryStream(2, idproof);
                                      updateAadharCardUser.setString(3, idprooffilename);
                                      updateAadharCardUser.setString(4,idproofno);
                                      updateAadharCardUser.setBinaryStream(5, marksheet);
                                      updateAadharCardUser.setString(6,marksheetfilename);
                                      updateAadharCardUser.setString(7,marksheetno);
                                      updateAadharCardUser.setBinaryStream(8, birthcertificate);
                                      updateAadharCardUser.setString(9,birthcertificatefilename);
                                      updateAadharCardUser.setString(10,birthcertificateno);
                                      updateAadharCardUser.setInt(11,cid);
                                      
                                      updateAadharCardUser.executeUpdate();     

                                      session.setAttribute("msg"," You have Successfully sent request");
                                      response.sendRedirect("ApplyAadharCard.jsp"); 
                                                  
                                         }else{
      PreparedStatement checkBirthCertificateNo=(PreparedStatement)application.getAttribute("checkBirthCertificateNo");
      checkBirthCertificateNo.setString(1, birthcertificateno);
      ResultSet rs=checkBirthCertificateNo.executeQuery();
                                if(rs.next()){
                                session.setAttribute("msg", "sorry.... your Aadhar card hasbeen generated along this birth-certificate number ");
                                response.sendRedirect("ApplyAadharCard.jsp"); 

                                }else{
                                              
                                        PreparedStatement insertAadharCardUser=(PreparedStatement)application.getAttribute("insertAadharCardUser");

                                      insertAadharCardUser.setInt(1,cid);
                                      insertAadharCardUser.setInt(2,0);
                                      insertAadharCardUser.setString(3,"Waiting");
                                      insertAadharCardUser.setBinaryStream(4, idproof);
                                      insertAadharCardUser.setString(5, idprooffilename);
                                      insertAadharCardUser.setString(6,idproofno);
                                      insertAadharCardUser.setBinaryStream(7, marksheet);
                                      insertAadharCardUser.setString(8,marksheetfilename);
                                      insertAadharCardUser.setString(9,marksheetno);
                                      insertAadharCardUser.setBinaryStream(10, birthcertificate);
                                      insertAadharCardUser.setString(11,birthcertificatefilename);
                                      insertAadharCardUser.setString(12,birthcertificateno);

                                      insertAadharCardUser.executeUpdate();     

                                      session.setAttribute("msg"," You have Successfully sent request");
                                      response.sendRedirect("ApplyAadharCard.jsp"); 
                                          
                                          
                                          }
                                   
                                    }
  }

 
   //................ for voter card query insertion....................................................//
  
  else if(documentname.equalsIgnoreCase("votercard")){
  
   
                                        
                                    if(status.equalsIgnoreCase("Rejected")){
                                          
                                           
                                     PreparedStatement updateVoterCardUser=(PreparedStatement)application.getAttribute("updateVoterCardUser");
                                      updateVoterCardUser.setString(1,"Waiting");
                                      updateVoterCardUser.setBinaryStream(2, idproof);
                                      updateVoterCardUser.setString(3, idprooffilename);
                                      updateVoterCardUser.setString(4,idproofno);
                                      updateVoterCardUser.setBinaryStream(5, marksheet);
                                      updateVoterCardUser.setString(6,marksheetfilename);
                                      updateVoterCardUser.setString(7,marksheetno);
                                      updateVoterCardUser.setBinaryStream(8, birthcertificate);
                                      updateVoterCardUser.setString(9,birthcertificatefilename);
                                      updateVoterCardUser.setString(10,birthcertificateno);
                                      updateVoterCardUser.setInt(11,cid);
                                      
                                      updateVoterCardUser.executeUpdate();     

                                      session.setAttribute("msg"," You have Successfully sent request");
                                      response.sendRedirect("ApplyVoterCard.jsp"); 
                                                  
                                         }else{
               PreparedStatement checkadhar=(PreparedStatement)application.getAttribute("checkadhar");

    checkadhar.setString(1, idproofno);
      ResultSet rs=checkadhar.executeQuery();
                               
                                if(rs.next()){
                                session.setAttribute("msg", "sorry.... your voter card hasbeen generated along this aadharcard number ");
                                response.sendRedirect("ApplyVoterCard.jsp"); 

                                }else{
                                     PreparedStatement insertVoterIdCardUser=(PreparedStatement)application.getAttribute("insertVoterIdCardUser");

                                      insertVoterIdCardUser.setInt(1,cid);
                                      insertVoterIdCardUser.setString(2,"0");
                                      insertVoterIdCardUser.setString(3,"Waiting");
                                      insertVoterIdCardUser.setBinaryStream(4, idproof);
                                      insertVoterIdCardUser.setString(5, idprooffilename);
                                      insertVoterIdCardUser.setString(6,idproofno);
                                      insertVoterIdCardUser.setBinaryStream(7, marksheet);
                                      insertVoterIdCardUser.setString(8,marksheetfilename);
                                      insertVoterIdCardUser.setString(9,marksheetno);
                                      insertVoterIdCardUser.setBinaryStream(10, birthcertificate);
                                      insertVoterIdCardUser.setString(11,birthcertificatefilename);
                                      insertVoterIdCardUser.setString(12,birthcertificateno);

                                      insertVoterIdCardUser.executeUpdate();     

                                      session.setAttribute("msg"," You have Successfully sent request");
                                      response.sendRedirect("ApplyVoterCard.jsp"); 
                                    }
                                    }
                                    
                                    
                                    
                                   
  }
  
   //................ for pancard card query insertion....................................................//
  
  else if(documentname.equalsIgnoreCase("pancard")){
  
      
                                        
                                    if(status.equalsIgnoreCase("Rejected")){
                                          
                                           
                                     PreparedStatement updatePancardUser=(PreparedStatement)application.getAttribute("updatePancardUser");
                                      updatePancardUser.setString(1,"Waiting");
                                      updatePancardUser.setBinaryStream(2, idproof);
                                      updatePancardUser.setString(3, idprooffilename);
                                      updatePancardUser.setString(4,idproofno);
                                      updatePancardUser.setBinaryStream(5, marksheet);
                                      updatePancardUser.setString(6,marksheetfilename);
                                      updatePancardUser.setString(7,marksheetno);
                                      updatePancardUser.setBinaryStream(8, birthcertificate);
                                      updatePancardUser.setString(9,birthcertificatefilename);
                                      updatePancardUser.setString(10,birthcertificateno);
                                      updatePancardUser.setInt(11,cid);
                                      
                                      updatePancardUser.executeUpdate();     

                                      session.setAttribute("msg"," You have Successfully sent request");
                                      response.sendRedirect("ApplyPancard.jsp"); 
                                                  
                                         }else{
                                         PreparedStatement checkadharnoforpancard=(PreparedStatement)application.getAttribute("checkadharnoforpancard");

    checkadharnoforpancard.setString(1, idproofno);
      ResultSet rs=checkadharnoforpancard.executeQuery();
                               
                                if(rs.next()){
                                session.setAttribute("msg", "sorry.... your pancard hasbeen generated along this aadharcard number ");
                                response.sendRedirect("ApplyPancard.jsp"); 

                                }else{
                                     PreparedStatement insertPancardUser =(PreparedStatement)application.getAttribute("insertPancardUser");

                                      insertPancardUser.setInt(1,cid);
                                      insertPancardUser.setString(2,"0");
                                      insertPancardUser.setString(3,"Waiting");
                                      insertPancardUser.setBinaryStream(4, idproof);
                                      insertPancardUser.setString(5, idprooffilename);
                                      insertPancardUser.setString(6,idproofno);
                                      insertPancardUser.setBinaryStream(7, marksheet);
                                      insertPancardUser.setString(8,marksheetfilename);
                                      insertPancardUser.setString(9,marksheetno);
                                      insertPancardUser.setBinaryStream(10, birthcertificate);
                                      insertPancardUser.setString(11,birthcertificatefilename);
                                      insertPancardUser.setString(12,birthcertificateno);

                                      insertPancardUser.executeUpdate();     

                                      session.setAttribute("msg"," You have Successfully sent request");
                                      response.sendRedirect("ApplyPancard.jsp"); 
                                    }
                                    }
  }
  
  //................ for passport card query insertion....................................................//
  
  else if(documentname.equalsIgnoreCase("passport")){
  
                     if(status.equalsIgnoreCase("Rejected")){
                                    PreparedStatement updatePassportUser=(PreparedStatement)application.getAttribute("updatePassportUser");
                                      updatePassportUser.setString(1,"Waiting");
                                      updatePassportUser.setBinaryStream(2, idproof);
                                      updatePassportUser.setString(3, idprooffilename);
                                      updatePassportUser.setString(4,idproofno);
                                      updatePassportUser.setBinaryStream(5, marksheet);
                                      updatePassportUser.setString(6,marksheetfilename);
                                      updatePassportUser.setString(7,marksheetno);
                                      updatePassportUser.setBinaryStream(8, birthcertificate);
                                      updatePassportUser.setString(9,birthcertificatefilename);
                                      updatePassportUser.setString(10,birthcertificateno);
                                      updatePassportUser.setInt(11,cid);
                                      
                                      updatePassportUser.executeUpdate();     

                                      session.setAttribute("msg"," You have Successfully sent request");
                                      response.sendRedirect("ApplyPassport.jsp"); 
                                                  
                                         }else{
                                         PreparedStatement checkadharnoforPassport=(PreparedStatement)application.getAttribute("checkadharnoforPassport");

    checkadharnoforPassport.setString(1, idproofno);
      ResultSet rs=checkadharnoforPassport.executeQuery();
                               
                                if(rs.next()){
                                session.setAttribute("msg", "sorry.... your pancard hasbeen generated along this aadharcard number ");
                                response.sendRedirect("ApplyPassport.jsp"); 

                                }else{
                                     PreparedStatement insertPassportUser =(PreparedStatement)application.getAttribute("insertPassportUser");

                                      insertPassportUser.setInt(1,cid);
                                      insertPassportUser.setString(2,"0");
                                      insertPassportUser.setString(3,"Waiting");
                                      insertPassportUser.setBinaryStream(4, idproof);
                                      insertPassportUser.setString(5, idprooffilename);
                                      insertPassportUser.setString(6,idproofno);
                                      insertPassportUser.setBinaryStream(7, marksheet);
                                      insertPassportUser.setString(8,marksheetfilename);
                                      insertPassportUser.setString(9,marksheetno);
                                      insertPassportUser.setBinaryStream(10, birthcertificate);
                                      insertPassportUser.setString(11,birthcertificatefilename);
                                      insertPassportUser.setString(12,birthcertificateno);

                                      insertPassportUser.executeUpdate();     

                                      session.setAttribute("msg"," You have Successfully sent request");
                                      response.sendRedirect("ApplyPassport.jsp"); 
                                    }
                                    }
  
  
      
  }
   //................ for drivinglicence card query insertion....................................................//
  
   else if(documentname.equalsIgnoreCase("drivinglicence")){
                         
                                 if(status.equalsIgnoreCase("Rejected")){
                                      
                                     PreparedStatement updateDLUser=(PreparedStatement)application.getAttribute("updateDLUser");
                                     
                                      updateDLUser.setString(1,"Waiting");
                                      updateDLUser.setBinaryStream(2, idproof);
                                      updateDLUser.setString(3, idprooffilename);
                                      updateDLUser.setString(4,idproofno);
                                      updateDLUser.setBinaryStream(5, marksheet);
                                      updateDLUser.setString(6,marksheetfilename);
                                      updateDLUser.setString(7,marksheetno);
                                      updateDLUser.setBinaryStream(8, birthcertificate);
                                      updateDLUser.setString(9,birthcertificatefilename);
                                      updateDLUser.setString(10,birthcertificateno);
                                      updateDLUser.setInt(11,cid);
                                      
                                      updateDLUser.executeUpdate();     

                                      session.setAttribute("msg"," You have Successfully sent request");
                                      response.sendRedirect("ApplyDL.jsp"); 
                                                  
                                         }else{
          PreparedStatement checkAdharnoForDL=(PreparedStatement)application.getAttribute("checkAdharnoForDL");

    checkAdharnoForDL.setString(1, idproofno);
      ResultSet rs=checkAdharnoForDL.executeQuery();
                               
                                if(rs.next()){
                                session.setAttribute("msg", "sorry.... your Driving License has been generated along this Aadharcard number ");
                                response.sendRedirect("ApplyDL.jsp"); 

                                }else{
                                     PreparedStatement insertDLUser =(PreparedStatement)application.getAttribute("insertDLUser");

                                      insertDLUser.setInt(1,cid);
                                      insertDLUser.setString(2,"0");
                                      insertDLUser.setString(3,"Waiting");
                                      insertDLUser.setBinaryStream(4, idproof);
                                      insertDLUser.setString(5, idprooffilename);
                                      insertDLUser.setString(6,idproofno);
                                      insertDLUser.setBinaryStream(7, marksheet);
                                      insertDLUser.setString(8,marksheetfilename);
                                      insertDLUser.setString(9,marksheetno);
                                      insertDLUser.setBinaryStream(10, birthcertificate);
                                      insertDLUser.setString(11,birthcertificatefilename);
                                      insertDLUser.setString(12,birthcertificateno);

                                      insertDLUser.executeUpdate();     

                                      session.setAttribute("msg"," You have Successfully sent request");
                                      response.sendRedirect("ApplyDL.jsp"); 
                                    }
                                    }

  }

  
    }
   
        
       catch(Exception ex){
        session.setAttribute("ex",ex); 
        response.sendRedirect("Error3.jsp");
        }
        }
    }

















  
