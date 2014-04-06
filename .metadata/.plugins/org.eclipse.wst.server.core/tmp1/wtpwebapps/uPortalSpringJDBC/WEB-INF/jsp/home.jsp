<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
	 
<t:genericpage title="Home">
	<div class="banner">
	    <h1 class="banner-head">
	        <span style= "padding-bottom: -10px;">uPortal</span><br>
	        <span style="font-size: 40px;">The Growing Portal.</span> <br>
	        <a href="register" title="register now"><button class="pure-button" id="getstarted">Get started <i class="fa fa-angle-double-right"></i></button></a>
	    </h1>
	</div>
	
	
	
	<div class="cont-div">
		<div class="pure-g-r">
			<div class="apps-desc-div">
				<div class="pure-u-1-3" style="font-size: 45px;">
					<i class="fa fa-github-alt fa-5x"></i>
				</div> 
				<div class="pure-u-2-3">
					<h3>Online Classroom</h3>
					<p id="apps-desc">App that lets you collaborate with your professor and classmates online! Come on and have your class online!</p>
					<div class="vis-site">
						<c:if test="${username != null}">
							<a href="#" title="visit Online Classroom">visit site <i class="fa fa-arrow-right"></i></a>
						</c:if>
						<c:if test="${username == null}">
							<span class="vis-siteNL">visit site <i class="fa fa-arrow-right"></i></span>
						</c:if>
					</div>
				</div>
			</div>
			
			<div class="apps-desc-div">
				<div class="pure-u-2-3">
					<h3>UP Map</h3>
					<p id="apps-desc">Not yet familiar with the whereabouts of different places in UP Diliman? Try this app! Surely, it will help you how to go there as fast as possible!</p>
					<div class="vis-site">
						<a href="https://uportal-kompyutersaiyans.rhcloud.com/UPMap" title="visit UP Map">https://uportal-kompyutersaiyans.rhcloud.com/UPMap<i class="fa fa-arrow-right"></i></a>
					</div>
				</div> 
				<div class="pure-u-1-3" style="font-size: 45px;">
				   
					<img src=<c:url value="/resources/imgs/goup.png"/> width="250" height="250">
				</div>
			</div> 
			
			
			<div class="apps-desc-div">
				<div class="pure-u-1-3" style="font-size: 45px;">
					<img src=<c:url value="/resources/imgs/Brain-Gym.png"/> width="250" height="250">
				</div> 
				<div class="pure-u-2-3">
					<h3>Brain Gym</h3>
					<p id="apps-desc">We know that you are genius! Want to test your genius right now?</p>
					<div class="vis-site">
						<c:if test="${username != null}">
							<a href="#" title="visit Brain Gym">visit site <i class="fa fa-arrow-right"></i></a>
						</c:if>
						<c:if test="${username == null}">
							<span class="vis-siteNL">visit site <i class="fa fa-arrow-right"></i></span>
						</c:if>
					</div>
				</div>
			</div>
			
			<div class="pure-u-2-3">
				<h3>Study Buddy</h3>
				<p id="apps-desc">Having a hard time managing your study life with the many luring stuff meddling upon your studies? Study Buddy is your best friend!</p>
				<div class="vis-site">
					<a href="https://uportal-kompyutersaiyans.rhcloud.com/StudyBuddy" title="visit Study Buddy">https://uportal-kompyutersaiyans.rhcloud.com/StudyBuddy<i class="fa fa-arrow-right"></i></a>
				</div>
			</div> 
			<div class="pure-u-1-3" style="font-size: 45px; margin-bottom: 80px;">
				<i class="fa fa-apple fa-5x" style="float:right"></i>
			</div> 
		</div>		
	</div>
	
	<div class="about-us">
		<h2 style="text-align: center; padding: 17px;">Developers</h2>
		<div class="cont-div">
			<div class="pure-g-r" style="text-align: center;">
				<div class="pure-u-1-3">
					<h4>Sherlyne Francia</h4>
					<img src=<c:url value="/resources/imgs/sher.png"/> width="250" height="250">
				</div>
				<div class="pure-u-1-3">
					<h4>Denise Alyssa Francisco</h4>
					<img src=<c:url value="/resources/imgs/denise.png"/> width="250" height="250">
					
				</div>
				<div class="pure-u-1-3">
					<h4>Erwin Sanchez</h4>
					<img src=<c:url value="/resources/imgs/awin.png"/> width="250" height="250">
				</div>
				<div class="pure-u-1-3">
					<h4>Joshua Frank Rayo</h4>
					<img src=<c:url value="/resources/imgs/frank.png"/> width="250" height="250">
				</div>
				<div class="pure-u-1-3">
					<h4>Mark Paolo Navata</h4>
					<img src=<c:url value="/resources/imgs/mark.png"/> width="250" height="250">
				</div>
				
			</div>
		</div>
	</div>
	
	<div class="about-us">
		<div class="cont-div" >
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
	</div>
	
	<div class="footer l-box">
	    <div class="pure-g-r">
	    	<div class="pure-u-1-6">
	    		<p>hits: ${homePageCounter}</p>
	    	</div>
	    	<div class="pure-u-2-3">
	    		<p>&copy; Kompyuter Saiyans 2013-2014</p>
	    	</div>
	    </div>
	</div>
</t:genericpage>