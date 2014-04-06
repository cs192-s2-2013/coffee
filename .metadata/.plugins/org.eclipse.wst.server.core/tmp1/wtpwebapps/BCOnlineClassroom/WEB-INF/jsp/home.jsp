<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<title>Blue Coffee</title>
	
	
	<link type="text/css" rel="stylesheet" href="css/bootstrap.css"/>
	<link href="http://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">
	<link type="text/css" rel="stylesheet" href="css/style.css">
	<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0-rc1/css/bootstrap.min.css" rel="stylesheet">
	
	<style>
          body { background: #FFFFFF; }
          .container { background: ; }
    </style>
	
</head>

<body>

	<font color="#336699">

	<!-- fixed navigation bar with drop down menu
	***************************************************-->
<div id="wrapper">	
	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a href="#" class="navbar-brand">Online Classroom</a> 
			</div>
			
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="index.html">Home</a></li>
					<li class="divider-vertical"></li>
					<li><a href="resource.html">Resources</a></li>
					<li class="divider-vertical"></li>
					<li><a href="feature.html">Forum</a></li>
					<li class="divider-vertical"></li>
					<li><a href="chat.html">Chat</a></li>
					<li class="divider-vertical"></li>
					<li><a href="about.html">About</a></li>
				</ul>
			</div>
		</div>
	</div>
	
	<!-- Carousel
	***********************************-->
	
	<div id="myCarousel" class="carousel slide">
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="2" class="active"></li>
		</ol>
		
		<div class="carousel-inner">
		
			<div class="item active">
				<img src="image/scene1.jpg"/>
				<div class="container">
					<div class="carousel-caption">
						<font color="#336699">
						<h1>Resources</h1>
						<p>Get files, samplex, codes, etc</p></font>
						<p><a class="btn btn-large btn-danger" action="materials">Check Resources</a></p>
					</div>
				</div>
			</div>
			
			<div class="item">
				<img src="image/scene2.jpg"/>
				<div class="container">
					<div class="carousel-caption">
						<font color="#336699">
						<h1>Forum</h1>
						<p>Blah blah</p></font>
						<p><a class="btn btn-large btn-danger" action="forum">Check Forum</a></p>
					</div>
				</div>
			</div>
			
			<div class="item">
				<img src="image/scene3.jpg"/>
				<div class="container">
					<div class="carousel-caption">
						<font color="#336699">
						<h1>Chat</h1>
						<p>Chat with the whole comsci community. wew</p></font>
						<p><a class="btn btn-large btn-danger" href="chat.html">Chat now!</a></p>
					</div>
				</div>
			</div>
			
		</div>
		
		<a class="left carousel-control" href="#myCarousel" data-slide="prev">
			<span class="glyphicon glyphicon-chevron-left"></span>
		</a>
		
		<a class="right carousel-control" href="#myCarousel" data-slide="next">
			<span class="glyphicon glyphicon-chevron-right"></span>
		</a>
		
	</div>	
	<!-- Grid
	****************************************-->
	
	<div class="container">
		<div class="row">
			
			<div class="col-md-12">
				<h2>Online Classroom</h2>
				<p>App that lets you collaborate with your professor and classmates online! Come on and have your class online!</p>
			</div>
		
		</div>
		
		<div class="row">
		
			<div class="col-md-4">
				<a href="materials"><h2>Resources</h2></a>
				<p>Some text will go here. Some text will go here. Some text will go here. Some text will go here.</p>
			</div>
			
			<div class="col-md-4">
				<a href="forum"><h2>Forum</h2></a>
				<p>Some text will go here. Some text will go here. Some text will go here. Some text will go here.</p>
			</div>
			
			<div class="col-md-4">
				<a href="chat"><h2>Chat</h2></a>
				<p>Some text will go here. Some text will go here. Some text will go here. Some text will go here.</p>
			</div>
			
		</div>
		
	</div>
	
	<!-- Font Awesome Icons
	***************************************************-->
	
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="well">
					
						<a href="#"><i class="largeicon icon-android"></i></a>
						<a href="#"><i class="largeicon icon-twitter"></i></a>
						<a href="#"><i class="largeicon icon-linkedin"></i></a>
						<a href="#"><i class="largeicon icon-youtube"></i></a>
						<a href="#"><i class="largeicon icon-skype"></i></a>
						<a href="#"><i class="largeicon icon-google-plus"></i></a>
						<a href="#"><i class="largeicon icon-apple"></i></a>
					
					</div>
				</div>
			</div>
		</div>

	<div class="push"></div>
	
	<!-- Footer and Modal
	**************************************************-->
	<div id="footer">
	<hr/>	
	<div class="container">
		<div class="row">
			<div class="col-md-12">

				<p>Copyright &copy; Blue Coffee.
				<!--<a href="#">Terms and Conditions</a> -->
				
					<a data-toggle="modal" href="#myModal">Terms and Conditions</a>
				</p>
				
				<!--Modal -->
				<div class="modal fade" id="myModal" tabinex="-1" role="dialog" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
							<h2>Terms and Conditions</h2>
							</div>
							<div class="modal-body">
								<p>The text will go here...</p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
</div>
	</font>
	
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>