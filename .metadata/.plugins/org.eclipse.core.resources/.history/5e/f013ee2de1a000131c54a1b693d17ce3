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
	text-align: left;
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
		<br /> <br /> <br /> <b>Uploading File </b> <br />
		<br />
		<div>
			<form:form method="post" action="/insert" modelAttribute="matFile">
				<table>
					<tr>
						<td>Filename :</td>
						<td><form:input path="fileName" /></td>
					</tr>
					<tr>
						<td>File Type :</td>
						<td><form:input path="fileType" /></td>
					</tr>
					<tr>
						<td>File Size :</td>
						<td><form:input path="fileSize" /></td>
					</tr>
					<tr>
						<td>Upload Date :</td>
						<td><form:input path="uploadDate" /></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td><input type="submit" value="Save" /></td>
					</tr>
					<tr>
						
						<td colspan="2"><a href="getList">Click Here to See File List</a></td>
					</tr>
				</table>
			</form:form>
		</div>
	</center>
</body>
</html>