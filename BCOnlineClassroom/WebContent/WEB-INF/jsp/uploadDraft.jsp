<!--  Edit starts here -->
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> *
<!--  Edit ends here -->

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Upload</title>

<!--  Edit starts here -->
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
<!--  Edit ends here -->

</head>
<body>
<div id="titlebox" style="background-color:#465e67; height:18%; margin-top:none;">
<div id="title" style="margin-top:30px; margin-left:50px; float:left;"><font size="6px" color="white">Online Classroom</font></div>

<div id="menu" style="margin-top:50px; margin-right:40px; float:right; ">
<font color="white"; size ="4px">Upload</font>
</div>
</div>
<div style="margin-top:20px; margin-left:30px; float:left;">
Select a file to upload: <br />
<form action="fileUploaded" method="post"
                        enctype="multipart/form-data">
<input type="file" name="file" size="50" />
<br />
<input type="submit" value="Upload File" />
</form>
</div>

<!--  Edit starts here -->
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
<!-- Edit ends here -->

</body>
</html>