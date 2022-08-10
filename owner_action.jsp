<%@ page import = "connection.Connection_provider"%>
<%@ page import = "java.sql.*"%>

<%
     String email = request.getParameter("email");
     String gender = request.getParameter("gender");
     String psw = request.getParameter("psw");
     
     
     try{
    	  Connection con = Connection_provider.getCon();
    	  PreparedStatement ps = con.prepareStatement("insert into owner values(?,?,?,?)");
    	  ps.setString(1,email);
    	  ps.setString(2,gender);
    	  ps.setString(3,psw);
    	  ps.setInt(4,0);
    	  ps.executeUpdate();
    	  response.sendRedirect("owner.jsp?msg=valid");
    	  
     }
     catch(Exception e)
     {
    	 System.out.println(e);
    	 response.sendRedirect("owner.jsp?msg=invalid");
    	
     }

  
%>
