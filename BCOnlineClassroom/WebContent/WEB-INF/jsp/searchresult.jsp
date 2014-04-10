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
					<li  class="active"><a href="resource.html">Materials</a></li>
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
	
	
		<!-- Subject Title
	**************************************************-->
	<div class = "jumbotron">
		<!--JSP code to get subject-->
		<a href="materials"><h2>Materials</h2></a>
		<h5>Upload or download all the resources you need.</h5>
	</div>
	<center>
		<h1>${id}</h1>
	</center>
	
	
		<!-- Search title
	**************************************************-->
	<div class = "container">
		<div class="container">
			<div class="row">
				<div class="col-md-7">
					<h2>Search results</h2>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- Table
	**************************************************-->
	
	<div class="container">
		<div class="row pull-center">
			<b>
			<div class="col-sm-5 table-bordered">Filename</div>
			<div class="col-sm-1 table-bordered">File Size</div>
			<div class="col-sm-2 table-bordered">Upload Date</div>
			<div class="col-sm-3 table-bordered">Uploaded by</div>
			<div class="col-sm-1 table-bordered">Download</div>
			</b>
		</div>
		<!-- JSP generated code for all items in folder -->
		<c:forEach var="matFile" items="${matFileList}">
			<div class="row pull-center">
				<div class="col-sm-5 table-bordered">${matFile.fileName}</div>
				<div class="col-sm-1 table-bordered">${matFile.fileSize}</div>
				<div class="col-sm-2 table-bordered">${matFile.uploadDate}</div>
				<div class="col-sm-3 table-bordered">${matFile.uploader}</div>
				<div class="col-sm-1 table-bordered"><a href="download.do?fid=${matFile.matFileID}">Download</a></div>
			</div>
		</c:forEach>
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