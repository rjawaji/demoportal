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
<title>MyRRMed : User ID and Password</title>


<form:form commandName="formData" action="" method="POST" role="form"
	class="form-horizontal">


	<div class="stepwizard">
		<div class="stepwizard-row setup-panel">
			<div class="stepwizard-step col-xs-3">
				<a href="#step-1" type="button" class="btn btn-default btn-circle"
					disabled="disabled">1</a>
				<h4>Sign Up</h4>
			</div>
			<div class="stepwizard-step col-xs-3">
				<a href="#step-2" type="button" class="btn  btn-default btn-circle"
					disabled="disabled">2</a>
				<h4>Address Verification</h4>
			</div>
			<div class="stepwizard-step col-xs-3">
				<a href="#step-3" type="button" class="btn btn-success btn-circle">3</a>
				<h4>User ID  and Password</h4>
			</div>
			
		</div>
	</div>
	<div class="container">
		<div class="page-header">
			<h3>User ID  and Password</h3>
		</div>

			<div id="errorSummary-0" class="errorSummaryContainer hide"
				tabindex="-1" role="group" aria-live="assertive">
				<h3 id="errorSummaryHeading-0" class="errorSummaryHeading"
					role="alert">
					<span class="glyphicon glyphicon-exclamation-sign"
						aria-hidden="true"></span>&nbsp;Please review data entered &nbsp;
				</h3>
			</div>


			<%-- <form class="form-horizontal" action="/registerMyAccount"> --%>
			<div class="form-group">
				<spring:bind path="formData.userId">
					<label class="control-label col-xs-2" for="userId">User ID:</label>
				<div class="col-sm-3">
					<c:out value='${formData.userId}' />
				</div>
			</spring:bind>
			</div>
			&nbsp; &nbsp;
			<div class="form-group">

				<label class="control-label col-sm-2  for="validationQuestion1">Validation
					Question 1:&nbsp;&nbsp;<span class="required">*</span></label>
				<div class="col-sm-4">
					<!-- <input type="validationQuestion1" class="form-control input-sm" id="validationQuestion1" name="validationQuestion1" > -->
					<spring:bind path="formData.validQuestion1">
						<select class="form-control input-sm"
							id="<c:out value='${status.expression}'/>"
							name="<c:out value='${status.expression}'/>"
							value="<c:out value='${status.value}'/>">
							<!-- <select class="form-control input-sm" id="validationQuestionlist"> -->
							<option value=''>--SELECT A QUESTION--</option>
							<c:forEach items="${listQues1}" var="questionn"> 
							<option  value='${questionn.questionId}'>${questionn.question}</option>
							
							</c:forEach>
							
						</select>
					</spring:bind>

				</div>

			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="validationAnswer1">Validation
					Answer 1:&nbsp;&nbsp;<span class="required">*</span></label>
				<div class="col-sm-4">
					<spring:bind path="formData.validAnswer1">
						<input type="text" class="form-control input-sm"
							id="<c:out value='${status.expression}'/>"
							name="<c:out value='${status.expression}'/>"
							value="<c:out value='${status.value}'/>">
					</spring:bind>
				</div>
			</div>
			&nbsp;
			<div class="form-group">
				<label class="control-label col-sm-2  for="validationQuestion2">Validation
					Question 2:&nbsp;&nbsp;<span class="required">*</span></label>
				<div class="col-sm-4">
					<!-- <input type="validationQuestion1" class="form-control input-sm" id="validationQuestion1" name="validationQuestion1" > -->
					<spring:bind path="formData.validQuestion2">
						<select class="form-control input-sm"
							id="<c:out value='${status.expression}'/>"
							name="<c:out value='${status.expression}'/>"
							value="<c:out value='${status.value}'/>">
							<!-- <select class="form-control input-sm" id="validationQuestionlist"> -->
							<option value=''>--SELECT A QUESTION--</option>
							<c:forEach items="${listQues2}" var="questionn"> 
							<option  value='${questionn.questionId}'>${questionn.question}</option>
							
							</c:forEach>
						</select>
					</spring:bind>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="validationAnswer2">Validation
					Answer 2:&nbsp;&nbsp;<span class="required">*</span></label>
				<div class="col-sm-4">
					<spring:bind path="formData.validAnswer2">
						<input type="text" class="form-control input-sm"
							id="<c:out value='${status.expression}'/>"
							name="<c:out value='${status.expression}'/>"
							value="<c:out value='${status.value}'/>">
					</spring:bind>
				</div>
			</div>
			&nbsp;
			<div class="form-group">
				<label class="control-label col-sm-2  for="validationQuestion3">Validation
					Question 3:&nbsp;&nbsp;<span class="required">*</span></label>
				<div class="col-sm-4">
					<!-- <input type="validationQuestion1" class="form-control input-sm" id="validationQuestion1" name="validationQuestion1" > -->
					<spring:bind path="formData.validQuestion3">
						<select class="form-control input-sm"
							id="<c:out value='${status.expression}'/>"
							name="<c:out value='${status.expression}'/>"
							value="<c:out value='${status.value}'/>">
							<!-- <select class="form-control input-sm" id="validationQuestionlist"> -->
							<option value=''>--SELECT A QUESTION--</option>
							<c:forEach items="${listQues3}" var="questionn"> 
							<option  value='${questionn.questionId}'>${questionn.question}</option>
							
							</c:forEach>
						</select>
					</spring:bind>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="validationAnswer3">Validation
					Answer 3:&nbsp;&nbsp;<span class="required">*</span></label>
				<div class="col-sm-4">
					<spring:bind path="formData.validAnswer3">
						<input type="text" class="form-control input-sm"
							id="<c:out value='${status.expression}'/>"
							name="<c:out value='${status.expression}'/>"
							value="<c:out value='${status.value}'/>">
					</spring:bind>
				</div>
			</div>
			&nbsp;

			<div class="form-group">
				<label class="control-label col-sm-2  for="validationQuestion4">Validation
					Question 4:&nbsp;&nbsp;<span class="required">*</span></label>
				<div class="col-sm-4">
					<!-- <input type="validationQuestion1" class="form-control input-sm" id="validationQuestion1" name="validationQuestion1" > -->
					<spring:bind path="formData.validQuestion4">
						<select class="form-control input-sm"
							id="<c:out value='${status.expression}'/>"
							name="<c:out value='${status.expression}'/>"
							value="<c:out value='${status.value}'/>">
							<!-- <select class="form-control input-sm" id="validationQuestionlist"> -->
							<option value=''>--SELECT A QUESTION--</option>
							<c:forEach items="${listQues4}" var="questionn"> 
							<option  value='${questionn.questionId}'>${questionn.question}</option>
							
							</c:forEach>
						</select>
					</spring:bind>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="validationAnswer4">Validation
					Answer 4:&nbsp;&nbsp;<span class="required">*</span></label>
				<div class="col-sm-4">
					<spring:bind path="formData.validAnswer4">
						<input type="text" class="form-control input-sm"
							id="<c:out value='${status.expression}'/>"
							name="<c:out value='${status.expression}'/>"
							value="<c:out value='${status.value}'/>">
					</spring:bind>
				</div>
			</div>
			&nbsp;

			<div class="form-group">
				<label class="control-label col-sm-2  for="validationQuestion5">Validation
					Question 5:&nbsp;&nbsp;<span class="required">*</span></label>
				<div class="col-sm-4">
					<!-- <input type="validationQuestion1" class="form-control input-sm" id="validationQuestion1" name="validationQuestion1" > -->
					<spring:bind path="formData.validQuestion5">
						<select class="form-control input-sm"
							id="<c:out value='${status.expression}'/>"
							name="<c:out value='${status.expression}'/>"
							value="<c:out value='${status.value}'/>">
							<!-- <select class="form-control input-sm" id="validationQuestionlist"> -->
							<option value=''>--SELECT A QUESTION--</option>
							<c:forEach items="${listQues5}" var="questionn"> 
							<option  value='${questionn.questionId}'>${questionn.question}</option>
							
							</c:forEach>
						</select>
					</spring:bind>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="validationAnswer5">Validation
					Answer 5:&nbsp;&nbsp;<span class="required">*</span></label>
				<div class="col-sm-4">
					<spring:bind path="formData.validAnswer5">
						<input type="text" class="form-control input-sm"
							id="<c:out value='${status.expression}'/>"
							name="<c:out value='${status.expression}'/>"
							value="<c:out value='${status.value}'/>">
					</spring:bind>
				</div>
			</div>
			&nbsp;

			<div class="form-group">
				<label class="control-label col-sm-2  for="validationQuestion6">Validation
					Question 6:&nbsp;&nbsp;<span class="required">*</span></label>
				<div class="col-sm-4">
					<!-- <input type="validationQuestion1" class="form-control input-sm" id="validationQuestion1" name="validationQuestion1" > -->
					<spring:bind path="formData.validQuestion6">
						<select class="form-control input-sm"
							id="<c:out value='${status.expression}'/>"
							name="<c:out value='${status.expression}'/>"
							value="<c:out value='${status.value}'/>">
							<!-- <select class="form-control input-sm" id="validationQuestionlist"> -->
							<option value=''>--SELECT A QUESTION--</option>
							<c:forEach items="${listQues6}" var="questionn"> 
							<option  value='${questionn.questionId}'>${questionn.question}</option>
							
							</c:forEach>
						</select>
					</spring:bind>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="validationAnswer6">Validation
					Answer 6:&nbsp;&nbsp;<span class="required">*</span></label>
				<div class="col-sm-4">
					<spring:bind path="formData.validAnswer6">
						<input type="text" class="form-control input-sm"
							id="<c:out value='${status.expression}'/>"
							name="<c:out value='${status.expression}'/>"
							value="<c:out value='${status.value}'/>">
					</spring:bind>
				</div>
			</div>
			&nbsp;

			<div class="form-group">
				<label class="control-label col-sm-2" for="enterNewPassword">Enter
					New Password:&nbsp;&nbsp;<span class="required">*</span></label>
				<div class="col-sm-3">
					<spring:bind path="formData.enterNewPassword">
						<input type="password" class="form-control input-sm"
							id="<c:out value='${status.expression}'/>" autocomplete="off"
							name="<c:out value='${status.expression}'/>"
							value="<c:out value='${status.value}'/>" maxlength="20">
					</spring:bind>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="reEnterNewPassword">Re-enter
					New Password:&nbsp;&nbsp;<span class="required">*</span></label>
				<div class="col-sm-3">
					<spring:bind path="formData.reEnterNewPassword">
						<input type="password" class="form-control input-sm"
							id="<c:out value='${status.expression}'/>" autocomplete="off"
							name="<c:out value='${status.expression}'/>"
							value="<c:out value='${status.value}'/>" maxlength="20">
					</spring:bind>
				</div>
			</div>
			&nbsp;
			<div class="form-group">
				<label class="control-label col-sm-2" for="email">Email
					Address:&nbsp;&nbsp;<span class="required">*</span></label>
				<div class="col-sm-4">
					<spring:bind path="formData.emailAddress">
						<input type="text" class="form-control input-sm"
							id="<c:out value='${status.expression}'/>"
							name="<c:out value='${status.expression}'/>"
							value="<c:out value='${status.value}'/>">
					</spring:bind>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="reEnterEmail">Re-enter
					Email Address:&nbsp;&nbsp;<span class="required">*</span></label>
				<div class="col-sm-4">
					<spring:bind path="formData.reEnterEmailAddress">
						<input type="text" class="form-control input-sm"
							id="<c:out value='${status.expression}'/>"
							name="<c:out value='${status.expression}'/>"
							value="<c:out value='${status.value}'/>">
					</spring:bind>
				</div>
			</div>
			&nbsp;
			<div class="form-group">
				<label class="control-label col-sm-2" for="phone">Phone
					Number:&nbsp;&nbsp;<span class="required">*</span></label><span aria_labeledby="phoneExampleLabel">123-456-7890</span>
				<div class="col-sm-3">
					<spring:bind path="formData.phone">
						<input type="text" class="form-control input-sm"
							id="<c:out value='${status.expression}'/>"
							name="<c:out value='${status.expression}'/>"
							value="<c:out value='${status.value}'/>">
					</spring:bind>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="phone">Extension:</label>
				<div class="col-sm-3">
					<spring:bind path="formData.extension">
						<input type="text" class="form-control input-sm"
							id="<c:out value='${status.expression}'/>"
							name="<c:out value='${status.expression}'/>"
							value="<c:out value='${status.value}'/>">
					</spring:bind>
				</div>
			</div>
			&nbsp;

			<%-- <c:if test="${(! empty mfaglobalenable) }"> --%>

			<div class="mfaInfo">
				<span>Due to a CMS mandate you are required to use Multi-Factor Authentication (MFA). You will be presented with a verification page each time you log into MyRRMed. If you would like to use your mobile phone to receive a code for authentication, please enter your mobile phone and carrier in the fields below. You will also have the option to use your registered email address on file for authentication.</span>
			</div>
			&nbsp;
			<div class="form-group">
				<label class="control-label col-sm-2" for="mobilePhone">Mobile
					Phone:</label><span aria_labeledby="phoneExampleLabel">123-456-7890</span>
				<div class="col-sm-3">
					<spring:bind path="formData.mobileNumber">
						<input type="text" class="form-control input-sm"
							id="<c:out value='${status.expression}'/>"
							name="<c:out value='${status.expression}'/>"
							value="<c:out value='${status.value}'/>">
					</spring:bind>
				</div>
			</div>

			<!-- add close option for carrier list -->
			<div class="ui-widget">
				<div class="form-group">
					<label class="control-label col-sm-2" for="smsCarrier">Carrier:</label>
					<div class="col-sm-3">
						<spring:bind path="formData.smsCarrier">
							<select class="form-control input-sm"
								id="<c:out value='${status.expression}'/>"
								name="<c:out value='${status.expression}'/>"
								value="<c:out value='${status.value}'/>">
								<option value=""></option>
								<c:forEach items="${smsCarriers}" var="smsCarrier"> 
							<option  value='${smsCarrier.carrierName}'>${smsCarrier.carrierName}</option>
							
							</c:forEach>
							</select>
						</spring:bind>
					</div>
				</div>
			</div>
			&nbsp;
			<div class="smsrates">
				<span>Standard text messaging rates may apply based on your
					plan with your mobile phone carrier. If you do not want to enter a
					mobile phone number, you can still use the MFA feature with your
					registered email address on file.</span>
			</div>
			<%-- </c:if> --%>
			&nbsp; &nbsp;
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<a href="#" class="btn  btn-success registerMyAccountSubmit"
						id="registerMyAccountSubmit">Submit</a>&nbsp;&nbsp; <a
						href="/ecx_rrbPortal/login" class="btn btn-default ">Cancel</a>
				</div>
			</div>
		
		&nbsp;

	</div>
	<spring:bind path="formData.validationErrorData">
		<input type="hidden" name="<c:out value='${status.expression}'/>"
			id="<c:out value='${status.expression}'/>"
			value="<c:out value='${status.value}'/>" />
	</spring:bind>
		<spring:bind path="formData.medicareNumber">
<input type="hidden" name="<c:out value='${status.expression}'/>" id="<c:out value='${status.expression}'/>" value="<c:out value='${status.value}'/>" />
</spring:bind>
<spring:bind path="formData.userId">
		<input type="hidden" name="<c:out value='${status.expression}'/>"
			id="<c:out value='${status.expression}'/>"
			value="<c:out value='${status.value}'/>" />
</spring:bind>
</form:form>
<%@include file="footer.jsp"%>
<script src="<c:url value="/resources/js/registerMyAccount.js" />"></script>
<script src="<c:url value="/resources/js/jasny-bootstrap.min.js" />"></script>
&nbsp;
</body>
</html>



























