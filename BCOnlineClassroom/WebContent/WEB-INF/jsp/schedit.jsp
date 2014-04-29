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
          i { font-size: 50px; }
    </style>
	
</head>

<body>

	<t:navbar user="${sessionScope.user}"/>
	<t:jumbotron title="Schedule"/>
	
	<!--  Description Bar 
	-->

	
	<!-- Sched Table
	**************************************************-->
	
	<div class="container">
        <form name='SelectTiles' method="post" action="schedupdate">
                <c:forEach var="ts" begin="0" end="125">
                	<input type=checkbox name="SelectedTiles" value="${ts}"></input>
                    <c:if test="${((ts+1)%6)==0}"><br></c:if>  
                </c:forEach>
                <div class="col-sm-3">
					<input type="text" name="schedDesc" required class="form-control input-lg" placeholder="Old description" id="descbox">
				</div>
                <button type="submit" class="btn btn-primary">Save</button> 
        </form>
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