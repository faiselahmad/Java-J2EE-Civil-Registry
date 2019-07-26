
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;


@MultipartConfig(maxFileSize = 16177215)
public class UpdatePic extends HttpServlet {

    
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session=request.getSession();
        
        response.setContentType("text/html;charset=UTF-8");
        try {
            ServletContext application=getServletContext();
             String cname=(String)session.getAttribute("cname");
              String sname=(String)session.getAttribute("sname");
               String aname=(String)session.getAttribute("aname");
               
               
               if(cname!=null)
               {
                        int cid=(Integer)session.getAttribute("cid");
                        Part filePart = request.getPart("pic");
                        InputStream  photo = filePart.getInputStream();
                        PreparedStatement updatePic=(PreparedStatement)application.getAttribute("updatePic");
                        updatePic.setBinaryStream(1,photo);
                        updatePic.setInt(2,cid);
                        updatePic.executeUpdate();
                        response.sendRedirect("EditProfile.jsp");
                   
                   }
               else if(sname!=null)
               {
                        int sid=(Integer)session.getAttribute("sid");
                        Part filePart = request.getPart("pic");
                        InputStream  photo = filePart.getInputStream();
                        PreparedStatement updateSPic=(PreparedStatement)application.getAttribute("updateSPic");
                        updateSPic.setBinaryStream(1,photo);
                        updateSPic.setInt(2,sid);
                        updateSPic.executeUpdate();
                        response.sendRedirect("DeptProfile.jsp");
               }
               else{
                        String aid=(String)session.getAttribute("aid");
                        Part filePart = request.getPart("pic");
                        InputStream  photo = filePart.getInputStream();
                        PreparedStatement adminUpdatePic=(PreparedStatement)application.getAttribute("adminUpdatePic");
                        adminUpdatePic.setBinaryStream(1,photo);
                        adminUpdatePic.setString(2,aid);
                        adminUpdatePic.executeUpdate();
                        response.sendRedirect("AdminProfile.jsp");
                       }
            
          
        }
        catch(Exception ex){
        session.setAttribute("ex",ex);  
	 ex.printStackTrace();
        response.sendRedirect("Error.jsp");
        }
        }
    }




