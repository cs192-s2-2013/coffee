<%@ tag language="java" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@attribute name="title" required="true"%>

<t:genericpage title="${title}">
	<jsp:doBody/>
</t:genericpage>
