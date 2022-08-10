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
<%
ArrayList<String> reviews = new ArrayList<String>();
Integer Id = (Integer)session.getAttribute("Id");
Float rate =(Float) session.getAttribute("rate");
int star =Integer.parseInt(request.getParameter("star"));
float Star = star;
String review = request.getParameter("comment");
System.out.println("review is : "+review);
Float rate_count =(Float) session.getAttribute("rate_count");

rate_count += 1;
float sum = rate+star;
float res = sum/rate_count;
System.out.println("res = "+res);
int count=0;
int max_count=0;
Connection con;
Statement st;
ResultSet rs;
PreparedStatement ps;

try {
Class.forName("com.mysql.jdbc.Driver");
con= DriverManager.getConnection("jdbc:mysql://localhost:3306/temp","root","Soniya@2071");
st=con.createStatement();
String sql ="update hostels set rate = "+sum+" where Id = "+Id+"";
st.executeUpdate(sql);
sql = "update hostels set rate_count = "+rate_count+" where Id = "+Id+"";
st.executeUpdate(sql);
sql = "update hostels set Rating = "+res+" where Id = "+Id+"";
st.executeUpdate(sql);
sql = "select * from hostel_reviews where Id = '"+Id+"'";
rs = st.executeQuery(sql);
while(rs.next())
{
	count = rs.getInt("count");
	count++;
	max_count = rs.getInt("max_count");
	System.out.println("count = "+count);
}
if(count > max_count)
{
sql = "alter table hostel_reviews add column review_"+count+" varchar(1000)";
st.executeUpdate(sql);
max_count++;
sql = "update hostel_reviews set max_count = "+max_count+"";
st.executeUpdate(sql);
}

sql = "update hostel_reviews set review_"+count+" = '"+review+"' where Id="+Id+"";
st.executeUpdate(sql);


sql = "update hostel_reviews set count = "+count+" where Id = "+Id+"";
st.executeUpdate(sql);

sql = "select * from hostel_reviews where Id = '"+Id+"'";
rs=st.executeQuery(sql);

while(rs.next())
{
	for(int i=0;i<count;i++)
	{
	reviews.add(rs.getString(i+4));
	}
}
System.out.println("inserted new review and rating");

}
catch(Exception e)
{
	System.out.println(e);
}
session.setAttribute("reviews", reviews);
session.setAttribute("Rating",res);
response.sendRedirect("commontemp.jsp");

	
%>