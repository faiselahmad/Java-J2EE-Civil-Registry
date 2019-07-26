

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class GetPic extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session=request.getSession();
        try {
            
           ServletContext application=getServletContext();
             String cname=(String)session.getAttribute("cname");
              String sname=(String)session.getAttribute("sname");
               String aname=(String)session.getAttribute("aname");
               if(cname!=null)
               {
               
                        int cid=Integer.parseInt(request.getParameter("cid"));
                        PreparedStatement getPic=(PreparedStatement)application.getAttribute("getPic");
                        getPic.setInt(1,cid);
                        ResultSet rs=getPic.executeQuery();
                        if(rs.next())
                         {
                        response.getOutputStream().write(rs.getBytes(1));
                          }
           
               }
               else if(sname!=null)
               {
                   
                        int sid=Integer.parseInt(request.getParameter("sid"));
                        PreparedStatement getSPic=(PreparedStatement)application.getAttribute("getSPic");
                        getSPic.setInt(1,sid);
                        ResultSet rs=getSPic.executeQuery();
                        if(rs.next())
                         {
                        response.getOutputStream().write(rs.getBytes(1));
                         }
                   
               }
               else{
                   
                   
                        String aid =request.getParameter("aid");
                        PreparedStatement AdminGetPic=(PreparedStatement)application.getAttribute("AdminGetPic");
                        AdminGetPic.setString(1,aid);
                        ResultSet rs=AdminGetPic.executeQuery();
                        if(rs.next())
                         {
                        response.getOutputStream().write(rs.getBytes(1));
                         }
               
               }
            
            
            
            
            

        } 
        catch(Exception ex){
        session.setAttribute("ex",ex); 
        response.sendRedirect("Error.jsp");
        }
    }

}
