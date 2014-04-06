<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:genericpage title="Sign in">
	<center>
		
		<div class="headers">
			<h1>Sign In</h1>	
		</div>
		
		<div>
			<div class= errs>
				<c:if test="${not empty error}">
					<div class="errorblock">
					Invalid username or password.
					</div>
				</c:if>
			</div>
			
			<div class="formdiv">
				<form name='f' id="rform" action="<c:url value='/j_spring_security_check' />"
				method='POST' class="pure-form">
					<div onload='document.f.j_username.focus();'>
						<div class="form-fields">
							<input type='text' name='j_username' value='' class="pure-input-1-3" placeholder="Username">
						</div>
						<div class="form-fields">
							<input type='password' name='j_password' class="pure-input-1-3" placeholder="Password"/>
						</div>
						<div class="form-fields">
							<button type="submit" class="pure-button pure-input-1-3 pure-button-primary" value="Submit" style="background: #8e44ad; border-radius: 5px;">Sign in</button>
						</div>
					</div>
				</form>
			</div>
		<center>
	</div>
	
</t:genericpage>