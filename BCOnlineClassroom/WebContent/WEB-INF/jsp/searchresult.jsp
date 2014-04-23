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
          .jumbotron { margin-top: -50px; }
    </style>
	
</head>

<body>

	<t:navbar user="${sessionScope.user}"/>
	<t:jumbotron title="Materials"/>
	
	<!-- Subject Title
	**************************************************-->
	<center>
		<h1>${id}</h1>
	</center>
	
	
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
	
	
	<c:choose>
	<c:when test="${empty matFileList}">
	
		<!-- Empty search
	**************************************************-->
	<div class="container">
		<div class="row">
			<div class="col-md-5" style="padding-left:35px;">
				<h2>No results found</h2>
			</div>
		</div>
		<div class="row">
			<div class="col-md-8" style="padding-left:50px">
			<h4>You can try:</h4>
			Entering one word at a time or phrases separated by dashes (-). White spaces will return no results.</br>
			Using a different but similar search key.</br>
			Asking a question. Maybe your concern hasn't been brought up on the forum yet. 
			</div>
		</div>
	</div>
	
	</c:when>
	
	<c:otherwise>
	
		<!-- Search title
	**************************************************-->
	<div class="container">
		<div class="row">
			<div class="col-md-5" style="padding-left:35px;">
				<h2>Search results</h2>
			</div>
		</div>
	</div>
	
	<!-- Table
	**************************************************-->
	<div class="container">
		<div class="row pull-center">
			<b>
			<div class="col-sm-1"></div>
			<div class="col-sm-5 table-bordered">File</div>
			<div class="col-sm-2 table-bordered">Upload Date</div>
			<div class="col-sm-3 table-bordered">Uploaded by</div>
			</b>
		</div>
		<!-- JSP generated code for all items in folder -->
		<c:forEach var="matFile" items="${matFileList}">
			<div class="row pull-center">
				<div class="col-sm-1"></div>				
				<div class="col-sm-5 table-bordered"><a href="download.do?fid=${matFile.matFileID}"><i class="largeicon icon-download-alt"></i></a> ${matFile.fileName}</div>
				<div class="col-sm-2 table-bordered">${matFile.uploadDate}</div>
				<div class="col-sm-3 table-bordered">${matFile.uploader}</div>
				<!-- <div class="col-sm-1 table-bordered"><a href="download.do?fid=${matFile.matFileID}">Download</a></div>	-->
			</div>
		</c:forEach>
	</div>
	
	</c:otherwise>
	</c:choose>
	
	
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