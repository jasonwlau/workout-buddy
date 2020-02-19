<!doctype html>
<html lang="en">
<%@ page import="java.io.BufferedReader, java.io.FileReader, java.io.FileNotFoundException, 
java.io.IOException, java.util.Scanner, java.lang.NumberFormatException, java.io.File, java.io.*, java.net.*, java.util.ArrayList, java.util.Vector" %>
<%@ page import="SpotMeTrojan.User" %>
<head>
  <title>Connection</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="author" content="colorlib.com">
  <link href="https://fonts.googleapis.com/css?family=Poppins:400,600,700" rel="stylesheet" />
  <link href="css/main.css" rel="stylesheet" />
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700|Oxygen:400,700" rel="stylesheet">

  <link rel="stylesheet" href="css/animate.css">
  <link rel="stylesheet" href="css/owl.carousel.min.css">
  <link rel="stylesheet" href="css/jquery.fancybox.min.css">

  <link rel="stylesheet" href="fonts/ionicons/css/ionicons.min.css">
  <link rel="stylesheet" href="fonts/fontawesome/css/font-awesome.min.css">
  <link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">
  <style>
   footer{
    margin
   }
  </style>
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
  

  
    <div class="s010" >
      <form  id = "userinfo" method="GET" action="ConnectionServlet">
        <div class="inner-form">
          <div class="basic-search">
            <div class="input-field">
              <div class="icon-wrap">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                  <path d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"></path>
                </svg>
              </div>
            </div>
          </div>
         <br>
          
<div class="advance-search">
            <span class="desc">ADVANCED SEARCH</span>
            <div class="row">
              <div class="input-field">
                <div class="input-select">
                  <select data-trigger="" name="interest">
                    <option placeholder="" value="football">Interest</option>
                    <option value="football">Football</option>
                    <option value="basketball">Basketball</option>
                    <option value="tennis">Tennis</option>
                    <option value="runningl">Running</option>
                    <option value="hiking">Hiking</option>
                    <option value="biking">Biking</option>
                    <option value="swimming">Swimming</option>
                  </select>
                </div>
              </div>
              <div class="input-field">
                <div class="input-select">
                  <select data-trigger="" name="location">
                    <option placeholder="" value="campus">Location</option>
                    <option value="campus">Campus</option>
                    <option value="LosAngeles">Los Angeles</option>
                    <option value="BeverlyHills">Beverly Hills</option>
                    <option value="SantaMonica">Santa Monica</option>
                    <option value="Pasadena">Pasadena</option>
                    <option value="Glendale">Glendale</option>
                  </select>
                </div>
              </div>
              <div class="input-field">
                <div class="input-select">
                  <select data-trigger="" name="day">
                    <option placeholder="" value="monday">Day</option>
                    <option value="monday">Monday</option>
                    <option value="tuesday">Tuesday</option>
                    <option value="wednesday">Wednesday</option>
                    <option value="thursday">Thursday</option>
                    <option value="friday">Friday</option>
                    <option value="saturday">Saturday</option>
                    <option value="sunday">Sunday</option>
                  </select>
                </div>
              </div>
            </div>
            <div class="row third">
              <div class="input-field">
                <div class="result-count">
                  <span> </span></div>
                <div class="group-btn">
                  <button class="btn-delete" id="delete">RESET</button>
                  <button class="btn-search">SEARCH</button>
                </div>
              </div>
            </div>
            <br>
            <%            
  Vector<User> reds = (Vector<User>) request.getSession().getAttribute("recommendations");
  String username = (String)request.getSession().getAttribute("userName");
  System.out.println(username);
  %>
  <%
  if(username != null &&!username.equals("") )
  {
   %>
    <span class="desc">Recommend For You </span>
    <div class="row second">
    <%
   for(int i= 0; i< Math.min(3,reds.size()); i++){
  %>
           
            
              <div class="input-field">
                <div class="input-select">
                  <table>
                   <tr>
         <td align="center">
         <a href="DetailServlet?val=<%=i %>" >
         <img src= "img/<%=Integer.toString(reds.get(i).photoID) + ".jpg"%>"  width="70" height="70">
         </a>
         </td>
         <td>&nbsp <%=reds.get(i).username %></td>
       </tr>
                  </table>
                </div>
              </div>
            
               <%
   }
  }
  %>
              </div>
            </div> 
          </div>
      </form>
    </div>
    <script src="js/extention/choices.js"></script>
    <script>
      const customSelects = document.querySelectorAll("select");
      const deleteBtn = document.getElementById('delete')
      const choices = new Choices('select',
      {
        searchEnabled: false,
        itemSelectText: '',
        removeItemButton: true,
      });
      for (let i = 0; i < customSelects.length; i++)
      {
        customSelects[i].addEventListener('addItem', function(event)
        {
          if (event.detail.value)
          {
            let parent = this.parentNode.parentNode
            parent.classList.add('valid')
            parent.classList.remove('invalid')
          }
          else
          {
            let parent = this.parentNode.parentNode
            parent.classList.add('invalid')
            parent.classList.remove('valid')
          }
        }, false);
      }
      deleteBtn.addEventListener("click", function(e)
      {
        e.preventDefault()
        const deleteAll = document.querySelectorAll('.choices__button')
        for (let i = 0; i < deleteAll.length; i++)
        {
          deleteAll[i].click();
        }
      });

    </script>
    
  <!-- recommends -->
  
<br>
<br>
<br>
<br>
<footer class="site-footer" role="contentinfo">
      <div class="container">
        <div class="row mb-5">
          <div class="col-md-4 mb-5">
            <h3>About SpotMeTrojan</h3>
            <p class="mb-5">Join more of our event here!</p >
            <ul class="list-unstyled footer-link d-flex footer-social">
              <li><a href ="#" class="p-2"><span class="fa fa-twitter"></span></a></li>
              <li><a href = "#" class="p-2"><span class="fa fa-facebook"></span></a></li>
              <li><a href = "#" class="p-2"><span class="fa fa-linkedin"></span></a></li>
              <li><a href = "#" class="p-2"><span class="fa fa-instagram"></span></a></li>
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
              <li><a href ="#">About</a></li>
              <li><a href ="#">Terms of Use</a></li>
              <li><a href ="#">Disclaimers</a></li>
              <li><a href ="#">Contact</a></li>
            </ul>
          </div>
          <div class="col-md-3">
          
          </div>
        </div>
        
      </div>
    </footer>


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