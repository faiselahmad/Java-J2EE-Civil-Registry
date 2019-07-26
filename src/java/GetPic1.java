

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class GetPic1 extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session=request.getSession();
        try {
            
           ServletContext application=getServletContext();
            
                        int cid=Integer.parseInt(request.getParameter("cid"));
                        PreparedStatement getPic=(PreparedStatement)application.getAttribute("getPic");
                        getPic.setInt(1,cid);
                        ResultSet rs=getPic.executeQuery();
                        if(rs.next())
                         {
                        response.getOutputStream().write(rs.getBytes(1));
                          }
           
        } 
        catch(Exception ex){
        session.setAttribute("ex",ex); 
        response.sendRedirect("Error.jsp");
        }
    }

}
