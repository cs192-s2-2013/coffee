<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<t:userpage title="Welcome">
	<div class="pbanner" >
		<div class="pure-g-r" id="pcont-div">
			<div id="prof-pic" class="pure-u-2-5">
				<img src=<c:url value="/resources/imgs/cat.gif"/>>
			</div>
			<div class="pure-u-2-3" id="pinfo" style="font-family: 'Istok Web', sans-serif;">
				<div class="name" >
					<h1>${user.getFirstName()} ${user.getLastName()}</h1>
				</div>
				<div class="details " id="det">
					<div class="info">Username: ${user.getUsername()}</div>
					<div class="info">Email: ${user.getEmail()}</div>
					<div class="info">
						Role: <c:forEach var="i" begin="0" end="${roles.size()-1}"> ${roles.get(i)} </c:forEach>
					</div>
					<c:if test="${college != null }">
						<div class="info">College: ${college}</div>
					</c:if>
					<c:if test="${department != null}">
						<div class="info">Department: ${department}</div>
					</c:if>
					<c:if test="${course != null}">
						<div class="info">Course: ${course}</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<div class="pure-g-r" id="prof-links">
		<div class="pure-u-1-4" id="profile-buttons">
			<a  href="https://uportal-kompyutersaiyans.rhcloud.com/UPMap" title="visit UP Map"><button class="pure-button"><img src=<c:url value="/resources/imgs/goup.png"/>></button></a>
		</div>
		<div class="pure-u-1-4" id="profile-buttons">
			<a href="https://uportal-kompyutersaiyans.rhcloud.com/StudyBuddy" title="visit Study Buddy"><button class="pure-button"><i class="fa fa-money"></i><br>Study Buddy</button></a>
		</div>
		<div class="pure-u-1-4" id="profile-buttons">
			<c:if test="${college == 'College of Engineering' || college == 'College of Science' || roles.indexOf('GOD') >= 0}">
				<a href="https://uportal-kompyutersaiyans.rhcloud.com/BrainGym" title="visit Brain Gym"><button class="pure-button"><img src=<c:url value="/resources/imgs/Brain-Gym.png"/>></button></a>
			</c:if>
			<c:if test="${college != 'College of Engineering' && college != 'College of Science' && roles.indexOf('GOD') < 0}">
				<button  class="pure-button" title="available to College of Engineering and Science students only" disabled><img src=<c:url value="/resources/imgs/Brain-Gym.png"/>></button>
			</c:if>
		</div>
		<div class="pure-u-1-4" id="profile-buttons">
			<c:if test="${department == 'Department of Computer Science' ||  roles.indexOf('GOD') >= 0}">
				<!-- <a href="https://uportal-kompyutersaiyans.rhcloud.com/OnlineClassroom" title="visit Online Classroom"><button class="pure-button"><i class="fa fa-cut"></i><br>Classroom</button></a> -->
				<a href="http://localhost:8080/OnlineClassroom" title="visit Online Classroom"><button class="pure-button"><i class="fa fa-cut"></i><br>Classroom</button></a>
			</c:if>
			<c:if test="${department != 'Department of Computer Science' &&  roles.indexOf('GOD') < 0}">
				<button class="pure-button" title="available to DCS students only" disabled><i class="fa fa-cut"></i><br>Classroom</button>
			</c:if>
		</div>
	</div>
	<c:if test="${roles.indexOf('GOD') < 0}">
		<div align="center">
			<a href="request">Request to be an admin</a>
		</div>
	</c:if>
	
		<div class="cont-div" style="margin-bottom: 50px;">
			<div class="pure-g-r">
				<div class= "pure-u-1-3"  style="font-size: 15px; margin-top: 65px;">
					Comments? Suggestions? Violent reactions?<br>
					Send us a feedback!
				</div>
				<div class= "pure-u-2-3"  style="font-size: 12px;">
					<div class="formdiv" >
						<form:form method="post" action="/send_feedback">
							<div class="pure-u-1-3" style="width: 170px;">
								<textarea cols="18" style="resize:none; border: 1px solid #ccc; border-radius: 5px; padding: 7px;" name="name" rows="1" maxlength="25"  placeholder="name/alias" required="true"></textarea>
								<button type="submit" class="pure-button pure-input-1-3 pure-button-primary" value="Save" style="background: #8e44ad; border-radius: 5px; width: 100px; margin-top: 10px; margin-left: 57px; height: 30px;">Submit</button>
							</div>
							<div class="pure-u-1-3">
								<textarea style="overflow:auto;resize:none; border: 1px solid #ccc; border-radius: 5px; padding: 7px;" cols="55" rows="7" name="feedback" maxlength="1000" placeholder="Enter your feedback here: (Maximum of 1000 characters)" required="true"></textarea>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	
</t:userpage>
	