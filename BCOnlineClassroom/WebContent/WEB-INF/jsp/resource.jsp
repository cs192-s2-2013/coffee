<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="t"%>

<html>
<head>
	<title>Blue Coffee</title>
	<script type="text/javascript" src="<c:url value="resources/js/jquery.js" />"> </script>
	<script type="text/javascript" src="<c:url value="resources/js/bootstrap.js" />"> </script>
	<t:css/>
	<t:jscheckbox/>
	
	<script>
	$('a[href]').each(function(){
		   $(this).qtip({ content: $(this).next('.tooltipContent:first') });});
	</script>
	
	<style>
          .modal-dialog {
          	width:400px; 
          	margin-top: 180px;
          }
		  .modal-body { height: 60px; }
		  
		a.tooltip strong {line-height:30px;}
a.tooltip:hover {
    text-decoration:none;
    text-align: left;
} 
a.tooltip span {
    z-index:10;
    display:none;
    padding:14px 20px;
    margin-top:30px;
    margin-left:-160px;
    width:300px;
    line-height:16px;
}
a.tooltip:hover span{
    display:inline; position:absolute; 
    border:2px solid #FFF;  color:#000;
    background:#EEE url(src/css-tooltip-gradient-bg.png) repeat-x 0 0;
}
.callout {z-index:20;position:absolute;border:0;top:-14px;left:120px;}

a.tooltip span {
    border-radius:2px;
    -moz-border-radius: 2px;
    -webkit-border-radius: 2px;
    -moz-box-shadow: 0px 0px 8px 4px #666;
    -webkit-box-shadow: 0px 0px 8px 4px #666;
    box-shadow: 0px 0px 8px 4px #666;
    opacity: 0.8;
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
	<t:jumbotron title="Materials"/>
	
	<!------------------  MODALS ---------------------->
	<!-- Input post -->
	<div id="inputupload" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog">
	<div class="modal-content">  
	        <form:form method="post" action="fileUploaded?id=${id}" modelAttribute="matFile" enctype="multipart/form-data">
	        <div class="modal-header">
	                <h4>File Upload</h4>  
	        </div>
	        <div class="modal-body">
		            <input type="text" name="fileDesc" required class="form-control input-lg" placeholder="Description" id="inbox">
	                <input type="text" name="tags" required class="form-control input-lg" placeholder="Tags" id="inbox">
	        		<!--
	                <div class="btn-group">
	                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" required>
	                                <span class="caret"></span> Select Category 
	                        </button>
	                        <ul class="dropdown-menu" role="menu" style="width:300px">
	                                <li><a href="#">Action</a></li>
	                                <li><a href="#">Another action</a></li>
	                                <li><a href="#">Something else here</a></li>
	                        </ul>
	                </div>
	        		-->
					<div class="col-sm-8">
					<tr>
						<td>Category: </td>
						<form:select path="matFolderID">
						<c:forEach var="matFolder" items="${matFolderList}">
							<option value="${matFolder.getMatFolderID()}">
	                    	<c:out value="${matFolder.getFolderName()}"></c:out>
	                		</option>
						</c:forEach>
						</form:select>
					</tr>
					</div>
					
	                <div class="fileinput fileinput-new" data-provides="fileinput">
	                                <span class="btn btn-default btn-file">
	                                        <span class="fileinput-new"></span>
	                                        <span class="fileinput-exists"></span>
	                                        <input type="file" name="file" size="50">
	                                </span>
	                                <span class="fileinput-filename"></span>
	                </div> 
	        </div>
	  
	          <div class="modal-footer">
	              <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>  
	            <button type="submit" class="btn btn-primary">Submit</button>  
	          </div>
	        </form:form>
	</div>
	</div>
	</div>
	

	
	<!------------------  end modals ---------------------->

	<!-- Subject Title
	**************************************************-->
	
	<center>
		<h1>${id}: ${desc}</h1>
	</center>

	<c:if test="${success == '1'}">
		<div id="message" class="modal show" tabindex="-1" role="dialog" aria-hidden="true">
		  <div class="modal-dialog">
		  <div class="modal-content">
		      <div class="modal-body">
		          <h3 class="text-center">Upload Successful!</h3>
		      </div>
		      <div class="modal-footer">
		          <div class="col-md-12">
		          <button class="btn btn-primary" data-dismiss="modal" aria-hidden="true"><a href="subfolder?id=${id}"><font color="white">Close</font></a></button>
				  </div>	
		      </div>
		  </div>
		  </div>
		</div>
	</c:if>
	<c:if test="${success == '-1'}">
		<div id="message" class="modal show" tabindex="-1" role="dialog" aria-hidden="true">
		  <div class="modal-dialog">
		  <div class="modal-content">
		      <div class="modal-body">
		          <h3 class="text-center">Upload Failed!</h3>
		      </div>
		      <div class="modal-footer">
		          <div class="col-md-12">
		          <button class="btn btn-primary" data-dismiss="modal" aria-hidden="true"><a href="subfolder?id=${id}"><font color="white">Close</font></a></button>
				  </div>	
		      </div>
		  </div>
		  </div>
		</div>
	</c:if>		
	
	</br></br>

			<!-- <div class="col-md-4">
			
				<div class="fileinput fileinput-new" data-provides="fileinput">
					
					 
					<form method="post" action="fileUploaded?id=${id}&sf=${key}" enctype="multipart/form-data">
					<span class="btn btn-default btn-file">
						<span class="fileinput-new"></span>
						<span class="fileinput-exists"></span>
						<input type="file" name="file" size="50">
					</span>
					
					<span class="fileinput-filename"></span>
					<button type="submit" class="btn btn-info" id="mytooltip" data-toggle="tooltip" title="Upload Files" data-placement="right">
						Upload
					</button>
					</form>
					<br/>
					
				</div>
			</div>-->
	
			<div class="col-md-4">
				<div class="fileinput fileinput-new" data-provides="fileinput">
					<button type="button" class="btn btn-info" data-toggle="modal" data-target="#inputupload">
						Upload
					</button>
					<br/>	
				</div>
			</div>
	
	<!-- Folder
	**************************************************-->
<div class = "container">
	<c:forEach var="key" items="${keys}">
	<div class="container">
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-7">
				<h2>${key} <a href="batchdownload?sn=${id}&fn=${key}"><i class="largeicon icon-download-alt" rel="tooltip" title="Download slides folder"></i></a></h2>
			</div>
		</div>
	</div>
					
	<!-- Table (Slides)
	**************************************************-->
	
	<div class="container">
		<form name='SelectFiles' method="post" action="batchdownload?sn=${id}&fn=${key}">
			<div class="row pull-center">
				<b>
				<div class="col-sm-1"></div>
				<div class="col-sm-5 table-bordered"><input type=checkbox name="checkall" onClick="check(this.form.SelectedFiles)">File</div>
				<!-- <div class="col-sm-1 table-bordered">File Size</div> -->
				<div class="col-sm-2 table-bordered">Upload Date</div>
				<div class="col-sm-3 table-bordered">Uploaded by</div>
				</b>
			</div>
			<!-- JSP generated code for all items in folder -->
			<c:forEach var="matFile" items="${map.get(key)}">
			
	<!-- View details -->
	<div class="modal fade" id="viewdetails${matFile.getMatFileID()}" tabindex="-1" role="dialog" aria-labelledby="viewdetailslabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">Add a subject to materials</h4>
				</div>
				<div class="modal-body">
					<h5>${matFile.getFileDesc()}</h5>
				</div>
				<br>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
					<button type="button" class="btn btn-primary">OK</button>
				</div>
			</div>
		</div>
	</div>
			
				<div class="row pull-center">
					<div class="col-sm-1"></div>				
					<div class="col-sm-5 table-bordered">
						<input type=checkbox name=SelectedFiles value="${matFile.fileName}">
						<a href="download.do?fid=${matFile.matFileID}"><i class="largeicon icon-download-alt" rel="tooltip" title="Download ${matFile.fileName}"></i></a> 
						<c:if test="${sessionScope.user.getAdmin()=='true'}"> <a href="deletematerial?mid=${matFile.matFileID}&id=${id}"><i class="largeicon icon-trash" rel="tooltip" title="Delete material"></i></a> </c:if>
						${matFile.fileName}						
						<a href="#" data-toggle="modal" data-target="#viewdetails${matFile.getMatFileID()}"> <i class="icon icon-info-sign" rel="tooltip" title="View details"></i></a>
						
						 <!-- HTML to write -->
 
						
					</div>
					<!-- <div class="col-sm-1 table-bordered">${matFile.fileSize}</div> -->
					<div class="col-sm-2 table-bordered">${matFile.uploadDate}</div>
					<div class="col-sm-3 table-bordered">${matFile.uploader}</div>
					<!-- <div class="col-sm-1 table-bordered"><a href="download.do?fid=${matFile.matFileID}">Download</a></div>	-->
				</div>
			</c:forEach>
			<button type="submit" class="btn btn-primary" rel="tooltip"">Download</button> 		
		</form>
	</c:forEach>
	</div>
	
	</br></br>
</div>	
	
	<div class="push"></div>

	
	
	<!-- Upload Success Modal
	**************************************************-->
	<div class="modal fade" id="uploadSuccess" role="dialog">
		<div class="modal-dialog">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title">File Upload</h4>
			</div>
		</div>
	</div>
	
<button type="button" id="element" class="btn btn-default" data-container="body" data-toggle="popover" data-placement="bottom" data-content="Vivamus
sagittis lacus vel augue laoreet rutrum faucibus.">
  Popover on bottom
</button>
	
	
	<!-- Footer and Modal
	**************************************************-->
	<div id="footer">
	<hr/>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
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
			</div>
		</div>
	</div>
	</div>
</div>
	</font>
	
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/contentHover.js"></script>
	<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0-rc1/js/bootstrap.min.js"></script>
	
	<script type="text/javascript">
		$('document').ready(function(){
		
			$('#mytooltip').tooltip();
			
		});
		$('#element').popover('hide');
		$('#filedetails').popover('hide')
		
		
	$('#telement').tooltip('show')
	
	$(function () {
    $(document).tooltip({
        content: function () {
            return $(this).prop('title');
        },
        show: null, 
        close: function (event, ui) {
            ui.tooltip.hover(

            function () {
                $(this).stop(true).fadeTo(400, 1);
            },

            function () {
                $(this).fadeOut("400", function () {
                    $(this).remove();
                })
            });
        }
    });
});
	
	</script>

</body>
</html>