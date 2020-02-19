<!DOCTYPE html>
<html>
<head>
<meta http-equiv="refresh" content="5;url=home.jsp" />
<title>Index</title>
<link rel="stylesheet" href="stylesheet.css">
<style>
body{
  margin:0;
  padding:0;
  background-color:white;
  color:white;
  min-width:900px;
}
#second{
  font-size:30px;
}
#welcome{
  width:100%;
  text-align:center;
  font-size:45px;
  margin-top:25%;
  margin-bottom:30%;
}
#nav{
  position:absolute;
  top:55%;
  margin:0;
  padding:0px;
  width:100%;
  margin-left:auto;
  margin-right:auto;
  text-align:center;
} 
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: transparent;
  display: inline-block;
  list-style-type: none;
}

li {
  float: left;
}

li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

li a:hover:not(.active) {

}

.active {
  background-color: transparent;
}

#myVideo{
  position:absolute;
  right: 0;
  bottom: 0;
  min-width: 100%;
  z-index:-1;
}

#content{
  color:black;
}
</style>
<script>
</script>	
</head>
<body>

<div id=welcome>
  <u>Welcome to SpotMeTrojan</u><br>
  <div id=second>USC's Premier Fitness Social Network</div>
</div>

<video autoplay muted loop id="myVideo">
	<source src="homepage.mp4" type="video/mp4">
</video>

</body>
</html>