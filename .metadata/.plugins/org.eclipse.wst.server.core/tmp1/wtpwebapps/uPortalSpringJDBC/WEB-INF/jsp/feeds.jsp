   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<t:userpage title="Feedbacks">
	<center><h1 style="margin-top:100px;">Feedbacks</h1></center>
	<ul style="margin-top:20px;">
       <c:forEach var="feed" items="${feeds}">  
        	<li>
        		<div class="pure-u-23-24" style="border:solid 1px gray;margin-bottom:10px;padding:10px;font-size:13px"><strong>${feed.username} says</strong> : <em>"${feed.feed}"</em></div>
        	</li>
       </c:forEach> 
       </ul> 
</t:userpage>