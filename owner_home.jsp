<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import = "java.util.logging.Logger" %>
<%@page import = "jakarta.servlet.*" %>
<%@page import = "jakarta.servlet.http.*" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<!--Code by Divinector (www.divinectorweb.com)-->
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Welcome to HostelDekho.com</title>
    <link rel="stylesheet" href="imageC.css">
    <style>
    
    .content-loader tr td {
    white-space: nowrap;
}
    table{
	background: #FFFFFF;
	
}
table tr th{
	font-size:20px;
	background: #F45B33;
	-webkit-border-radius: 0 0 5px 5px;
	border-radius: 5px 5px 0 0;
	border-bottom: 2px solid brown;
}
table tr td{
	background:#cccccc;
	border-spacing:0;
	margin:0;
	opacity:.8;
	padding:6px;
}
table td th{
    width:50px;
	text-align:center;
}

    
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
.registerbtn {
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

.registerbtn:hover {
  opacity: 1;
}

/* Add a blue text color to links */
a {
  outline:none;
  text-align:center;
  box-sizing:border box;
  width:50%;
  padding:10px;
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
top:20px;
right:300px;
bottom:300px;
left:300px;

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
	padding: 15px 0;
}
.active{
	background: #66ccff;
	color: #333;
}

</style>    
</head>
<body>
   <header>
    <div class="wrapper">
        <div class="logo">
            <img src="images\LOGOImg.jpeg" alt="" width="100" height="100">
        </div>
        <% String msg = request.getParameter("msg"); %>
<ul class="nav-area">
<li><a href="owner_home.jsp" class="active" >Home</a></li>
<li><a href="about.jsp">About</a></li>
<li><a <%
    if("done".equals(msg))
    {%>
    	href="owner_logout.jsp"<%
    } 
    else{
    %>
    href="owner.jsp"<%
    }%>>
    <%
    if("done".equals(msg))
    {%>
    	Logout<%
    } 
    else{
    %>
    Login<%
    }%></a></li>



<%



if("done".equals(msg))
{
	String owner_email = session.getAttribute("owner_email").toString();
	  %>
	  
	      <li><a href="#"><% out.print(owner_email); %></a></li>
	  <%
}%>


</ul>
</div>

</header>
<div style="padding-left:20px;">
<br>
<h3> Add Your Hostel Here </h3>
<br>
<a style="display:button;text-decoration:none;" href="add_hostel.jsp">Add</a>
</div>

<%
String owner_email = session.getAttribute("owner_email").toString();
System.out.println("email is"+owner_email);
Connection con;
Statement st;
Statement st2;
ResultSet rs;
ResultSet resSet;
PreparedStatement ps;

try {

Class.forName("com.mysql.jdbc.Driver");
con= DriverManager.getConnection("jdbc:mysql://localhost:3306/temp","root","Soniya@2071");
st=con.createStatement();
st2=con.createStatement();
String sql ="select hostels.Id,Name,1_sharing,2_sharing,3_sharing from hostels inner join hostel_sharing on hostels.Id = hostel_sharing.Id where hostel_email = '"+owner_email+"'";
rs = st.executeQuery(sql);


%>
<br>
<br>
<br>
<h3>Booked Hostel Details</h3>
<br>
<table>
<tr>
    <th style="width:100px;">Hostel Id</th>
    <th>Hostel Name</th>
    <th>Beds Booked</th>
    <th>Beds Available</th>
</tr>
<%
while(rs.next())
{
	int beds_avail = rs.getInt("1_sharing")+rs.getInt("2_sharing")+rs.getInt("3_sharing");
	int bed_booked = 30-beds_avail;
	%>
	<tr>
    <td style="width:100px;"><%=rs.getInt("Id")%></td>
    <td><%=rs.getString("Name")%></td>
    <td><%=bed_booked%></td>
    <td><%=beds_avail%></td>
    </tr>
    
	<%
}%>

</table>

<%

sql ="select hostels.Id,Name,1_sharing,2_sharing,3_sharing from hostels inner join hostel_sharing on hostels.Id = hostel_sharing.Id where hostel_email = '"+owner_email+"'";
rs= st.executeQuery(sql);
%>
<br>
<br>
<h3>Amount Received Details</h3>
<br>
<table>
<tr>
    <th style="width:200px;">Hostel Name</th>
    <th>1_sharing</th>
    <th>Amount Received</th>
    <th>2_sharing</th>
    <th>Amount Received</th>
    <th>3_sharing</th>
    <th>Amount Received</th>
    <th>Total amount received</th>
</tr>
<%
String sql2 = "select hostels.Id,Name,1_sharing,2_sharing,3_sharing from hostels inner join hostel_price on hostels.Id = hostel_price.Id where hostel_email = '"+owner_email+"'";
resSet = st2.executeQuery(sql2);

while(rs.next() && resSet.next())
{
	int one =  10-rs.getInt("1_sharing");
	int two = 10-rs.getInt("2_sharing");
	int three =10- rs.getInt("3_sharing");
	int amount_one = one*resSet.getInt("1_sharing");
	int amount_two = two*resSet.getInt("2_sharing");
	int amount_three = three*resSet.getInt("3_sharing");
	
	int total = amount_one + amount_two + amount_three;
	%>
	<tr>
	
	<td style="width:200px;" ><%=rs.getString("Name")%></td>
	<td><%=one%></td>
	<td><%=amount_one%></td>
	<td><%=two%></td>
	<td><%=amount_two%></td>
	<td><%=three%></td>
	<td><%=amount_three%></td>
	<td><%=total %></td>
	


	</tr>
	
	<% 
}

%>

</table>
    <br>
	
	<%
	   sql="select * from owner where email = '"+owner_email+"'";
	   rs = st.executeQuery(sql);
	   int earnings=6;
	   while(rs.next())
	   {
		   earnings = rs.getInt("earnings");
	   }
	%>
	<br>
	<h3 style="align : center;">Total Earnings = <%=earnings%></h3>
    <br>
    
<%
}
catch(Exception e)
{
	System.out.println(e);
}
      

%>

</body>
</html>