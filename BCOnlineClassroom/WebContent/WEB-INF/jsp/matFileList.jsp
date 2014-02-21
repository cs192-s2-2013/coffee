<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Blue Coffee | Online Classroom </title>
<style>
body {
	font-size: 20px;
	color: teal;
	font-family: Calibri;
}

td {
	font-size: 15px;
	color: black;
	width: 100px;
	height: 22px;
	text-align: center;
}
.heading {
	font-size: 18px;
	color: white;
	font: bold;
	background-color: orange;
	border: thick;
}
</style>
</head>
<body>
	<center>
		<br /> <br /> <br /> <b>Files </b><br /> <br />
			
		

		<table border="1">
			<tr>
				<td class="heading">FileID</td>
				<td class="heading">File Name</td>
				<td class="heading">File Type</td>
				<td class="heading">File Size</td>
				<td class="heading">Upload Date</td>
				<td class="heading">Edit</td>
				<td class="heading">Delete</td>
			</tr>
			<c:forEach var="matFile" items="${matFileList}">
				<tr>
					<td>${matFile.matFileID}</td>
					<td>${matFile.fileName}</td>
					<td>${matFile.fileType}</td>
					<td>${matFile.fileSize}</td>
					<td>${matFile.uploadDate}</td>
					<td><a href="edit?id=${matFile.matFileID}">Edit</a></td>
					<td><a href="delete?id=${matFile.matFileID}">Delete</a></td>
				</tr>
			</c:forEach>
			<tr><td colspan="7"><a href="register">Add New User</a></td></tr>
		</table>

	</center>
</body>
</html>