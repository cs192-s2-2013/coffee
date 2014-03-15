<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Upload</title>

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
<form action="fileUploaded?id=${id}&sf=${sf}" method="post"
                        enctype="multipart/form-data">
<input type="file" name="file" size="50" />
<br />
<input type="submit" value="Upload File" />
</form>
</div>

</body>
</html>