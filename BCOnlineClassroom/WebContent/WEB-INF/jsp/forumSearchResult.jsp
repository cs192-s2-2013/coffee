<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="t"%>

<html>
<head>
	<title>Blue Coffee</title>
	<t:css/>
</head>

<body>

	<t:navbar user="${sessionScope.user}"/>
	<t:jumbotron title="Forum"/>
	
	<!-- Search Bar
	************************************************* -->
	<form:form method="post" action="/searchpost">
		<div class="row">
			<div class="col-sm-6"></div>
			<div class="col-sm-3" style="margin-left:60px">
				<input type="text" name="s" class="form-control" placeholder="Search for posts">
			</div>
			<div class="col-sm-1">
				<button type="submit" class="btn btn-primary"><i class="largeicon icon-search"></i></button>
			</div>
		</div>
	</form:form>	


	<c:choose>
	<c:when test="${noresultfound=='true'}">
	<div class="container">
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-4"><h3>No results found</h3></div>
		</div>
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-8" style="padding-left:50px">
				<h4>You can try:</h4>
				Entering one word at a time or phrases separated by dashes (-). White spaces will return no results.</br>
				Using a different but similar search key.</br>
				Asking a question. Maybe your concern hasn't been brought up on the forum yet. 
			</div>
		</div>
	</div>
	</c:when>
	<c:otherwise>
	<div class="container">
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-4"><h3>Search result</h3></div>
		</div>
	</div>
	<!-- List of questions
	**************************************************-->
	<c:forEach var="forumItem" items="${fPostList}">
		<div class="container">
			<div class="row">
				<div class="col-sm-1"></div>
				<div class="col-sm-8 table-bordered">
					<h4><a href="viewpost?pid=${forumItem.getFPostID()}">${forumItem.title}</a></h4>
					<h6>Posted by ${forumItem.poster} on ${forumItem.postDate}</h6>
				</div>
				<div class="col-sm-2 table-bordered"><center>
					<k> ${forumItem.commentCount} </k>
					replies
				</center></div>
			</div>
		</div>
	</c:forEach>
	</c:otherwise>
	</c:choose>
	<!-- Footer and Jumbotron
	**************************************************
	
	
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				
				<div class="jumbotron">
					<h1>We are awesome</h1>
					<p>
						<a href="#" class="btn btn-success">Learn more</a>
					</p>
				</div>
				
			</div>
		</div>
	-->
	<!-- Accordion
	**************************************************
	
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h2>Accordion</h2> <hr/>
				
				<div class="panel-group" id="accordion">
				
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="Accordion" href="#section1">
									Something
								</a>
							</h4>
						</div>
						
						<div class="panel-collapse collapse in" id="section1">
							<div class="panel-body">
								This will contain some text...
							</div>
						</div>
					</div>
					
					<div class="panel panel-success">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="Accordion" href="#section2">
									Something
								</a>
							</h4>
						</div>
						
						<div class="panel-collapse collapse" id="section2">
							<div class="panel-body">
								This will contain some text... haha
							</div>
						</div>
					</div>
					
					<div class="panel panel-danger">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="Accordion" href="#section3">
									Something
								</a>
							</h4>
						</div>
						
						<div class="panel-collapse collapse" id="section3">
							<div class="panel-body">
								This will contain some text... hahaha
							</div>
						</div>
					</div>
					
				</div>
				
			</div>
		</div>
	</div>
	-->
	<!-- Tab
	**************************************************
	
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h2> Tab </h2> <hr/>
				
				<!-- Tabs Navigation
				<ul class="nav nav-tabs">
					<li class="active"> <a href="#tab1" data-toggle="tab"> Section 1 </a></li>
					<li> <a href="#tab2" data-toggle="tab"> Section 2 </a></li>
					<li> <a href="#tab3" data-toggle="tab"> Section 3 </a></li>
				</ul>
				
				<!-- Tab Section 
				<div class="tab-content">
					<div class="tab-pane active" id="tab1">
						This is our first tab...This is our first tab...
						This is our first tab...This is our first tab...
						This is our first tab...This is our first tab...
						This is our first tab...This is our first tab...
						This is our first tab...This is our first tab...
					</div>
					<div class="tab-pane" id="tab2">
						This is our second tab...This is our second tab...
						This is our second tab...This is our second tab...
						This is our second tab...This is our second tab...
						This is our second tab...This is our second tab...
						This is our second tab...This is our second tab...
					</div>
					<div class="tab-pane" id="tab3">
						This is our third tab...This is our third tab...
					</div>
				</div>
				
			</div>
		</div>
	</div>
	-->
	
	<!-- Tooltips and Popovers
	**************************************************
	
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h2>Tooltips</h2> <hr/>
				
				<a class="btn btn-primary" id="mytooltip" href="#" data-toggle="tooltip" title="My Tooltip text" data-placement="right">
					Tooltip
				</a>
				
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-12">
				<h2>Popovers</h2> <hr/>
				<button id="myPopOver" class="btn btn-danger" data-toggle="popover" title="My Title" data-content="This will be the body text">
					Popover
				</button>

			</div>
		</div>
	</div>
	-->
	
	<!-- Content Hover
	**************************************************
	
	<hr/>
	
	<div class="container">
		<div class="row">
			<div class="col-md-3">
			
				<img id="d1" src="image/coffee.jpg"/>
				
				<div class="contenthover">
					<h3>Lorem ipsum dolor</h3>
					<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. </p>
					<p><a href="#" class="mybutton">Lorem ipsum</a></p>
				</div>
				
			</div>
			
			<div class="col-md-3 col-md-offset-1">
			
				<img id="d2" src="image/coffee.jpg"/>
				
				<div class="contenthover">
					<h3>Lorem ipsum dolor</h3>
					<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. </p>
					<p><a href="#" class="mybutton">Lorem ipsum</a></p>
				</div>
				
			</div>
			
			<div class="col-md-3 col-md-offset-1">
			
				<img id="d3" src="image/coffee.jpg"/>
				
				<div class="contenthover">
					<h3>Lorem ipsum dolor</h3>
					<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. </p>
					<p><a href="#" class="mybutton">Lorem ipsum</a></p>
				</div>
				
			</div>
			
		</div>
	</div>
	-->
	
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