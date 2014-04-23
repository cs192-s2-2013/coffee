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
			.modal-dialog{
				width: 400px; 
          		margin-top: 180px;
			}
			.modal-header{ height: 65px; }
			.modal-body{ height: 65px; }
			.modal-footer{ height: 65px; }
			.mygrid-wrapper-div {
		  		border: solid 2px;
		  		overflow: auto;
		  		padding-top: 10px;
		  	}
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
	<div style="height: 80%; width: 50%;">
	<div class="row">
	
	
	<div class="col-sm-6 text-left">
	<!-- List of users
	**************************************************-->
	<c:choose>
	<c:when test="${q=='1'}">
		<div class="col-sm-7">
			<font size=5px>Online</font>
		</div>
		<div class="col-sm-5" style="padding-top:10px;">
			<a href="chat"><font size=2px>view all users</font></a>
		</div>
	</c:when>
	<c:when test="${q=='2'}">
		<div class="col-sm-7">
			<font size=5px>Search result</font>
		</div>
		<div class="col-sm-5" style="padding-top:10px;">
			<a href="chat"><font size=2px>view all users</font></a>
		</div>
	</c:when>
	<c:otherwise>
		<div class="col-sm-7">
			<font size=5px>All Users</font>
		</div>
		<div class="col-sm-5" style="padding-top:10px;">
			<a href="chat?q=1"><font size=2px>view online</font></a>
		</div>
	</c:otherwise>
	</c:choose>
	<div class="mygrid-wrapper-div" style="width:100%; height:300px">
		<div style="padding-left:10px; margin:5px">
		
		<!--  Search user
		************************************************* -->
		<form:form method="post" action="/searchuser">
			<div class="row">
				<div class="col-sm-2"></div>
				<div class="col-xs-2">
					<input type="text" class="input-small" name="s" class="form-control" placeholder="Search for users">
					<button type="submit" class="btn btn-primary"><i class="icon-search"></i></button>
				</div>
			</div>
		</form:form>
		</br>
		<c:forEach var="u" items="${userList}">
			<a href="gettitle?v=${u.getUserID()}"><i class="icon-envelope" rel="tooltip" title="Start conversation with ${u.getFirstName()} ${u.getLastName()}"></i></a> ${u.getFirstName()} ${u.getLastName()}				
			</br>			
		</c:forEach>
		</div>
	</div>
	
	</div>
	
	<c:if test="${nc == '1'}">
		<form:form method="post" action="/newconvo?v=${v}">
		<div id="login" class="modal show" tabindex="-1" role="dialog" aria-hidden="true">
		  <div class="modal-dialog">
		  <div class="modal-content">
		      <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><a href="chat">x</a></button>
				  
		        <h3>Enter conversation title:</h3>
		      </div>
		      <div class="modal-body">
		              <input type="text" name="title" required class="form-control input-lg" placeholder="Title">
		      </div>
		      <div class="modal-footer">
		          <button type="submit" class="btn btn-primary" data-dismiss="modal" aria-hidden="true">Submit</button>	
		      </div>
		  </div>
		  </div>
		</div>
		</form:form>
	</c:if>
	
	
	<div class="col-sm-6 text-left">
	<!-- List of conversations
	**************************************************-->
	<div class="col-sm-12">
	<font size=5px>My Conversations</font>
	</div>
	<div class="mygrid-wrapper-div" style="width:100%; height:300px;">
		<div style="margin:10px">
		<c:forEach var="convo" items="${chatConvoList}">
			<h5><a href="conversation?c=${convo.getChatConvoID()}">'${convo.getTitle()}'</a></h5>
		</c:forEach>
		</div>
	</div>
	
	</div>
	
	</div>
	</div>
	</center>
	
	</br></br>
	
	<!-- Footer and Modal
	**************************************************-->
		
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				
				<hr/>
				<p>Copyright &copy; Blue Coffee.
				<!--<a href="#">Terms and Conditions</a> -->
				
					<a data-toggle="modal" href="#myModal">Terms and Conditions</a>
				</p>
				
				<!--Modal -->
				<div class="modal fade" id="myModal" tabinex="-1" role="dialog" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
							<h2>Terms and Conditions</h2>
							</div>
							<div class="modal-body">
								<p>The text will go here...</p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
			
	</font>
	<!-- Comment --->
					
			</div>
		</div>
	</div>
	
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/contentHover.js"></script>
	
	<script type="text/javascript">
		$('document').ready(function(){
		
			$('#mytooltip').tooltip();
			
			$('#myPopOver').popover();
			
			$('#d1').contenthover({
				overlay_background:'#000',
				overlay_opacity:0.8
			});
			
			$('#d2').contenthover({
				effect:'slide',
				slide_speed:300,
				overlay_background:'#000',
				overlay_opacity:0.8
			});
			
			$('#d3').contenthover({
				overlay_width:270,
				overlay_height:180,
				effect:'slide',
				slide_direction:'right',
				overlay_x_position:'right',
				overlay_y_position:'center',
				overlay_background:'#000',
				overlay_opacity:0.8
			});
			
		});
	
	</script>
</body>
</html>

<!--

16 -  tutorial 1 : creating website from scratch
17 - tutorial 2 : responsive navigation bar
-->