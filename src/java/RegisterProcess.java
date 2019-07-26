

import java.io.*;
import java.sql.*;
import java.util.*;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;


@MultipartConfig(maxFileSize = 16177215)
public class RegisterProcess extends HttpServlet {

    
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session=request.getSession();
        ServletContext application=getServletContext();
        
        response.setContentType("text/html;charset=UTF-8");
        try {
           
            String name=request.getParameter("name");
        
            String fname=request.getParameter("fname");	
            
            String mname=request.getParameter("mname");
          
            String gender=request.getParameter("gender");
            
            String mstatus=request.getParameter("mstatus");
            
            String email=request.getParameter("email");
          
            String phone=request.getParameter("phone");
            
            String address=request.getParameter("address");
           
            String city=request.getParameter("city");	
            String state=request.getParameter("state");
            int pincode=Integer.parseInt(request.getParameter("pincode"));
            String dob=request.getParameter("dob");
            Part filePart = request.getPart("fil");
            InputStream  photo = filePart.getInputStream();
            String pass=request.getParameter("pass");
          
     PreparedStatement checkEmailId=(PreparedStatement)application.getAttribute("checkEmailId");
     
     checkEmailId.setString(1, email);
    ResultSet prs =  checkEmailId.executeQuery();
    if(prs.next()){
    session.setAttribute("msg","Sorry .... Your email id is already registered.");
      response.sendRedirect("index.jsp"); 
      
    }else{
           PreparedStatement insertUser=(PreparedStatement)application.getAttribute("insertUser");
           
            insertUser.setString(1,name);
            insertUser.setString(2,fname);
            insertUser.setString(3,mname);
            insertUser.setString(4,gender);
            insertUser.setString(5,mstatus);
            insertUser.setString(6,email);
            insertUser.setString(7,phone);
            insertUser.setString(8,address);
            insertUser.setString(9,city);
            insertUser.setString(10,state);
            insertUser.setInt(11,pincode);
            insertUser.setString(12,dob);
            insertUser.setBinaryStream(13,photo);
            insertUser.setString(14,pass);
           
               String subject=" Successfully Registered";
            String body="You are Registered Successfullly and Your User ID:"+email+" and Password:"+pass;
            final String aemail=application.getInitParameter("aemail");
            final String apass=application.getInitParameter("apass");
        
            Properties properties = new Properties();
            properties.put("mail.smtp.host", "smtp.gmail.com");  
            properties.put("mail.smtp.socketFactory.port", "465");  
            properties.put("mail.smtp.socketFactory.class",  
                  "javax.net.ssl.SSLSocketFactory");  
            properties.put("mail.smtp.auth", "true");  
            properties.put("mail.smtp.port", "465");
            
           Session ses = Session.getInstance(properties,   
                new javax.mail.Authenticator() {  
                 protected PasswordAuthentication getPasswordAuthentication() {  
                 return new PasswordAuthentication(aemail, apass); } 
                });  

            Message message = new MimeMessage(ses);  
            message.setFrom(new InternetAddress(aemail));  
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));  
            message.setSubject(subject);  
            message.setText(body);  
            Transport.send(message); 
            
            insertUser.executeUpdate();
            
        checkEmailId=(PreparedStatement)application.getAttribute("checkEmailId");
     
     checkEmailId.setString(1, email);
     prs =  checkEmailId.executeQuery();
  
       if(prs.next()){
           
session.setAttribute("cid",prs.getInt(1));
session.setAttribute("cname",prs.getString(2));

       
            HashMap ud=new HashMap(); // ud= User Data
            ud.put("cid",prs.getInt(1));
            ud.put("name",prs.getString(2));
            ud.put("fname",prs.getString(3));
            ud.put("mname",prs.getString(4)); 
            ud.put("gender",prs.getString(5));
            ud.put("maritalstatus",prs.getString(6));
            ud.put("email",prs.getString(7));
            ud.put("phone",prs.getString(8));
            ud.put("address",prs.getString(9));
            ud.put("city",prs.getString(10));
            ud.put("state",prs.getString(11));
            ud.put("pincode",prs.getString(12));
            ud.put("dob",prs.getString(13));          
          
          session.setAttribute("ud", ud);
            session.setAttribute("msg", "Register Successfully");
          prs.close();
            
          response.sendRedirect("index.jsp");
      
    } 
   }
    }
        catch(Exception ex){
        session.setAttribute("ex",ex); 
        response.sendRedirect("Error.jsp");
        }
        }
    }




