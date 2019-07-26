<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page errorPage="Error.jsp" %>
<%
String aname=(String)session.getAttribute("aname");
if(aname!=null){ 
String aid=(String)session.getAttribute("aid");
 java.util.Date d=new java.util.Date();
%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
<title>Update Employee Details</title>

<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/bootstrap-table.css" rel="stylesheet">
</head>

<body  style="background-color: gainsboro">
	
    <%@ include file="HeaderA1.html" %>
		
	<br><br>
        <div class="container-fluid">
            
             <div class="text-center">
               
                 <div class="btn-group" role="group"  >
  <a href="OfficialHomePage.jsp" type="button" class="btn btn-primary">Home</a>
                </div>
                <div class="btn-group" role="group"  >
  <a href="RegEmp.jsp" type="button" class="btn btn-primary">Register New Employee</a>
                </div>
                
                <div class="btn-group" role="group" >
  <a href="ViewAllEmp.jsp" type="button" class="btn btn-primary">Delete Employee</a>
</div>
                 <div class="btn-group" role="group" >
  <a href="ViewAllEmp.jsp" type="button" class="btn btn-primary">Update Employee</a>
</div>
                 <div class="btn-group" role="group" >
  <a href="ViewAllEmp.jsp" type="button" class="btn btn-primary">View All Employee</a>
</div>
        </div> 
            
            
	
            
         <%
           String notfound=(String)session.getAttribute("notfound"); 
            if(notfound!=null){
               %>   
               <div class="panel panel-success">
                   <div class="panel-heading">
    <h4 class="panel-title text-center"> <%=notfound%></h4>
                </div>
                </div>
               
                <%
                session.setAttribute("notfound",null);
                }
            


    HashMap edata=(HashMap)session.getAttribute("edata");

   %>

   <div class="page-header">
            <h3 class="text-capitalize">Update Employee details :EID&nbsp;&nbsp;&nbsp;<%=edata.get("eid")%></h3>
            </div>
  
   
    <div class="row">
         <form action="UpdateEmpDetailsProcess.jsp" role="form" method="post">
        <div class="col-md-6">
           
                   <input type="hidden" name="eid" value="<%=edata.get("eid")%>" >
                   
          <div class="form-group">
                        <label>Name</label>
                        <input type ="text" name="name" class="form-control"  value="<%=edata.get("ename")%> ">
                </div>
               <div class="form-group">
                        <label>Email</label>
                        <input type ="text" name="email" class="form-control" value="<%=edata.get("eemail")%>">
                </div>
                <div class="form-group">
                        <label>password</label>
                        <input type ="text" name="pass" class="form-control" value="<%=edata.get("epass")%>">
                </div>
                    
                <div class="form-group">
                        <label>Phone</label>
                        <input type ="text" name="phone" class="form-control" value="<%=edata.get("ephone")%>" maxlength="10">
                </div>
    
                <div class="form-group">
            <label>Date of birth</label>
            <input type="date" name="dob" class="form-control"  value="<%=edata.get("edob")%>">
            </div>  
            
            
            <%
                        if(edata.get("egender").equals("male")){
                         %>
                         <div class="form-group radio">
                        <label>
                        <input type="radio" name="gender" value="male" checked> Male<br>

                        </label>
              
                        <label>
                        <input type="radio" name="gender" value="female"> Female<br>
                        </label>
               
                        <label>
                         <input type="radio" name="gender" value="other"> Other 
                        </label>
                    </div>   
                            
                        <%
                        }else if(edata.get("egender").equals("female")){
                        %>
                        <div class="form-group radio">
                        <label>
                        <input type="radio" name="gender" value="male" > Male<br>

                        </label>
              
                        <label>
                        <input type="radio" name="gender" value="female" checked> Female<br>
                        </label>
               
                        <label>
                         <input type="radio" name="gender" value="other"> Other 
                        </label>
                    </div>
                        
                        <%
                        }
                        else{
                        %>

                        <div class="form-group radio">
                        <label>
                        <input type="radio" name="gender" value="male" > Male<br>

                        </label>
              
                        <label>
                        <input type="radio" name="gender" value="female"> Female<br>
                        </label>
               
                        <label>
                         <input type="radio" name="gender" value="other" checked> Other 
                        </label>
                    </div>
                        <%
                        }
                        %>
            
            
        </div>
             
    <div class="col-md-6">
        
       <div class="form-group">
       <label>Select Department</label>
<select name="departmenttype" class="form-control" >
        <option ><%=edata.get("edept")%></option>
       <option value="AADHAR CARD">AADHAR CARD</option>
        <option value="DRIVING LICENCE">DRIVING LICENCE</option>
        <option value="PANCARD">PANCARD</option>
        <option value="VOTER CARD">VOTER CARD</option>
       <option value="PASSPORT">PASSPORT</option>
</select>
        </div>
        
     
<div class="form-group">
<label>Address</label>
<input type ="text" name="address"  value="<%=edata.get("eaddress")%>" class="form-control" >
</div>       

         <script>
function populate(s1,s2){
	var s1 = document.getElementById(s1);
	var s2 = document.getElementById(s2);
	s2.innerHTML = "";
	if(s1.value == "Madhya Pradesh"){
		var optionArray = ["|","Morena|Morena","Bhopal|Bhopal","Gwalior|Gwalior","Indor|Indor"];
	}
        else if(s1.value == "Utter Pradesh"){
		var optionArray = ["|","Agra|Agra","Kanpur|Kanpur","Noida|Noida","Lacknow|Lacknow"];
	} 
         else if(s1.value == "Rajsthan"){
		var optionArray = ["|","Ajmer|Ajmer","Jaipur|Jaipur","Udaypur|Udaypur"];
	}
	for(var option in optionArray){
		var pair = optionArray[option].split("|");
		var newOption = document.createElement("option");
		newOption.value = pair[0];
		newOption.innerHTML = pair[1];
		s2.options.add(newOption);
	}
}
</script>   
    
<div class="form-group">
<label>state</label>
<select name="state" class="form-control"  id="state"  onchange="populate(this.id,'city')" >
<option ><%=edata.get("estate")%></option>
<option value="Madhya Pradesh">Madhya Pradesh</option> 
<option value="Utter Pradesh">Utter Pradesh</option>
<option value="Rajsthan">Rajsthan</option>
<!--
 <option value="Andhra Pradesh">Andhra Pradesh</option>
  <option value="Arunachal Pradesh">Arunachal Pradesh</option>
 <option value="Assam">Assam</option>
<option value="Bihar">Bihar</option>
<option value="Chhattisgarh">Chhattisgarh</option>	
<option value="Goa">Goa</option>
<option value="Gujarat">Gujarat</option>
 <option value="Haryana">Haryana</option>
 <option value="Himachal Pradesh">Himachal Pradesh</option>
<option value="Jharkhand">Jharkhand</option>
<option value="Karnataka">Karnataka</option>	
<option value="Kerala">Kerala</option>
<option value="Maharashtra">Maharashtra</option>-->
 </select>
</div>

<div class="form-group">
<label>City</label>
<select id="city" name="city" class="form-control" >
<option ><%=edata.get("ecity")%></option>
</select>
</div>

    <div class="form-group">
        <label>pincode</label>
        <input type="text" name="pincode" value="<%=edata.get("epincode")%>" class="form-control" maxlength="6">
    </div> 
        
 </div>
             <div class="form-group ">
            <button type="submit" class="btn btn-primary ">Update</button>
         </div>
        
    </form> 
    </div>
        </div>
        
       
 <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/bootstrap-table.js"></script>
		
</body>

</html>
<% 
    }
else{
session.setAttribute("msg", "please Login First");
        response.sendRedirect("Official.jsp");
}
   %>