<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
<title>Being Java Guys | Spring DI Hello World</title>
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
		<br /> <br /> <br /> <b>Edit User Details </b><br /> <br />
		<div>
			<form:form method="post" action="/update" modelAttribute="matFile">
				<table>
					<tr>
						<td>First Name :</td>
						<td><form:input path="fileName"
								value="${map.matFile.fileName}" />
						</td>
					</tr>
					<tr>
						<td>Last Name :</td>
						<td><form:input path="fileType" value="${map.matFile.fileType}" />
						</td>
					</tr>
					<tr>
						<td>Gender :</td>
						<td><form:input path="fileSize" value="${map.matFile.fileSize}" />
						</td>
					</tr>
					<tr>
						<td>City :</td>
						<td><form:input path="uploadDate" value="${map.matFile.uploadDate}" />
						</td>
					</tr>
										<tr>
						<td>&nbsp;</td>
						<td><input type="submit" value="Save" />
						</td>
					</tr>
				</table>
				<form:hidden path="matFileID" value="${map.matFile.matFileID}" />

			</form:form>
		</div>
	</center>
</body>
</html>