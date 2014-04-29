<%@tag description="Jumbotron Tag" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@attribute name="title" required="true"%>

<div class = "jumbotron">
	<c:choose>
		<c:when test="${title=='Materials'}">
			<h2><a href="materials">Materials</a></h2>
			<h5>Upload or download all the resources you need.</h5>
		</c:when>

		<c:when test="${title=='Forum'}">
			<h2><a href="forum">Forum</a></h2>
			<h5>Ask away or share your knowledge.</h5>
		</c:when>
		
		<c:when test="${title=='Chat'}">
			<h2><a href="chat">Chat</a></h2>
			<h5>Insightful discussion with your peers.</h5>
		</c:when>
		
		<c:when test="${title=='Schedule'}">
			<h2><a href="schedule">Schedule</a></h2>
			<h5>Consult with a mentor.</h5>
		</c:when>
		
		<c:when test="${title=='Admin'}">
			<h2><a href="admin">Admin Page</a></h2>
			<h5></h5>
		</c:when>
		
		<c:when test="${title=='notfound'}">
			<h2>404: Page Not Found</h2>
		</c:when>
		
	</c:choose>
</div>