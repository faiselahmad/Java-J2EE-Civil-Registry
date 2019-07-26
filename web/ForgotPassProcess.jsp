<%@page import="javax.mail.internet.*"%>
<%@page import="javax.mail.*"%>
<%@page import="java.util.Properties"%>
<%@page import="java.sql.*"%>
<%@page errorPage="Error.jsp" %>
<%
       
    String email = request.getParameter("email");
 //code for random string 
            String pass="";
            String sss="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890@#$%";
            int i,pl=8;
            for(int x=0;x<pl;x++)
            {
                i=(int)(Math.random()*(sss.length()-1));
                pass=pass+sss.charAt(i);
            }//end- code for random string
            
   PreparedStatement ForgotPass=(PreparedStatement)application.getAttribute("ForgotPass");
ForgotPass.setString(1, pass);  
ForgotPass.setString(2, email);

  //Mail send Code
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
            Transport.send(message); //end -Mail send Code
        
        
ForgotPass.executeUpdate();
response.sendRedirect("index.jsp");

%>