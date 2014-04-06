<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:adminpage title="Admin Page">

	<div id="wrapper">
			<div id="content">
				<div class="c1">
					<div class="tabs">
						<div id="tab-1" class="tab">
							<nav class="links">
								<ul>
									<li>
										<a href="requestList" class="ico2">Requests
											<c:if test="${numberOfAdminRequests > 0}">
												<span class="num">${numberOfAdminRequests}</span>
											</c:if>
										</a>
									</li>
								</ul>
							</nav>
						</div>
						<div id="tab-3">
							<center>
								<h1>Admin List | uPortal </h1>  
								<table class="pure-table pure-table-striped" >  
									<thead>
										<tr>  
											<th>Username</th>  
											<th>Typename</th>  
											<th>Operations</th>  
										</tr>  
									</thead>
								       <tbody>
								       <c:forEach var="admin" items="${adminList}">  
								        	<tr>  
								         	<td>${admin.username}</td>  
								         	<td>${admin.typename}</td>  
								         	<td><a href="delete_admin?userid=${admin.userid}&typeid=${admin.typeid}" onclick="return confirm('Are you sure?')">Delete</a></td>    
								        	</tr>  
								       </c:forEach>  
								       <c:if test="${adminList.size() == 0}">
								       		<tr><td colspan="4">No admins </td></tr>  
								       </c:if>
								       </tbody>
								</table>   
							</center>
						</div>
						<div id="tab-9">
							<center>  
								<h1>Admin Request | uPortal </h1>   
								<table class="pure-table pure-table-striped">  
									<thead>
										<tr>  
											<th>Username</th>  
											<th>Typename</th>  
											<th colspan="2">Operations</th> 
										</tr>  
									</thead>
									<tbody>
										<c:forEach var="request" items="${adminRequestList}">  
											<tr>  
												<td>${request.username}</td>  
												<td>${request.typename}</td>  
												<td><a href="approve_admin?userid=${request.userid}&typeid=${request.typeid}">Approve</a></td>  
												<td><a href="decline_admin?userid=${request.userid}&typeid=${request.typeid}">Decline</a></td>  
											</tr>  
										</c:forEach>  
										<c:if test="${numberOfAdminRequests == 0}">
											<tr><td colspan="4">No pending admin requests </td></tr>  
										</c:if>
									</tbody>
								</table>  								      
							</center>  
						</div>
						<div id="tab-4">
							<center>  
								<h1>User List | uPortal </h1>  
								<table class="pure-table pure-table-striped"> 
									<thead> 
										<tr>  
											<th>User Id</th>  
											<th>First Name</th>  
											<th>Last Name</th>  
											<th>Email</th>  
											<th>Username</th>
											<th>College</th>
											<th>Department</th>
											<th>Course</th>
										</tr>  
									</thead>
									<tbody>
										<c:forEach var="user" items="${userList}">  
											<tr>  
												<td>${user.userId}</td>  
												<td>${user.firstName}</td>  
												<td>${user.lastName}</td>  
												<td>${user.email}</td>  
												<td>${user.username}</td>  
												<td>${user.college}</td>
												<td>${user.department }</td>
												<td>${user.course }</td>
											</tr>  
										</c:forEach>  
										<tr><td colspan="8"><a href="register">Add New User</a></td></tr>  
									</tbody>
								</table>  
							</center>  				
						</div>
						<div id="tab-5">
							<article>
								<center> 
									<h1>Hotline List | uPortal </h1> 
									<table class="pure-table pure-table-striped" width="95%" id="tblData">  
										<col width="2%">
										<col width="30%">
										<col width="55%">
										<col width="15%">
										<thead>
											<tr>  
												<th>ID</th>
												<th>Entity Name</th>  
												<th>Description</th>  
												<th>Options</th>  
											</tr>  
										</thead>
										<tbody>
											<c:forEach var="tel" items="${hotlineList}">
												<tr>  
													<td>${tel.getValue()}</td>
													<td>${tel.getLabel()}</td>  
													<td>${tel.getTelInfo()}</td>
													<td>
														<button class='btnEdit'>Edit</button>
														<button class='btnDelete'>Delete</button>
													</td>
												</tr>  
											</c:forEach>
										</tbody>    
									</table>  
									<button class="pure-button" id="btnAdd">Add new</button>
								</center>  
								<p id="status"></p>
								<ul class="states">
									<li class="warning">When editing hotline numbers, please separate them with asterisk.</li>
									<li class="warning">Saving duplicate IDs will remove the older entry.</li>
								</ul>
							</article>
						</div>
						
						<div id="tab-10">
							<center>  
								<h1>Send Admin Invitation | uPortal </h1>  
								<table class="pure-table pure-table-striped"> 
									<thead> 
										<tr>  
											<th>Username</th>  
											<c:if test="${roles.indexOf('GOD') >= 0 }">
												<th colspan="5">Operations</th>  
											</c:if>
											<c:if test="${roles.indexOf('GOD') < 0}">
												<th colspan="${appsAdmin}">Operations</th>
											</c:if>
										</tr>  
									</thead>
									<tbody>
										<c:forEach var="user" items="${userList}">  
											<tr>  
												<td>${user.username}</td>  
												
												<c:if test="${roles.indexOf('GOD') >= 0 || roles.indexOf('ADMIN_PORTAL') >= 0 }">
													<c:if test="${user.roles.indexOf('GOD') >= 0 || user.roles.indexOf('ADMIN_PORTAL') >= 0 }">
														<td>User is already a Portal Admin</td>
													</c:if>
													<c:if test="${user.roles.indexOf('GOD') < 0 && user.roles.indexOf('ADMIN_PORTAL') < 0 }">
														<td><a href="send_invitation?userid=${user.userId}&typeid=4">Send Invitation to be a Portal Admin</a></td>
													</c:if>
												</c:if>
												 
												 <c:if test="${roles.indexOf('GOD') >= 0 || roles.indexOf('ADMIN_MAPS') >= 0 }">
													<c:if test="${user.roles.indexOf('GOD') >= 0 || user.roles.indexOf('ADMIN_MAPS') >= 0 }">
														<td>User is already a UP Map Admin</td>
													</c:if>
													<c:if test="${user.roles.indexOf('GOD') < 0 && user.roles.indexOf('ADMIN_MAPS') < 0 }">
														<td><a href="send_invitation?userid=${user.userId}&typeid=5">Send Invitation to be a UP Map Admin</a></td>
													</c:if> 
												</c:if>
												
												<c:if test="${roles.indexOf('GOD') >= 0 || roles.indexOf('ADMIN_BUDDY') >= 0 }">
													<c:if test="${user.roles.indexOf('GOD') >= 0 || user.roles.indexOf('ADMIN_BUDDY') >= 0 }">
														<td>User is already a Study Buddy Admin</td>
													</c:if>
													<c:if test="${user.roles.indexOf('GOD') < 0 && user.roles.indexOf('ADMIN_BUDDY') < 0 }">
														<td><a href="send_invitation?userid=${user.userId}&typeid=6">Send Invitation to be a Study Buddy Admin</a></td>
													</c:if>
												</c:if>
												
												<c:if test="${roles.indexOf('GOD') >= 0 || roles.indexOf('ADMIN_CLASS') >= 0 }">
													<c:if test="${user.department == 'Department of Computer Science' ||  user.roles.indexOf('GOD') >= 0}">
														<c:if test="${user.roles.indexOf('GOD') >= 0 || user.roles.indexOf('ADMIN_CLASS') >= 0 }">
															<td>User is already an Online Classroom Admin</td>
														</c:if>
														<c:if test="${user.roles.indexOf('GOD') < 0 && user.roles.indexOf('ADMIN_CLASS') < 0 }">
															<td><a href="send_invitation?userid=${user.userId}&typeid=7">Send Invitation to be an Online Classroom Admin</a></td>
														</c:if>
													</c:if>
													<c:if test="${user.department != 'Department of Computer Science' &&  user.roles.indexOf('GOD') < 0}">
														<td>N/A</td>
													</c:if>
												</c:if>
												
												<c:if test="${roles.indexOf('GOD') >= 0 || roles.indexOf('ADMIN_GYM') >= 0 }">
													<c:if test="${user.college == 'College of Engineering' || user.college == 'College of Science' || user.roles.indexOf('GOD') >= 0}">
														<c:if test="${user.roles.indexOf('GOD') >= 0 || user.roles.indexOf('ADMIN_GYM') >= 0 }">
															<td>User is already a Brain Gym Admin</td>
														</c:if>
														<c:if test="${user.roles.indexOf('GOD') < 0 && user.roles.indexOf('ADMIN_GYM') < 0 }">
															<td><a href="send_invitation?userid=${user.userId}&typeid=8">Send Invitation to be a Brain Gym Admin</a></td>
														</c:if>
													</c:if>
													<c:if test="${user.college != 'College of Engineering' && user.college != 'College of Science' && user.roles.indexOf('GOD') < 0}">
														<td>N/A</td>
													</c:if>
												</c:if>
												
											</tr>  
										</c:forEach>  
									</tbody>
								</table>  
							</center>  				
						</div>
						
						<div id="tab-8" class="tab">
							<article>
								<div class="text-section">
									<h1>Settings</h1>
									<p>Configure admin control panel here</p>
									<c:if test="${reset_success == true}">
									<p><b>The hit counter was successfully reset</b></p>
									</c:if>
									
									<br/>
									<p><u>Hit Counter</u></p>
									<p>Number of visitors: <b> ${homePageCounter} </b></p>
									<p><b><a href="reset">Reset counter</a></b></p>
									
									<br/>
									<p>Edit hotlines via PhpMyAdmin <a href="http://localhost/phpmyadmin/sql.php?db=uportaldb&table=hotlines&server=1&target=&token=91bbb9b8a6c80cc5f21072e153a3401c#PMAURL-0:sql.php?db=uportaldb&table=hotlines&server=1&target=&token=91bbb9b8a6c80cc5f21072e153a3401c">here</a></p>
								</div>
							</article>
						</div>
					</div>
				</div>
			</div>
			<aside id="sidebar">
				
				<ul class="tabset buttons">
					<c:if test="${request != true && seeAdminList != true && reset_success != true && invitation != true}">
						<li class="active">
							<a href="#tab-1" class="ico1"><span>Dashboard</span><em></em></a>
							<span class="tooltip"><span>Dashboard</span></span>
						</li>
					</c:if>
					<c:if test="${request == true || seeAdminList == true || reset_success == true || invitation == true}">
						<li>
							<a href="#tab-1" class="ico1"><span>Dashboard</span><em></em></a>
							<span class="tooltip"><span>Dashboard</span></span>
						</li>
					</c:if>
					<c:if test="${seeAdminList == true}">
						<li class="active">
							<a href="#tab-3" class="ico3"><span>Admins</span><em></em></a>
							<span class="tooltip"><span>Admins</span></span>
						</li>
					</c:if>
					<c:if test="${seeAdminList != true}">
						<li>
							<a href="#tab-3" class="ico3"><span>Admins</span><em></em></a>
							<span class="tooltip"><span>Admins</span></span>
						</li>
					</c:if>
					<c:if test="${request == true}">
						<li class="active">
							<a href="#tab-9" class="ico3"><span>Admin Requests</span><em></em></a>
							<span class="tooltip"><span>Admin Requests</span></span>
						</li>
					</c:if>
					<c:if test="${request != true}">
						<li>
							<a href="#tab-9" class="ico3"><span>Admin Requests</span><em></em></a>
							<span class="tooltip"><span>Admin Requests</span></span>
						</li>
					</c:if>
					<li>
						<a href="#tab-4" class="ico3"><span>Users</span><em></em></a>
						<span class="tooltip"><span>Users</span></span>
					</li>
					
					<c:if test="${invitation == true}">
					<li class="active">
						<a href="#tab-10" class="ico3"><span>Send Admin Invitation</span><em></em></a>
						<span class="tooltip"><span>Send Admin Invitation</span></span>
					</li>
					</c:if>
					
					<c:if test="${invitation != true}">
					<li>
						<a href="#tab-10" class="ico3"><span>Send Admin Invitation</span><em></em></a>
						<span class="tooltip"><span>Send Admin Invitation</span></span>
					</li>
					</c:if>
					
					<li>
						<a href="#tab-5" class="ico3"><span>Edit Hotlines</span><em></em></a>
						<span class="tooltip"><span>Edit Hotlines</span></span>
					</li>
					
					<c:if test="${reset_success == true }">
					<li class="active">
						<a href="#tab-8" class="ico8"><span>Settings</span><em></em></a>
						<span class="tooltip"><span>Settings</span></span>
					</li>
					</c:if>
					
					<c:if test="${reset_success != true }">
					<li>
						<a href="#tab-8" class="ico8"><span>Settings</span><em></em></a>
						<span class="tooltip"><span>Settings</span></span>
					</li>
					</c:if>
					
					
				</ul>
				
			</aside>
		</div>
</t:adminpage>