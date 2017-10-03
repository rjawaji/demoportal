<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<jsp:directive.page contentType="text/html; charset=UTF-8" />

<%@include file="header.jsp"%>
<link href="<c:url value="/resources/css/passwordreset.css" />"  rel="stylesheet">

<title>MyRRMed : System Requirements</title>
	<div id="breadcrumbs" class="noprint ">
		<ol class="breadcrumb container">
			<li><a href="/ecx_rrbPortal/login">MyRRMed</a></li>
			<li><a href="#">System Requirements</a></li>
		</ol>
	</div>

	<div class="container marginbottom40">
	<h2>MyRRMed Minimum System Requirements</h2>
<p>To optimize usability of MyRRMed we recommend that users verify their system adheres to the following requirements:</p>


<h3>Desktop</h3>
<ul>
	<li><strong>Chrome:</strong> 40+ to current version </li>
	<li><strong>Edge:</strong> All</li>
	<li><strong>Firefox:</strong> 34+ to current version</li>
	<li><strong>Internet Explorer:</strong> 11 to current version</li>
	<li><strong>Safari:</strong> 10+ to Current</li>
	<li><strong>Opera:</strong> 26+ to Current</li>
</ul>
<p>Users can check their browser version by going to the Help menu and selecting "About...." A screen will appear showing which browser and version you are using.</strong></p>
<h3>Operating System</h3>
<ul>
	<li>Windows 7 (or later) </li>
</ul>

<h3>Mobile</h3>
<ul>
	<li> <strong>Android:</strong> 4.5+</li>
	<li><strong>Safari:</strong> iOS 7+</li>
</ul>
<h3>Recommended Screen Resolution: 1024 x 768</h3>
<h3>Additional Requirements:</h3>
<ul>
	<li>Adobe Acrobat Reader Version X (or later) or Adobe Acrobat Pro Version X (or later) </li>
	<li>JavaScript enabled</li>
	<li>Compatibility view disabled</li>
	<li>Pop-up blocker disabled</li>
	<li>Use TLS 1.2 or higher selected in browser settings. This option is typically located on the Advanced tab under Internet Options in your browser.</li>
	
</ul>

<h4><strong>Please note: Although MyRRMed may still be accessible without meeting these requirements, only the options above are supported. Failure to meet these requirements may adversely affect the functionality and layout of MyRRMed.</h4>

	</div>

	

	
<%@include file="footer.jsp"%>
&nbsp;
</body>
</html>