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
			#box {
				overflow: auto;
				background: transparent;
				border: 1px solid rgb(192,192,192);
			}
			.modal-dialog {
	          	width:450px; 
	          	height: 60px;
	          	margin-top: 180px;
          	}
		  	.modal-body {
		  		height: 60px;
		  		margin-top:-10px; 
		  	}
		  	.modal-footer {
		  		height: 60px;
		  	}
		  	.modal-footer button {
		  		margin-top: -10px;
		  	}
		  	.chatbox {
		  		padding-right: 15px;
		  		padding-left: 15px;
		  		height: 400px;
		  	}
		  	
		  	.mygrid-wrapper-div {
		  		border: solid 2px;
		  		overflow: auto;
		  		padding-top: 10px;
		  		width: 100%;
		  	}
			
			i { font-size: 10px; }
		  	
    </style>
	
</head>

<body>

	<font color="#336699">
	
	<!-- tried this one on the first tut <button class="btn btn-success">Test</button> -->

	<!-- fixed navigaiton bar with dropdown menu
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
				<a href="home" class="navbar-brand">Blue Coffee</a> 
			</div>
			
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav nav-pills">
					<li><a href="index.html">Home</a></li>
					<li class="divider-vertical"></li>
					<li  class="active"><a href="resource.html">Resources</a></li>
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

	
	<!-- Title
	**************************************************-->
	<div class="jumbotron">
		<a href="chat"><h2>Chat</h2></a>
		<h5>Insightful discussion with your peers</h5>
	</div>
	
	
	
	<center>
	<div style="height: 75%; width: 70%;">

	<!-- List of members
	**************************************************-->
			<div class="col-sm-3" style="margin-left:2px;">
				<h4>Members</h4>
				<div class="row mygrid-wrapper-div" style="height:120px;">
					<div class="row">
						<c:forEach var="member" items="${membersList}">${member.getFirstName()} ${member.getLastName()}</br>
						</c:forEach>
					</div>
				</div>
				
				<!--  Add Members 
				***************************************** -->
				<div class="row mygrid-wrapper-div text-left" style="height:294px; padding-left:8px;">
					<form:form method="post" action="/searchuser?c=${c}">
						<div class="row">
							<div class="col-sm-9" >
								<input type="text" name="s" class="form-control input-small" placeholder="Search users">
							</div>
							<div class="col-sm-1" style="padding-left:0px;">
								<button type="submit" class="btn btn-primary"><i class="icon-search"></i></button>
							</div>
						</div>
					</form:form>
					<c:forEach var="user" items="${userList}">
						<a href="addmember?c=${c}&u=${user.getUserID()}"><i class="icon-plus"></i></a>
						${user.getFirstName()} ${user.getLastName()}
						</br>
					</c:forEach>
				</div>
			</div>
	
	<!-- List of messages
	**************************************************-->	
			<div class="col-sm-9 row" style="margin-left:2px;">
				<h4>${convoTitle }</h4>
				<div class="mygrid-wrapper-div" id="messagebox">
				<div class="chatbox text-left">
					<c:forEach var="message" items="${chatMessageList}">
					<b>${message.getSender()}:</b> ${message.getMessage()} </br>
					</c:forEach>
				</div>
				</div>
				
				<script>	
					var d = document.getElementById('messagebox');

					if(d.scrollHeight > d.clientHeight) {
  					d.scrollTop = d.scrollHeight - d.clientHeight;
					}
				</script>
					
			</div>
		
	
	<!-- Input message
	**************************************************-->	
	<div class="row" >
			
			<!-- Leave conversation
			************************************** -->
			<div class="col-sm-3" style="margin-top:10px; margin-bottom:10px; margin-left:15px;"><a href="conversation?c=${c}&lc=1"><button type="" class="btn btn-primary">Leave conversation</button></a></div>
			
	<form:form method="post" action="/sendmessage?c=${c}" modelAttribute="chatMessage">
			<div class="col-sm-7">
				<input type="text" name="message" class="form-control" placeholder="Type your message here" style="margin-top:10px; margin-bottom:10px;"> 
			</div>
			<div class="col-sm-1">
				<button type="submit" class="btn btn-primary" style="margin-top:10px; margin-bottom:10px;">Send</button>
			</div>
	</form:form>
	
	<c:if test="${lc=='1'}">
		<div id="message" class="modal show" tabindex="-1" role="dialog" aria-hidden="true">
		 	<div class="modal-dialog">
		  		<div class="modal-content">
					<div class="modal-body">
         				<h4 class="text-center">Are you sure you want to leave conversation?</h4>
		     		</div>
		      		<div class="modal-footer">
		          		<div class="col-md-12">
		         			<button class="btn btn-primary" data-dismiss="modal" aria-hidden="true"><a href="leave?c=${c}"><font color="white">Yes</font></a></button>
		          			<button class="btn btn-primary" data-dismiss="modal" aria-hidden="true"><a href="conversation?c=${c}"><font color="white">Close</font></a></button>
				 		</div>	
		      		</div>
		  		</div>
		 	</div>
		</div>
	</c:if>
	</div>
	
	</div>
	</center>
	
		
	<!-- Footer and Modal
	**************************************************-->
		
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				
				<hr/>
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
			
	</font>
	<!-- Comment --->
					
			</div>
		</div>
	</div>
	
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/contentHover.js"></script>
	
	<script type="text/javascript">
		$('document').ready(function(){
		
			$('#mytooltip').tooltip();
			
			$('#myPopOver').popover();
			
			$('#d1').contenthover({
				overlay_background:'#000',
				overlay_opacity:0.8
			});
			
			$('#d2').contenthover({
				effect:'slide',
				slide_speed:300,
				overlay_background:'#000',
				overlay_opacity:0.8
			});
			
			$('#d3').contenthover({
				overlay_width:270,
				overlay_height:180,
				effect:'slide',
				slide_direction:'right',
				overlay_x_position:'right',
				overlay_y_position:'center',
				overlay_background:'#000',
				overlay_opacity:0.8
			});
			
		});
	
	</script>
</body>
</html>

<!--

16 -  tutorial 1 : creating website from scratch
17 - tutorial 2 : responsive navigation bar
-->