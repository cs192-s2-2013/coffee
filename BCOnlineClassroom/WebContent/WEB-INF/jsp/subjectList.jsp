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
          i { font-size: 50px; }
          
    </style>
	
</head>

<body>

	<!--  Navigation Bar
	***************************** -->
	<nav class="navbar navbar-inverse" role="navigation">
	   <div class="navbar-header">
	      <a class="navbar-brand" href="home">Online Classroom</a>
	   </div>
	   <div>
	      <ul class="nav navbar-nav">
	         <li><a href="materials">Materials</a></li>
	         <li><a href="forum">Forum</a></li>
	         <li><a href="chat">Chat</a></li>
	      </ul>
		<ul class="nav navbar-nav pull-right">
              <li><a>${sessionScope.user.getUsername()}<c:if test="${sessionScope.user.getAdmin()}"> (admin)</c:if></a></li>
              <li><a href="logout">Logout</a></li>
          </ul>
	     
	   </div>
	</nav>	
	
	<!-- Resources
	**************************************************-->
	<div class = "jumbotron">
		<!--JSP code to get subject-->
		<a href="#"><h2>Materials</h2></a>
		<h5>Upload or download all the resources you need.</h5>
	</div>
	
	
	<!-- Search Bar
	************************************************* -->
	<form:form method="post" action="/searchfile">
		<div class="row">
			<div class="col-sm-7"></div>
			<div class="col-sm-3">
				<input type="text" name="s" class="form-control" placeholder="Find files">
			</div>
			<div class="col-sm-1">
				<button type="submit" class="btn btn-primary"><i class="icon-search" style="font-size:15px;"></i></button>
			</div>
		</div>
	</form:form>
	
	</br></br>
	
	<!-- Add Category
	************************************************* -->
	<form:form method="post" action="/addmatcategory" modelAttribute="matFolder">
		<div class="row">
			<div class="col-sm-6"></div>
			<div class="col-sm-3" style="margin-left:60px">
				<input type="text" name="folderName" class="form-control" placeholder="Add Category">
			</div>
			<div class="col-sm-1">
				<button type="submit" class="btn btn-primary"><i class="largeicon icon-plus"></i></button>
			</div>
		</div>
	</form:form>	
	
	<!--Subject Grid
	*************************************************-->
	<div class="container">
		<div class="row">
			</br>
		</div>
		<%int i=0; %>
		<c:forEach var="matSubject" items="${matSubjectList}">
			<%if(i==0) {%>
				<div class="row">
				<div class="col-sm-1"></div>
			<%} %>
			<div class="col-sm-2">
				<center>
				<a href="subfolder?id=${matSubject.subjectName}"><i class="icon-folder-open" rel"tooltip" title="${matSubject.subjectName}"></i></a>
				</br>
				${matSubject.subjectName}<c:if test="${sessionScope.user.getAdmin()=='true'}"> <a href="deletesubject?sid=${matSubject.getMatSubjectID()}"><t class="largeicon icon-trash" rel="tooltip" title="Delete subject"></t></a> </c:if>
				</br></br>
				</center>
			</div>
			<%i++;	
			if(i==5) {
				i=0;%>
				</div>
			<%} %>
		</c:forEach>
	</div>
	<!-- ${matSubject.subjectDesc} -->

	
	
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