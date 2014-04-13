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
          .jumbotron { margin-top: -50px; }
    </style>
	
</head>

<body>

	<!--  Navigation Bar
	***************************** -->
	<nav class="navbar navbar-inverse" role="navigation">
	   <div class="navbar-header">
	      <a class="navbar-brand" href="#">Online Classroom</a>
	   </div>
	   <div>
	      <ul class="nav navbar-nav">
	         <li><a href="#">Materials</a></li>
	         <li><a href="#">Forum</a></li>
	         <li><a href="#">Chat</a></li>
	      </ul>
	      <ul class="nav navbar-nav pull-right">
	         <li><a href="#">Logout</a></li>
	      </ul>
	     
	   </div>
	</nav>	
	
	<!-- Subject Title
	**************************************************-->
	<div class = "jumbotron">
		<!--JSP code to get subject-->
		<h2>404: Page Not Found</h2>
	</div>

	
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
	<script src="js/contentHover.js"></script>
	<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0-rc1/js/bootstrap.min.js"></script>
	
	<script type="text/javascript">
		$('document').ready(function(){
		
			$('#mytooltip').tooltip();
			
		});
	
	</script>

</body>
</html>