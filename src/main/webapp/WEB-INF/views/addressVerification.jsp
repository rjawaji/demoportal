<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page import="java.util.Date, java.text.SimpleDateFormat"%>
<jsp:directive.page contentType="text/html; charset=UTF-8" />

<%@include file="header.jsp"%>
<link href="<c:url value="/resources/css/registration.css" />"
	rel="stylesheet">
<title>MyRRMed : Address Verification</title>


<div class="stepwizard">
	<div class="stepwizard-row setup-panel">
		<div class="stepwizard-step col-xs-3">
			<a href="#step-1" type="button" class="btn btn-default btn-circle"
				disabled="disabled">1</a>
			<h4>Sign Up</h4>
		</div>
		<div class="stepwizard-step col-xs-3">
			<a href="#step-2" type="button" class="btn  btn-success btn-circle">2</a>
			<h4>Address Verification</h4>
		</div>
		<div class="stepwizard-step col-xs-3">
			<a href="#step-3" type="button" class="btn btn-default btn-circle"
				disabled="disabled">3</a>
			<h4>User ID  and Password</h4>
		</div>
		
	</div>
</div>
<div class="container">
	<div class="page-header">
		<h3>Address Verification</h3>
	</div>

	<div id="errorSummary-0" class="errorSummaryContainer hide"
		tabindex="-1" role="group" aria-live="assertive">
		<h3 id="errorSummaryHeading-0" class="errorSummaryHeading"
			role="alert">
			<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>&nbsp;Please
			review data entered &nbsp;
		</h3>
	</div>
	&nbsp;

	<div class="textbox">
		<p>Please verify that the address below is current. We will send
			you a confirmation letter regarding your registration to the MyRRMed
			portal to this address.</p>

	</div>
	<form:form commandName="formData"  action="" method="POST"  role="form" >
	&nbsp; &nbsp; &nbsp;&nbsp;
	<div class="addrTextbox">
		<p>
			<b>Address:</b>
		</p>
		<p>
			<c:out value='${formData.address1}'/><br> <c:out value='${formData.address2}'/> <c:out value='${formData.city}'/>, <c:out value='${formData.state}'/> <c:out value='${formData.zip}'/>
		</p>
	</div>
	&nbsp; &nbsp; &nbsp;
	<div class="textbox">
		<p>If the address listed here is not correct, please select the Cancel
				button to end the registration process. You can update your address
				by calling our Beneficiary Contact Center at 800-833-4455. You may
				also contact the Railroad Retirement Board (RRB) via phone at
				1-877-772-5772. Please wait to register until your address update is
				completed. This may take 7-14 days from the date you made the
				request.</p>
		&nbsp;
	</div>
	&nbsp; &nbsp;

	<div class="col-sm-offset-2 col-sm-10">
		<a href="#" id="addressVerificationSubmit"  class="btn  btn-success">Continue</a>&nbsp;&nbsp; <a
			href="/ecx_rrbPortal/login" class="btn btn-default ">Cancel</a>
	</div>


</div>
&nbsp;
	
	<spring:bind path="formData.medicareNumber">
<input type="hidden" name="<c:out value='${status.expression}'/>" id="<c:out value='${status.expression}'/>" value="<c:out value='${status.value}'/>" />
</spring:bind>
<spring:bind path="formData.address1">
<input type="hidden" name="<c:out value='${status.expression}'/>" id="<c:out value='${status.expression}'/>" value="<c:out value='${status.value}'/>" />
</spring:bind>
<spring:bind path="formData.address2">
<input type="hidden" name="<c:out value='${status.expression}'/>" id="<c:out value='${status.expression}'/>" value="<c:out value='${status.value}'/>" />
</spring:bind>
<spring:bind path="formData.city">
<input type="hidden" name="<c:out value='${status.expression}'/>" id="<c:out value='${status.expression}'/>" value="<c:out value='${status.value}'/>" />
</spring:bind>
<spring:bind path="formData.state">
<input type="hidden" name="<c:out value='${status.expression}'/>" id="<c:out value='${status.expression}'/>" value="<c:out value='${status.value}'/>" />
</spring:bind>

	<spring:bind path="formData.zip">
<input type="hidden" name="<c:out value='${status.expression}'/>" id="<c:out value='${status.expression}'/>" value="<c:out value='${status.value}'/>" />
</spring:bind>

	<spring:bind path="formData.middleName">
<input type="hidden" name="<c:out value='${status.expression}'/>" id="<c:out value='${status.expression}'/>" value="<c:out value='${status.value}'/>" />
</spring:bind>
	<spring:bind path="formData.suffix">
<input type="hidden" name="<c:out value='${status.expression}'/>" id="<c:out value='${status.expression}'/>" value="<c:out value='${status.value}'/>" />
</spring:bind>

	<spring:bind path="formData.firstName">
<input type="hidden" name="<c:out value='${status.expression}'/>" id="<c:out value='${status.expression}'/>" value="<c:out value='${status.value}'/>" />
</spring:bind>
	<spring:bind path="formData.lastName">
<input type="hidden" name="<c:out value='${status.expression}'/>" id="<c:out value='${status.expression}'/>" value="<c:out value='${status.value}'/>" />
</spring:bind>

	</form:form>
	<%@include file="footer.jsp"%>
<script src="<c:url value="/resources/js/addressVerification.js" />"></script> 

&nbsp;
</body>
</html>



























