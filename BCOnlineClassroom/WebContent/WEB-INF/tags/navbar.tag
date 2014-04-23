<%@tag description="Generic Page Tag" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@attribute name="user" required="false" type="com.bluecoffee.domain.User"%>


	<nav class="navbar navbar-inverse" role="navigation">
	   <div class="navbar-header">
	      <a class="navbar-brand" href="home">Online Classroom</a>
	   </div>
	   <div>
	      <ul class="nav navbar-nav">
	         <li><a href="materials">Materials</a></li>
	         <li><a href="forum">Forum</a></li>
	         <li><a href="chat">Chat</a></li>
	      </ul>
		<ul class="nav navbar-nav pull-right">
              <li><a>${user.getUsername()}<c:if test="${user.getAdmin()}"> (admin)</c:if></a></li>
              <li><a href="logout">Logout</a></li>
          </ul>
	     
	   </div>
	</nav>