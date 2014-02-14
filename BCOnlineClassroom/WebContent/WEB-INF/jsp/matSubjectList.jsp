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
	<center>
		<br /> <br /> <br /> <b>User
			List | Being Java Guys </b><br /> <br />
			
		

		<table border="1">
			<tr>
				<td class="heading">Subject Name</td>
				<td class="heading">Description</td>
			</tr>
			<c:forEach var="matSubject" items="${matSubjectList}">
				<tr>
					<td><a href="subfolder?id=${matSubject.matSubjectID}">${matSubject.subjectName}</a></td>
					<td>${matSubject.subjectDesc}</td>
				</tr>
			</c:forEach>
		</table>

	</center>
</body>
</html>