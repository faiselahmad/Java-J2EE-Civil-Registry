
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class GetGenPic extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session=request.getSession();
        try {
            
            int cid=Integer.parseInt(request.getParameter("cid"));
            String cardname=request.getParameter("documentname");
            ServletContext application=getServletContext();
            
             PreparedStatement getGenPic=(PreparedStatement)application.getAttribute("getGenPic");
             getGenPic.setInt(1,cid);
             getGenPic.setString(2,cardname);   
          ResultSet rs=getGenPic.executeQuery();
            
            
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


