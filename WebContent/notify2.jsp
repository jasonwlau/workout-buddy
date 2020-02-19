<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*" %>
<%@page import="SpotMeTrojan.*" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700|Oxygen:400,700" rel="stylesheet">

    <link rel="stylesheet" href="myInfo.css">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700|Oxygen:400,700" rel="stylesheet">
    <link rel="stylesheet" href="css/animate.css">
  <link rel="stylesheet" href="css/owl.carousel.min.css">
  <link rel="stylesheet" href="css/jquery.fancybox.min.css">
  <link rel="stylesheet" href="fonts/ionicons/css/ionicons.min.css">
  <link rel="stylesheet" href="fonts/fontawesome/css/font-awesome.min.css">
  <link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">
    <!-- Theme Style -->
  <link rel="stylesheet" href="css/style.css">
  <script src="https://www.google.com/recaptcha/api.js" async defer></script>
<title>Notifications</title>
<style>

#header{
  width:100%;
  text-align:center;
  padding-top:5%;
  padding-bottom:5%;
}

#interests{
  width:50%;
  height:300px;
  float:left;
}

#times{
  width:50%;
  height:300px;
  float:left;
}

#info{
  width:50%;
  height:200px;
  float:left;
}

#title{
  font-size:25px;
  width:50%;
  float:left;
}

</style>
<script>
function submitform(name) {
	document.getElementById(name).submit();
}
function remove(i){
	//check error
	console.log(document.myform.sender.value);
	var xhttp = new XMLHttpRequest();
	
	xhttp.open("GET", "DeclineRequest?sender=" + document.myform.sender.value +
			"&day=" + document.myform.day.value + "&time=" +
			document.myform1.time.value +"&interest=" + document.myform.interest.value , true);
			
	xhttp.send();
	console.log("sent")
	document.getElementById(i).innerHTML = "";
	return false;
}
function accept(i){
	//check error
	var params = $('acceptreq'+id).serialize();
	var xhttp = new XMLHttpRequest();
	xhttp.open("POST", "AcceptRequest", true);
	xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	document.getElementById("request" + id).style.display = "none";
	xhttp.send(params);
	/*
	var xhttp = new XMLHttpRequest();
	xhttp.open("GET", "AcceptRequest?sender=" + document.myform.sender.value +
			"&day=" + document.myform.day.value + "&time=" +
			document.myform.time.value +"&interest=" + document.myform.interest.value , true);
			
	xhttp.send();
	console.log("sent")
	
	document.getElementById(i).innerHTML = "";
	*/
	return false;
}
function ask(){
	$.ajax({
	  url: "AcceptRequest",
	  data: {
		  day: $("#day").val(),
		  time: $("#time").val(),
		  interest: $("#interest").val(),
		  receiver: $("#person").val()
	  },
	  success: function(returnValue){
		  console.log(returnValue);
	  }
})
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
<h1 style="font-size:20pt">Requests:</h1>
<form  name="myform" style = "display:inline">
<table>

<% // ArrayList<ConnectDetail> requests = GetInfo.getRequests(session.getAttribute("username"));
	ArrayList<ConnectDetail> req = (ArrayList<ConnectDetail>) request.getSession().getAttribute("invite");
	
	if (req == null){
		System.out.println("null after sent");//test
	}
	else {
	
for(int i = 0; i < req.size(); ++i ){%>
<tr id = "<%=i%>">
<td><p id = "request<%=i%>" style = "display:inline;margin-right:50px;">
<%=req.get(i).getSender()%>, <%=req.get(i).getInterest()%> on <%=req.get(i).getDay()%> in <%=req.get(i).getTime()%></p>
	</td>
	
	
	<td>

	<input type = "hidden" name = "sender" value = <%=req.get(i).getSender()%> >
	<input type = "hidden" name = "day" value = <%=req.get(i).getDay()%> >
	<input type = "hidden" name = "time" value = <%=req.get(i).getTime()%> >
	<input type = "hidden" name = "interest" value = <%=req.get(i).getInterest()%> >
	<%--<button class="white button" style = "margin-top:5pt;display:inline;" onclick = "accept(<%=i%>)">Accept</button>
	<button class="white button" style = "margin-top:5pt;display:inline;" onclick = "remove(<%=i%>)" >Decline</button>--%>
	</td>
	<br>
	</tr>
<%}} %>

</table>
</form>

</div>
<div>
<form name=form action=AcceptRequest>

		<select name=sender>
			<%  if (req != null) {
					for(int i = 0; i < req.size(); ++i ) {%>
						<option value="<%=req.get(i).getSender()%>"><%=req.get(i).getSender()%></option>
			<%}
			}%>
		</select>
      	<select name=day>
      		<option value=monday>Monday</option>
      		<option value=tuesday>Tuesday</option>
      		<option value=wednesday>Wednesday</option>
      		<option value=thursday>Thursday</option>
      		<option value=friday>Friday</option>
      		<option value=saturday>Saturday</option>
      		<option value=sunday>Sunday</option>
      	</select>
      	<select name=time>
      		<option value=morning>Morning</option>
      		<option value=evening>Evening</option>
      		<option value=Allday>All Day</option>
      	</select>
      	<select name=interest>
      		<option value=basketball>Basketball</option>
      		<option value=running>Running</option>
      		<option value=hiking>Hiking</option>
      		<option value=swimming>Swimming</option>
      		<option value=biking>Biking</option>
      		<option value=football>Football</option>
      		<option value=tennis>Tennis</option>
      	</select>
      	
      	<input type=submit name=submit value=connect>
      </form>
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

