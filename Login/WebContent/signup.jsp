<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<style>
form 
{
    border: 3px solid #f1f1f1;
}

input[type=text], input[type=password] 
{
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

button 
{
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
}

.container 
{
    padding: 16px;
}

span.psw 
{
    float: right;
    padding-top: 16px;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) 
{
    span.psw 
    {
       display: block;
       float: none;
    }
    
}
</style>
</head>
<body>
	<form action="SignupServlet" method="get">
	<div class="container">
		<!--  <label><b>First Name</b></label>
    	<input type="text" placeholder="Enter first name" name="firstname" required>
    	
    	<label><b>Last Name</b></label>
    	<input type="text" placeholder="Enter last name" name="lastname" required>-->
    	
    	<label><b>Username</b></label>
    	<input type="text" placeholder="Enter Username" name="username1" id="uname" >

    	<label><b>Password</b></label>
    	<input type="password" placeholder="Enter Password" name="password1" id="pass1" required>
    	
    	<label><b>Re-enter Password</b></label>
    	<input type="password" placeholder="Enter Password" name="password2" id="pass2" required>
        
    	<button type="submit" onclick="validateform()">Register</button>
 	</div>
 	</form>
 	<script>
 	function validateform()
 	{  
 		var name=document.getElementById("uname").value;
 		var ps1=document.getElementById("pass1").value;  
 		var ps2=document.getElementById("pass2").value;
 		
 		if (name==null || name=="")
 		{  
 			alert("Name can't be blank");
			document.getElementById("uname").focus();
			return false; 
 		}
 		/*else if(ps1.length<6 )
 		{  
 			alert("Password must be at least 6 characters long.");
			document.getElementById("pass1").focus();
			return false;  
 		}
 		else if(ps2.length<6)
 		{  
 			alert("Password must be at least 6 characters long.");
			document.getElementById("pass2").focus();
			return false;  
 		}
 		else if(ps1!=ps2)
 		{  
 			alert("Passwords should match");
			document.getElementById("pass2").focus();*/
		
 		else
 			{
 			alert("Good to go");
 			return true;
 			}	return false;  
 		}
 	
 	
 	</script>
</body>
</html>