<%@tag description="Jumbotron Tag" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@attribute name="name" required="true"%>
<%@attribute name="redirect" required="true" %>

	<div class="modal fade" id="confirmdelete" tabindex="-1" role="dialog" aria-labelledby="confirmdeletelabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">Confirm Delete</h4>
				</div>
				<div class="modal-body">
					Are you sure you want to delete ${name}
				</div>
				<br>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
					<button type="button" class="btn btn-primary" data-target="${redirect}">Yes</button>
				</div>
			</div>
		</div>
	</div>