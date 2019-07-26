 <%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page errorPage="Error.jsp" %>

<%
    try{
            String name=request.getParameter("name");	
            String email=request.getParameter("email");
            String phone=request.getParameter("phone");
            String dob=request.getParameter("dob");
            String gender=request.getParameter("gender");
            String departmenttype=request.getParameter("departmenttype");
            String address=request.getParameter("address");
            String city=request.getParameter("city");	
            String state=request.getParameter("state");
            String pincode=request.getParameter("pincode");
            String pass="";
            int PASSWORD_LENGTH = 8;
            String letters = "abcdefghjkmnpqrstuvwxyzABCDEFGHJKMNPQRSTUVWXYZ23456789@";
            for (int i=0; i<PASSWORD_LENGTH; i++)
            {
                int index = (int)(Math.random() * letters.length());
                pass += letters.charAt(index);
            }
          

 PreparedStatement insertEmp =(PreparedStatement)application.getAttribute("insertEmp");
           
            insertEmp.setString(1,name);
            insertEmp.setString(2,email);
            insertEmp.setString(3,phone);
            insertEmp.setString(4,dob);
            insertEmp.setString(5,gender);
            insertEmp.setString(6,departmenttype);
            insertEmp.setString(7,address);
            insertEmp.setString(8,city);
            insertEmp.setString(9,state);
            insertEmp.setString(10,pincode); 
            insertEmp.setString(11,pass);
            
  
            String subject=" Successfully Registered";
            String body="You are Registered Successfullly and Your User ID:"+email+" and Password:"+pass;
            final String aemail=application.getInitParameter("aemail");
            System.out.println("hello");
            System.out.println(aemail);
            final String apass=application.getInitParameter("apass");
            System.out.println(apass);
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
                 return new PasswordAuthentication(aemail,apass); } 
                });  

            Message message = new MimeMessage(ses);  
            message.setFrom(new InternetAddress(aemail));  
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));  
            message.setSubject(subject);  
            message.setText(body);  
            Transport.send(message); //end -Mail send Code         
                
            
            insertEmp.executeUpdate();
            session.setAttribute("empdone","successfully registered employee");
            response.sendRedirect("RegEmp.jsp");

    }
    catch(Exception ex)
    {
        ex.printStackTrace();
        response.sendRedirect("RegEmp.jsp");
    }
%>