<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="t"%>

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
		  .jumbotron {
		  	margin-top: 0px; 
		  	margin-bottom: 50px;
		  }
		  p {
		  	color: gray;
		  }
    </style>
	
</head>

<body>

	<!--  Navigation Bar
	***************************** -->
<div class="container">
        <div class="row clearfix">
                <div class="col-md-12 column">
                        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                  <a class="navbar-brand" href="#">Online Classroom</a>
               <div>
                  <ul class="nav navbar-nav navbar-left">
                     <li><a href="materials">Materials</a></li>
                     <li><a href="forum">Forum</a></li>
                     <li><a href="chat">Chat</a></li>
                     <li><a href="schedule">Schedule</a></li>   
                     <c:if test="${user.getAdmin()}">
	         			<li><a href="admin">Admin</a></li>
	         		</c:if>
                  </ul>
                  <ul class="nav navbar-nav pull-right">
                  	  <li><a>${sessionScope.user.getUsername()}<c:if test="${sessionScope.user.getAdmin()}"> (admin)</c:if></a></li>
                    <li><a href="logout">Logout</a></li>
                 </ul>
               </div>
            </nav>        
                    <div class="jumbotron">
                                <h1> The Online Classroom </h1>
                                <p> An exclusive platform for collaboration with your Department of Computer Science fellows. 
Access a plethora of review materials and learning resources.
Gain feedback from the entire UP DCS network.
Hold a conference or study session with anyone in the department. </p>
                                <!-- <p> <a class="btn btn-primary btn-md" href="#">Learn more</a> </p> -->
                        </div>
                </div>
        </div>
        
        <div class="row">
        		<h2 style="margin-left: 20px"> Features: </h2></br>
        		<center>
                <div class="col-sm-4 column">
                        <h2><i class="largeicon icon-folder-open"></i> Materials </h2>
                        <p> Upload or download all the resources you need. </p>
                        <p> <a class="btn btn-primary" href="materials">Go to Materials »</a> </p>
                </div>
                <div class="col-sm-4 column">
                        <h2><i class="largeicon icon-pencil"></i> Forum </h2>
                        <p> Ask away or share your knowledge. </p>
                        <p> <a class="btn btn-primary" href="forum">Go to Forum »</a> </p>
                </div>
                <div class="col-sm-4 column">
                        <h2><i class="largeicon icon-comment"></i> Chat </h2>
                        <p> Insightful discussion with your peers. </p>
                        <p> <a class="btn btn-primary" href="chat">Go to Chat »</a> </p>
                </div>
        
        </center>
        </div>
</div>

	
	
	
	<!-- Footer and Modal
	**************************************************-->
	</br>
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