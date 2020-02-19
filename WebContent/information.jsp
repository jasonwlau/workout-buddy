<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
  <script src="https://www.google.com/recaptcha/api.js" async defer></script>
<style>
div.bt{
margin-left:43%;
}
option{
background-color:#8B0000;
}
p{
    text-align:center;
    font-family: Arial, Helvetica, sans-serif;
    font-weight:10;
}
p.title1{
    margin-top:5%;
    color:#8B0000;
    font-size:40px; 
}
p.title2{
    
    font-size:17px; 
}
form{
    margin-left:15%;
    margin-right:15%;
}
table{
    text-align:center;
}
input.btn btn-primary px-3 py-3{
    margin-left:50%;
}
</style>
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
              <a class="nav-link " href="index.jsp">Home</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="connection.jsp">Connections</a>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="class.jsp" id="dropdown04" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false">Class</a>
              <div class="dropdown-menu" aria-labelledby="dropdown04">
                <a class="dropdown-item" href="All.jsp">All</a>
                  <a class="dropdown-item" href="AbsPage.jsp">Abs Circuit</a>
                  <a class="dropdown-item" href="RowPage.jsp">Rowing Workout</a>
                  <a class="dropdown-item" href="YogaPage.jsp">Hot Yoga</a>
                  <a class="dropdown-item" href="YogaPage.jsp">Restorative Yoga</a>
              </div>
            </li> 
            <li class="nav-item">
              <a class="nav-link " href="posts.jsp">Posts</a>
            </li>
              <li class="nav-item">
                <a class="nav-link" href="contact.jsp">Contact Us!</a>
              </li>
             
          </ul>
                <a class="nav-link" href = "signin.jsp">Sign-in</a>
                <a class="nav-link" href = "register.jsp">Register</a>
        </div>
      </div>
    </nav>
  </header>
  <hr>
  <form  id = "userinfo" method="GET" action="RegistInfoServlet">
<div class = "title">
<p class = "title1">What Are you interested in?</p>
<p class = "title2">This will customize you experience</p>
</div>
<table width="100%">
    <tr>
        <th>Interests<hr></th>
        <th>Days<hr></th>
        <th>Time Period<hr></th>
        <th>Location<hr></th>
    </tr>
    <tr>
        <td><input type="checkbox" name="interests" value="hiking">&nbsp Hiking</td>
        <td><input type="checkbox" name="day" value="monday">&nbsp Monday</td>
        <td><select data-trigger="" name="time1">
             <option placeholder="" value="Allday">AllDay</option>
             <option value="morning">morning</option>
             <option value="evening">evening</option>
           </select>
        </td>
        <td><input type="checkbox" name="location" value="campus">&nbsp campus</td>
    </tr>
    <tr>
        <td><input type="checkbox" name="interests" value="swimming">&nbsp Swimming</td>
        <td><input type="checkbox" name="day" value="tuesday">&nbsp Tuesday</td>
        <td><select data-trigger="" name="time2">
             <option placeholder="" value="Allday">Allday</option>
             <option value="morning">morning</option>
             <option value ="evening">evening</option>
           </select>
        </td>
        <td><input type="checkbox" name="location" value="LosAngeles">&nbsp Los Angeles</td>
    </tr>
    <tr>
        <td><input type="checkbox" name="interests" value="biking">&nbsp Biking</td>
        <td><input type="checkbox" name="day" value="wednesday">&nbsp Wednesday</td>
        <td><select data-trigger="" name="time3">
             <option placeholder="" value="Allday">Allday</option>
             <option value="morning">morning</option>
             <option value="evening">evening</option>
           </select>
        </td>
        <td><input type="checkbox" name="location" value="BeverlyHills">&nbsp Beverly Hills</td>
    </tr>
    <tr>
        <td><input type="checkbox" name="interests" value="running">&nbsp Running</td>
        <td><input type="checkbox" name="day" value="thursday">&nbsp Thursday</td>
        <td><select data-trigger="" name="time4">
             <option placeholder="" value="Allday">Allday</option>
             <option value="morning">morning</option>
             <option value="evening">evening</option>
           </select>
        </td>
        <td><input type="checkbox" name="location" value="SantaMonica">&nbsp Santa Monica</td>
    </tr>
    <tr>
        <td><input type="checkbox" name="interests" value="basketball">&nbsp Basketball</td>
        <td><input type="checkbox" name="day" value="friday">&nbsp Friday</td>
        <td><select data-trigger="" name="time5">
             <option placeholder="" value="Allday">Allday</option>
             <option value="morning">morning</option>
             <option value="evening">evening</option>
           </select>
        </td>
        <td><input type="checkbox" name="location" value="Pasadena">&nbsp Pasadena</td>
    </tr>
    <tr>
        <td><input type="checkbox" name="interests" value="football">&nbsp Football</td>
        <td><input type="checkbox" name="day" value="saturday">&nbsp Saturday</td>
        <td><select data-trigger="" name="time6">
             <option placeholder="" value="Allday">Allday</option>
             <option value="morning">morning</option>
             <option value="evening">evening</option>
           </select>
        </td>
        <td><input type="checkbox" name="location" value="Glendale">&nbsp Glendale</td>
    </tr>
    <tr>
        <td><input type="checkbox" name="interests" value="tennis">&nbsp Tennis</td>
        <td><input type="checkbox" name="day" value="sunday">&nbsp Sunday</td>
        <td><select data-trigger="" name="time7">
             <option placeholder="" value="Allday">Allday</option>
             <option value="morning">morning</option>
             <option value="evening">evening</option>
           </select>
        </td>
        <td><input type="checkbox" name="location" value="Malibu">&nbsp Malibu</td>
    </tr>
</table>
<br><br>
<div class = "chooseImg">
    <p>Please choose your profile image: </p><br>
    <%for (int i = 0; i < 7; i++){ %>
    <div style="display: inline-block; vertical-align: middle; margin-left:40px;">
        <img id = "photo<%=i%>" src="img/<%=i%>.jpg"  width ="70"  height ="70">
        <br>
         <input id="photoid" type="radio" name="photoid" value = "<%=i%>" style="margin-left:30px">
    </div>
    
    <%} %>
</div>
<br>
<div class = "bt">
    <input type = "submit" value = "Register" id = "submitinfo" class="btn btn-primary px-3 py-3"> 
</div>
<br><br><br><br><br><br><br><br>
</form>
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
</body>
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
  <div id="loader" class="show fullscreen"><svg class="circular" width="48px" height="48px">
      <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
      <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10"
        stroke="#f4b214" /></svg></div>
  <script src="js/jquery-3.2.1.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.waypoints.min.js"></script>
  <script src="js/jquery.fancybox.min.js"></script>
  <script src="js/main.js"></script>
</html>