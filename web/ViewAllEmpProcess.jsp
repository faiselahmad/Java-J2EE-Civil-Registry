<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<% 
    
     
        
    int scount=0,f=0;
     ArrayList ae=new ArrayList(); //as= all emp
  PreparedStatement getEmpRecords=(PreparedStatement)application.getAttribute("getEmpRecords");     
          ResultSet getRs=  getEmpRecords.executeQuery();
         while(getRs.next()){
             scount++; f=1;    
             
                HashMap se=new HashMap(); //single emp
            
                se.put("eid",getRs.getString(1));
                se.put("ename",getRs.getString(2));
                se.put("eemail",getRs.getString(3)); 
		se.put("ephone",getRs.getString(4));
	        se.put("edept",getRs.getString(7));
	        se.put("edob",getRs.getString(5));
                se.put("ecity",getRs.getString(9));
		se.put("estate",getRs.getString(10));
		se.put("epass",getRs.getString(12)); 
                ae.add(se); 
                
 
                }
            if(f==1){
                           session.setAttribute("scount", scount);  
                           session.setAttribute("ae", ae); 
                           getRs.close();
                           response.sendRedirect("ViewAllEmp.jsp");

            }
           else{

               session.setAttribute("delete", "No Employee Data"); 
               response.sendRedirect("ViewAllEmp.jsp");
           }

%>