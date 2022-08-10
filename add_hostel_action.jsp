<%@ page import = "connection.Connection_provider"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.Properties"%>

<%
	String hostel_name = request.getParameter("hostel_name");
	String location = request.getParameter("location");
	String hostel_address = request.getParameter("hostel_address");
	String contact = request.getParameter("contact");
	Integer bed_1 = Integer.parseInt(request.getParameter("1_sharing"));
	Integer bed_2 = Integer.parseInt(request.getParameter("2_sharing"));
	Integer bed_3 = Integer.parseInt(request.getParameter("3_sharing"));
	Integer rent_1 = Integer.parseInt(request.getParameter("1_sharing_rent"));
	Integer rent_2 = Integer.parseInt(request.getParameter("2_sharing_rent"));
	Integer rent_3 = Integer.parseInt(request.getParameter("3_sharing_rent"));
	String girl = request.getParameter("gender_girl");
	String boy = request.getParameter("gender_boy");
	String desc = request.getParameter("description");
	String owner_email = session.getAttribute("owner_email").toString();
	
	try {
  	  Connection con = Connection_provider.getCon();
  	  ResultSet rs;
  	  Statement st=con.createStatement();
  	  int count_rows = 0;
  	  String sql = "select * from hostels where Id = 1";
  	  rs=st.executeQuery(sql);
  	  while(rs.next())
  	  {
  		  count_rows = rs.getInt("count_rows");
  	  }
  	  count_rows++;
  	  PreparedStatement ps = con.prepareStatement("insert into hostels values(?,?,?,?,?,?,?,?,?,?,?,?)");
  	  ps.setInt(1,count_rows);
  	  ps.setString(2,hostel_name);
  	  ps.setString(3,contact);
  	  ps.setString(4,hostel_address);
  	  ps.setString(5,desc);
  	  ps.setInt(6,9);
  	  ps.setInt(7,0);
  	  ps.setString(8,location);
  	  ps.setInt(9,0);
  	  ps.setInt(10,0);
  	  ps.setInt(11,count_rows);
  	  ps.setString(12,owner_email);
  	  ps.executeUpdate();
  	  
  	  sql = "SET SQL_SAFE_UPDATES = 0;";
  	  st.executeUpdate(sql);
  	  
  	  sql = "update hostels set count_rows = "+count_rows+"";
  	  st.executeUpdate(sql);
  	  
  	  ps = con.prepareStatement("insert into hostel_sharing values(?,?,?,?)");
  	  ps.setInt(1,count_rows);
  	  ps.setInt(2,bed_1);
  	  ps.setInt(3,bed_2);
  	  ps.setInt(4,bed_3);
  	  ps.executeUpdate();
  	  
  	  ps = con.prepareStatement("insert into hostel_price values(?,?,?,?)");
	  ps.setInt(1,count_rows);
	  ps.setInt(2,rent_1);
	  ps.setInt(3,rent_2);
	  ps.setInt(4,rent_3);
	  ps.executeUpdate();
  	  
	  ps = con.prepareStatement("insert into hostel_gender values(?,?,?)");
	  ps.setInt(1,count_rows);
	  ps.setString(2,girl);
	  ps.setString(3,boy);
	  ps.executeUpdate();
  	  
	  ps = con.prepareStatement("insert into hostel_image values(?,?,?,?)");
	  ps.setInt(1,count_rows);
	  ps.setString(2,"galaxy hostel_1");
	  ps.setString(3,"galaxy hostel_2");
	  ps.setString(4,"galaxy hostel_3");
	  ps.executeUpdate();
	  
	  sql = "Select * from hostel_reviews where Id = 1";
	  rs = st.executeQuery(sql);
	  int max_count_reviews=0;
	  while(rs.next())
	  {
		  max_count_reviews = rs.getInt("max_count");
	  }
	  
	  ps = con.prepareStatement("insert into hostel_reviews(Id,count,max_count) values(?,?,?)");
	  ps.setInt(1,count_rows);
	  ps.setInt(2,0);
	  ps.setInt(3,max_count_reviews);
	  ps.executeUpdate();
	  
  	  System.out.println("done inserting");

    }catch(Exception e){
	System.out.println(e);
}
	
	response.sendRedirect("owner_home.jsp");
    
%>