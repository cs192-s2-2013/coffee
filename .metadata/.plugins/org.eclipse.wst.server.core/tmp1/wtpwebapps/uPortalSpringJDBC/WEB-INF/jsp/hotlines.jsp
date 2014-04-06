<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:genericpage title="Hotlines">
	<div class="headers">
		<h1>Hotlines</h1>	
	</div>
	
	
	<div class="cont-div" >
		<div class="htln-left" >
			<c:forEach var="hotline1" items="${hotlineList1}">
				<h4><c:out value="${hotline1.getLabel()}"/></h4>
				<ul>
					<c:forEach var="tel1" items="${hotline1.getTelInfos()}">
					<li><c:out value="${tel1}"/></li>
					</c:forEach>
				</ul>
			</c:forEach>
		</div>
		
		<div class="htln-right">
			<c:forEach var="hotline2" items="${hotlineList2}">
				<h4><c:out value="${hotline2.getLabel()}"/></h4>
				<ul>
					<c:forEach var="tel2" items="${hotline2.getTelInfos()}">
					<li><c:out value="${tel2}"/></li>
					</c:forEach>
				</ul>
			</c:forEach>
		</div>
	</div>

</t:genericpage>