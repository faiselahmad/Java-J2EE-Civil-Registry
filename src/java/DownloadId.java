

import com.lowagie.text.*;
import com.lowagie.text.pdf.*;
import java.io.*;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.*;
import javax.servlet.*;


public class DownloadId extends HttpServlet {

    //long uniqueno=(Long)session.getAttribute("uniqueno");
    protected void service(HttpServletRequest request, HttpServletResponse response) throws IOException{
        
        HttpSession session=request.getSession();
        try {
            
            int cid=Integer.parseInt(request.getParameter("cid"));
            String documentname=request.getParameter("documentname");
            
            ServletContext application=getServletContext();
             Document d=new Document();
            d.addAuthor("INCAPP");
            d.addCreationDate();
            d.addTitle("id card");
            PdfWriter.getInstance(d, response.getOutputStream());
           d.open();
            
     PreparedStatement getGenUser=(PreparedStatement)application.getAttribute("getGenUser");
                getGenUser.setInt(1, cid);
                getGenUser.setString(2, documentname);
                ResultSet getId=getGenUser.executeQuery();
           
if(getId.next()){
         String name=getId.getString(3);
         String fname=getId.getString(4);
         String cardname=getId.getString(5);
         String cardno=getId.getString(6);
         String dob=getId.getString(7);
         String issuedate=getId.getString(8);
      String address=getId.getString(9);
         String city=getId.getString(10);
        String state=getId.getString(11);
      String pincode=getId.getString(12);
         String validtill=getId.getString(13);
       String gender=getId.getString(14);
  Image img=Image.getInstance(getId.getBytes(15));
 img.scaleToFit(50, 50);
  ///img.setAbsolutePosition(150, 150);
  

          
              
if(documentname.equals("AADHAR CARD"))
             {
          d.add(img);
           d.add(new Paragraph(cardno));
           d.add(new Paragraph(name));
           d.add(new Paragraph(dob));
           d.add(new Paragraph(gender));
           d.add(new Paragraph(address));
           d.add(new Paragraph(city+pincode));
           d.add(new Paragraph(state));
           
             }
else if(documentname.equals("VOTER CARD"))
             {
           d.add(img);
           d.add(new Paragraph(cardno));
           d.add(new Paragraph(name));d.add(new Paragraph(fname));     
           d.add(new Paragraph(gender));d.add(new Paragraph(dob));
           d.add(new Paragraph(address));
           d.add(new Paragraph(city+pincode));
           d.add(new Paragraph(state));
          
             }
else if(documentname.equals("PANCARD"))
             {
          d.add(img);
           d.add(new Paragraph(name));d.add(new Paragraph(fname));
           d.add(new Paragraph(dob)); d.add(new Paragraph(cardno));
           
             }
else if(documentname.equals("PASSPORT"))
             {
         d.add(img);
           d.add(new Paragraph(cardno));
           d.add(new Paragraph(name));d.add(new Paragraph(fname));
           d.add(new Paragraph(dob));d.add(new Paragraph(issuedate));
           d.add(new Paragraph(gender));d.add(new Paragraph(validtill));
           d.add(new Paragraph(address));d.add(new Paragraph(city+pincode));
           d.add(new Paragraph(state));
           
             }
else 
             {
          d.add(img);
           d.add(new Paragraph(cardno));
           d.add(new Paragraph(name));d.add(new Paragraph(fname));
           d.add(new Paragraph(dob));d.add(new Paragraph(issuedate));
           d.add(new Paragraph(gender));d.add(new Paragraph(validtill));
           d.add(new Paragraph(address));d.add(new Paragraph(city+pincode));
          d.add(new Paragraph(state));
           
             }
                                                      
d.close();
 response.setContentType("application/pdf");

}
           

} 
     
catch(Exception ex){
 session.setAttribute("ex",ex);
ex.printStackTrace(); 
response.sendRedirect("Error.jsp");
}
        }
    }


