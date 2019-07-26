
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page errorPage="Error.jsp" %>

<%
   
    String aid=request.getParameter("aid");
String apass=new String(request.getParameter("apass"));
ResultSet ars;

PreparedStatement checkAdmin=(PreparedStatement)application.getAttribute("checkAdmin");
checkAdmin.setString(1,aid);
checkAdmin.setString(2,apass);

 ars=checkAdmin.executeQuery();

                            if(ars.next()){
                    session.setAttribute("aid",ars.getString(1));
                    session.setAttribute("aname",ars.getString(3));
                    HashMap ap=new HashMap();
                        ap.put("aid",ars.getString(1));
                        ap.put("aname",ars.getString(3));
                        ap.put("aphone",ars.getString(4));
                        ap.put("agen",ars.getString(5)); 
                        ap.put("aemail",ars.getString(6));
                        session.setAttribute("ap", ap);
                        
                        ars.close();
                        
                   response.sendRedirect("OfficialHomePage.jsp"); 
                            }

                            else{
                         session.setAttribute("amsg","Wrong Admin id and password");
                   response.sendRedirect("Official.jsp");
                            }
							%>