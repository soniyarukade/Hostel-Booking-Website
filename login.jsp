<html>
<head>
<title>Login page</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
  font-family: Arial, Helvetica, sans-serif;
  background-color: white;
}
main {
background-image:url('https://youthincmag.com/wp-content/uploads/2018/10/hostel-1.jpg');
height:100vh;
-webkit-background-size:cover;
background-size:cover;
background-position:center center;
position:relative;

}

* {
  box-sizing: border-box;
}

/* Add padding to containers */
.container {
  padding: 16px;
  background-color:white
}

/* Full-width input fields */
input[type=text], input[type=password] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: 1px solid black;
  background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

/* Overwrite default styles of hr */
hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}

/* Set a style for the submit button */
.loginbtn {
  background-color: #88ff4d;
  font-size:20px;
  color: black;
  padding: 16px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

.loginbtn:hover {
  opacity: 1;
}

/* Add a blue text color to links */
a {
  outline:none;
  text-align:center;
  box-sizing:border box;
  width:50%;
  padding:5px;
  color:white;
  background-color: green;
}
a:hover {
background:dogger blue;
}
/* Set a grey background color and center the text of the "sign in" section */
.signin {
  background-color: white;
  text-align: center;
}
h1 {
text-align: center;
color:black;
}
form {
position:absolute;
top:10px;
right:350px;
bottom:300px;
left:350px;

}

header{
	height:100px;
	background-color:#003366;
}


* {
	margin: 0;
	padding: 0;
}
body {
	font-family: 'Poppins', sans-serif;
}

.nav-area {
	float: right;
	list-style: none;
	margin-top: 30px;
}
.nav-area li {
	display: inline-block;
}
.nav-area li a {
	color: #ffffff;
	text-decoration: none;
	padding: 5px 20px;
	font-family: poppins;
	font-size: 16px;
	text-transform: uppercase;

}
.nav-area li a:hover {
	background: #ffffff;
	color: #333;
}
.logo {
	float: left;
}
.logo img {
	width: 100%;
	height: 100%;
	padding: 10px;
}
.active{
	background: #66ccff;
	color: #333;
}

.animate {
  -webkit-animation: animatezoom 0.6s;
  animation: animatezoom 0.6s
}

@-webkit-keyframes animatezoom {
  from {-webkit-transform: scale(0)} 
  to {-webkit-transform: scale(1)}
}
  
@keyframes animatezoom {
  from {transform: scale(0)} 
  to {transform: scale(1)}
}


</style>
</head>
<body>
 <header>
    <div class="wrapper">
        <div class="logo">
            <img src="images\LOGOImg.jpeg" alt="" width="100" height="100">
        </div>
<ul class="nav-area">
<li><a href="home.jsp">Home</a></li>
<li><a href="about.jsp">About</a></li>
<li><a href="image.jsp">Hostels</a></li>
<li><a href="signup.jsp" class="active">Login</a></li>
<li><a href="owner.jsp">Admin</a></li>
</ul>
</div>
</header>


<main>
<img src="https://youthincmag.com/wp-content/uploads/2018/10/hostel-1.jpg"  alt="">
<form class="animate" action="login_action.jsp" method="post">
  <div class="container";div style="background-color:white; color:black ; padding:20px;">
    <h1>Login</h1>
    <br/>
    <p align="center"><strong>Please enter your registered Email</strong></p>
    <hr>

    <label for="email"><b>Email</b></label>
    <input type="text" placeholder="Enter Email" name="email" id="email" required></br>
   
    <label for="psw"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="psw" id="psw" required>
   <hr>
   <br/>
    <p align="center" ><a href="forgot_password.jsp">Forgot Password</a>.</p><br/>
    <button type="submit" class="loginbtn"><strong>Login</strong></button>
    <hr>
  </div>
  <div>
  </div>
   
  <div class="signin">
    <%
          String msg = request.getParameter("msg");
    	  if("notexist".equals(msg))
    	  {
    		  %>
    		  <h4>Invalid email or password</h4>
    		  <%
    	  }%>
    	  
    	  <%
         
    	  if("match".equals(msg))
    	  {
    		  %>
    		  <h4>Please Check Your Mail and Login</h4>
    		  <%
    	  }%>
    	  
    <%
         if("invalid".equals(msg))
         {
        	 %>
        	 <h4>Something went wrong. Try Again!</h4>
        	 <%
         }%>
    <p><strong>Didn't have an account? </strong><a href="signup.jsp">Sign up</a>.</p><br/>
  </div>
</form>
</main>
</body>
</html>