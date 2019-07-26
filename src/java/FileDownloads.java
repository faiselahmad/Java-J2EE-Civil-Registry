
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class FileDownloads extends HttpServlet {

    
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
             HttpSession session=request.getSession();
             
         String departmenttype=(String)session.getAttribute("departmenttype"); 
         
         
            int cid=Integer.parseInt(request.getParameter("cid"));
            int n=Integer.parseInt(request.getParameter("no"));
            ServletContext application=getServletContext();
          
            if(departmenttype.equalsIgnoreCase("AADHAR CARD")){
           
                
   PreparedStatement getDocumentForAadharCard=(PreparedStatement)application.getAttribute("getDocumentForAadharCard");
          getDocumentForAadharCard.setInt(1, cid);
           ResultSet rs=getDocumentForAadharCard.executeQuery();
            if(rs.next())
            {
               response.setContentType("APPLICATION/OCTET-STREAM");  
               if(n==5)
                response.setHeader("Content-Disposition","attachment; filename="+rs.getString(6)); 
               else if(n==8)
                response.setHeader("Content-Disposition","attachment; filename="+rs.getString(9)); 
                else if(n==11)
                response.setHeader("Content-Disposition","attachment; filename="+rs.getString(12)); 
                
                response.getOutputStream().write(rs.getBytes(n)); 
                
            
            }
           
           
           
           } 
           if(departmenttype.equalsIgnoreCase("VOTER-ID")){
           
                
   PreparedStatement getDocumentForVoterCard=(PreparedStatement)application.getAttribute("getDocumentForVoterCard");
          getDocumentForVoterCard.setInt(1, cid);
           ResultSet rs=getDocumentForVoterCard.executeQuery();
            if(rs.next())
            {
               response.setContentType("APPLICATION/OCTET-STREAM");  
               if(n==5)
                response.setHeader("Content-Disposition","attachment; filename="+rs.getString(6)); 
               else if(n==8)
                response.setHeader("Content-Disposition","attachment; filename="+rs.getString(9)); 
                else if(n==11)
                response.setHeader("Content-Disposition","attachment; filename="+rs.getString(12)); 
                
                response.getOutputStream().write(rs.getBytes(n)); 
                
            
            }
           } 
           
            if(departmenttype.equalsIgnoreCase("PANCARD")){
            
    PreparedStatement getDocumentForPancard=(PreparedStatement)application.getAttribute("getDocumentForPancard");
getDocumentForPancard.setInt(1, cid);
           ResultSet rs=getDocumentForPancard.executeQuery();
            if(rs.next())
            {
               response.setContentType("APPLICATION/OCTET-STREAM");  
               if(n==5)
                response.setHeader("Content-Disposition","attachment; filename="+rs.getString(6)); 
               else if(n==8)
                response.setHeader("Content-Disposition","attachment; filename="+rs.getString(9)); 
                else if(n==11)
                response.setHeader("Content-Disposition","attachment; filename="+rs.getString(12)); 
                
                response.getOutputStream().write(rs.getBytes(n)); 
                
            
            }
            
            } 
            
          
           if(departmenttype.equalsIgnoreCase("PASSPORT")){
           
      PreparedStatement getDocumentForPassport=(PreparedStatement)application.getAttribute("getDocumentForPassport");
getDocumentForPassport.setInt(1, cid);
           ResultSet rs=getDocumentForPassport.executeQuery();
            if(rs.next())
            {
               response.setContentType("APPLICATION/OCTET-STREAM");  
               if(n==5)
                response.setHeader("Content-Disposition","attachment; filename="+rs.getString(6)); 
               else if(n==8)
                response.setHeader("Content-Disposition","attachment; filename="+rs.getString(9)); 
                else if(n==11)
                response.setHeader("Content-Disposition","attachment; filename="+rs.getString(12)); 
                
                response.getOutputStream().write(rs.getBytes(n)); 
                
            
            }
           } 
      
           if(departmenttype.equalsIgnoreCase("DRIVING LICENCE")){
               
                   
      PreparedStatement getDocumentForDL=(PreparedStatement)application.getAttribute("getDocumentForDL");
getDocumentForDL.setInt(1, cid);
           ResultSet rs=getDocumentForDL.executeQuery();
            if(rs.next())
            {
               response.setContentType("APPLICATION/OCTET-STREAM");  
               if(n==5)
                response.setHeader("Content-Disposition","attachment; filename="+rs.getString(6)); 
               else if(n==8)
                response.setHeader("Content-Disposition","attachment; filename="+rs.getString(9)); 
                else if(n==11)
                response.setHeader("Content-Disposition","attachment; filename="+rs.getString(12)); 
                
                response.getOutputStream().write(rs.getBytes(n)); 
            } 
            }
         } catch (Exception ex) {
             ex.printStackTrace();
        }
    
    }

}
