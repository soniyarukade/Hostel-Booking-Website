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
 <% Logger logger = Logger.getLogger(this.getClass().getName());%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<!--Code by Divinector (www.divinectorweb.com)-->
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Welcome to HostelDekho.com</title>
    <link rel="stylesheet" href="imageC.css">
    <style>
    .right
    {
      float:right;
    }
    .right, .left
    {
      display:inline-block;
    }
    td:first-child{
    float:left;
}

table tr td{
	border-style:groove;
	padding:2px;
	margin-left:2px;
}
table{
	margin-left:2%;
	width:90%;
}
* { box-sizing: border-box; }
body {
  font: 16px Arial;
}
.autocomplete {
  /*the container must be positioned relative:*/
  position: relative;
  display: inline-block;
  margin-top:2%;
  margin-left:4%;
}
input {
  border: 1px solid transparent;
  background-color: #f1f1f1;
  padding: 10px;
  font-size: 16px;
}
input[type=text] {
  background-color: #f1f1f1;
  width: 100%;
}
input[type=submit] {
  background-color: DodgerBlue;
  color: #fff;
}
.autocomplete-items {
  position: absolute;
  border: 1px solid #d4d4d4;
  border-bottom: none;
  border-top: none;
  z-index: 99;
  /*position the autocomplete items to be the same width as the container:*/
  top: 100%;
  left: 0;
  right: 0;
}
.autocomplete-items div {
  padding: 10px;
  cursor: pointer;
  background-color: #fff;
  border-bottom: 1px solid #d4d4d4;
}
.autocomplete-items div:hover {
  /*when hovering an item:*/
  background-color: #e9e9e9;
}
.autocomplete-active {
  /*when navigating through the items using the arrow keys:*/
  background-color: DodgerBlue !important;
  color: #ffffff;
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
	padding-top:40px;
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
    background:#66ccff;
	color: #000000;
    }


</style>   

</head>
<body>
   <header>
    <div class="wrapper">
        <div class="logo">
            <img src="images\LOGOImg.jpeg" alt="" height="100" width="100"/>
        </div>
        <% String msg = request.getParameter("msg"); %>
<ul class="nav-area">
<li><a href="home.jsp" class="active">Home</a></li>
<li><a href="about.jsp">About</a></li>
<li><a href="image.jsp?msg=<%=msg%>">Hostels</a></li>
<li><a <%

    if("done".equals(msg))
    {%>
    	href="logout.jsp"<%
    } 
    else{
    %>
    href="signup.jsp"<%
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
<li><a href="MyBooking.jsp">My Bookings</a></li>

<%



if("done".equals(msg))
{
	  String email = session.getAttribute("email").toString();
	  %>
	  
	      <li><a href="#"><% out.print(email); %></a></li>
	  <%
}%>


</ul>
</div>

</header>
<%
String email = session.getAttribute("email").toString();
if("".equals(email))
{
	response.sendRedirect("login.jsp");
}
else
{
	Connection con;
	Statement st;
	ResultSet rs;
	PreparedStatement ps;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		con= DriverManager.getConnection("jdbc:mysql://localhost:3306/temp","root","Soniya@2071");
		st=con.createStatement();
		String sql ="select user_details.Id,Hostels.Name,Hostels.Address,Hostels.location,contact,occupancy_type,amount_paid,img1 from hostels inner join user_details on hostels.Id = user_details.Id inner join hostel_image on user_details.Id = hostel_image.Id where email = '"+email+"'";
		
		rs= st.executeQuery(sql);

		int cnt=0;
      %>
      <br>
        <table>
      <% 
		while(rs.next()){
			
			cnt=1;%>
			<tr>
			
			<td>
			<div class="left">
			<form method=post >
			<img src="images\<%=rs.getString("img1")%>.jpg" height="350" width="400" alt="chitale hostel" /></a>
		
        </form>
	       </div>
			</td>
			
			<td style="width:65%;">
			 <div class="right">
			      <h4>Hostel Booked : <%=rs.getString("Name") %></h4>
			      <br>
			      <h4>Hostel Address : <%=rs.getString("Address") %></h4>
			      <br>
			      <h4>Hostel Location<%=rs.getString("location") %></h4>
			      <br>
			      <h4>Owner Contact : <%=rs.getString("contact") %></h4>
			      <br>
			      <h4>Occupancy Type : <%=rs.getString("occupancy_type") %></h4>
			      <br>
			      <h4>Amount Paid : <%=rs.getInt("amount_paid") %></h4>  
			 </div>
			</td>
		</tr>
			
			<%  }%>
			</table>
			<% 
		if(cnt==0)
		{
			System.out.println("not fetched booked hostel");
		}
		
		} 
	catch (Exception e)
	{

		e.printStackTrace();
	}
}
%>


</body>
</html>