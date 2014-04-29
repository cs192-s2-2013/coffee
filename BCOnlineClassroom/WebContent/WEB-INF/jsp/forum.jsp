<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="t"%>

<html>

<style>

</style>

<head>
	<title>Blue Coffee</title>
	<script type="text/javascript" src="<c:url value="resources/js/jquery.js" />"> </script>
	<script type="text/javascript" src="<c:url value="resources/js/bootstrap.js" />"> </script>
	<t:css/>
	
</head>

<body>
	<t:navbar user="${sessionScope.user}"/>
	<t:jumbotron title="Forum"/>
	
	<!------------------  MODALS ---------------------->
	<!-- Modal for creating new post -->
	<div class="modal fade" id="inputpost" tabindex="-1" role="dialog" aria-labelledby="inputpostlabel" aria-hidden="true">
		<div class="modal-dialog">
			<form:form method="post" action="/submitpost" modelAttribute="fPost">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="myModalLabel">Ask a question</h4>
					</div>
					<div class="modal-body">
						<input type="text" name="title" class="form-control" placeholder="Type your question here">
						<textarea class="form-control" name="content" rows="3" placeholder="Details about the problem"></textarea>
						<textarea class="form-control" name="tag" placeholder="Tags: tags-are-separated-by-spaces this-is-another-tag"></textarea>
						<tr>
							<td>Category: </td>
							<form:select path="fCategoryID">
							<c:forEach var="fCategory" items="${fCategoryList}">
								<option value="${fCategory.getFCategoryID()}">
		                    	<c:out value="${fCategory.getFCategory()}"></c:out>
		                		</option>
							</c:forEach>
							</form:select>
						</tr>
					</div>
					<br>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
						<button type="submit" class="btn btn-primary">Submit</button>
					</div>
				</div>
			</form:form>
		</div>
	</div>
	<!------------------  end modals ---------------------->


	<!-- Search Bar
	************************************************* -->
	<div class="row">
		<div class="col-sm-1"></div>
		<div class="col-sm-1" style="margin-bottom:20px"><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#inputpost">Ask a question</button></div>
		<div class="col-sm-5"></div>
		<form:form method="post" action="/searchpost">
		<div class="col-sm-3">
			<input type="text" name="s" class="form-control" placeholder="Find posts">
		</div>
		<div class="col-sm-1">
			<button type="submit" class="btn btn-primary"><i class="icon-search" style="font-size:15px;"></i></button>
		</div>
		</form:form>
	</div>


	<!-- Category title
	**************************************************-->
	<div class="row">
		<div class="col-sm-3">
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-8"><h3>Categories</h3></div>
		</div>
		</div>
		<div class="col-sm-4">
			<h2>${fCategory}</h2>
		</div>
	</div>
	

	
<div class="row">

	<div class="col-sm-3">
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-8 table-bordered">
				<h4><a href="forum?fc=-1">All posts</a></h4>
			</div>
		</div>
		<c:forEach var="fCategory" items="${fCategoryList}">
			<div class="row">
				<div class="col-sm-3"></div>
				<div class="col-sm-8 table-bordered">
					<h4><a href="forum?fc=${fCategory.getFCategoryID()}">${fCategory.getFCategory()}</a></h4>
				</div>
			</div>
		</c:forEach>
	</div>	
	
	<div class="col-sm-9">
	
	<!-- List of questions
	**************************************************-->
	<div class="container">
		<c:forEach var="forumItem" items="${fPostList}">
			<div class="row">
				<div class="col-sm-8 table-bordered">
					<h4><a href="viewpost?pid=${forumItem.getFPostID()}">${forumItem.title}</a></h4>
					<h5>Posted by ${forumItem.poster} on ${forumItem.postDate}
					<c:if test="${sessionScope.user.getAdmin()=='true'}"> <a href="deletepost?pid=${forumItem.getFPostID()}"><i class="largeicon icon-trash" rel="tooltip" title="Delete post"></i></a> </c:if>
					</h5>
				</div>
				<div class="col-sm-2 table-bordered"><center>
					<k> ${forumItem.commentCount} </k>
					<c:choose>
					<c:when test="${forumItem.commentCount ==1}">
					reply </c:when>
					<c:otherwise>
					replies </c:otherwise>
					</c:choose>
				</center></div>
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