<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*" %>
<%@page import="SpotMeTrojan.*" %>
<!DOCTYPE html>
<html>
<head>
<script src = "jquery.js"></script>
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700|Oxygen:400,700" rel="stylesheet">
    <link rel="stylesheet" href="myInfo.css">
<title>Notifications</title>
<style>
#header{
  width:100%;
  text-align:center;
  padding-top:5%;
  padding-bottom:5%;
}
button{
padding: 10px 6px;
}
h1{
margin-left:15%;
font-weight: normal;
}
table{
margin-left:15%;
margin-right:15%;
}
td{
vertical-align: center;
font-size: 20px;
border-bottom: 1px solid #ddd;
}
</style>
<script>
function remove(form) {
    var c = form.name.substring(2);
    form.style.display = "none";
    document.getElementById(c).style.display = "none";
    var params = "sender="+form.sender.value+"&day="+form.day.value+"&time="+form.time.value+"&interest="+form.interest.value;
    var xhttp = new XMLHttpRequest();
    xhttp.open("POST", 'DeclineRequest', false);
    xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    //document.getElementById("aq"+c).style.display = "none";
    xhttp.send(params);
}
function accept(form) {
    var c = form.name.substring(2);
    form.style.display = "none";
    document.getElementById(c).style.display = "none";
    var params = "sender="+form.sender.value+"&day="+form.day.value+"&time="+form.time.value+"&interest="+form.interest.value;
    
    var xhttp = new XMLHttpRequest();
    xhttp.open("POST", 'AcceptRequest', false);
    xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    var c = form.name.substring(2);
    //document.getElementById("dq"+c).style.display = "none";
    xhttp.send(params);
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
<div id = interests style = "display:inline;">
<h1 style="font-size:25pt">Requests:</h1>
<table>
<% // ArrayList<ConnectDetail> requests = GetInfo.getRequests(session.getAttribute("username"));
    ArrayList<ConnectDetail> req = (ArrayList<ConnectDetail>) request.getSession().getAttribute("invite");
    
    if (req == null){
        System.out.println("null after sent");//test
    }
    
for(int i = 0; i < req.size(); ++i ){%>
<tr id = "<%=i%>">
<td><p  class = "info" id = "request<%=i%>" style = "display:inline;margin-right:50px;">
<%=req.get(i).getSender()%> wants to connect with you!<br>Day: <%=req.get(i).getDay()%>&nbsp&nbsp&nbsp&nbsp&nbspTime: <%=req.get(i).getTime()%>&nbsp&nbsp&nbsp&nbsp&nbspActivity: <%=req.get(i).getInterest()%></p>
    
    </td>
    <td><form name="aq<%=i %>" id = "acceptreq<%=i%>"  style = "display:inline">
    <br>
    <input type = "hidden" name = "sender" value = <%=req.get(i).getSender()%> >
    <input type = "hidden" name = "day" value = <%=req.get(i).getDay()%> >
    <input type = "hidden" name = "time" value = <%=req.get(i).getTime()%> >
    <input type = "hidden" name = "interest" value = <%=req.get(i).getInterest()%> >
    <button class="btn btn-primary px-3 py-3" style = "margin-top:5pt;display:inline;" onclick = "accept(acceptreq<%=i%>)">Accept</button>
        </form>
         <br>
    <br>
        </td>
        <td>
    <form name="dq<%=i %>" id = "declinereq<%=i%>"  style = "display:inline">
    <br>
    <input type = "hidden" name = "sender" value = <%=req.get(i).getSender()%> >
    <input type = "hidden" name = "day" value = <%=req.get(i).getDay()%> >
    <input type = "hidden" name = "time" value = <%=req.get(i).getTime()%> >
    <input type = "hidden" name = "interest" value = <%=req.get(i).getInterest()%> >
        &nbsp &nbsp &nbsp<button class="btn btn-primary px-3 py-3" style = "margin-top:5pt;display:inline;" onclick = "remove(declinereq<%=i%>)" >Decline</button>
    </form>
     <br>
    <br>
    </td>
    
    </tr>
<%} %>
</table>
</div>
<div id = Times style = "display:inline">
<div id = "newevent"></div>
</div>
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
            <ul class="list-unstyled footer-link d-flex footer-social">
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
</body>
</html>