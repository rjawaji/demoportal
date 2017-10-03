<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@ page session="false" %>
<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0);
//prevents caching at the proxy server
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<sec:csrfMetaTags />
<title>MyRRMed</title>

<!-- Bootstrap -->
<link href="<c:url value="/resources/css/bootstrap.min.css" />"  rel="stylesheet">
<link href="<c:url value="/resources/css/bootstrap-theme.min.css" />"  rel="stylesheet">
<link href="<c:url value="/resources/css/palmetto.css?20150218" />"  rel="stylesheet">
<link href="<c:url value="/resources/css/openSans.css" />"  rel="stylesheet">
<link href="<c:url value="/resources/css/print.css" />"  rel="stylesheet">
 
<link href="<c:url value="/resources/css/jquery-ui/jquery-ui.min.css" />"  rel="stylesheet">
<link href="<c:url value="/resources/css/common.css" />"  rel="stylesheet">
<link href="<c:url value="/resources/css/formvalidator-3.0.css" />"  rel="stylesheet">
</head>


<body >
<c:url var="home" value="/" scope="request" />
<!--<div class="chatwrapperInline" > <img src="<c:url value="/resources/imgs/chaticon.png" />"> </div>-->
<nav class="navbar navbar-default">
	<div class="container-fluid">   
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navigation"> <img class="collapsedtrue"  src="<c:url value="/resources/imgs/menu.svg" />"> <img class="collapsedfalse" src="<c:url value="/resources/imgs/close.svg" />"> </button>
			<a class="navbar-brand" href="/ecx_rrbPortal/login"><img src="<c:url value="/resources/imgs/logo.svg?1234" />" class="navbar-brandImgInline"></a> </div>
		
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div id="navigation" class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li > <a href="<c:url value="/register/initSignUp"/>" >Register Now!</a></li>
				<li><a href="<c:url value="/contactUs"/>">Contact</a></li>
				<li> <a href="#" >Help</a></li>								
			</ul>
		</div>
		<!-- /.navbar-collapse --> 
	</div>
	<!-- /.container-fluid --> 
</nav>

<div id="dialog-greyOut" title="Processing" class="hideDiv" aria-describedby="processingDesc">                
 		<p id="processingDesc" ><span  class="ui-icon ui-icon-alert floatLeft"></span>Your request is being submitted. Please wait...</p>
</div>