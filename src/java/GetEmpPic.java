

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class GetEmpPic extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session=request.getSession();
        try {
            int eid=Integer.parseInt(request.getParameter("eid"));
            ServletContext application=getServletContext();
           PreparedStatement getEmpPic=(PreparedStatement)application.getAttribute("getEmpPic");
             getEmpPic.setInt(1,eid);
          ResultSet rs=getEmpPic.executeQuery();
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
