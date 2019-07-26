

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;


@MultipartConfig(maxFileSize = 16177215)
public class UpdateDocumentProcess extends HttpServlet {

    
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session=request.getSession();
        ServletContext application=getServletContext();
        
        response.setContentType("text/html;charset=UTF-8");
        try {
            
          int cid=(Integer)session.getAttribute("cid"); //from  session
          String documentname=request.getParameter("documentname");//from hidden field form
         
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
 
    PreparedStatement updateAadharCardUser=(PreparedStatement)application.getAttribute("updateAadharCardUser");
    updateAadharCardUser.setString(1,"Update");
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

    response.sendRedirect("ApplyAadharCard.jsp"); 
                                                  
                                         
  }

 
   //................ for voter card query insertion....................................................//
  
  else if(documentname.equalsIgnoreCase("votercard")){
  
   
                                
                                           
    PreparedStatement updateVoterCardUser=(PreparedStatement)application.getAttribute("updateVoterCardUser");
     updateVoterCardUser.setString(1,"Update");
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

     response.sendRedirect("ApplyVoterCard.jsp"); 

                                         
                                    
                                    
                                    
                                   
  }
  
   //................ for pancard card query insertion....................................................//
  
  else if(documentname.equalsIgnoreCase("pancard")){
  
      
                                        
                                  
                                          
                                           
PreparedStatement updatePancardUser=(PreparedStatement)application.getAttribute("updatePancardUser");
 updatePancardUser.setString(1,"Update");
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

 response.sendRedirect("ApplyPancard.jsp"); 

                                        
  }
  
  //................ for passport card query insertion....................................................//
  
  else if(documentname.equalsIgnoreCase("passport")){
  
PreparedStatement updatePassportUser=(PreparedStatement)application.getAttribute("updatePassportUser");
  updatePassportUser.setString(1,"Update");
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
  response.sendRedirect("ApplyPassport.jsp"); 

                                        
  
      
  }
   //................ for drivinglicence card query insertion....................................................//
  
   else if(documentname.equalsIgnoreCase("drivinglicence")){
                         
                                      
PreparedStatement updateDLUser=(PreparedStatement)application.getAttribute("updateDLUser");

 updateDLUser.setString(1,"Update");
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

 response.sendRedirect("ApplyDL.jsp"); 
                                                  
                                        

  }
   else{
  response.sendRedirect("Error2.jsp");
  
  }
  
    }
   
        
       catch(Exception ex){
        session.setAttribute("ex",ex); 
        response.sendRedirect("Error.jsp");
        }
        }
    }

















  
