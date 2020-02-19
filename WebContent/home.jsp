<!doctype html>
<html lang="en">
  <head>
    <title>Homepage</title>
    <meta charset="utf-8">
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

    <!-- <div class="top-shadow"></div> -->
    

    <div class="slider-item overlay" style="background-image: url('back1.jpeg');">
      <div class="container">
        <div class="row slider-text align-items-center justify-content-center">
          <div class="col-lg-9 text-center col-sm-12 element-animate">
            <h1 class="mb-4">Spot Me Trojans!</h1>
            <div class="btn-play-wrap mx-auto">
              <p class="mb-4"><a href="homepage.mp4" data-fancybox data-ratio="2"
                  class="btn-play"><span class="ion ion-ios-play"></span></a></p>
            </div>
            <span>Watch Video</span>
    
          </div>
        </div>
      </div>
    </div>

    <div class="section bg-light block-11">
      <div class="container">
        <div class="row justify-content-center mb-5">
          <div class="col-md-8 text-center">
            <h2 class=" heading mb-4">Recent Events!</h2>
          </div>
        </div>
        <div class="nonloop-block-11 owl-carousel">
          <div class="item">
            <div class="block-33 h-100">
              <div class="vcard d-flex mb-3">
                <div class="image align-self-center"><img src="image/climb.jpeg" alt="Person here"></div>
                <div class="name-text align-self-center">
                  <h2 class="heading">Hiking Night!</h2>
                  <span class="meta">abc hike club</span>
                </div>
              </div>
              <div class="text">
                <blockquote>
                  <p>&rdquo; Do you want hike with trojans? Have you even been to xxx? time to join us! 
                  be a health person, get start climbing today!Do you want hike with trojans? Have you even been to xxx? time to join us! 
                  be a health person, get start climbing today!Do you want hike with trojans? Have you even been to xxx? time to join us! 
                  be a health person, get start climbing today!Do you want hike with trojans? Have you even been to xxx? time to join us! 
                  be a health person, get start climbing today!&ldquo;<br>
                  Location: potato chip<br>
                  Date: 12.3 9am<br>
                  contact: 201.201.2019
                  </p>
                </blockquote>
              </div>
            </div>
          </div>
    
          <div class="item">
            <div class="block-33 h-100">
              <div class="vcard d-flex mb-3">
                <div class="image align-self-center"><img src="image/bike.jpeg" alt="Person here"></div>
                <div class="name-text align-self-center">
                  <h2 class="heading">Bike your day</h2>
                  <span class="meta">Cyc Person</span>
                </div>
              </div>
              <div class="text">
                <blockquote>
                  <p>&rdquo; meet you day in fresh, see you friedns in exercising! Enjoy the view at santa monica. Cyc Person 
                  will lead a cyclying team at santa monica on Road abc. Join in us today and get a free lunch. <br>
                  meet you day in fresh, see you friedns in exercising! Enjoy the view at santa monica. Cyc Person 
                  will lead a cyclying team at santa monica on Road abc. Join in us today and get a free lunch. &ldquo;<br>
                  Location: santa monica<br>
                  Date: 12.3 9am<br>
                  contact: 201.201.2019
                  </p>
                </blockquote>
              </div>
            </div>
          </div>
    
          <div class="item">
            <div class="block-33 h-100">
              <div class="vcard d-flex mb-3">
                <div class="image align-self-center"><img src="image/basket.jpeg" alt="Person here"></div>
                <div class="name-text align-self-center">
                  <h2 class="heading">DT All Star</h2>
                  <span class="meta">DT Basket</span>
                </div>
              </div>
              <div class="text">
                <blockquote>
                  <p>&rdquo; Join our all star game at dt basketball gym.<br>you
                            get a pure new experience about basketball.
                            git rid of one day's tired work and go to sports.
                            chat with you friends and play with anonymous.
                            see you at dt B.<br>
                            Join our all star game at dt basketball gym.<br>you
                            get a pure new experience about basketball.
                            git rid of one day's tired work and go to sports.
                            chat with you friends and play with anonymous.
                            see you at dt B.<br>
                            Location: dtown basketball gym<br>
                  Date: 12.3 9am<br>
                  contact: 201.201.2019
                            
                     &ldquo;</p>
                </blockquote>
              </div>
            </div>
          </div>
    
          <div class="item">
            <div class="block-33 h-100">
              <div class="vcard d-flex mb-3">
                <div class="image align-self-center"><img src="image/football.jpeg" alt="Person here"></div>
                <div class="name-text align-self-center">
                  <h2 class="heading">football us</h2>
                  <span class="meta">fight on</span>
                </div>
              </div>
              <div class="text">
                <blockquote>
                  <p>&rdquo; fight on! &ldquo;</p>
                </blockquote>
              </div>
            </div>
          </div>
    
        </div>
      </div>
    </div>

    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-6 mb-4 mb-lg-0 col-lg-3">
            <div class="service-box">
              <div class="square-figure">
                <span class="flaticon-yoga-mat"></span>
              </div>
              <div class="service-text">
                <h3>Connections</h3>
                <p>You can search based on your own requirement and find
                people you can work out together. We will also recommend you some options based on your preference and interest.
                 </p>
              </div>
            </div>
          </div>
          <div class="col-md-6 mb-4 mb-lg-0 col-lg-3">
            <div class="service-box">
              <div class="square-figure">
                <span class="flaticon-weight-1"></span>
              </div>
              <div class="service-text">
                <h3>Personal Profile</h3>
                <p>DIY your personal profile with your available time, interest, self-introduction and location. Help others to better
                know you can connect you.</p>
              </div>
            </div>
          </div>
          <div class="col-md-6 mb-4 mb-lg-0 col-lg-3">
            <div class="service-box">
              <div class="square-figure">
                <span class="flaticon-bike"></span>
              </div>
              <div class="service-text">
                <h3>Request Notification</h3>
                <p>You will see all the connection request from other users here. You can choose to accept each request
                or decline it.</p>
              </div>
            </div>
          </div>
          <div class="col-md-6 mb-4 mb-lg-0 col-lg-3">
            <div class="service-box">
              <div class="square-figure">
                <span class="flaticon-pulse"></span>
              </div>
              <div class="service-text">
                <h3>My Schedule</h3>
                <p>You will see other's invitation and your own recent work out event here. You can choose to decline the invitation
                 or accept it and add to your schedule.</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="site-section position-relative">
      <div style="background-image:url('images/gym1.jpg');" class="img-1"></div>
      <div class="container">
        <div class="row align-items-center">
          <div class="col-lg-5 ml-auto">
            <div class="padding-tb">
            <h2 class="heading mb-4">Be Fit</h2>
            <<p>SpotMeTrojan is an amazing opportunity for trojan who want to get fit. Often times, having a workout buddy can dramatically improve
            your performance in the gym. SpotMeTrojan will keep you motivated, consistent, and wanting to excercise and socialize more.</p>
            <p>SpotMeTrojan is also a great opportunity to meet people with similar interest that you may otherwise not meet and befriend.
            There are many great trojans to meet on campus. Get outside of your comfort zone and social circle join a fellow SpotMeTrojan in an
            activity that you will both truly enjoy.</p></div>

          </div>
        </div>
      </div>
    </div>

    <div class="section bg-primary">
      <div class="container">
        <div class="row">
          <div class="col-md-6 col-lg-4 element-animate ">
            <div class="media block-6 d-block text-center">
              <div class="icon mb-3"><span class="flaticon-yoga-mat text-white"></span></div>
              <div class="media-body">
                <h3 class="heading text-white">Show your event?</h3>
                <p class="text-white">Sports club can contact us their recent event. We will choose some of those and show
                on the home page.</p>
              </div>
            </div>
    
          </div>
          <div class="col-md-6 col-lg-4 element-animate ">
            <div class="media block-6 d-block text-center">
              <div class="icon mb-3"><span class="flaticon-bike text-white"></span></div>
              <div class="media-body">
                <h3 class="heading text-white">Find more functions?</h3>
                <p class="text-white">Contact us with what you think and what you need. We will choose to add more functions
                to our website.</p>
              </div>
            </div>
    
          </div>
          <div class="col-md-6 col-lg-4 element-animate ">
            <div class="media block-6 d-block text-center">
              <div class="icon mb-3"><span class="flaticon-pulse text-white"></span></div>
              <div class="media-body">
                <h3 class="heading text-white">Have Troubles?</h3>
                <p class="text-white">Contact us with you troubles when using our website and tell us more details about your 
                concerns, we will have our person contact you.</p>
              </div>
            </div>
    
          </div>
        </div>
      </div>
    </div>
    <!-- END section -->


    <div class="site-section position-relative">
      <div style="background-image: url('images/hero_2.jpg');" class="img-2"></div>
      <div class="container">
        <div class="row align-items-center">
          <div class="col-lg-5 mr-auto">
            <div class="padding-tb">
            <h2 class="heading mb-4">Be a Supporter</h2>
             <p>SpotMeTrojan needs motivated and hard working people like you to join our platform and make connections with you fellow trojans</p>
            <p>By having a great network of people on the app, we can attract even more trojans to become users. So, by joining us, you can help change the entire trojan community and help everyone become more fit.</p>
            </div>
    
          </div>
        </div>
      </div>
    </div>

    
    <!-- END .block-4 -->
    </div>

    <div class="bg-primary py-5">
      <div class="container text-center">
        <div class="row justify-content-center">
          <div class="col-lg-7">
            <h3 class="text-white mb-4">Join With Us Now!</h3>
            <p class="text-white lead mb-4">Click the link below to send us more about your thoughts!
              </p>
            <p class="mb-0"><a href="contact.jsp" class="btn btn-warning px-4 py-3">Get In Touch!</a></p>
          </div>
        </div>
        
      </div>
    </div>
    
    
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

    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/jquery.waypoints.min.js"></script>
    <script src="js/jquery.fancybox.min.js"></script>
    <script src="js/main.js"></script>
  </body>
</html>