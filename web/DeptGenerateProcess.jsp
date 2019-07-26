<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*"%>
<%@page errorPage="Error.jsp" %>
<%

     String departmenttype=(String)session.getAttribute("departmenttype");      
     String cdname=request.getParameter("cdname");// for first letter
  
  
  if(departmenttype.equalsIgnoreCase("AADHAR CARD"))
  {
   long ano=0; 
                               
              PreparedStatement getMaxAadharno=(PreparedStatement)application.getAttribute("getMaxAadharno");
                             ResultSet mrs=getMaxAadharno.executeQuery();

                         if(mrs.next())
                         {
                         ano=mrs.getLong(1);
                             if(ano!=0){
                             ano++;
                             }else{
                            
                                 ano=395138945216L;
                             }
                         }
                         session.setAttribute("ano", ano);   

                            

         
  }
  
  //............................................................................................................//
  
  else if(departmenttype.equalsIgnoreCase("VOTER CARD"))
  {
                String f3l=""; //f3l first 3 letters
          String str="ABCDEFGHIJKLMNOPQRSTUVWXYZ";
          int i,len1=3; 
          for(int x=0;x<len1;x++) 
          {
          i=(int) (Math.random()*(str.length()-1));
           f3l=f3l+str.charAt(i);
          }
          
          String v7n=""   ;   
String str1="1234567890";   //v7n voter card 7digit  number
      int len2=7;  
      for(int x=0;x<len2;x++)
          {
          i=(int) (Math.random()*(str1.length()-1));
           v7n=v7n+str1.charAt(i);
          }
           
      String vno=f3l+v7n;
          
                       
         session.setAttribute("vno", vno); 
                                   

                             
    
  }
  
  //.............................................................................................................//
  
  else if(departmenttype.equalsIgnoreCase("PANCARD")){
  
                  
// code for auto generate 
        String f3l=""; //f3l first 3 letters
          String str="ABCDEFGHIJKLMNOPQRSTUVWXYZ";
          int i,len1=3; 
          for(int x=0;x<len1;x++) 
          {
          i=(int) (Math.random()*(str.length()-1));
           f3l=f3l+str.charAt(i);
          }
//......................................
String s4n=""   ;   
String str1="1234567890";   //s4n sequencial number
      int len2=4;  
      for(int x=0;x<len2;x++)
          {
          i=(int) (Math.random()*(str1.length()-1));
           s4n=s4n+str1.charAt(i);
          }
   //........................
          
String chkd=""; /// check digit
String str2="ABCDEFGHIJKLMNOPQRSTUVWXYZ";
int len3=1; 
for(int x=0;x<len3;x++) 
{
i=(int) (Math.random()*(str2.length()-1));
chkd = str2.charAt(i)+"";
}
 //////////end
 
 
     String upprcse=cdname.charAt(0)+"";
     
     String panno=f3l+upprcse.toUpperCase()+s4n+chkd;       
         
     session.setAttribute("panno", panno);  
                                   
                       
  
  }
 //.................................................................................... 
  
  
  else if(departmenttype.equalsIgnoreCase("PASSPORT")){
  
      String pfl=""; /// passport first letter
String str2="ABCDEFGHIJKLMNOPRSTUVWY";
int len3=1,i; 
for(int x=0;x<len3;x++) 
{
i=(int) (Math.random()*(str2.length()-1));
pfl = str2.charAt(i)+"";
}


String pnd=""   ;   
String str1="1234567890";   //pnd -pasport number digit 
      int len2=7;  
      for(int x=0;x<len2;x++)
          {
          i=(int) (Math.random()*(str1.length()-1));
           pnd=pnd+str1.charAt(i);
          }
      StringBuffer pno=new StringBuffer(pfl+pnd);
    pno=pno.insert(3, " ");

 session.setAttribute("pno", pno);    
  
  }
  //..................................................................................................//
  
  else if(departmenttype.equalsIgnoreCase("DRIVING LICENCE")){
      java.util.Date d=new java.util.Date();
      SimpleDateFormat sdf=new SimpleDateFormat("yyyy");
     
      
      String n7=""   ;   
String str1="1234567890";   //n7- 7 number
      int len=7,i;  
      for(int x=0;x<len;x++)
          {
          i=(int) (Math.random()*(str1.length()-1));
           n7=n7+str1.charAt(i);
          }
        
      String city="",citycode="";
        String state="",statecode=""; 
     
  HashMap sud =(HashMap)session.getAttribute("sud"); 
  
         city= (String)sud.get("city");  
         state= (String)sud.get("state");  
       
         if(state.equalsIgnoreCase("Madhya pradesh")) 
        {
            statecode="MP";
                        if(city.equalsIgnoreCase("Morena")){
                                    citycode="06";                            
                        }
                        else if(city.equalsIgnoreCase("Gwalior")){
                                    citycode="07";
                        }
                        else if(city.equalsIgnoreCase("Indore")){
                                    citycode="09";
                        }
                        else if(city.equalsIgnoreCase("Bhopal")){
                                    citycode="04";
                        }
                    else{
                       
                        session.setAttribute("error2", "unidentified state");
                        response.sendRedirect("Error2.jsp");  
                             }
                        
        }
        else if(state.equalsIgnoreCase("Uttar Pradesh")){ 
            statecode="UP";
                        if(city.equalsIgnoreCase("Noida")){
                                    citycode="14";
                        }
                        else if(city.equalsIgnoreCase("Agra")){
                                    citycode="80";
                        }
                          else if(city.equalsIgnoreCase("Kanpur")){
                                    citycode="78";
                        }
                        else if(city.equalsIgnoreCase("Lucknow")){
                                    citycode="32";
                        }
                          
                     else{
                     
                     session.setAttribute("error2", "unidentified state");
                       response.sendRedirect("Error2.jsp");  

                    }
        
        
        }
            
            else{
             session.setAttribute("error2", "unidentified state");
           response.sendRedirect("Error2.jsp");  
                
          } 
      
       String dlno=statecode+citycode+"-"+sdf.format(d)+"-"+n7;     
      session.setAttribute("dlno", dlno);                                    

                             
    } 
  
  else{
      
    session.setAttribute("error2", "unidentified department");
 response.sendRedirect("Error2.jsp");
    }  
     response.sendRedirect("CardGeneratePage.jsp");
  
%>