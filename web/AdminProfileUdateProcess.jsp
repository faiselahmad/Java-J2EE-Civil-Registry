 <%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page errorPage="Error.jsp" %>
<%
    String type =request.getParameter("type");
    String aid=(String)session.getAttribute("aid"); 
     
    if(type.equalsIgnoreCase("editprofile"))
    {
            String aname=request.getParameter("aname");
            String agen=request.getParameter("agen");
             String aemail=request.getParameter("aemail");
            String aphone=request.getParameter("aphone");
            
       PreparedStatement adminUpdate=(PreparedStatement)application.getAttribute("adminUpdate");
       
            adminUpdate.setString(1,aname);
            adminUpdate.setString(2,aphone);
            adminUpdate.setString(3,agen);
            adminUpdate.setString(4,aemail);
            adminUpdate.setString(5,aid);
            adminUpdate.executeUpdate();
           session.setAttribute("doneprof","update Profile Successfully");
           
            PreparedStatement Adminfo=(PreparedStatement)application.getAttribute("Adminfo");
                          Adminfo.setString(1, aid);
                                ResultSet ars= Adminfo.executeQuery();
                                    if(ars.next()){
                                    session.setAttribute("aname",ars.getString(3));
                                    HashMap ap=new HashMap();
                                    ap.put("aid",ars.getString(1));
                                    ap.put("aname",ars.getString(3));
                                    ap.put("aphone",ars.getString(4));
                                    ap.put("agen",ars.getString(5)); 
                                    ap.put("aemail",ars.getString(6));
                                    session.setAttribute("ap", ap);

                                    ars.close();
                                     response.sendRedirect("AdminProfile.jsp");
                                                }
               
    }
 
    
     else 
 {
     
            String np=request.getParameter("np"); 
            String cp=request.getParameter("cp");
     
                     if(np.equals(cp))
                       {

                       PreparedStatement adminUpdatePass=(PreparedStatement)application.getAttribute("adminUpdatePass");
                       adminUpdatePass.setString(1,cp);
                       adminUpdatePass.setString(2,aid); 
                       adminUpdatePass.executeUpdate(); 
                       session.setAttribute("doneprof", "your password successfully changed ");
                       response.sendRedirect("AdminProfile.jsp");  

                       }else{
                                session.setAttribute("doneprof", "password doesnot matched");
                            response.sendRedirect("AdminProfile.jsp");
                            }  
            
     
 }
     

       
        
%>