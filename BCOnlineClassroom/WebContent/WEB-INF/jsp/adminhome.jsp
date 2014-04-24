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
	<script type="text/javascript" src="<c:url value="resources/js/bootstrap.js"/>"> </script>
	<script type="text/javascript" src="<c:url value="resources/js/jquery.js" />"> </script>	
</head>
<body>
	<t:navbar user="${sessionScope.user}"/>
	<t:jumbotron title="Admin"/>
	
	<h1>Materials</h1>

	<!-- MATERIALS SUBJECT -->
	<c:choose>
	<c:when test="${collapse=='1'}">
		<h3><a href="admin"> <button class="btn btn-primary">Subject</button></a></h3>
		<table border=1 cellpadding=4>
			<tr>
				<th>ID</th><th>Name</th><th>Description</th>
			</tr>
			<c:forEach var="matSubject" items="${list}">
				<tr>
					<td> ${matSubject.getMatSubjectID()} </td>
					<td> ${matSubject.getSubjectName()} </td>
					<td> ${matSubject.getSubjectDesc()} </td>
				</tr>
			</c:forEach>
		</table>
	</c:when>
	<c:otherwise>
		<h3><a href="admin?collapse=1"> <button class="btn btn-primary">Subject</button></a></h3>
	</c:otherwise>
	</c:choose>
	
	<!-- MATERIALS CATEGORY -->
	<c:choose>
	<c:when test="${collapse=='2'}">
		<h3><a href="admin"> <button class="btn btn-primary">Category</button></a></h3>
		<table border=1 cellpadding=4>
			<tr>
				<th>ID</th><th>Folder Name</th>
			</tr>
			<c:forEach var="matFolder" items="${list}">
				<tr>
					<td>${matFolder.getMatFolderID()}</td>
					<td>${matFolder.getFolderName()}</td>
				</tr>
			</c:forEach>
		</table>
	</c:when>
	<c:otherwise>
		<h3><a href="admin?collapse=2"> <button class="btn btn-primary">Category</button></a></h3>
	</c:otherwise>
	</c:choose>
	
	<!-- MATERIALS FILE -->
	<c:choose>
	<c:when test="${collapse=='3'}">
		<h3><a href="admin"> <button class="btn btn-primary">File</button></a></h3>
		<table border=1 cellpadding=4>
			<tr>
				<th>ID</th><th>Filename</th><th>Type</th><th>Size</th><th>Upload Date</th>
			</tr>
			<c:forEach var="matFile" items="${list}">
				<tr>
					<td align="center">${matFile.getMatFileID()}</td>
					<td>${matFile.getFileName()}</td>
					<td>${matFile.getFileType()}</td>
					<td>${matFile.getFileSize()}</td>
					<td>${matFile.getUploadDate()}</td>
				</tr>
			</c:forEach>
		</table>
	</c:when>
	<c:otherwise>
		<h3><a href="admin?collapse=3"> <button class="btn btn-primary">File</button></a></h3>
	</c:otherwise>
	</c:choose>

	<br>
	
	<h1>Forum</h1>
	<h3>Category</h3>
	<h3>Post</h3>
	<h3>Comment</h3>


</body>
</html>