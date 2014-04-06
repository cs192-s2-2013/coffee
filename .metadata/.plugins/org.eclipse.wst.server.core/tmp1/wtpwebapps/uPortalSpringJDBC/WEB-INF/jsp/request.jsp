<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:genericpage title="Request To Be An Admin">
	<div class="headers">
		<h1>Request To Be An Admin</h1>	
	</div>
	
	
	<div class="cont-div" >
		<c:if test="${isPortalAdmin == true}">
			<div>
				You are already a PORTAL Admin
			</div>
			<br>
		</c:if>
		<c:if test="${isMapAdmin == true}">
			<div>
				You are already a UP MAP Admin
			</div>
			<br>
		</c:if>
		<c:if test="${isBuddyAdmin == true}">
			<div>
				You are already a STUDY BUDDY Admin
			</div>
			<br>
		</c:if>
		<c:if test="${department == 'Department of Computer Science'}">
			<c:if test="${isClassAdmin == true}">
				<div>
					You are already an ONLINE CLASSROOM Admin
				</div>
				<br>
			</c:if>
		</c:if>
		<c:if test="${college == 'College of Engineering' || college == 'College of Science'}">
			<c:if test="${isGymAdmin == true}">
				<div>
					You are already a BRAIN GYM Admin
				</div>
				<br>
			</c:if>
		</c:if>
		
	
		<c:if test="${isPortalAdmin != true}">
			<div>
				<a href="send?typeid=4">Request to be a PORTAL admin</a>
			</div>
			<br>
		</c:if>
		
		<c:if test="${isMapAdmin != true}">
			<div>
				<a href="send?typeid=5">Request to be a UP MAP admin</a>
			</div>
			<br>
		</c:if>

		
		<c:if test="${isBuddyAdmin != true}">
			<div>
				<a href="send?typeid=6">Request to be a STUDY BUDDY admin</a>
			</div>
			<br>
		</c:if>

		<c:if test="${department == 'Department of Computer Science'}">
			<c:if test="${isClassAdmin != true}">
				<div>
					<a href="send?typeid=7">Request to be an ONLINE CLASSROOM admin</a>
				</div>
				<br>
			</c:if>
		</c:if>
		
		<c:if test="${college == 'College of Engineering' || college == 'College of Science'}">
			<c:if test="${isGymAdmin != true}">
				<div>
					<a href="send?typeid=8">Request to be a BRAIN GYM admin</a>
				</div>
				<br>
			</c:if>
		</c:if>

		
		
	</div>

</t:genericpage>