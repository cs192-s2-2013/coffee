<%@tag description="Head Tag" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@attribute name="title" required="true"%>

<head>
	<link rel="stylesheet" href=<c:url value="/resources/css/pure.css"/>>
	<link rel="stylesheet" type="text/css" href=<c:url value="/resources/css/style.css"/>>
	<link rel="stylesheet" type="text/css" href=<c:url value="/resources/css/pricing.css"/>>
	<link rel="stylesheet" type="text/css" href=<c:url value="/resources/css/profile.css"/>>
	<link rel="stylesheet" href=<c:url value="/resources/font-awesome/css/font-awesome.min.css"/>>
	<link href='http://fonts.googleapis.com/css?family=Istok+Web' rel='stylesheet' type='text/css'>
	<title>${title} - uPortal</title>
</head>