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
<link href="<c:url value="/resources/css/passwordreset.css" />"  rel="stylesheet">
<title>MyRRMed : Password Reset Validate</title>
	
	<div id="breadcrumbs" class="noprint">
		<ol class="breadcrumb container">
			<li><a href="initLogin">MyRRMed</a></li>
			<li><a href="#">Password Reset Validate</a></li>
		</ol>
	</div>
	<div class="container">
		<div class="page-header">
			<h2>Password Reset Validate</h2>
		</div>
	<div class="form-group">
		<p class="text-info">
			Fields marked with an asterisk <span class="required">*</span> are
			required.
		</p>
	</div>
	<div class="form-group">
			<p class="text-info"><b>NOTE:</b> Your security answers are not case
				sensitive.</p>
		</div>

						<div id="errorSummary-0" class="errorSummaryContainer hide" tabindex="-1" role="group" aria-live ="assertive">
			<h3 id="errorSummaryHeading-0" class="errorSummaryHeading" role="alert">
				<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>&nbsp;Please review the data entered &nbsp;
			</h3>
		</div>
		&nbsp;
		<form:form commandName="formData"  method="POST"  role="form" >
			<div class="form-group marginbottom15">
				<label class="control-label col-xs-2 " for="userId">User ID:</label>&nbsp;&nbsp;&nbsp;<c:out value='${formData.userId}'/>

			</div>

			<div class="form-group marginbottom15">
				<label class="control-label col-sm-2"  for="validationQuestion1">Validation
					Question 1:</label>&nbsp;&nbsp;&nbsp;<c:out value='${formData.validationQuestion1}'/>
			</div>
			<div class="form-group marginbottom15">
				<label class="control-label col-sm-2" for="validationAnswer1">Validation
					Answer 1:&nbsp;&nbsp;<span class="required">*</span></label>
				<div class="col-sm-4">
	
						<spring:bind path="formData.validationAnswer1">
					<input type="text" class="form-control input-sm"  placeholder="Validation Answer 1" id="<c:out value='${status.expression}'/>" name="<c:out value='${status.expression}'/>" value="<c:out value='${status.value}'/>" size="35" maxlength="10">
					
					</spring:bind>
				</div>
			</div>
			
<div style="clear: both;">
			<div class="form-group marginbottom15">
				<label class="control-label col-sm-2 "  for="validationQuestion2">Validation
					Question 2:</label>&nbsp;&nbsp;&nbsp; <c:out value='${formData.validationQuestion2}'/>
			</div>
			<div class="form-group marginbottom15">
				<label class="control-label col-sm-2" for="validationAnswer2">Validation
					Answer 2:&nbsp;&nbsp;<span class="required">*</span></label>
				<div class="col-sm-4">
				
						<spring:bind path="formData.validationAnswer2">
					<input type="text" class="form-control input-sm"  placeholder="Validation Answer 2" id="<c:out value='${status.expression}'/>" name="<c:out value='${status.expression}'/>" value="<c:out value='${status.value}'/>" size="35" maxlength="10">
					
					</spring:bind>
				</div>
			</div>
			<div style="clear: both;">
				&nbsp; &nbsp;
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<a href="#" class="btn  btn-success "
							id="passwordResetValidateSubmit">Submit</a> <a href="#"
							id="passwordResetValidateClear" class="btn btn-default ">Clear</a>
					</div>
				</div>
				&nbsp;
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<a href="#"><u>Need Help?</u></a>&nbsp; &nbsp; &nbsp; <a href="/ecx_rrbPortal/initLogin"><u>Return
							to Login</u></a>
				</div>
			</div>
			<div class="passwordResetAdjustCss">&nbsp;</div>
	<spring:bind path="formData.validationErrorData">
<input type="hidden" name="<c:out value='${status.expression}'/>" id="<c:out value='${status.expression}'/>" value="<c:out value='${status.value}'/>" />
</spring:bind>
<spring:bind path="formData.validationQuestion1">
<input type="hidden" name="<c:out value='${status.expression}'/>" id="<c:out value='${status.expression}'/>" value="<c:out value='${status.value}'/>" />
</spring:bind>
<spring:bind path="formData.validationQuestion2">
<input type="hidden" name="<c:out value='${status.expression}'/>" id="<c:out value='${status.expression}'/>" value="<c:out value='${status.value}'/>" />
</spring:bind>
<spring:bind path="formData.userId">
<input type="hidden" name="<c:out value='${status.expression}'/>" id="<c:out value='${status.expression}'/>" value="<c:out value='${status.value}'/>" />
</spring:bind>

		</form:form>
	</div>
<%@include file="footer.jsp"%>
<script src="<c:url value="/resources/js/passwordresetvalidate.js" />"></script> 
&nbsp;
</body>
</html>