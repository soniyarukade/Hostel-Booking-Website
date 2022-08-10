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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta charset="ISO-8859-1">
<style>  

.checked {
  color: orange;
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
<link rel="stylesheet" href="imageC.css"> 
<title>Hostels</title>
</head>
<body>

<header>
    <div class="wrapper">
        <div class="logo">
            <img src="images\LOGOImg.jpeg" alt="" width="100" height="100">
        </div>
        
        <!--Make sure the form has the autocomplete function switched off:-->
<form autocomplete="off" action="Search.jsp">
  <div class="autocomplete" style="width:300px;">
    <input id="myInput" type="text" name="h" placeholder="Search Hostel by Name/Area">
  </div>
  <input type="submit" value="Search">
</form>
<script>
var countries = ["Chitale Hostel","City Pride Chowk","Daizy Hostel","David Hostel","Deccan Gymkhana","Koregaon Park","Karve Nagar","Nandini Hostel","Ramadan Hostel","Swaroop Hostel","Viman Nagar"];
function autocomplete(inp, arr) {
	  /*the autocomplete function takes two arguments,
	  the text field element and an array of possible autocompleted values:*/
	  var currentFocus;
	  /*execute a function when someone writes in the text field:*/
	  inp.addEventListener("input", function(e) {
	      var a, b, i, val = this.value;
	      /*close any already open lists of autocompleted values*/
	      closeAllLists();
	      if (!val) { return false;}
	      currentFocus = -1;
	      /*create a DIV element that will contain the items (values):*/
	      a = document.createElement("DIV");
	      a.setAttribute("id", this.id + "autocomplete-list");
	      a.setAttribute("class", "autocomplete-items");
	      /*append the DIV element as a child of the autocomplete container:*/
	      this.parentNode.appendChild(a);
	      /*for each item in the array...*/
	      for (i = 0; i < arr.length; i++) {
	        /*check if the item starts with the same letters as the text field value:*/
	        if (arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
	          /*create a DIV element for each matching element:*/
	          b = document.createElement("DIV");
	          /*make the matching letters bold:*/
	          b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
	          b.innerHTML += arr[i].substr(val.length);
	          /*insert a input field that will hold the current array item's value:*/
	          b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
	          /*execute a function when someone clicks on the item value (DIV element):*/
	              b.addEventListener("click", function(e) {
	              /*insert the value for the autocomplete text field:*/
	              inp.value = this.getElementsByTagName("input")[0].value;
	              /*close the list of autocompleted values,
	              (or any other open lists of autocompleted values:*/
	              closeAllLists();
	          });
	          a.appendChild(b);
	        }
	      }
	  });
	  /*execute a function presses a key on the keyboard:*/
	  inp.addEventListener("keydown", function(e) {
	      var x = document.getElementById(this.id + "autocomplete-list");
	      if (x) x = x.getElementsByTagName("div");
	      if (e.keyCode == 40) {
	        /*If the arrow DOWN key is pressed,
	        increase the currentFocus variable:*/
	        currentFocus++;
	        /*and and make the current item more visible:*/
	        addActive(x);
	      } else if (e.keyCode == 38) { //up
	        /*If the arrow UP key is pressed,
	        decrease the currentFocus variable:*/
	        currentFocus--;
	        /*and and make the current item more visible:*/
	        addActive(x);
	      } else if (e.keyCode == 13) {
	        /*If the ENTER key is pressed, prevent the form from being submitted,*/
	        e.preventDefault();
	        if (currentFocus > -1) {
	          /*and simulate a click on the "active" item:*/
	          if (x) x[currentFocus].click();
	        }
	      }
	  });
	  function addActive(x) {
	    /*a function to classify an item as "active":*/
	    if (!x) return false;
	    /*start by removing the "active" class on all items:*/
	    removeActive(x);
	    if (currentFocus >= x.length) currentFocus = 0;
	    if (currentFocus < 0) currentFocus = (x.length - 1);
	    /*add class "autocomplete-active":*/
	    x[currentFocus].classList.add("autocomplete-active");
	  }
	  function removeActive(x) {
	    /*a function to remove the "active" class from all autocomplete items:*/
	    for (var i = 0; i < x.length; i++) {
	      x[i].classList.remove("autocomplete-active");
	    }
	  }
	  function closeAllLists(elmnt) {
	    /*close all autocomplete lists in the document,
	    except the one passed as an argument:*/
	    var x = document.getElementsByClassName("autocomplete-items");
	    for (var i = 0; i < x.length; i++) {
	      if (elmnt != x[i] && elmnt != inp) {
	      x[i].parentNode.removeChild(x[i]);
	    }
	  }
	}
	/*execute a function when someone clicks in the document:*/
	document.addEventListener("click", function (e) {
	    closeAllLists(e.target);
	});
	}


autocomplete(document.getElementById("myInput"), countries);
</script>
        
        <% String msg = request.getParameter("msg"); %>
<ul class="nav-area">
<li><a href="home.jsp" >Home</a></li>
<li><a href="about.jsp">About</a></li>
<li><a href="image.jsp" class="active">Hostels</a></li>
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


<br>



<%
Connection con;
Statement st;
ResultSet rs;
PreparedStatement ps;

try {
	Class.forName("com.mysql.jdbc.Driver");
	con= DriverManager.getConnection("jdbc:mysql://localhost:3306/temp","root","Soniya@2071");
	st=con.createStatement();
	String sql ="select hostels.Id,Name,Address,Rating,location,img1,img2,img3,Girl,Boy from hostels inner join hostel_image on hostels.Id = hostel_image.Id inner join hostel_gender on hostels.Id = hostel_gender.Id";
	rs= st.executeQuery(sql);

	int cnt=0;

    %>
    <table>
    <% 
	while(rs.next())
	{
	  cnt=1;
	%>
	    <tr>
		
			<td>
			<form method=post >
			<a href ="Retrive.jsp?Id=<%=rs.getInt("Id") %>" style="color:black;font-size:20px;"><img src="images\<%=rs.getString("img1")%>.jpg" height="350" width="400" alt="chitale hostel" /></a>
		
        </form>
	    
			</td>
			
			<td style="width:65%;">
			 <div class="right">
			      <h2> <%=rs.getString("Name") %></h2>
			      <br>
			      <p><%=rs.getString("Address") %></p>
			      <br>
			      <h4><%=rs.getString("location") %></h4>
			      <br>
			      <h5>For Girls : <%=rs.getString("Girl") %></h5>
			      <br>
			      <h5>For Boys : <%=rs.getString("Boy") %></h5>
			 </div>
			 <br>
			 <%
			 float decimal = rs.getFloat("Rating")%1;
			 int rating = (int)rs.getFloat("Rating");
			   for(int i=0;i<rating;i++)
			   {
				   %>
				     <span class="fa fa-star checked"></span>
				   <% 
			   }
			   
			   for(int i=(5-rating);i>=1;i--)
			   {%>
			       
			       <span class="fa fa-star"></span>
			<%	   
			   }
			 %>
			 
			 
			 
			</td>
		</tr>
			
	
	
	<% 
		
		}
    %>
    </table>
    <%
	if(cnt==0)
	{
		System.out.println("not fetched hostel");
	}
	
	} catch (Exception e) {

	e.printStackTrace();
	}
%>

	

</body>
</html>