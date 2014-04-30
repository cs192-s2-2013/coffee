<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="t"%>

<html>
<head>
	<title>Blue Coffee</title>
	<script type="text/javascript" src="<c:url value="resources/js/jquery.js" />"> </script>
    <script type="text/javascript" src="<c:url value="resources/js/bootstrap.js" />"> </script>
	<t:css/>
	<style>
          i { font-size: 50px; }
    </style>
	
</head>

<body>

	<t:navbar user="${sessionScope.user}"/>
	<t:jumbotron title="Schedule"/>
	
	<!-- Sched Table
	**************************************************-->
	
	<!-- 
	<div class="container">
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-7"><h3>Search Result</h3></div>
		</div>
        <c:forEach var="user" items="${userList }" varStatus="count">
        	<div class="row">
        		<div class="col-sm-2"></div>
        		<div class="col-sm-8 table-bordered">
        			<h4>${user.getFirstName() } ${user.getLastName() } (email: ${user.getEmail() })</h4>
        			<h5>${schedList[count.index].getSchedDesc()}</h5>
        		</div>
        	</div>
        </c:forEach>
	</div>
	 -->
	
	<div class="row">
		<div class="col-sm-1"></div>
		<div class="col-sm-7"><h2>Search Result</h2></div>
	</div>
	<div class="row">
		<div class="col-sm-1"></div>
		<div class="col-sm-10">
    		<div class="panel-group" id="accordion">
        	<!-- USER LIST -->
        		<c:forEach var="user" items="${userList }" varStatus="count">
          			<div class="panel panel-default">
            			<div class="panel-heading">
                			<div class="panel-title">
                				<div class="row">
                					<div class="col-sm-1"></div>
                					<div class="col-sm-8">
                    					<a data-toggle="collapse" data-parent="#accordion" href="#_${user.getUsername() }">
                        					<h4>${user.getFirstName() } ${user.getLastName() } (email: ${user.getEmail() })</h4>
        									<h5>${schedList[count.index].getSchedDesc()}</h5>
                    					</a>
                    				</div>
                    				<div class="col-sm-2">
                    					<c:choose>
                    					<c:when test="${percentMatchList[count.index]>-1}">
                    						<center>
                    						<h4>${percentMatchList[count.index]}%</h4>
                    						<h6>matching</h6>
                    						</center>
                    					</c:when>
                    					</c:choose>
                    				</div>
                    			</div>
                    		</div>
            			</div>
            			<div id="_${user.getUsername() }" class="panel-collapse collapse">
                			<div class="panel-body">
                    			<div class="container">
									<div class="row">
										<b>
										<center>
										<div class="col-sm-2"></div>
										<div class="col-sm-2 table-bordered">Time/Day</div>
										<div class="col-sm-1 table-bordered">Monday</div>
										<div class="col-sm-1 table-bordered">Tuesday</div>
										<div class="col-sm-1 table-bordered">Wednesday</div>
										<div class="col-sm-1 table-bordered">Thursday</div>
										<div class="col-sm-1 table-bordered">Friday</div>
										<div class="col-sm-1 table-bordered">Saturday</div>
										</center>
										</b>
									</div>
									<%int i = 0;%>
									<c:forEach var="bit" items="${schedStreamList[count.index]}" varStatus="count2">
										<%if(i==0) {%>
											<div class="row">
											<div class="col-sm-2"></div>
											<div class="col-sm-2 table-bordered">${timeslots[count2.index / 6]}</div>
										<%} %>
										<c:choose>
											<c:when test="${not bit}">
												<div class="col-sm-1 table-bordered" style="background-color:#ffffff; color:#ffffff;">*</div>
											</c:when>
											<c:otherwise>
												<div class="col-sm-1 table-bordered" style="background-color:#32CD32; color:#32CD32;">*</div>
											</c:otherwise>
										</c:choose>
										<%i++;	
										if(i==6) {
											i=0;%>
											</div>
										<%} %>
									</c:forEach>
								</div>
                			</div>
            			</div>
        			</div>
        		</c:forEach>
			</div>
		</div>
	</div>
	
	
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
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
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