<%@tag description="Generic Page Tag" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@attribute name="title" required="true"%>

<div class = "jumbotron">
	<c:choose>
		<c:when test="${title=='Materials'}">
			<a href="materials"><h2>Materials</h2></a>
			<h5>Upload or download all the resources you need.</h5>
		</c:when>

		<c:when test="${title=='Forum'}">
			<a href="forum"><h2>Forum</h2></a>
			<h5>Ask away or share your knowledge.</h5>
		</c:when>
		
		<c:when test="${title=='Chat'}">
			<a href="chat"><h2>Chat</h2></a>
			<h5>Insightful discussion with your peers.</h5>
		</c:when>
		
		<c:when test="${title=='notfound'}">
			<h2>404: Page Not Found</h2>
		</c:when>
		
	</c:choose>
</div>