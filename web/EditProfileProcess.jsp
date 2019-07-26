 <%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page errorPage="Error.jsp" %>
<%
     String type =request.getParameter("type");
     PreparedStatement getStatuswiseCitizenInfo;
      ResultSet prs;
  HashMap ud=new HashMap(); // ud= User Data
    if(type.equalsIgnoreCase("editprofile"))
    {
    int cid=(Integer)session.getAttribute("cid");
        
            String name=request.getParameter("name");
            String fname=request.getParameter("fname");	
            String mname=request.getParameter("mname");
            String gender=request.getParameter("gender");
            
       PreparedStatement updateProfile=(PreparedStatement)application.getAttribute("updateProfile");
       
            updateProfile.setString(1,name);
            updateProfile.setString(2,fname);
            updateProfile.setString(3,mname);
            updateProfile.setString(4,gender);
            updateProfile.setInt(5,cid);    
            updateProfile.executeUpdate();
           session.setAttribute("msg","update Profile Successfully");
           
            getStatuswiseCitizenInfo=(PreparedStatement)application.getAttribute("getStatuswiseCitizenInfo");
                                    getStatuswiseCitizenInfo.setInt(1, cid);
                                    prs= getStatuswiseCitizenInfo.executeQuery();
                                    if(prs.next()){  
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
                                    session.setAttribute("cname",prs.getString(2)); 
                                        session.setAttribute("ud",ud); 
                                    prs.close();                                    
                                    response.sendRedirect("EditProfile.jsp");
                                    }
    }
    
    else if(type.equalsIgnoreCase("pi"))
    {
    int cid=(Integer)session.getAttribute("cid");
            String dob=request.getParameter("dob");    
            String email=request.getParameter("email");
            String phone=request.getParameter("phone");	
            String mstatus=request.getParameter("mstatus");
            
       PreparedStatement updatePI=(PreparedStatement)application.getAttribute("updatePI");
       
            updatePI.setString(1,dob);
            updatePI.setString(2,email);
            updatePI.setString(3,phone);            
            updatePI.setString(4,mstatus);
            updatePI.setInt(5,cid); 
            updatePI.executeUpdate(); 
           session.setAttribute("msg","update personal information Successfully");
           
            getStatuswiseCitizenInfo=(PreparedStatement)application.getAttribute("getStatuswiseCitizenInfo");
                                    getStatuswiseCitizenInfo.setInt(1, cid);
                                    prs= getStatuswiseCitizenInfo.executeQuery();
                                    if(prs.next()){                 
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
                                       session.setAttribute("ud",ud);
                                       response.sendRedirect("PI.jsp");
                                    }
    }
            
 else if(type.equalsIgnoreCase("address"))
 {
    int cid=(Integer)session.getAttribute("cid");
            String address=request.getParameter("address");
            String city=request.getParameter("city");	
            String state=request.getParameter("state");
            int pincode=Integer.parseInt(request.getParameter("pincode"));
            
       PreparedStatement updateAddress=(PreparedStatement)application.getAttribute("updateAddress");
       
            updateAddress.setString(1,address);
            updateAddress.setString(2,city);
            updateAddress.setString(3,state);
            updateAddress.setInt(4,pincode); 
            updateAddress.setInt(5,cid);   
            updateAddress.executeUpdate();  
           session.setAttribute("msg","update address Successfully");
            getStatuswiseCitizenInfo=(PreparedStatement)application.getAttribute("getStatuswiseCitizenInfo");
                                    getStatuswiseCitizenInfo.setInt(1, cid);
                                    prs= getStatuswiseCitizenInfo.executeQuery();
                                    if(prs.next()){
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
                                        session.setAttribute("ud",ud);
                                        response.sendRedirect("ChangeAddress.jsp");
                                    }
     
 }
    
     else if(type.equalsIgnoreCase("password"))
 {
    int cid=(Integer)session.getAttribute("cid");
     
            String np=request.getParameter("np"); 
            String cp=request.getParameter("cp");
     
                     if(np.equals(cp))
                       {

                       PreparedStatement updatePass=(PreparedStatement)application.getAttribute("updatePass");
                       updatePass.setString(1,cp);
                       updatePass.setInt(2,cid); 
                       updatePass.executeUpdate(); 
                       session.setAttribute("msg", "your password successfully changed ");
                       response.sendRedirect("ChangePassword.jsp");  

                       }else{
                                session.setAttribute("msg", "password doesnot matched");
                            response.sendRedirect("ChangePassword.jsp");
                            }  
            
     
 }
     else
     {      
     int sid=(Integer)session.getAttribute("sid");   
         
            String np=request.getParameter("np"); 
            String cp=request.getParameter("cp");
     
                     if(np.equals(cp))
                       {

                       PreparedStatement updateSPass=(PreparedStatement)application.getAttribute("updateSPass");
                       updateSPass.setString(1,cp);
                       updateSPass.setInt(2,sid); 
                       updateSPass.executeUpdate(); 
                       session.setAttribute("doneprof", "your password successfully changed ");
                       response.sendRedirect("DeptProfile.jsp");  

                       }
                     else{
                       session.setAttribute("doneprof", "password doesnot matched");
                       response.sendRedirect("DeptProfile.jsp");
                            }   
         
         
     }


       
        
%>