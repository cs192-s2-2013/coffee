<%@tag description="Head Tag" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@attribute name="title" required="true"%>

<html>
	<head>
		<link rel="stylesheet" href=<c:url value="/resources/css/all.css"/>>
		<link rel="stylesheet" href=<c:url value="/resources/font-awesome/css/font-awesome.min.css"/>>
		<link rel="stylesheet" type="text/css" href=<c:url value="/resources/css/ie.css"/>>
		<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
		<script type="text/javascript">
			window.jQuery || document.write("<script type='text/javascript' src='js/jquery-1.7.2.min.js'></script>");
		</script>
		<script type="text/javascript" src= <c:url value = "/resources/js/jquery.main.js"/>></script>
		<%--<script type="text/javascript" src= <c:url value = "/resources/js/jquery-2.1.0.js"/>></script> --%>
		<script type="text/javascript" src= <c:url value = "/resources/js/HotlineEditor.js"/>></script>
		<link rel="stylesheet" href=<c:url value="/resources/css/pure.css"/>>
		<link rel="stylesheet" type="text/css" href=<c:url value="/resources/css/pricing.css"/>>
		<link rel="stylesheet" type="text/css" href=<c:url value="/resources/css/style.css"/>>
		<title>${title} - uPortal</title>
	</head>
	<body >
		<div class="header" >
		    <div class="home-menu pure-menu pure-menu-open pure-menu-horizontal pure-menu-fixed" >
		         <a class="pure-menu-heading" href="home" style="float:left; font-size: 25px;"><i class="fa fa-frown-o"></i> uPortal</a> 
		        <ul style="float:right;">
		        		<c:if test="${username == null}">
							<li>
								<a href="home">Home</a>
							</li>
							<li>
								<a href="register">Sign up</a>
							</li>
							<li>
								<a href="login">Sign in</a>
							</li>
						</c:if>
						<c:if test="${isAdmin == true}">
							<li>
								<a href="AdminPage">Admin Page</a>
							</li>
						</c:if>
						<c:if test="${username != null}">
							<li>
								<a href="<c:url value="welcome" />" >Profile</a>
							</li>
						</c:if>
		        	<li>
		        		<a href="hotlines">Hotlines</a>
		        	</li>
		        	<c:if test="${username != null}">
		       		 	<li>
		        			<a href="<c:url value="/j_spring_security_logout" />" > Logout</a>
		        		</li>
		        	</c:if>
		        </ul>
		    </div>
		</div>
			<c:if test="${request_success == true}">
				<div id="message" class="modalWindow">
					<span style="float: right; margin-top:-40px; margin-right: -40px;"><a href="#message"><i class="fa fa-times"></i></a></span>
					Your request was successfully sent
				</div>
			</c:if>
			<c:if test="${request_success != true && request_success != null}">
				<div id="message" class="modalWindow">
					<span style="float: right; margin-top:-40px; margin-right: -40px;"><a href="#message"><i class="fa fa-times"></i></a></span>
					Your have already sent a request for this application
				</div>
			</c:if>
			
			
		<jsp:doBody/>
	</body>
</html>