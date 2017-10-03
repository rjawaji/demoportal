<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
<sec:csrfMetaTags />
</head>


<body>
<!-- <div class="chatwrapperInline" > <img src="<c:url value="/resources/imgs/chaticon.png" />"> </div>-->
<sec:authorize access="isAuthenticated() and @rrbUrlInterceptor.checkAllVerified(authentication, request)" var="showMenu" />
<nav class="navbar navbar-default">
	<div class="container-fluid">   
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navigation"> <img class="collapsedtrue"  src="<c:url value="/resources/imgs/menu.svg" />"> <img class="collapsedfalse" src="<c:url value="/resources/imgs/close.svg" />"> </button>
			<a class="navbar-brand" href="<c:url value="/login" />"><img src="<c:url value="/resources/imgs/logo.svg?1234" />" class="navbar-brandImgInline"></a>
		</div>
		
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div id="navigation" class="collapse navbar-collapse">
				<c:if test="${showMenu}">	
					<ul class="nav navbar-nav">	
						<li class="dropdown"> <a href='<c:url value="/" />' >Home </a></li>
						<li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Medicare <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<!--  <li><a href="#">View Authorized Representatives</a></li>-->
								<li><a href="/ecx_rrbPortal/initClaimsLookup">Claim Status Lookup</a></li> 
								<!-- <li><a href="msn.html">MSN Status Lookup</a></li> -->	
								<li><a href='<c:url value="/msnRequest" />'>MSN Status Lookup</a></li>
							</ul>
						</li>								
						<!-- 
						<li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Sickness &amp; Disability<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="docupload.html">Upload Medical Records</a></li>
								<li><a href="uploadhistory.html">My Upload History</a></li>	
							</ul>
						</li>	-->		
						
					</ul>
				</c:if>
				<ul class="nav navbar-nav navbar-right">
					<c:if test="${showMenu}">
						<li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="<c:url value="/resources/imgs/usericon.svg"/>" class="usaericon" >  <sec:authentication property="principal.firstName" /> <sec:authentication property="principal.lastName" />  <span class="caret"></span></a>
							<ul class="dropdown-menu dropdown-menu-left" role="menu">
								<li><a href='<c:url value="/initMyProfile" />'>My Profile</a></li>
								<!-- <li><a href="#">Settings</a></li>-->
								<li><a href="/ecx_rrbPortal/changePassword">Password Reset</a></li>
							</ul>
						</li>
					</c:if>
					<li><a href='<c:url value="/doLogout" />'>Logout</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		
	</div>
	<!-- /.container-fluid --> 
</nav>

<div id="dialog-greyOut" title="Processing" class="hideDiv" aria-describedby="processingDesc">                
 	<p id="processingDesc" ><span  class="ui-icon ui-icon-alert floatLeft"></span>Your request is being submitted. Please wait...</p>
</div>