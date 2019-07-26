<%
  String aname=(String)session.getAttribute("aname");
   String cname=(String)session.getAttribute("cname");
    String sname=(String)session.getAttribute("sname");
    
       
if(cname!=null){ 
     session.invalidate();
response.sendRedirect("index.jsp");
}
else if(sname!=null){
     session.invalidate();
response.sendRedirect("Department1.jsp");
}
else{
     session.invalidate();
response.sendRedirect("Official.jsp");
}
        
    %>