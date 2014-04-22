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
	<link rel="stylesheet" type="text/css" href=<c:url value="/WEB-INF/jsp/css/style.css"/>>
	<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0-rc1/css/bootstrap.min.css" rel="stylesheet">

	<!--  

	<link type="text/css" rel="stylesheet" href="css/style.css">
	-->
	
	<style>
          body { background: #FFFFFF; }
          .container { background: ; }
          .modal-dialog {
          	width:400px; 
          	margin-top: 180px;
          }
		  .modal-body { height: 60px; }
		  .jumbotron { margin-top: -50px; }
    </style>
	<script>
	    $(document).ready(function(){
	        $("[rel=tooltip]").tooltip({ placement: 'right'});
	    });
    </script>
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
					<a href="#" class="close fileupload-exists" data-dismiss="fileupload" style="float: none">Ã—</a>
				</div>
				<a class="btn btn-info" id="mytooltip" href="#" data-toggle="tooltip" title="Upload Files" data-placement="right">
					Upload
				</a>
			</div>
		</div>
	</div> -->
	
	
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

	<c:if test="${success == '1'}">
		<div id="message" class="modal show" tabindex="-1" role="dialog" aria-hidden="true">
		  <div class="modal-dialog">
		  <div class="modal-content">
		      <div class="modal-body">
		          <h3 class="text-center">Upload Successful!</h3>
		      </div>
		      <div class="modal-footer">
		          <div class="col-md-12">
		          <button class="btn btn-primary" data-dismiss="modal" aria-hidden="true"><a href="subfolder?id=${id}"><font color="white">Close</font></a></button>
				  </div>	
		      </div>
		  </div>
		  </div>
		</div>
	</c:if>
	<c:if test="${success == '-1'}">
		<div id="message" class="modal show" tabindex="-1" role="dialog" aria-hidden="true">
		  <div class="modal-dialog">
		  <div class="modal-content">
		      <div class="modal-body">
		          <h3 class="text-center">Upload Failed!</h3>
		      </div>
		      <div class="modal-footer">
		          <div class="col-md-12">
		          <button class="btn btn-primary" data-dismiss="modal" aria-hidden="true"><a href="subfolder?id=${id}"><font color="white">Close</font></a></button>
				  </div>	
		      </div>
		  </div>
		  </div>
		</div>
	</c:if>		
	
	<!-- 
	<div class="modal hide" id="myModal">
	  <div class="modal-header">
	    <button type="button" class="close" data-dismiss="modal">×</button>
	    <h3>Modal header</h3>
	  </div>
	  <div class="modal-body">
	      <textarea id="textareaID"></textarea>
	  </div>
	  <div class="modal-footer">
	    <a href="#" class="btn" data-dismiss="modal">Close</a>
	    <a href="#" class="btn btn-primary">Save changes</a>
	  </div>
	</div>
	-->
	
	</br></br>
		<!-- Slides
	**************************************************-->
<div class = "container">
	<c:forEach var="key" items="${keys}">
	<div class="container">
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-7">
				<h2>${key} <a href="batchdownload?sn=${id}&fn=Slides"><i class="largeicon icon-download-alt" rel="tooltip" title="Download slides folder"></i></a></h2>
			</div>
			<div class="col-md-4">
			
				<div class="fileinput fileinput-new" data-provides="fileinput">
					
					 
					<form method="post" action="fileUploaded?id=${id}&sf=Slides" enctype="multipart/form-data">
					<span class="btn btn-default btn-file">
						<span class="fileinput-new"></span>
						<span class="fileinput-exists"></span>
						<input type="file" name="file" size="50">
					</span>
					
					<span class="fileinput-filename"></span>
					<button type="submit" class="btn btn-info" id="mytooltip" data-toggle="tooltip" title="Upload Files" data-placement="right">
						Upload
					</button>
					</form>
					<br/>
					
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- Table (Slides)
	**************************************************-->
	
	<div class="container">
		<div class="row pull-center">
			<b>
			<div class="col-sm-1"></div>
			<div class="col-sm-5 table-bordered">File</div>
			<!-- <div class="col-sm-1 table-bordered">File Size</div> -->
			<div class="col-sm-2 table-bordered">Upload Date</div>
			<div class="col-sm-3 table-bordered">Uploaded by</div>
			</b>
		</div>
		<!-- JSP generated code for all items in folder -->
			<c:forEach var="matFile" items="${map.get(key)}">
				<div class="row pull-center">
					<div class="col-sm-1"></div>				
					<div class="col-sm-5 table-bordered">
						<a href="download.do?fid=${matFile.matFileID}"><i class="largeicon icon-download-alt" rel="tooltip" title="Download ${matFile.fileName}"></i></a> 
						<c:if test="${sessionScope.user.getAdmin()=='true'}"> <a href="deletematerial?mid=${matFile.matFileID}&id=${id}"><i class="largeicon icon-trash" rel="tooltip" title="Delete material"></i></a> </c:if>
						${matFile.fileName}
					</div>
					<!-- <div class="col-sm-1 table-bordered">${matFile.fileSize}</div> -->
					<div class="col-sm-2 table-bordered">${matFile.uploadDate}</div>
					<div class="col-sm-3 table-bordered">${matFile.uploader}</div>
					<!-- <div class="col-sm-1 table-bordered"><a href="download.do?fid=${matFile.matFileID}">Download</a></div>	-->
				</div>
			</c:forEach>
		</c:forEach>
	</div>
	
	</br></br>
</div>	
	
	<div class="push"></div>

	
	
	<!-- Upload Success Modal
	**************************************************-->
	<div class="modal fade" id="uploadSuccess" role="dialog">
		<div class="modal-dialog">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title">File Upload</h4>
			</div>
		</div>
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