<%@tag description="Navigation Bar Tag" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@attribute name="user" required="false" type="com.bluecoffee.domain.User"%>

	<style>
		.navbar-default{
			background-color: #428BCA;
		}
		.navbar-default .navbar-brand{
			color: #FFFFFF;
		}
		.navbar-default .navbar-nav > li > a{
			color: #FFFFFF;
		}
	</style>
	
	
	<nav class="navbar navbar-default" role="navigation">
	   <div class="navbar-header">
	      <a class="navbar-brand" href="home">Online Classroom</a>
	   </div>
	   <div>
	      <ul class="nav navbar-nav">
	         <li><a href="materials">Materials</a></li>
	         <li><a href="forum">Forum</a></li>
	         <li><a href="chat">Chat</a></li>
	         <li><a href="schedule">Schedule</a></li>
	         <c:if test="${user.getAdmin()}">
	         	<li><a href="admin">Admin</a></li>
	         </c:if>
	      </ul>
		<ul class="nav navbar-nav pull-right">
              <li><a>${user.getUsername()}<c:if test="${user.getAdmin()}"> (admin)</c:if></a></li>
              <li><a href="logout">Logout</a></li>
          </ul>
	     
	   </div>
	</nav>