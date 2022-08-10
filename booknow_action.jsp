<%@page import="javax.mail.MessagingException"%>
<%@ page import = "connection.Connection_provider"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.Properties"%>
<%@ page import = "javax.mail.internet.InternetAddress"%>
<%@ page import = "javax.mail.Authenticator"%>
<%@ page import = "javax.mail.Message"%>
<%@ page import = "javax.mail.PasswordAuthentication"%>
<%@ page import = "javax.mail.Session"%>
<%@ page import = "javax.mail.Transport"%>
<%@ page import = "javax.mail.internet.MimeMessage"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


      

      <% 
      
      
      String checkin = (String)session.getAttribute("checkin");
      String hostel_address = (String)session.getAttribute("Address");
      String hostel_name = (String)session.getAttribute("Name");
      Integer res = (Integer)session.getAttribute("res");
      Integer Id = (Integer)session.getAttribute("Id");
      String email = request.getParameter("email");
      String Name = request.getParameter("Name");
      String address = request.getParameter("address");
      String nationality = request.getParameter("nationality");
      String occupancy_type = request.getParameter("occupancy_type");
      String name_on_card = request.getParameter("name_on_card");
      String card_number = request.getParameter("card_number");
      String validity = request.getParameter("validity");
      String upi_id = request.getParameter("upi_id");
      String phone  = request.getParameter("Phone");
      String cvv  = request.getParameter("cvv");
      String amount_paid = request.getParameter("amount_paid");
      String owner_email="";
      
      
      
      try {
    	  Connection con = Connection_provider.getCon();
    	  ResultSet rs;
    	  Statement st=con.createStatement();
    	  PreparedStatement ps = con.prepareStatement("insert into user_details values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
    	  ps.setString(1,email);
    	  ps.setString(2,Name);
    	  ps.setString(3,phone);
    	  ps.setString(4,address);
    	  ps.setString(5,nationality);
    	  ps.setString(6,occupancy_type);
    	  ps.setString(7,name_on_card);
    	  ps.setString(8,card_number);
    	  ps.setString(9,validity);
    	  ps.setString(10,cvv);
    	  ps.setString(11,upi_id);
    	  ps.setString(12,amount_paid);
    	  ps.setInt(13,Id);
    	  ps.executeUpdate();
    	  int update = res-1;
    	  int numUpd;
    	  
    	  String sql = "update hostel_sharing set "+occupancy_type+" = "+update+" where Id = "+Id+"";
    	  st.executeUpdate(sql);
    	  sql = "select * from hostels where Id="+Id+"";
    	  rs=st.executeQuery(sql);
    	  int earning=0;
    	  while(rs.next())
    	  {
    		  owner_email = rs.getString("hostel_email");
    	  }
    	  sql="select * from owner where email = '"+owner_email+"'";
    	  rs=st.executeQuery(sql);
    	  while(rs.next())
    	  {
    		  earning=rs.getInt("earnings");
    	  }
    	  System.out.println("earning is : "+earning);
    	  int amount = Integer.parseInt(amount_paid);
    	  
    	  int new_earning = earning + amount;
    	  sql = "update owner set earnings = "+new_earning+" where email = '"+owner_email+"'";
    	  st.executeUpdate(sql);
    	  System.out.println("done update");

      }catch(Exception e){
	System.out.println(e);
}
      
      %>
      
      <%
  

String to = email;
String to1 = owner_email;
String from = "hosteldekho20@gmail.com";
String pass = "dshkzrehvxsgrlps";

String host = "Smtp.gmail.com";

//your host email smtp server details
Properties pr = new Properties();
pr.put("mail.smtp.host", host);
pr.put("mail.transport.protocol", "smtp");
pr.put("mail.smtp.auth", "true");
pr.put("mail.smtp.starttls.enable", "true");
pr.put("mail.user",from);
pr.put("mail.password", pass);
pr.put("mail.smtp.port", "587");

Session mailSession = Session.getInstance(pr, new Authenticator() {
   
    protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication(from, pass);
    }
});
String msg="";
try{
MimeMessage message = new MimeMessage(mailSession);
MimeMessage message1 = new MimeMessage(mailSession);
message.setFrom(new InternetAddress(from));
message1.setFrom(new InternetAddress(from));
message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
message1.setRecipient(Message.RecipientType.TO, new InternetAddress(to1));
message.setSubject("From HostelDekho.com");
message1.setSubject("From HostelDekho.com");



String Mess = "Greetings from HostelDekho.com, \n   We are Glad that you chose HostelDekho.com to book your Hostel. Room is booked for "+Name+" in "+hostel_name+".\n\nHostel Details\n\nHostel Name - "+hostel_name+".\nRoom-type - "+occupancy_type+".\nHostel Address - "+hostel_address+".\nCheck in Date - "+checkin+".\nAmount paid - "+amount_paid+"\n\nThank You!";
String mesg = "Greetings from HostelDekho.com, \n   "+occupancy_type+" bed is booked in "+hostel_name+" by "+Name+"\n\nCheck-in Date : "+checkin+"\nAmount paid : "+amount_paid+"";
message.setText(Mess);
message1.setText(mesg);
Transport.send(message);
Transport.send(message1);

}

catch(MessagingException mex)
{
	System.out.println("Error is this = "+mex);
	mex.printStackTrace();
	response.sendRedirect("home.jsp");
}




response.sendRedirect("home.jsp");
%>
      
</body>
</html>