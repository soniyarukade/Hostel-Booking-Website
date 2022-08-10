<%  
   session.removeAttribute("owner_email");
   session.invalidate();   //to remove all the data
   response.sendRedirect("home.jsp");

%>