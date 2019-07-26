<%
   String documentname=(String)session.getAttribute("documentname"); 
  if(documentname!=null){ 
    session.setAttribute("documentname", null);
      
  }  
response.sendRedirect("Profile.jsp");


%>