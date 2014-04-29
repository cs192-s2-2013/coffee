<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<head>
<meta http-equiv="refresh" content="5">
</head>

<div class="col-sm-9 row" style="margin-left:2px;">
	<h4>'${convoTitle }'</h4>
					<div class="mygrid-wrapper-div" id="messagebox">
					<div class="chatbox text-left">
						<c:forEach var="message" items="${chatMessageList}">
						<b>${message.getSender()}:</b> ${message.getMessage()} <br>
						</c:forEach>
					</div>
					</div>
</div>