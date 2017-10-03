<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<jsp:directive.page contentType="text/html; charset=UTF-8" />

<%@include file="header_Tabs.jsp"%>

<title>MyRRMed : Home</title>

<div id="breadcrumbs" class="noprint">
	<ol class="breadcrumb container">
		<li><a href="/ecx_rrbPortal/">MyRRMed</a></li>
		<li><a href="#">Home Page</a></li>
	</ol>
</div>


<div class="container">
	<h2>RRMed</h2>

	<%-- <c:if test="${error != null}">
	<div id="errorSummary-0" class="errorSummaryContainer hide"
			tabindex="-1" role="group" aria-live="assertive">
			<h3 id="errorSummaryHeading-0" class="errorSummaryHeading"
				role="alert">
				<span class="glyphicon glyphicon-exclamation-sign"
					aria-hidden="true"></span>&nbsp;Please review data entered &nbsp;
			</h3>
		</div>
</c:if> --%>

	<c:if test="${error != null}">
		<div id="errorSummary-0" class="errorSummaryContainer marginzero "
			tabindex="-1" role="group" aria-live="assertive">
			<ul class='errorSummaryList' id='errorList'>
				<li class='errorSummaryItem'><span class="error-text">${error}</span>
				</li>
			</ul>
		</div>
	</c:if>
	
	
	<div class="textbox">
			<p>This warning banner provides privacy and security notices consistent with applicable federal laws, directives, and other federal guidance for accessing this Government system, which includes (1) this computer network, (2) all computers connected to this network, and (3) all devices and storage media attached to this network or to a computer on this network.</p>
<ul>
<li>This system is provided for Government-authorized use only.</li>
<li>Unauthorized or improper use of this system is prohibited and may result in disciplinary action and/or civil and criminal penalties.</li>
<li>Personal use of social media and networking sites on this system is limited as to not interfere with official work duties and is subject to monitoring.</li>
<li>By using this system, you understand and consent to the following:
<ul>
<li>
The Government may monitor, record, and audit your system usage, including usage of personal devices and email systems for official duties or to conduct HHS business. Therefore, you have no reasonable expectation of privacy regarding any communication or data transiting or stored on this system. At any time, and for any lawful Government purpose, the Government may monitor, intercept, and search and seize any communication or data transiting or stored on this system.
</li>
<li> Any communication or data transiting or stored on this system may be disclosed or used for any lawful Government purpose.
Refer to the Terms of Use.</li>
</ul>
</li>


</ul>
			<%-- <c:if test="${currentuser.userType == 4}"><c:out value="${opsLoginPage1_Rendering}" escapeXml="false" /></c:if>
					<c:if test="${currentuser.userType != 4}"><c:out value="${opsLoginPage1}" escapeXml="false" /></c:if>
					 --%>
		</div>
		&nbsp; &nbsp; &nbsp;
		<div class="textbox">
			<h2 style="color:blue"> Welcome to the MyRRMed Portal! </h3>
			<h4><strong>Due to increased CMS security requirements, all MyRRMed portal users must use Multi-factor Authentication (MFA) when accessing a MyRRMed account.  Users may choose to add a mobile phone number on their MyRRMed My Profile screen as an optional method of MFA verification.</strong></h4>
			<h5>How It Works:</h5>
			<p> MFA adds an extra layer of security to your MyRRMed account.  You must receive and enter an MFA verification code each time you log into the portal.</p>
			<ol>
			<li>You will enter your account password as usual.  </li>
			<li>Then, you will select your preferred method of delivery between email or a text message (if you have added a mobile phone number to your account). </li>
			<li>Once you receive your verification code by email or by text, you will enter it in the verification box, hit Submit, and you're in. </li>
			</ol>

			<%-- <c:if test="${currentuser.userType == 4}"><c:out value="${opsLoginPage1_Rendering}" escapeXml="false" /></c:if>
					<c:if test="${currentuser.userType != 4}"><c:out value="${opsLoginPage1}" escapeXml="false" /></c:if>
					 --%>
		</div>
		&nbsp;

</div>


<%@include file="footer.jsp"%>
<c:if test="${! empty lastSuccessfulLoginTime}">
		<div id="dialog-confirm" title="Login Details"   role="alert" aria-describedby="eSignDesc" class="hideDiv">
    <p id="eSignDesc"><span class="ui-icon ui-icon-alert" ></span>There have been <c:out value="${failedCount}" /> unsuccessful logins since your last login on <c:out value="${lastSuccessfulLoginTime}" /> </p>
</div>
<script src="<c:url value="/resources/js/unsuccessfulAlert.js" />"></script>
</c:if>
&nbsp;
</body>
</html>


