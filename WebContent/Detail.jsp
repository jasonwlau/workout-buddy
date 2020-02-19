<%@page import="SpotMeTrojan.User"%> 
<%@page import="java.util.*"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
​
<head>
  <title>Detail</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
​
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700|Oxygen:400,700" rel="stylesheet">
​
  <link rel="stylesheet" href="css/animate.css">
  <link rel="stylesheet" href="css/owl.carousel.min.css">
  <link rel="stylesheet" href="css/jquery.fancybox.min.css">
​
  <link rel="stylesheet" href="fonts/ionicons/css/ionicons.min.css">
  <link rel="stylesheet" href="fonts/fontawesome/css/font-awesome.min.css">
  <link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">
​
  <!-- Theme Style -->
  <link rel="stylesheet" href="css/style.css">
  <script src="https://www.google.com/recaptcha/api.js" async defer></script>
  <style type="text/css">
    #loginForm input{
      width : 100%;
      height: 40px;
    }
    #loginForm{
      margin-top:3%;
      margin-left : 6%;
      margin-right:6%;
      color :#888888;
      font-family: Arial, Helvetica, sans-serif;
    }
    #content{
      margin-top:2%;
      width:100%;
      color:black;
    }
    #innercontent{
      margin:8%;
    }
    #customers{
      width:90%;
      text-align:center;
    }
    #interests{
      width:90%;
      text-align:center;
    }
    tr{
      color:grey;
    }
    td{
      color:#c41e3a;
    }
    table{
      border: 1px black;
      border-collapse: collapse;
      font-size:22px;
    }
    #photo{
      float:left;
    }
    #info{
      float:left;
      margin-left:5%;
      font-size:28px;
      font-weight: bold;
    }
    #times{
      clear:both;
    }
    #head{
      font-size:28px;
      text-decoration: underline;
      color:black;
    }
    #val{
      float:left;
      color:#c41e3a;
    }
    #key{
      float:left;
      color:gold;
    }
    #button{
      float:left;
      margin-left:5%;
    }
    button {     
    background-color: Transparent;
    background-repeat:no-repeat;
    border: none;
    cursor:pointer;
    overflow: hidden;      
    }
    #request{
      float:right;
      margin-right:10%;
      margin-top:25px;
      font-size:30px;
    }
  </style>
​
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
  <!-- END header -->
<hr>
​
<script>
</script>
 <%int photoId = 0;%>
 <%String username = "";%>
 
 <%String email = "";%>
 <%String location = "";%>
 <%User u = (User)request.getAttribute("username");%>
 
 <%photoId = u.getPhotoID();%>
 <%String photoName = Integer.toString(photoId) + ".jpg";%>
 <%username = u.getUsername();%>
 <%email = u.getEmail();%>
 <%location = u.getLocation();%>
 
 <%Map<String, String> times = u.getTime();%>
 <%Vector<String> interest = u.getInterest();%>
 
 <%String monday = times.get("monday");%>
 <%String tuesday = times.get("tuesday");%>
 <%String wednesday = times.get("wednesday");%>
 <%String thursday = times.get("thursday");%>
 <%String friday = times.get("friday");%>
 <%String saturday = times.get("saturday");%>
 <%String sunday = times.get("sunday");%>
 
 <%if(monday == null){monday="not available";}%>
 <%if(tuesday == null){tuesday="not available";}%>
 <%if(wednesday == null){wednesday="not available";}%>
 <%if(thursday == null){thursday="not available";}%>
 <%if(friday == null){friday="not available";}%>
 <%if(saturday == null){saturday="not available";}%>
 <%if(sunday == null){sunday="not available";}%>
 
 <%String basketball = "no";%>
 <%String running = "no";%>
 <%String hiking = "no";%>
 <%String swimming = "no";%>
 <%String biking = "no";%>
 <%String football = "no";%>
 <%String tennis = "no";%>
 
 <%if(interest.contains("basketball")){basketball = "yes";}%>
 <%if(interest.contains("running")){running = "yes";}%>
 <%if(interest.contains("hiking")){hiking = "yes";}%>
 <%if(interest.contains("swimming")){swimming = "yes";}%>
 <%if(interest.contains("biking")){biking = "yes";}%>
 <%if(interest.contains("footbal")){football = "yes";}%>
 <%if(interest.contains("tennis")){tennis = "yes";}%>
​
  <script>
    <%session.setAttribute("time", "not available");%>
    <%session.setAttribute("time", "not available");%>
  </script>
​
<script>
function monday(){
  <%session.setAttribute("day", "monday");%>
  <%session.setAttribute("time", monday);%>
  console.log(<%=session.getAttribute("day")%>);
}
function tuesday(){
  <%session.setAttribute("day", "tuesday");%>
  <%session.setAttribute("time", tuesday);%>
}
function wednesday(){
  <%session.setAttribute("day", "wednesday");%>
  <%session.setAttribute("time", wednesday);%>
}
function thursday(){
  <%session.setAttribute("day", "thursday");%>
  <%session.setAttribute("time", thursday);%>

}
function friday(){
  <%session.setAttribute("day", "friday");%>
  <%session.setAttribute("time", friday);%>
}
function saturday(){
  <%session.setAttribute("day", "saturday");%>
  <%session.setAttribute("time", saturday);%>
}
function sunday(){
	  <%session.setAttribute("day", "sunday");%>
	  <%session.setAttribute("time", sunday);%>
}
function basketball(){
  <%session.setAttribute("interest", "basketball");%>
  <%session.setAttribute("bool", basketball);%>
}
function running(){
  <%session.setAttribute("interest", "running");%>
  <%session.setAttribute("bool", running);%>
}
function hiking(){
  <%session.setAttribute("interest", "hiking");%>
  <%session.setAttribute("bool", hiking);%>
}
function swimming(){
  <%session.setAttribute("interest", "swimming");%>
  <%session.setAttribute("bool", swimming);%>
}
function biking(){
  <%session.setAttribute("interest", "biking");%>
  <%session.setAttribute("bool", biking);%>
}
function football(){
  <%session.setAttribute("interest", "football");%>
  <%session.setAttribute("bool", football);%>
}
function tennis(){
  <%session.setAttribute("interest", "tennis");%>
  <%session.setAttribute("bool", tennis);%>
}
</script>
<script>
function ask(){
	  var receiver = <%=username%>
	  console.log(day);​
	  $.ajax({
		  url: "RequestServlet",
		  data: {
			  day: $("#day").val(),
			  time: $("#time").val(),
			  interest: $("#interest").val(),
			  receiver: $("#receiver").val()
		  },
		  success: function(returnValue){
			  console.log(returnValue);
		  }
	  })
}
</script>

  <div id=content>
    <div id=innercontent>
      <div id=photo style="">
      <img src="img/<%=photoName%>" alt="Italian Trulli" style="width:200px;height:200px;">
      </div>
      <br>
      <div id=info>
      <span id=key>Name: &nbsp</span><div id=val><%=username%></div><br>
      <span id=key>Email: &nbsp</span><div id=val><%=email%></div><br>
      <span id=key>Location: &nbsp</span><div id=val><%=location%><br></div><br>
      </div>
      
      <%if(request.getSession().getAttribute("login").equals("yes")){%>
      <form name=form action=RequestServlet onclick=ask()>
      <p style="text-align:center; color:#c41e3a; font-size:20px; font-weight:bold" >Choose to send your request</p>
      	<select name=day style="margin-left:5%">
      		<option value=monday>Monday</option>
      		<option value=tuesday>Tuesday</option>
      		<option value=wednesday>Wednesday</option>
      		<option value=thursday>Thursday</option>
      		<option value=friday>Friday</option>
      		<option value=saturday>Saturday</option>
      		<option value=sunday>Sunday</option>
      	</select>
      	<select name=time style="margin-left:3%">
      		<option value=morning>Morning</option>
      		<option value=evening>Evening</option>
      		<option value=Allday>All Day</option>
      	</select>
      	<select name=interest style="margin-left:3%">
      		<option value=basketball>Basketball</option>
      		<option value=running>Running</option>
      		<option value=hiking>Hiking</option>
      		<option value=swimming>Swimming</option>
      		<option value=biking>Biking</option>
      		<option value=football>Football</option>
      		<option value=tennis>Tennis</option>
      	</select>
      	<input type=hidden name=receiver value="<%=username%>">
      	<br>
      	<br>
      	
      	<input type=submit name=submit value=request class="btn btn-primary px-3 py-3" style="margin-left:30%">

      </form>
            	<%} %>
      <br>
      <div id=times>
      <br>
      <br>
      <div id=head>Times:</div>
  <table id="customers" style="border: 1px black;">
  <tr>
    <th>Monday</th>
    <th>Tuesday</th>
    <th>Wednesday</th>
    <th>Thursday</th>
    <th>Friday</th>
    <th>Saturday</th>
    <th>Sunday</th>
  </tr>
  <tr>
    <td><button onclick="monday()"><%=monday%></button></td>
    <td><button onclick="tuesday()"><%=tuesday%></button></td>
    <td><button onclick="wednesday()"><%=wednesday%></button></td>
    <td><button onclick="thursday()"><%=thursday%></button></td>
    <td><button onclick="friday()"><%=friday%></button></td>
    <td><button onclick="saturday()"><%=saturday%></button></td>
    <td><button onclick="sunday()"><%=sunday%></button></td>
  </tr>
</table>
</div>
    <br>
    <div id="head">Interests:</div>
    <table id="interests">
  <tr>
    <th>Basketball</th>
    <th>Running</th>
    <th>Hiking</th>
    <th>Swimming</th>
    <th>Biking</th>
    <th>Football</th>
    <th>Tennis</th>
  </tr>
  <tr>
    <td><button onclick="basketball()"><%=basketball%></button></td>
    <td><button onclick="running()"><%=running%></button></td>
    <td><button onclick="hiking()"><%=hiking%></button></td>
    <td><button onclick="swimming()"><%=swimming%></button></td>
    <td><button onclick="biking()"><%=biking%></button></td>
    <td><button onclick="football()"><%=football%></button></td>
    <td><button onclick="tennis()"><%=tennis%></button></td>
  </tr>
</table>
  <br>
    </div>
  </div>
​<footer class="site-footer" role="contentinfo">
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
​
  <script src="js/jquery-3.2.1.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.waypoints.min.js"></script>
  <script src="js/jquery.fancybox.min.js"></script>
  <script src="js/main.js"></script>
</body>
​
​
</html>