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
<title>MyRRMed : Verify Profile</title>

<div class="container">
	<div class="page-header">
		<h2>Profile Verification</h2>
	</div>

	<div class="form-group">
		<p class="text-info">To verify your account, access your email.
			Cut and paste the verification code into the field below. The
			Verification code must be entered exactly as it is written in your
			e-mail.If you receive a message that the code is invalid, make sure
			you are using the most recent e-mail you have received.</p>
	</div>

	<div id="errorSummary-0" class="errorSummaryContainer hide"
		tabindex="-1" role="group" aria-live="assertive">
		<h3 id="errorSummaryHeading-0" class="errorSummaryHeading"
			role="alert">
			<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>&nbsp;Please
			review the data entered &nbsp;
		</h3>
	</div>
	&nbsp;

	<form:form commandName="formData" method="POST" role="form"
		class="form-horizontal">
		<div class="form-group">
			<label class="control-label col-xs-2 for="verificationCode">Verification
				Code:</label>
			<div class="col-xs-3 marginbottom40">
				 <input type="text" class="form-control " id="hash"
					name="hash" title="Enter Your Verification Code"
					maxlength="35"> 
			</div>
		</div>
        &nbsp;

		<div class="form-group">
			<label class="control-label col-xs-2 for="userId">Enter User
				ID:</label>
			<div class="col-xs-3 marginbottom40">
			 <input type="text" class="form-control " id="userId" name="userId"
					title="Enter Your UserId" size="35" maxlength="10"> 
			</div>
		</div>
		<div style="clear: both;">
			&nbsp; &nbsp;
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<a href="#" class="btn  btn-success " id="verifyProfileSubmit">Submit</a>
					<a href="#" id="verifyProfileClear" class="btn btn-default ">Clear</a>
				</div>
			</div>
			&nbsp;
				<spring:bind path="formData.validationErrorData">
<input type="hidden" name="<c:out value='${status.expression}'/>" id="<c:out value='${status.expression}'/>" value="<c:out value='${status.value}'/>" />
</spring:bind>
	</form:form>
</div>
<%@include file="footer.jsp"%>
<script src="<c:url value="/resources/js/verifyProfile.js" />"></script> 
&nbsp;
</body>
</html>