<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page errorPage="Error.jsp" %>
<%
String cname=(String)session.getAttribute("cname");
if(cname!=null){
    int cid =(Integer)session.getAttribute("cid"); 
   String documentname=(String)session.getAttribute("documentname"); 
    HashMap ud =(HashMap)session.getAttribute("ud"); 
    
%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
<title>Change Address</title>

<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">

</head>

<body>   
    
	<%@ include file="CHeader.html" %>

<br><br>
<div class="container-fluid">   
    <%
           String msg=(String)session.getAttribute("msg"); 
            if(msg!=null){
               %>   
               <div class="panel panel-primary">
                   <div class="panel-heading">
    <h4 class="panel-title text-center"> <%=msg%></h4>
                </div>
                </div>
               
                <%
                session.setAttribute("msg",null);
                }
                %>
                
	<div class="row">
          <div class="col-md-2">
            
	<ul class="nav nav-pills nav-stacked">
  <li role="presentation"  ><a href="Profile.jsp">View Profile</a></li>
  <li role="presentation"  ><a href="EditProfile.jsp">Edit Profile</a></li>
  <li role="presentation" ><a href="PI.jsp">Personal Information</a></li>
  <li role="presentation" class="active" ><a href="ChangeAddress.jsp">Change Address</a></li>
  <%
      if(documentname!=null){ 
  %> 
  <li role="presentation"  ><a href="UpdateDoc.jsp">Upload Documents</a></li>
  <% }
  %>
  
  
</ul> 
          </div>
           <br><br>
           
               
           <div class="col-md-4 col-md-offset-1">
               <form action="EditProfileProcess.jsp"  method="post" >
            
                   <div class="form-group">
                <label>Address</label>
                <input type ="text" name="address"  value="<%=ud.get("address")%>" class="form-control" >
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
		var optionArray = ["|","Agra|Agra","Kanpur|Kanpur","Noida|Noida","Lacknow|Lacknow"];
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
<option ><%=ud.get("state")%></option>
<option value="Madhya Pradesh">Madhya Pradesh</option> 
<option value="Utter Pradesh">Utter Pradesh</option>
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
<select id="city" name="city" class="form-control" required>
<option ><%=ud.get("city")%></option>
</select>
</div>

              <div class="form-group">
                <label>pincode</label>
                <input type="text" name="pincode" value="<%=ud.get("pincode")%>" class="form-control" maxlength="6">
                      </div>
                   
                    <input type="hidden" name="type" value="address" >
                   
                    <div class="form-group">
        <button  type="submit" class="btn btn-primary">Save Changes</button>
                </div>
                   
                  </form> 
            </div> 
                      
                      <div class="col-md-1 col-md-offset-4">
            <%@ include file="Menu.html"%>
        </div>
                    
       
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
        response.sendRedirect("index.jsp");
}
   %>
        