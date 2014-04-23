<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="t"%>

<html>
<head>
	<title>Blue Coffee</title>
	
	
	<link type="text/css" rel="stylesheet" href="css/bootstrap.css"/>
	<link href="http://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">
	<link type="text/css" rel="stylesheet" href="css/style.css">
	<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0-rc1/css/bootstrap.min.css" rel="stylesheet">
	
	<style type="text/css">
          body { background: #FFFFFF; }
          .container { background: ; }
		  .jumbotron { margin-top: -50px; }
          textarea { resize: none; }
          k { font-size: 44.5px; }
          
    </style>
	
</head>

<body>

	<t:navbar user="${sessionScope.user}"/>
	<t:jumbotron title="Forum"/>
	
	<!-- Search Bar
	************************************************* -->
	<form:form method="post" action="/searchpost">
		<div class="row">
			<div class="col-sm-7"></div>
			<div class="col-sm-3">
				<input type="text" name="s" class="form-control" placeholder="Find posts">
			</div>
			<div class="col-sm-1">
				<button type="submit" class="btn btn-primary"><i class="icon-search" style="font-size:15px;"></i></button>
			</div>
		</div>
	</form:form>	
	
	
	<c:choose>
	<c:when test="${r=='1'}">
		<!-- Input question
		**************************************************-->
		<div class="container">
		<form:form method="post" action="/submitpost" modelAttribute="fPost">
			<div class="row">
				<div class="col-sm-2"></div>
					<div class="col-sm-8"><center><h3>Ask a question</h3></center></div>
			</div>
			<div class="row">
				<div class="col-sm-2"></div>
				<div class="col-sm-8">
					<input type="text" name="title" class="form-control" placeholder="Type your question here">
				</div>
			</div>
			</br>
			<div class="row">
				<div class="col-sm-2"></div>
				<div class="col-sm-8">
					<textarea class="form-control" name="content" rows="3" placeholder="Details about the problem"></textarea>
				</div>
			</div>
			</br>
			<div class="row">
				<div class="col-sm-2"></div>
				<div class="col-sm-8">
					<textarea class="form-control" name="tag" placeholder="Tags: tags-are-separated-by-spaces this-is-another-tag"></textarea>
				</div>
			</div>
			</br>
			<div class="row">
				<div class="col-sm-8"></div>
				<div class="col-sm-3">
					<!--<button type="button" class="btn btn-info">Add details</button>-->
					<a href="forum?r=1"></a><button type="cancel" class="btn btn-primary">Cancel</button></a>
					<button type="submit" class="btn btn-primary">Submit</button>
				</div>
			</div>
		</form:form>
		</div>
		</br></br></br>
	</c:when>
	<c:otherwise>
		<div class="row">
			<div class="col-sm-2"></div>
				<div class="col-sm-1" style="margin-bottom:20px"><a href="forum?r=1"><button type="ask" class="btn btn-primary">Ask a question</button></a></div>
		</div>
	</c:otherwise>
	</c:choose>
	
	<!-- Add Category
	************************************************* -->
	<form:form method="post" action="/addcategory" modelAttribute="fCategory">
		<div class="row">
			<div class="col-sm-6"></div>
			<div class="col-sm-3" style="margin-left:60px">
				<input type="text" name="fCategory" class="form-control" placeholder="Add Category">
			</div>
			<div class="col-sm-1">
				<button type="submit" class="btn btn-primary"><i class="largeicon icon-plus"></i></button>
			</div>
		</div>
	</form:form>
	
	<!-- List of questions
	**************************************************-->
	<c:forEach var="forumItem" items="${fPostList}">
		<div class="container">
			<div class="row">
				<div class="col-sm-1"></div>
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
		</div>
	</c:forEach>
	
	
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