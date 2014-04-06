<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:genericpage title="Sign up">
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script type="text/javascript">
		function OnChange(dropdown, id)
		{
		    
		    if(id == 'college'){
		    	var myindex  = dropdown.selectedIndex;
			    var value = dropdown.options[myindex].value;
			    for(var c = 1; c <= 77; c++){
		    		document.getElementById('dp'+c).value = 'null';
			    	document.getElementById('dp'+c).style.display = 'none';
		    	}
		    	for(var c = 1; c <= 25; c++){
		    		document.getElementById('d'+c).value = 'null';
			    	document.getElementById('d'+c).style.display = 'none';
			    	
			    	if(c == value ){
			    		if(document.getElementById('d'+c).length != 2){
			    			document.getElementById('d'+c).style.display = 'block';	
			    		}else{
			    			var a = document.getElementById('d'+c).options[1].value;
				    		document.getElementById('dp'+a).style.display = 'block';
			    		}
			    	}
		    	}
		    }else if(id == 'department'){
		    	var myindex  = dropdown.selectedIndex;
			    var value = dropdown.options[myindex].value;
		    	for(var c = 1; c <= 77; c++){
		    		document.getElementById('dp'+c).value = 'null';
			    	document.getElementById('dp'+c).style.display = 'none';
			    	if(c == value){
			    		document.getElementById('dp'+c).style.display = 'block';
			    	}
		    	}
		    }
		}
		
		function OnDeptChange(c)
		{
		   
		}
	</script>
	
	<div class="headers" style="margin-bottom: -50px; ">
		<h1>Register</h1>	
	</div>
	<center>
		<div class="formdiv" >
			<form:form method="post" action="/submit" modelAttribute="user" commandName="user" id="rform" class="pure-form">	
				<div class="form-fields">
					<form:input path="firstName" class="pure-input-1-3" placeholder="First name" required="true" maxlength="50"/>
					<label style="color: red; font-style: italic; font-size: small; width:200px;" class=comment><form:errors path="firstName" /></label>
				</div>
				<div class="form-fields">
					<form:input path="lastName" class="pure-input-1-3" placeholder="Last name" required="true" maxlength="20"/>
					<label style="color: red; font-style: italic; font-size: small; width:200px;" class=comment><form:errors path="lastName" /></label>
				</div>
				<div class="form-fields">
					<form:input path="email" class="pure-input-1-3" placeholder="Email address" required="true" maxlength="50"/>
					<label style="color: red; font-style: italic; font-size: small; width:200px;" class=comment>
						<form:errors path="email" /><c:if test="${msg_failed == 2 || msg_failed == 3}">Email is already taken.</c:if>
					</label>
				</div>
				<div class="form-fields">
					<form:input path="username" class="pure-input-1-3" placeholder="Username" required="true" maxlength="30"/>
					<label style="color: red; font-style: italic; font-size: small; width:200px;" class=comment>
						<form:errors path="username" /><c:if test="${msg_failed == 1 || msg_failed == 3}">Username is already taken.</c:if>
					</label>
				</div>
				<div class="form-fields">
					<form:password path="password" class="pure-input-1-3" placeholder="Password" required="true" maxlength="30"/>
					<label style="color: red; font-style: italic; font-size: small; width:200px;" class=comment>
						<form:errors path="password" />
					</label>
				</div>
				<div class="form-fields">
					<form:password path="confirmPassword" class="pure-input-1-3" placeholder="Confirm password" required="true" maxlength="30"/>
					<label style="color: red; font-style: italic; font-size: small; width:200px;" class=comment>
						<form:errors path="confirmPassword" />
					</label>
				</div>
				<div class="form-fields">
					<form:select id="role" path="role">
						<form:option label="Student" value="STUDENT"/>
						<form:option label="Faculty" value="FACULTY"/>
					</form:select>
				</div>
				<div class="form-fields"><form:select  id="college" path="college" onchange = "OnChange(this.form.college, 'college')"> 
					<form:option label="Select College" value="null"/>
					<form:options items="${model.resourceService.getCollegeList()}" itemLabel="label" itemValue="value" /> 
					</form:select>
				</div>
				<div class="form-fields" id="department">
				<c:forEach var="i" begin="1" end="25">
					<form:select path="department" id="d${i}" style="display:none" onchange = "OnChange(this.form.d${i}, 'department')"> 
						<form:option label="Select Department" value="null"/>
						<form:options items="${model.resourceService.getDeptList(i)}" itemLabel="label" itemValue="value" />
					</form:select>
				</c:forEach> 
					 
				</div>
				<div class="form-fields" id="courses">
					<c:forEach var="i" begin="1" end="77">
						<form:select path="course" id="dp${i}" style="display:none"> 
							<form:option label="Select Course" value="null"/>
							<form:options items="${model.resourceService.getCourseList(i)}" itemLabel="label" itemValue="value" />
						</form:select>
					</c:forEach>  
				</div>
				
				<div>
					${captcha} ${captchaerror}
				</div>
				
				<script type="text/javascript">
				
			</script>
				<div class="form-fields">
					<button type="submit" class="pure-button pure-input-1-3 pure-button-primary" value="Save" style="background: #8e44ad; border-radius: 5px;">Submit</button>
				</div>
			</form:form>
		</div>
	</center>
	
</t:genericpage>
  