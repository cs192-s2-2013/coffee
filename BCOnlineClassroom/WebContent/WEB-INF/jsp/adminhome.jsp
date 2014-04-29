<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="t"%>

<html>
<head>
	<title>Blue Coffee</title>
	<script type="text/javascript" src="<c:url value="resources/js/jquery.js" />"> </script>
	<script type="text/javascript" src="<c:url value="resources/js/bootstrap.js" />"> </script>
	<t:css/>
	
	<style>
		.modal-dialog {
          	width:450px; 
          	height: 60px;
          	margin-top: 300px;
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
	</style>
</head>
<body>
	<t:navbar user="${sessionScope.user}"/>
	<t:jumbotron title="Admin"/>
	
	<!------------------  MODALS ---------------------->
	<!-- Modal Materials Subject -->
	<div class="modal fade" id="addsubject" tabindex="-1" role="dialog" aria-labelledby="addsubjectlabel" aria-hidden="true">
		<div class="modal-dialog">
			<form:form method="post" action="/admin/addsubject" modelAttribute="matSubject">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="myModalLabel">Add a subject to materials</h4>
					</div>
					<div class="modal-body">
						<input type="text" name="subjectName" required class="form-control input-lg" placeholder="Subject Name">
						<input type="text" name="subjectDesc" required class="form-control input-lg" placeholder="Description">
					</div>
					<br>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
						<button type="submit" class="btn btn-primary">Create Subject</button>
					</div>
				</div>
			</form:form>
		</div>
	</div>
	<!-- Modal Materials Folder -->
	<div class="modal fade" id="addfolder" tabindex="-1" role="dialog" aria-labelledby="addfolderlabel" aria-hidden="true">
		<div class="modal-dialog">
			<form:form method="post" action="/admin/addfolder" modelAttribute="matFolder">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="myModalLabel">Add a category to materials</h4>
					</div>
					<div class="modal-body">
						<input type="text" name="folderName" required class="form-control input-lg" placeholder="Category Name">
					</div>
					<br>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
						<button type="submit" class="btn btn-primary">Create Category </button>
					</div>
				</div>
			</form:form>
		</div>
	</div>
	<!-- Modal Forum Category -->
	<div class="modal fade" id="addcategory" tabindex="-1" role="dialog" aria-labelledby="addcategorylabel" aria-hidden="true">
		<div class="modal-dialog">
			<form:form method="post" action="/admin/addcategory" modelAttribute="fCategory">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="myModalLabel">Add a category to forum</h4>
					</div>
					<div class="modal-body">
						<input type="text" name="fCategory" required class="form-control input-lg" placeholder="Category Name">
					</div>
					<br>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
						<button type="submit" class="btn btn-primary">Create Category</button>
					</div>
				</div>
			</form:form>
		</div>
	</div>
	<!------------------  end modals ---------------------->
	
	<h1>Materials</h1>
	<div class="panel-group" id="accordion">
		<!-- MATERIALS SUBJECT -->
		<div class="panel panel-default">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion" href="#collapsemsubject">
						Subject
    			   </a>
				</h4>
			</div>
			<div id="collapsemsubject" class="panel-collapse collapse">
				<div class="panel-body">
					<a href="#" data-toggle="modal" data-target="#addsubject">Add a subject...</a>
					<table border=1 cellpadding=4>
						<tr>
							<th>Name</th><th>Description</th><th>Delete</th>
						</tr>
						<c:forEach var="matSubject" items="${matSubjectList}">
							<tr>
								<td> ${matSubject.getSubjectName()} </td>
								<td> ${matSubject.getSubjectDesc()} </td>
								<td align="center"> <a href="admin/deletesubject?sid=${matSubject.getMatSubjectID()}"><i class="largeicon icon-trash" rel="tooltip" title="Delete subject"></i></a> </td>
							</tr>
						</c:forEach>
					</table>
					<br>
				</div>
			</div>

		<!-- MATERIALS CATEGORY -->
			<div class="panel-heading">
				<h4 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion" href="#collapsemfolder">
						Category
    			   </a>
				</h4>
			</div>
			<div id="collapsemfolder" class="panel-collapse collapse">
				<div class="panel-body">
					<a href="#" data-toggle="modal" data-target="#addfolder">Add a category...</a>
					<table border=1 cellpadding=4>
						<tr>
							<th>ID</th><th>Folder Name</th><th>Delete</th>
						</tr>
						<c:forEach var="matFolder" items="${matFolderList}">
							<tr>
								<td>${matFolder.getMatFolderID()}</td>
								<td>${matFolder.getFolderName()}</td>
								<td align="center"> <a href="admin/deletefolder?fid=${matFolder.getMatFolderID()}"><i class="largeicon icon-trash" rel="tooltip" title="Delete category"></i></a> </td>
							</tr>
						</c:forEach>
					</table>
					<br>
				</div>
			</div>
		
		<!-- MATERIALS FILE -->
			<div class="panel-heading">
				<h4 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion" href="#collapsemfile">
						File
    			   </a>
				</h4>
			</div>
			<div id="collapsemfile" class="panel-collapse collapse">
				<div class="panel-body">
					<table border=1 cellpadding=4>
						<tr>
							<th>ID</th><th>Filename</th><th>Type</th><th>Size</th><th>Upload Date</th><th>Delete</th>
						</tr>
						<c:forEach var="matFile" items="${matFileList}">
							<tr>
								<td align="center">${matFile.getMatFileID()}</td>
								<td>${matFile.getFileName()}</td>
								<td>${matFile.getFileType()}</td>
								<td>${matFile.getFileSize()}</td>
								<td>${matFile.getUploadDate()}</td>
								<td align="center"> <a href="admin/deletefile?id=${matFile.getMatFileID()}"><i class="largeicon icon-trash" rel="tooltip" title="Delete file"></i></a> </td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
  
	<h1>Forum</h1>
	<div class="panel-group" id="accordion2">
		<div class="panel panel-default">
		<!-- FORUM CATEGORY -->
			<div class="panel-heading">
				<h4 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion2" href="#collapsefcategory">
						Category
    			   </a>
				</h4>
			</div>
			<div id="collapsefcategory" class="panel-collapse collapse">
				<div class="panel-body">
					<a href="#" data-toggle="modal" data-target="#addcategory">Add a category...</a>
					<table border=1 cellpadding=4>
						<tr>
							<th>ID</th><th>Category Name</th><th>Delete</th>
						</tr>
						<c:forEach var="fCategory" items="${fCategoryList}">
							<tr>
								<td> ${fCategory.getFCategoryID()} </td>
								<td> ${fCategory.getFCategory()} </td>
								<td align="center"> <a href="admin/deletecategory?cid=${fCategory.getFCategoryID()}"><i class="largeicon icon-trash" rel="tooltip" title="Delete category"></i></a> </td>
							</tr>
						</c:forEach>
					</table>
					<br>
				</div>
			</div>
		<!-- FORUM POST -->
			<div class="panel-heading">
				<h4 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion2" href="#collapsefpost">
						Post
    			   </a>
				</h4>
			</div>
			<div id="collapsefpost" class="panel-collapse collapse">
				<div class="panel-body">
					<table border=1 cellpadding=4>
						<tr>
							<th>ID</th><th>Title</th><th>Content</th><th>Delete</th>
						</tr>
						<c:forEach var="fPost" items="${fPostList}">
							<tr>
								<td> ${fPost.getFPostID()} </td>
								<td> ${fPost.getTitle()} </td>
								<td> ${fPost.getContent()} </td>
								<td align="center"> <a href="admin/deletepost?pid=${fPost.getFPostID()}"><i class="largeicon icon-trash" rel="tooltip" title="Delete post"></i></a> </td>
							</tr>
						</c:forEach>
					</table>
					<br>
				</div>
			</div>
		<!-- FORUM COMMENT -->
			<div class="panel-heading">
				<h4 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion2" href="#collapsefcomment">
						Comment
    			   </a>
				</h4>
			</div>
			<div id="collapsefcomment" class="panel-collapse collapse">
				<div class="panel-body">
					<table border=1 cellpadding=4>
						<tr>
							<th>ID</th><th>Content</th><th>Delete</th>
						</tr>
						<c:forEach var="fComment" items="${fCommentList}">
							<tr>
								<td> ${fComment.getFCommentID()} </td>
								<td> ${fComment.getContent()} </td>
								<td align="center"> <a href="admin/deletecomment?pid=${fComment.getFPostID()}&cid=${fComment.getFCommentID()}"><i class="largeicon icon-trash" rel="tooltip" title="Delete comment"></i></a> </td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
	</div>


</body>
</html>