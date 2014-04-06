<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:genericpage title="Send Feedback">
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	
	<div class="headers" style="margin-bottom: -50px; ">
		<h1>Send Feedback</h1>	
	</div>
	<center>
		<div class="formdiv" >
			<form:form method="post" action="/send_feedback">
				<div>
					Enter your name/alias here: <textarea cols="40" style="resize:none" name="name" rows="1" maxlength="25" required="true"></textarea>
				</div>
				<div>
					<center>Enter your feedback here: (Maximum of 1000 characters)</center>
					<textarea style="overflow:auto;resize:none" cols="60" rows="5" name="feedback" maxlength="1000" required="true"></textarea>
				</div>
				
				<div class="form-fields">
					<button type="submit" class="pure-button pure-input-1-3 pure-button-primary" value="Save" style="background: #8e44ad; border-radius: 5px;">Submit</button>
				</div>
			</form:form>
		</div>
	</center>
	
</t:genericpage>