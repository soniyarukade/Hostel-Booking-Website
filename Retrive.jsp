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
<html>
<head>
<meta charset="ISO-8859-1">
<title>JSP page</title>
</head>
<body>



	




<%
ArrayList<String> reviews = new ArrayList<String>();
String Name="";
String Contact="";
String Address="";
String Description="";
String rooms="";
String Rating="";
String img1="";
String img2="";
String img3="";
int count_review = 0;
float rate=0;
float rate_count=0;
Connection con;
Statement st;
ResultSet rs;
PreparedStatement ps;

int Id = Integer.parseInt(request.getParameter("Id"));
System.out.println("Id = "+Id);
try {
Class.forName("com.mysql.jdbc.Driver");
con= DriverManager.getConnection("jdbc:mysql://localhost:3306/temp","root","Soniya@2071");
st=con.createStatement();
String sql ="select* from Hostels where Id='"+Id+"'";
rs= st.executeQuery(sql);

int cnt=0;


while(rs.next()){
	
	cnt=1;
	Name = rs.getString("Name");
	Contact = rs.getString("Contact");
	Address = rs.getString("Address");
	Description = rs.getString("Description");
	rooms = rs.getString("rooms");
	Rating = rs.getString("Rating");
	rate = rs.getFloat("rate");
	rate_count = rs.getFloat("rate_count");
	System.out.println("Name = "+Name);
	 }
if(cnt==0)
{
	System.out.println("not fetched hostel");
}
sql = "select * from hostel_reviews where Id="+Id+"";
rs = st.executeQuery(sql);
while(rs.next())
{
	count_review = rs.getInt("count");
	for(int i=0;i<count_review;i++)
	{
		int k = i+4;
		reviews.add(rs.getString(k));
	}
	
}
} catch (Exception e) {

e.printStackTrace();
}

try {
	Class.forName("com.mysql.jdbc.Driver");
	con= DriverManager.getConnection("jdbc:mysql://localhost:3306/temp","root","Soniya@2071");
	st=con.createStatement();
	String query = "select * from hostel_image where Id='"+Id+"'";
	rs= st.executeQuery(query);
	while(rs.next()){
		img1 = rs.getString("img1");
		img2 = rs.getString("img2");
		img3 = rs.getString("img3");
		
	}
}
catch (Exception e) {

e.printStackTrace();
}


session.setAttribute("Name",Name);
session.setAttribute("Contact", Contact);
session.setAttribute("Address", Address);
session.setAttribute("Description", Description);
session.setAttribute("rooms", rooms);
session.setAttribute("Rating", Rating);
session.setAttribute("rate_count", rate_count);
session.setAttribute("rate", rate);
session.setAttribute("img1", img1);
session.setAttribute("img2", img2);
session.setAttribute("img3", img3);
session.setAttribute("count_review", count_review);

session.setAttribute("Id", Id);
session.setAttribute("reviews", reviews);
response.sendRedirect("commontemp.jsp");
%>

</body>
</html>