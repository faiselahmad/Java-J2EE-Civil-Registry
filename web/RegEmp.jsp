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
<title>Register Employee</title>

<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
</head>

<body style="background-color: gainsboro">
    
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
            
	<div class="page-header">
            <h3 class="text-capitalize">Fill the details</h3>
            </div>
            
        <%
           String empdone=(String)session.getAttribute("empdone"); 
            if(empdone!=null){
               %>   
               <div class="panel panel-info col-lg-offset-3">
                   <div class="panel-heading">
    <h4 class="panel-title text-center"> <%=empdone%> </h4>
                </div>
                </div>
               
                <%
                session.setAttribute("empdone",null);
                }
            %>
   <div class="row">
         <form action="RegEmpProcess.jsp" role="form" method="post">
        <div class="col-md-6">
          <div class="form-group">
                        <label>Name</label>
                        <input type ="text" name="name" class="form-control" placeholder="Name" required>
                </div>
               <div class="form-group">
                        <label>Email</label>
                        <input type ="email" name="email" class="form-control" placeholder="Email" required>
                </div>
                    
                <div class="form-group">
                        <label>Phone</label>
                        <input type ="text" name="phone" class="form-control" placeholder="Phone"  maxlength="10" required>
                </div>
    
                <div class="form-group">
            <label>Date of birth</label>
            <input type="Date" name="dob" class="form-control" required >
            </div>   
            
             <div class="form-group">
                <label>Gender </label>
                <div class="radio">
                        <label>
                       <input type="radio" name="gender" value="male" checked> Male<br>
                        <input type="radio" name="gender" value="female"> Female<br>
                         <input type="radio" name="gender" value="other"> Other 

                        </label>
                </div>
                 </div> 
        </div>
    <div class="col-md-6">
   <div class="form-group">
        <label>Select Department</label>
        <select name="departmenttype" class="form-control" required>
                <option value="">select your department</option>
               <option value="AADHAR CARD">AADHAR CARD</option>
                <option value="DRIVING LICENCE">DRIVING LICENCE</option>
                <option value="PANCARD">PANCARD</option>
                <option value="VOTER CARD">VOTER CARD</option>
                <option value="PASSPORT">PASSPORT</option>
        </select>
    </div>

<div class="form-group">
                <label>Address</label>
                <input type ="text" name="address" class="form-control" placeholder="Address" required>
   </div>
        
        <script>
function populate(s1,s2){
	var s1 = document.getElementById(s1);
	var s2 = document.getElementById(s2);
	s2.innerHTML = "";
	if(s1.value == "Madhya Pradesh"){
		var optionArray = ["|","Morena|Morena","Bhopal|Bhopal","Gwalior|Gwalior","Indor|Indor"];
	}
        else if(s1.value == "Uttar Pradesh"){
		var optionArray = ["|","Agra|Agra","Kanpur|Kanpur","Noida|Noida","Lucknow|Lucknow"];
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
<select name="state" class="form-control"  id="state"  onchange="populate(this.id,'city')" required>
<option value=""></option> 
<option value="Madhya Pradesh">Madhya Pradesh</option> 
<option value="Utter Pradesh">Uttar Pradesh</option>
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
<select id="city" name="city" class="form-control" required></select>                          
</div>

    <div class="form-group">
        <label>pincode</label>
        <input type="text" name="pincode" placeholder="pincode" class="form-control" maxlength="6" required>
    </div>    

</div>
             <div class="form-group">
            
               <button type="submit" class="btn btn-primary ">Register</button>
               <button type="reset" class="btn btn-default " >Reset</button>
         </div>
    </form> 
    </div>
        </div>
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
		
</body>

</html>
<% 
    }
else{
session.setAttribute("msg", "please Login First");
        response.sendRedirect("Official.jsp");
}
   %>