<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*" %>
<%@page import="SpotMeTrojan.GetInfo" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MyInformation</title>
</head>
<body>
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700|Oxygen:400,700" rel="stylesheet">
    <link rel="stylesheet" href="myInfo.css">
<title><%=session.getAttribute("username") %>'s Information</title>
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
#interests{
  display: inline-block;
  padding-top: 0.3125rem;
  padding-bottom: 0.3125rem;
  margin-right: 1rem;
  font-size: 1.25rem;
  line-height: inherit;
  white-space: nowrap;
}
</style>
<script>
function submitinterest(num) {
    var id = "interest"+num;
    document.getElementById(id).submit();
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
<div id=interests style = "font-size:20pt;padding-left:50px;" >
Interests:
<br>
<% ArrayList<String> interests = GetInfo.getInterests((String)session.getAttribute("userName")); 
    //ArrayList<String> interests = GetInfo.getInterests("A"); 
    //ArrayList interests = new ArrayList<String>();
    //interests.add("aaa");
    //interests.add("b21bb");
    //interests.add("c1cc");
    //interests.add("ddd");
    //interests.add("eee");
for(int i = 0; i < interests.size(); ++i ){%>
<br>
<p style = "display:inline;margin-right:50px;font-size: 18px;"><%=interests.get(i) %> </p>
    <form id = "interest<%=i%>" action="RemoveInterest" style = "display:inline;color:blue;">
    <input type = "hidden" name = "username" value = <%=session.getAttribute("username") %> >
    <input type = "hidden" name = "interest" value = <%=interests.get(i) %> >
    <button class="red button" style = "margin-top:5pt;float:right;margin-right:30%;background-color:#990000;" onclick = "submitinterest(<%=i%>);">delete</button>
    </form>
<%} %>
<br>
<br><br>
Add A New Interest:<br><br>
<form action = "UpdateInterest">
    <select name = "interest" style = "font-size:20px;">
          <option value="basketball">Basketball</option>
          <option value="running">Running</option>
          <option value="hiking">Hiking</option>
          <option value="swimming">Swimming</option>
          <option value="biking">Biking</option>
          <option value="football">Football</option>
          <option value="tennis">Tennis</option>
    </select>
    <input type = "submit" class = "red button" value="add new interest" style="float:right; margin-right:30%;background-color:#990000;">
</form>
</div>
<%Map<String, String> Times = GetInfo.getTimes((String)session.getAttribute("username")); 
//Map<String, String> Times = GetInfo.getTimes("A"); 
//Map<String, String> Times = new HashMap<String, String>();
//Times.put("monday","morning");
//Times.put("sunday","evening");
//Times.put("friday","allday");%>
<form METHOD = "GET" action = "UpdateServlet">
<div id=Times style = "padding-left:50px;" >
<p style="font-size:20pt;" class = "title1">Update your leisure time</p>
</div>
<table width="100%" style = "display:inline">
    <tr>
        <th>Days<hr></th>
        <th>Time<hr></th>
    </tr>
    <tr>
        <%if (!Times.containsKey("monday")){ %>
        <td><input type="checkbox" name="day" value="monday">&nbsp Monday</td><%} else{ %>
        <td><input type="checkbox" name="day" value="monday" checked>&nbsp Monday</td><%} %>
        <td><select data-trigger="" name="time1">
            <%if (Times.containsKey("monday")){ %>
            <option selected><%=Times.get("monday")%></option>
            <%} else{ %>
            <option selected disabled></option>
            <%} %>
            <option value="Allday">Allday</option>
            <option value="morning">morning</option>
            <option value="evening">evening</option>
           </select>
        </td>
    </tr>
    <tr>
        <%if (!Times.containsKey("tuesday")){ %>
        <td><input type="checkbox" name="day" value="tuesday">&nbsp Tuesday</td><%} else{ %>
        <td><input type="checkbox" name="day" value="tuesday" checked>&nbsp Tuesday</td><%} %>
        <td><select data-trigger="" name="time2">
            <%if (Times.containsKey("tuesday")){ %>
            <option selected><%=Times.get("tuesday")%></option>
            <%} else{ %>
            <option selected disabled></option>
            <%} %>
            <option value="Allday">Allday</option>
            <option value="morning">morning</option>
            <option value="evening">evening</option>
           </select>
        </td>
    </tr>
    <tr>
        <%if (!Times.containsKey("wednesday")){ %>
        <td><input type="checkbox" name="day" value="wednesday">&nbsp Wednesday</td><%} else{ %>
        <td><input type="checkbox" name="day" value="wednesday" checked>&nbsp Wednesday</td><%} %>
        <td><select data-trigger="" name="time3">
            <%if (Times.containsKey("wednesday")){ %>
            <option selected><%=Times.get("wednesday")%></option>
            <%} else{ %>
            <option selected disabled></option>
            <%} %>
            <option value="Allday">Allday</option>
            <option value="morning">morning</option>
            <option value="evening">evening</option>
           </select>
        </td>
    </tr>
    <tr>
        <%if (!Times.containsKey("thursday")){ %>
        <td><input type="checkbox" name="day" value="thursday">&nbsp Thursday</td><%} else{ %>
        <td><input type="checkbox" name="day" value="thursday" checked>&nbsp Thursday</td><%} %>
        <td><select data-trigger="" name="time4">
            <%if (Times.containsKey("thursday")){ %>
            <option selected><%=Times.get("thursday")%></option>
            <%} else{ %>
            <option selected disabled></option>
            <%} %>
            <option value="Allday">Allday</option>
            <option value="morning">morning</option>
            <option value="evening">evening</option>
           </select>
        </td>
    </tr>
    <tr>
        <%if (!Times.containsKey("friday")){ %>
        <td><input type="checkbox" name="day" value="friday">&nbsp Friday</td><%} else{ %>
        <td><input type="checkbox" name="day" value="friday" checked>&nbsp Friday</td><%} %>
        <td><select data-trigger="" name="time5">
            <%if (Times.containsKey("friday")){ %>
            <option selected><%=Times.get("friday")%></option>
            <%} else{ %>
            <option selected disabled></option>
            <%} %>
            <option value="Allday">Allday</option>
            <option value="morning">morning</option>
            <option value="evening">evening</option>
           </select>
        </td>
    </tr>
    <tr>
        <%if (!Times.containsKey("saturday")){ %>
        <td><input type="checkbox" name="day" value="saturday">&nbsp Saturday</td><%} else{ %>
        <td><input type="checkbox" name="day" value="saturday" checked>&nbsp Saturday</td><%} %>
        <td><select data-trigger="" name="time6">
            <%if (Times.containsKey("saturday")){ %>
            <option selected><%=Times.get("saturday")%></option>
            <%} else{ %>
            <option selected disabled></option>
            <%} %>
            <option value="Allday">Allday</option>
            <option value="morning">morning</option>
            <option value="evening">evening</option>
           </select>
        </td>
    </tr>
    <tr>
    <%if (!Times.containsKey("sunday")){ %>
        <td><input type="checkbox" name="day" value="sunday">&nbsp Sunday</td><%} else{ %>
        <td><input type="checkbox" name="day" value="sunday" checked>&nbsp Sunday</td><%} %>
        <td><select data-trigger="" name="time7">
            <%if (Times.containsKey("sunday")){ %>
            <option selected><%=Times.get("sunday")%></option>
            <%} else{ %>
            <option selected disabled></option>
            <%} %>
            <option value="Allday">Allday</option>
            <option value="morning">morning</option>
            <option value="evening">evening</option>
           </select>
        </td>
    </tr>
</table>
<br>
<br>
<input type = "submit" style = "float:right; margin-right: 40%;" value = "Update" id = "submitinfo" class="btn btn-primary px-3 py-3"> 
<br>
</form>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
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