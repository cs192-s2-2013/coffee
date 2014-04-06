/**
 * 
 */

function deleteAdmin(userid, typeid){
	if(confirm('Are you sure?')){
		$.ajax({
			type: 'GET',
	        url : 'delete_admin',
	        data: ({userid: typeid}),
	        success: alert('Admin privileges removed!')
		});
	}
}