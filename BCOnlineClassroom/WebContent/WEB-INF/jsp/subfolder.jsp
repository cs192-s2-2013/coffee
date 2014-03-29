<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Blue Coffee | Online Classroom</title>
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

${message }

	<center>
		<br /> <br /> <br /> <b>Subfolder </b><br /> <br />
			
			Slides
			
			<table border="1">
			<tr>
				<td class="heading">File Name</td>
				<td class="heading">File Type</td>
				<td class="heading">File Size</td>
				<td class="heading">Upload Date</td>
				<td class="heading">Uploaded by</td>
				<td class="heading"></td>
			</tr>
			<c:forEach var="matFile" items="${map.Slides}">
				<tr>
					<td>${matFile.fileName}</td>
					<td>${matFile.fileType}</td>
					<td>${matFile.fileSize}</td>
					<td>${matFile.uploadDate}</td>
					<td>${matFile.uploader}</td>
					<td><a href="download.do?fid=${matFile.matFileID}">download</a></td>
				</tr>
			</c:forEach>
			<tr><td colspan="7"><a href="upload?id=${id}&sf=Slides">Upload</a></td></tr>
		</table>
			
		Samplex
			
		<table border="1">
			<tr>
				<td class="heading">File Name</td>
				<td class="heading">File Type</td>
				<td class="heading">File Size</td>
				<td class="heading">Upload Date</td>
				<td class="heading">Uploaded by</td>
				<td class="heading"></td>
			</tr>
			<c:forEach var="matFile" items="${map.Samplex}">
				<tr>
					<td>${matFile.fileName}</td>
					<td>${matFile.fileType}</td>
					<td>${matFile.fileSize}</td>
					<td>${matFile.uploadDate}</td>
					<td>${matFile.uploader}</td>
					<td><a href="download.do?fid=${matFile.matFileID}">download</a></td>
				</tr>
			</c:forEach>
			<tr><td colspan="7"><a href="upload?id=${id}&sf=Samplex">Upload</a></td></tr>
		</table>

		Miscellaneous
			
		<table border="1">
			<tr>
				<td class="heading">File Name</td>
				<td class="heading">File Type</td>
				<td class="heading">File Size</td>
				<td class="heading">Upload Date</td>
				<td class="heading">Uploaded by</td>
				<td class="heading"></td>
			</tr>
			<c:forEach var="matFile" items="${map.Miscellaneous}">
				<tr>
					<td>${matFile.fileName}</td>
					<td>${matFile.fileType}</td>
					<td>${matFile.fileSize}</td>
					<td>${matFile.uploadDate}</td>
					<td>${matFile.uploader}</td>
					<td><a href="download.do?fid=${matFile.matFileID}">download</a></td>
				</tr>
			</c:forEach>
			<tr><td colspan="7"><a href="upload?id=${id}&sf=Miscellaneous">Upload</a></td></tr>
		</table>
			

	</center>
</body>
</html>