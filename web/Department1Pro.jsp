<%
    

    String departmenttype=request.getParameter("departmenttype"); 
    if(departmenttype!=null)
    {
     session.setAttribute("departmenttype",departmenttype);          
          response.sendRedirect("Department.jsp");
    }
               
    
%>