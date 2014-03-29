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
				<a href="#" class="navbar-brand">Blue Coffee</a> 
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
	</div>
	
	
		<!-- Upload
	**************************************************
	
	<div class="container">
		<div class="row">
			<div class="col-md-12">
			
			<br/>
			<br/>
			<hr/>
				<div class="fileupload fileupload-new" data-provides="fileupload">
					<span class="btn btn-primary btn-file">
					<span class="fileupload-new">Select file</span>
					<span class="fileupload-exists"></span>
						<input type="file" data-bfi-disabled/>
					</span>-
					<span class="fileupload-preview"></span>
					<a href="#" class="close fileupload-exists" data-dismiss="fileupload" style="float: none">×</a>
				</div>
				<a class="btn btn-info" id="mytooltip" href="#" data-toggle="tooltip" title="Upload Files" data-placement="right">
					Upload
				</a>
			</div>
		</div>
	</div> -->
	
	
	<!-- Question/Title
	**************************************************-->
	<div class = "jumbotron">
		<!--JSP code to get subject-->
		<h2>Forum</h2>
		<h5>Ask away or share your knowledge.</h5>
	</div>
	
	
	<!-- Details/Content
	**************************************************-->
	<div class="container">
		<div class="row">
			<center><h2>${fPost.title}</h2></center>
		</div>
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-10">
				${fPost.content}
				</br></br>
				Tags: <c:forEach var="fTag" items="${fTagList}"> ${fTag.tag }	</c:forEach>
				</br></br>
				<small><b>Posted by ${fPost.poster} on ${fPost.postDate}</small></b>
			</div>
		</div>
	</div>
	</br></br>
	
	
	<!-- Answers
	**************************************************-->
	<div class="container">
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-10"><h3>${fPost.commentCount} answers</h3></div>
		</div>
		
		<c:forEach var="fComment" items="${fCommentList}">
			<div class="row">
				<div class="col-sm-1"></div>
				<div class="col-sm-10 table-bordered">
					<h4>${fComment.commenter} says:</h4>
					<small>
					${fComment.content}
					</small>
				</br></br>
				<p class="text-right"><small>Posted on ${fComment.commentDate}</small></p>
				</div>
			</div>
		</c:forEach>
	</div>
		
	
	<!-- Add an answer
	**************************************************-->
	<form:form method="post" action="/comment?pid=${pid}" modelAttribute="fComment">
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-5"><h3>Add a reply</h3></div>
		</div>
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<textarea class="form-control" name="content" rows="3" placeholder="Type your answer here..."></textarea>
			</div>
		</div>
		</br>
		<div class="row">
			<div class="col-sm-9"></div>
			<div class="col-sm-2">
				<button type="submit" class="btn btn-success">Reply</button>
			</div>
		</div>
	</form:form>
	
	
	<!-- Footer and Modal
	**************************************************-->
		
	</font>
</div>
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
	<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0-rc1/js/bootstrap.min.js"></script>
	
	<script type="text/javascript">
		$('document').ready(function(){
		
			$('#mytooltip').tooltip();
			
		});
	
	</script>

</body>
</html>

<!--

16 -  tutorial 1 : creating website from scratch
17 - tutorial 2 : responsive navigation bar
-->