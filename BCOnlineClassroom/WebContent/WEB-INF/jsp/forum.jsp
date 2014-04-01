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
	
	<!-- tried this one on the first tut <button class="btn btn-success">Test</button> -->

	<!-- fixed navigaiton bar with dropdown menu
	***************************************************-->
	<div class="container">
	<div class="navbar navbar-inverse navbar-fixed-top">
	<div class="navbar-inner">
		
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
					<li><a href="resource.html">Resources</a></li>
					<li class="divider-vertical"></li>
					<li  class="active"><a href="feature.html">Forum</a></li>
					<li class="divider-vertical"></li>
					<li><a href="chat.html">Chat</a></li>
					<li class="divider-vertical"></li>
					<li><a href="about.html">About</a></li>
				</ul>
			</div>
		</div>
	</div>
	</div>
	
	<!-- Title
	**************************************************-->
	<div class="jumbotron">
		<!--JSP code to get subject-->
		<a href="#"><h2>Forum</h2></a>
		<h5>Ask away or share your knowledge.</h5>
	</div>
	
	
	<c:choose>
	<c:when test="${r=='1'}">
		<!-- Input question
		**************************************************-->
		<div class="container">
		<form:form method="post" action="/insertpost" modelAttribute="fPost">
			<div class="row">
				<div class="col-sm-2"></div>
					<div class="col-sm-8"><center><h3>Ask a question</h3></center></div>
			</div>
			<div class="row">
				<div class="col-sm-2"></div>
				<div class="col-sm-8">
					<input type="text" name="title" class="form-control" placeholder="Type your question here">
				</div>
			</div>
			</br>
			<div class="row">
				<div class="col-sm-2"></div>
				<div class="col-sm-8">
					<textarea class="form-control" name="content" rows="3" placeholder="Details about the problem"></textarea>
				</div>
			</div>
			</br>
			<div class="row">
				<div class="col-sm-2"></div>
				<div class="col-sm-8">
					<textarea class="form-control" name="tag" placeholder="Tags: tags-are-separated-by-spaces this-is-another-tag"></textarea>
				</div>
			</div>
			</br>
			<div class="row">
				<div class="col-sm-8"></div>
				<div class="col-sm-3">
					<!--<button type="button" class="btn btn-info">Add details</button>-->
					<a href="forum?r=1"></a><button type="cancel" class="btn btn-primary">Cancel</button></a>
					<button type="submit" class="btn btn-primary">Submit</button>
				</div>
			</div>
		</form:form>
		</div>
		</br></br></br>
	</c:when>
	<c:otherwise>
		<div class="row">
			<div class="col-sm-2"></div>
				<div class="col-sm-8"><a href="forum?r=1"><p align="right"><button type="ask" class="btn btn-primary">Ask a question</p></button></a></div>
		</div>
	</c:otherwise>
	</c:choose>
	
	<!-- List of questions
	**************************************************-->
	
	<c:forEach var="forumItem" items="${fPostList}">
		<div class="container">
			<div class="row">
				<div class="col-sm-1"></div>
				<div class="col-sm-8 table-bordered">
					<h4><a href="forumPost?pid=${forumItem.getFPostID()}">${forumItem.title}</a></h4>
					Tags:
					<!-- Insert tags here later -->
					</br>
					<h6>Posted by ${forumItem.poster} on ${forumItem.postDate}</h6>
				</div>
				<div class="col-sm-2 table-bordered"><center>
					<h1>${forumItem.commentCount}</h1>
					replies
				</center></div>
			</div>
		</div>
	</c:forEach>
	
	
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