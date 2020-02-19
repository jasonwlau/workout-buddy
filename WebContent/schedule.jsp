<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*" %>
<%@page import="SpotMeTrojan.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
  margin: 0;
  min-width: 250px;
}
/* Include the padding and border in an element's total width and height */
* {
  box-sizing: border-box;
}
/* Remove margins and padding from the list */
ul#myUL {
  margin: 0;
  padding: 0;
}
/* Style the list items */
ul#myUL li {
  cursor: pointer;
  position: relative;
  padding: 12px 8px 12px 40px;
  list-style-type: none;
  background: #eee;
  font-size: 18px;
  transition: 0.2s;
  /* make the list items unselectable */
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}
/* Set all odd list items to a different color (zebra-stripes) */
ul#myUL li:nth-child(odd) {
  background: #F9F9F9;
}
/* Darker background-color on hover */
ul#myUL li:hover {
  background: #ddd;
}
/* When clicked on, add a background color and strike out text */
ul#myUL li.checked {
  background: #888;
  color: #fff;
  text-decoration: line-through;
}
/* Add a "checked" mark when clicked on */
ul#myUL li.checked::before {
  content: '';
  position: absolute;
  border-color: #fff;
  border-style: solid;
  border-width: 0 2px 2px 0;
  top: 10px;
  left: 16px;
  transform: rotate(45deg);
  height: 15px;
  width: 7px;
}
/* Style the close button */
.close {
  position: absolute;
  right: 0;
  top: 0;
  padding: 12px 16px 12px 16px;
}
.close:hover {
  background-color: #F44336;
  color: white;
}
/* Style the header */
.header {
  background-color: #b30000;
  padding: 30px 40px;
  color: white;
  text-align: center;
}
/* Clear floats after the header */
.header:after {
  content: "";
  display: table;
  clear: both;
}
/* Style the input */
input {
  margin: 0;
  border: none;
  border-radius: 0;
  width: 75%;
  padding: 10px;
  float: left;
  font-size: 16px;
}
/* Style the "Add" button */
.addBtn {
  padding: 10px;
  width: 25%;
  background: #D9D9D9;
  color: #555;
  float: left;
  text-align: center;
  font-size: 16px;
  cursor: pointer;
  transition: 0.3s;
  border-radius: 0;
}
.addBtn:hover {
  background-color: #bbb;
}
</style>
 <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700|Oxygen:400,700" rel="stylesheet">

    <link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/jquery.fancybox.min.css">

    <link rel="stylesheet" href="fonts/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="fonts/fontawesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">
    <link rel="stylesheet" href="myInfo.css">
<title>Notifications</title>

<script>
function submitform(name) {
	document.getElementById(name).submit();
}
function cancel(i){
	//check error
	var xhttp = new XMLHttpRequest();
	console.log(i);
	xhttp.open("GET", "RemoveConnection?sender=" + document.myform.sender.value +
			"&day=" + document.myform.day.value + "&time=" +
			document.myform.time.value +"&interest=" + document.myform.interest.value , true);
			
	xhttp.send();
	console.log("sent")
	
	document.getElementById(i).innerHTML = "";
	return false;
}


</script>	
</head>
<body>

   <header >
    <nav class="navbar navbar-expand-lg  bg-dark">
      <div class="container-fluid">
        <a class="navbar-brand " href="index.jsp">SpotMeTrojan</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample05"
          aria-controls="navbarsExample05" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarsExample05">
          <ul class="navbar-nav pl-md-5 mr-auto">
            <li class="nav-item">
              <a class="nav-link " href="home.jsp">Home</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="RecommendServlet">Connections</a>
            </li>
            <%
				System.out.println(request.getSession().getAttribute("userName"));
				if(request.getSession().getAttribute("userName")!= null && !request.getSession().getAttribute("userName").equals("")){
			%>
            
			<li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="class.jsp" id="dropdown04" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false">Me</a>
              <div class="dropdown-menu" aria-labelledby="dropdown04">
               
                  <a class="dropdown-item" href="myInfo.jsp">Profile</a>
                  <a class="dropdown-item" href="CS">Schedule</a>
                  <a class="dropdown-item" href="IS">Notify</a>
              </div>
              </li>
             <%
			}
           %>

              <li class="nav-item">
                <a class="nav-link" href="contact.jsp">Contact Us!</a>
              </li>
             
          </ul>
                <%
				System.out.println(request.getSession().getAttribute("userName"));
				if(request.getSession().getAttribute("userName")== null || request.getSession().getAttribute("userName").equals("")){
			%>
					<a class="nav-link" href = "signin.jsp">Sign-in</a>
					<a class="nav-link" href = "register.jsp">Register</a>
			<%
				}
				else{
			%>
					<a class="nav-link" href = "signoutServlet">Sign-out</a>
					
			<%
				}
			%>
        </div>
      </div>
    </nav>

  </header>

<br>
<br>

<div id="myDIV" class="header">
  <h2 style="margin:5px; color:white" >My Schedule</h2>
  
</div>
<ul id="myUL">
<% // Queue<ConnectDetail> cons = GetInfo.getConnections(session.getAttribute("username")); ; 
Queue<ConnectDetailPro> cons = (Queue<ConnectDetailPro>) request.getSession().getAttribute("connection");

int i = 0;	
for(ConnectDetailPro con:cons ){
%>
  <li> <img src="img/<%=con.photoID + ".jpg"%>" alt="Italian Trulli" width="70" height="70" style="margin-right:70px;margin-left:100px">
    <%=con.interest%> with <%=con.sender%> on <%=con.day%> in <%=con.time+"."%>  <br> <div style="margin-left:245px"><%=con.sender %>'s email: <%=con.email %></div></li>
  
  

<%
i++;
} %>

</ul>
<script>
/* function acceptRequest(id) {
	var params = $('acceptreq'+id).serialize();
	params += "&accept=1";
	var xhttp = new XMLHttpRequest();
	xhttp.open("POST", "UpdateNotification", true);
	xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xhttp.onreadystatechange = function() {
		if(this.readyState == 4 && this.status == 200){
			document.getElementById("request" + id).style.display = "none";
		}
	}
	xhttp.send(params);
} */
/* function declineRequest(id) {
	var params = $('declinereq'+id).serialize();
	params += "&accept=0";
	var xhttp = new XMLHttpRequest();
	xhttp.open("POST", "UpdateNotification", true);
	xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xhttp.onreadystatechange = function() {
		if(this.readyState == 4 && this.status == 200){
			document.getElementById("request" + id).style.display = "none";
		}
	}
	xhttp.send(params);
} */
/* function canclecon(id) {
	var params = $('upc'+id).serialize();
	var xhttp = new XMLHttpRequest();
	xhttp.open("POST", "RemoveConnection", true);
	xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xhttp.onreadystatechange = function() {
		if(this.readyState == 4 && this.status == 200){
			document.getElementById("request" + id).style.display = "none";
		}
	}
	xhttp.send(params);
} */
</script>
<br>
<br>
<br>
<br>
<br>
<br>

<footer class="site-footer" role="contentinfo">
      <div class="container">
        <div class="row mb-5">
          <div class="col-md-4 mb-5">
            <h3>About SpotMeTrojan</h3>
            <p class="mb-5">Join more of our event here!</p>
            <ul  class="list-unstyled footer-link d-flex footer-social">
              <li><a href="#" class="p-2"><span class="fa fa-twitter"></span></a></li>
              <li><a href="#" class="p-2"><span class="fa fa-facebook"></span></a></li>
              <li><a href="#" class="p-2"><span class="fa fa-linkedin"></span></a></li>
              <li><a href="#" class="p-2"><span class="fa fa-instagram"></span></a></li>
            </ul>

          </div>
          <div class="col-md-5 mb-5 pl-md-5">
            <div class="mb-5">
              <h3>Contact Info</h3>
              <ul class="list-unstyled footer-link">
                <li class="d-block">
                  <span class="d-block">Address:</span>
                  <span>University of Southern California</span></li>
                <li class="d-block"><span class="d-block">Telephone:</span><span>+1 323 1111 234</span></li>
                <li class="d-block"><span class="d-block">Email:</span><span>spotmetrojan@usc.edu</span></li>
              </ul>
            </div>
          
            <div class="mb-4">
              <h3>Subscribe</h3>
              <form action="#" method="post" class="site-block-subscribe">
                <div class="input-group mb-3">
                  <input type="text" class="form-control border-secondary bg-transparent" placeholder="Enter your email"
                    aria-label="Enter Email" aria-describedby="button-addon2">
                  <div class="input-group-append">
                    <button class="btn btn-warning" type="button" id="button-addon2">Subscribe</button>
                  </div>
                </div>
              </form>
          
            </div>
          </div>
          <div class="col-md-3 mb-5">
            <h3>Quick Links</h3>
            <ul class="list-unstyled footer-link">
              <li><a href="#">About</a></li>
              <li><a href="#">Terms of Use</a></li>
              <li><a href="#">Disclaimers</a></li>
              <li><a href="#">Contact</a></li>
            </ul>
          </div>
          <div class="col-md-3">
          
          </div>
        </div>
        
      </div>
    </footer>
    <!-- END footer -->
 <!-- loader -->
    <div id="loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#f4b214"/></svg></div>

    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/jquery.waypoints.min.js"></script>
    <script src="js/jquery.fancybox.min.js"></script>
    <script src="js/main.js"></script>
    <script>
// Create a "close" button and append it to each list item
//var myNodelist = document.getElementsByTagName("LI");
var i;
for (i = 0; i < myNodelist.length; i++) {
  var span = document.createElement("SPAN");
  var txt = document.createTextNode("\u00D7");
  span.className = "close";
  span.appendChild(txt);
  myNodelist[i].appendChild(span);
}
// Click on a close button to hide the current list item
//var close = document.getElementsByClassName("close");
/*var i;
for (i = 0; i < close.length; i++) {
  close[i].onclick = function() {
    var div = this.parentElement;
    div.style.display = "none";
  }
}*/
// Add a "checked" symbol when clicking on a list item
var list = document.querySelector('ul');
list.addEventListener('click', function(ev) {
  if (ev.target.tagName === 'LI') {
    ev.target.classList.toggle('checked');
  }
}, false);
// Create a new list item when clicking on the "Add" button
function newElement() {
  var li = document.createElement("li");
  var inputValue = document.getElementById("myInput").value;
  var t = document.createTextNode(inputValue);
  li.appendChild(t);
  if (inputValue === '') {
    alert("You must write something!");
  } else {
    document.getElementById("myUL").appendChild(li);
  }
  document.getElementById("myInput").value = "";
  var span = document.createElement("SPAN");
  var txt = document.createTextNode("\u00D7");
  span.className = "close";
  span.appendChild(txt);
  li.appendChild(span);
  for (i = 0; i < close.length; i++) {
    close[i].onclick = function() {
      var div = this.parentElement;
      div.style.display = "none";
    }
  }
}
</script>


</body>
</html>

