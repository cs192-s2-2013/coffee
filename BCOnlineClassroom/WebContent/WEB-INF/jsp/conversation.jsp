<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="t"%>

<html>
<head>
	<title>Blue Coffee</title>
	<t:css/>
	
	<style>
			#box {
				overflow: auto;
				background: transparent;
				border: 1px solid rgb(192,192,192);
			}
			}
			.modal-dialog {
	          	width:450px; 
	          	height: 60px;
	          	margin-top: 300px;
          	}
		  	.modal-body {
		  		height: 60px;
		  		margin-top:-10px; 
		  	}
		  	.modal-footer {
		  		height: 60px;
		  	}
		  	.modal-footer button {
		  		margin-top: -10px;
		  	}
		  	.chatbox {
		  		padding-right: 15px;
		  		padding-left: 15px;
		  		height: 400px;
		  	}		  	
		  	.mygrid-wrapper-div {
		  		border: solid 2px;
		  		overflow: auto;
		  		padding-top: 10px;
		  		width: 100%;
		  	}
			
			i { font-size: 10px; }
		  	
    </style>
    <script>
	    $(document).ready(function(){
	        $("[rel=tooltip]").tooltip({ placement: 'right'});
	    });
    </script>
	
</head>

<body>

	<t:navbar user="${sessionScope.user}"/>
	<t:jumbotron title="Chat"/>
	
	
	<center>
	<div style="height: 75%; width: 70%;">

	<!-- List of members
	**************************************************-->
			<div class="col-sm-3" style="margin-left:2px;">
				<h4>Members</h4>
				<div class="row mygrid-wrapper-div" style="height:120px;">
					<div class="row">
						<c:forEach var="member" items="${membersList}">${member.getFirstName()} ${member.getLastName()}</br>
						</c:forEach>
					</div>
				</div>
				
				<!--  Add Members 
				***************************************** -->
				<div class="row mygrid-wrapper-div text-left" style="height:294px; padding-left:8px;">
					<div class="row">
						<c:choose>
						<c:when test="${q=='1'}">
							<div class="col-sm-6"><small><a href="conversation?c=${c}">view all users</a></small></div>
							<div class="col-sm-5"><small><a href=#>view online</a></small></div>
						</c:when>
						<c:when test="${q=='2'}">
							<div class="col-sm-6"><small><a href="conversation?c=${c}">view all users</a></small></div>
							<div class="col-sm-5"><small><a href="conversation?c=${c}&q=1">view online</a></small></div>
						</c:when>
						<c:otherwise>
							<div class="col-sm-6"><small><a href=#>view all users</a></small></div>
							<div class="col-sm-5"><small><a href="conversation?c=${c}&q=1">view online</a></small></div>
						</c:otherwise>
						</c:choose>
					</div>
					<form:form method="post" action="/searchuser?c=${c}">
					<div class="row" style="margin-top:5px; margin-bottom:5px;">
						<div class="col-sm-9" >
							<input type="text" name="s" class="form-control input-small" placeholder="Search users">
						</div>
						<div class="col-sm-1" style="padding-left:0px;">
							<button type="submit" class="btn btn-primary"><i class="icon-search"></i></button>
						</div>
					</div>
					</form:form>
					<c:forEach var="user" items="${userList}">
						<a href="areyousure?c=${c}&u=${user.getUserID()}"><i class="icon-plus" rel="tooltip" title="Add ${user.getFirstName()} ${user.getLastName()} to conversation"></i></a>
						${user.getFirstName()} ${user.getLastName()}
						</br>
					</c:forEach>
				</div>
			</div>
	
	<!-- List of messages
	**************************************************-->	
			<div class="col-sm-9 row" style="margin-left:2px;">
				<h4>'${convoTitle }'</h4>
				<div class="mygrid-wrapper-div" id="messagebox">
				<div class="chatbox text-left">
					<c:forEach var="message" items="${chatMessageList}">
					<b>${message.getSender()}:</b> ${message.getMessage()} </br>
					</c:forEach>
				</div>
				</div>
					
			</div>
		
	
	<!-- Input message
	**************************************************-->	
	<div class="row" >
			
			
	<div class="col-sm-3" style="margin-top:10px; margin-bottom:10px; margin-left:15px;"><a href="conversation?c=${c}&lc=1"><button type="" class="btn btn-primary">Leave conversation</button></a></div>
			
	<form:form method="post" action="/sendmessage?c=${c}" modelAttribute="chatMessage">
			<div class="col-sm-7">
				<input type="text" name="message" class="form-control" placeholder="Type your message here" style="margin-top:10px; margin-bottom:10px;"> 
			</div>
			<div class="col-sm-1">
				<button type="submit" class="btn btn-primary" style="margin-top:10px; margin-bottom:10px;">Send</button>
				<a href="conversation?c=${c}"><i class ="largeicon icon-star"></i></a>
			</div>
	</form:form>
	
	<script>
		var d = document.getElementById("messagebox");

		if(d.scrollHeight > d.clientHeight) {
		  d.scrollTop = d.scrollHeight - d.clientHeight;
		}
	</script>

	<!-- Leave conversation
	************************************************** -->
	
	<c:if test="${lc=='1'}">
		<div id="message" class="modal show" tabindex="-1" role="dialog" aria-hidden="true">
		 	<div class="modal-dialog">
		  		<div class="modal-content">
					<div class="modal-body">
         				<h4 class="text-center">Are you sure you want to leave conversation?</h4>
		     		</div>
		      		<div class="modal-footer">
		          		<div class="col-md-12">
		         			<button class="btn btn-primary" data-dismiss="modal" aria-hidden="true"><a href="leave?c=${c}"><font color="white">Yes</font></a></button>
		          			<button class="btn btn-primary" data-dismiss="modal" aria-hidden="true"><a href="conversation?c=${c}"><font color="white">Close</font></a></button>
				 		</div>	
		      		</div>
		  		</div>
		 	</div>
		</div>
	</c:if>
	</div>
	
	<!--  Add Member Modal
	************************************************* -->
	
	<!--  If user already in the conversation -->
	<c:if test="${au == '2'}">
		<div id="message" class="modal show" tabindex="-1" role="dialog" aria-hidden="true">
		  <div class="modal-dialog">
		  <div class="modal-content">
		      <div class="modal-body">
		          <h4 class="text-center">The user is already in the conversation.</h4>
		      </div>
		      <div class="modal-footer">
		          <div class="col-md-12">
		          <button class="btn btn-primary" data-dismiss="modal" aria-hidden="true"><a href="conversation?c=${c}"><font color="white">Close</font></a></button>
				  </div>	
		      </div>
		  </div>
		  </div>
		</div>
	</c:if>
	
	<!--  "Are you sure?" modal -->
	<c:if test="${au=='1'}">
		<div id="message" class="modal show" tabindex="-1" role="dialog" aria-hidden="true">
		 	<div class="modal-dialog">
		  		<div class="modal-content">
					<div class="modal-body">
         				<h4 class="text-center">Are you sure you want to add this user?</h4>
		     		</div>
		      		<div class="modal-footer">
		          		<div class="col-md-12">
		         			<button class="btn btn-primary" data-dismiss="modal" aria-hidden="true"><a href="addmember?c=${c}&u=${u}"><font color="white">Yes</font></a></button>
		          			<button class="btn btn-primary" data-dismiss="modal" aria-hidden="true"><a href="conversation?c=${c}"><font color="white">Close</font></a></button>
				 		</div>	
		      		</div>
		  		</div>
		 	</div>
		</div>
	</c:if>
	
	
	</div>
	</center>
	
	
</body>
</html>

<!--

16 -  tutorial 1 : creating website from scratch
17 - tutorial 2 : responsive navigation bar
-->