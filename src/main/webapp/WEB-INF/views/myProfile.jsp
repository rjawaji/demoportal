<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page import="java.util.Date, java.text.SimpleDateFormat"%>
<jsp:directive.page contentType="text/html; charset=UTF-8" />
<%@ page session="true" %>


<%@include file="header_Tabs.jsp"%>
<title>MyRRMed : My Profile</title>
<div id="breadcrumbs" class="noprint">
		<ol class="breadcrumb container">
			<li><a href="/ecx_rrbPortal/initMyProfile">MyRRMed</a></li>
			<li><a href="#">My Profile</a></li>
		</ol>
	</div>


	<div class="container">
		<div class="page-header">
			<h3>My Profile</h3>
		</div>

		<div class="form-group">
			<p class="text-info">
				Fields marked with an asterisk <span class="required">*</span> are
				required.
			</p>
		</div>
		&nbsp;
		<div id="errorSummary-0" class="errorSummaryContainer hide"
			tabindex="-1" role="group" aria-live="assertive">
			<h3 id="errorSummaryHeading-0" class="errorSummaryHeading"
				role="alert">
				<span class="glyphicon glyphicon-exclamation-sign"
					aria-hidden="true"></span>&nbsp;Please review data entered &nbsp;
			</h3>
		</div>

	<form:form commandName="formData" action="" method="POST" role="form"
		class="form-horizontal">
		<sec:authentication property="principal.emailId" var="currentEmail" />
		<input type="hidden" id="currentEmail" value="${currentEmail}" />

		<sec:authentication property="principal.profileVerified"
			var="isProfileVerified" />


		<c:if test="${!isProfileVerified}">
			<div id="errorSummary-0" class="errorSummaryContainer marginzero "
				tabindex="-1" role="group" aria-live="assertive">
				<ul class='errorSummaryList' id='errorList'>
					<li class='errorSummaryItem'><span class="text-success">${profileVerified}</span>
					</li>
				</ul>
			</div>
		</c:if>
		
		<c:if test="${error != null}">
			<div id="errorSummary-0" class="errorSummaryContainer  "
				tabindex="-1" role="group" aria-live="assertive">
				<ul class='errorSummaryList' id='errorList'>
					<li class='errorSummaryItem'><span class="error-text">${error}</span>
					</li>
				</ul>
			</div>
		</c:if>  
		<%-- <c:if test="${error != null}">
			<div id="errorSummary-0" class="errorSummaryContainer marginzero "
				tabindex="-1" role="group" aria-live="assertive">
				<ul class='errorSummaryList' id='errorList'>
					<li class='errorSummaryItem'><span class="error-text">${error}</span>
					</li>
				</ul>
			</div>
		</c:if>
		<c:if test="${successfulMessage != null}">
			<div id="errorSummary-0" class="errorSummaryContainer marginzero "
				tabindex="-1" role="group" aria-live="assertive">
				<ul class='errorSummaryList' id='errorList'>
					<li class='errorSummaryItem'><span class="text-success">${successfulMessage}</span>
					</li>
				</ul>
			</div>
		</c:if> --%>


		<div class="form-group">
			<form:label path="userId" cssClass="control-label col-sm-2">User Id:</form:label>
			<div class="col-sm-3">
				<c:out value='${formData.userId}' />
			</div>
			
			<%-- <spring:bind path="formData.userId">
				<label class="control-label col-xs-2" for="userId">User ID:</label>
				<c:out value='${formData.userId}' />
			</spring:bind> --%>
		</div>

		&nbsp; &nbsp;
		<div class="form-group">
			<label class="control-label col-sm-2" for="lastname">Last
				Name:&nbsp;&nbsp;<span class="required">*</span>
			</label>

			<div class="col-sm-3">
				<form:input path="lastName" cssClass="form-control input-sm" />
			</div>
		</div>

		&nbsp;
		<div class="form-group">
			<label class="control-label col-sm-2" for="firstname">First
				Name:&nbsp;&nbsp;<span class="required">*</span></label>

			<div class="col-sm-3">
				<form:input path="firstName" cssClass="form-control input-sm" />
			</div>
		</div>
		&nbsp;
		<div class="form-group">
			<label class="control-label col-sm-2  for="validationQuestion1">Validation
				Question 1:&nbsp;&nbsp;<span class="required">*</span></label>
			<div class="col-sm-4">
				<form:select path="validQuestion1" cssClass="form-control input-sm">
					<form:option value="" label="--SELECT A QUESTION--" />
					<c:forEach items="${sessionScope.questions}" var="question"
						begin="0" end="4">
						<form:option value="${question.key}" label="${question.value}" />
					</c:forEach>
				</form:select>

			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-sm-2" for="validationAnswer1">Validation
				Answer 1:&nbsp;&nbsp;<span class="required">*</span></label>
			<div class="col-sm-4">
				<form:input path="validAnswer1" cssClass="form-control input-sm" />

			</div>
		</div>
		&nbsp;
		<div class="form-group">
			<label class="control-label col-sm-2  for="validationQuestion2">Validation
				Question 2:&nbsp;&nbsp;<span class="required">*</span></label>
			<div class="col-sm-4">

				<form:select path="validQuestion2" cssClass="form-control input-sm">
					<form:option value="" label="--SELECT A QUESTION--" />
					<c:forEach items="${sessionScope.questions}" var="question"
						begin="5" end="9">
						<form:option value="${question.key}" label="${question.value}" />
					</c:forEach>
				</form:select>

			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-sm-2" for="validationAnswer2">Validation
				Answer 2:&nbsp;&nbsp;<span class="required">*</span></label>
			<div class="col-sm-4">
				<form:input path="validAnswer2" cssClass="form-control input-sm" />
			</div>
		</div>
		&nbsp;
		<div class="form-group">
			<label class="control-label col-sm-2  for="validationQuestion3">Validation
				Question 3:&nbsp;&nbsp;<span class="required">*</span></label>
			<div class="col-sm-4">
				<form:select path="validQuestion3" cssClass="form-control input-sm">
					<form:option value="" label="--SELECT A QUESTION--" />
					<c:forEach items="${sessionScope.questions}" var="question"
						begin="10" end="14">
						<form:option value="${question.key}" label="${question.value}" />
					</c:forEach>
				</form:select>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="validationAnswer3">Validation
				Answer 3:&nbsp;&nbsp;<span class="required">*</span></label>
			<div class="col-sm-4">
				<form:input path="validAnswer3" cssClass="form-control input-sm" />
			</div>
		</div>
		&nbsp;

		<div class="form-group">
			<label class="control-label col-sm-2  for="validationQuestion4">Validation
				Question 4:&nbsp;&nbsp;<span class="required">*</span></label>
			<div class="col-sm-4">
				<form:select path="validQuestion4" cssClass="form-control input-sm">
					<form:option value="" label="--SELECT A QUESTION--" />
					<c:forEach items="${sessionScope.questions}" var="question"
						begin="15" end="19">
						<form:option value="${question.key}" label="${question.value}" />
					</c:forEach>
				</form:select>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="validationAnswer4">Validation
				Answer 4:&nbsp;&nbsp;<span class="required">*</span></label>
			<div class="col-sm-4">
				<form:input path="validAnswer4" cssClass="form-control input-sm" />
			</div>
		</div>
		&nbsp;

		<div class="form-group">
			<label class="control-label col-sm-2  for="validationQuestion5">Validation
				Question 5:&nbsp;&nbsp;<span class="required">*</span></label>
			<div class="col-sm-4">
				<form:select path="validQuestion5" cssClass="form-control input-sm">
					<form:option value="" label="--SELECT A QUESTION--" />
					<c:forEach items="${sessionScope.questions}" var="question"
						begin="20" end="24">
						<form:option value="${question.key}" label="${question.value}" />
					</c:forEach>
				</form:select>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="validationAnswer5">Validation
				Answer 5:&nbsp;&nbsp;<span class="required">*</span></label>
			<div class="col-sm-4">
				<form:input path="validAnswer5" cssClass="form-control input-sm" />
			</div>
		</div>
		&nbsp;

		<div class="form-group">
			<label class="control-label col-sm-2  for="validationQuestion6">Validation
				Question 6:&nbsp;&nbsp;<span class="required">*</span></label>
			<div class="col-sm-4">
				<form:select path="validQuestion6" cssClass="form-control input-sm">
					<form:option value="" label="--SELECT A QUESTION--" />
					<c:forEach items="${sessionScope.questions}" var="question"
						begin="25" end="29">
						<form:option value="${question.key}" label="${question.value}" />
					</c:forEach>
				</form:select>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="validationAnswer6">Validation
				Answer 6:&nbsp;&nbsp;<span class="required">*</span></label>
			<div class="col-sm-4">
				<form:input path="validAnswer6" cssClass="form-control input-sm" />
			</div>
		</div>
		&nbsp;

		<div class="form-group">
			<label class="control-label col-sm-2" for="email">Email
				Address:&nbsp;&nbsp;<span class="required">*</span></label>

			<div class="col-sm-4">
				<form:input path="emailAddress" cssClass="form-control input-sm" />
			</div>
		</div>


		<div class="form-group hide" id="reenterEmailId2">
			<label class="control-label col-sm-2" for="emailId2">Re-enter
				Email Address:&nbsp;&nbsp;<span class="required">*</span></label>
			<div class="col-sm-4">
				<form:input path="reEnterEmailAddress"
					cssClass="form-control input-sm"
					title="Re-Enter Your Email Address" />
			</div>
		</div>


		&nbsp;
		<div class="form-group">
			<label class="control-label col-sm-2" for="phone">Phone
				Number:&nbsp;&nbsp;<span class="required">*</span></label><span aria_labeledby="phoneExampleLabel">123-456-7890</span>
			<div class="col-sm-3">
				<form:input path="phone" cssClass="form-control input-sm" />
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-sm-2" for="phone">Extension:</label>
			<div class="col-sm-3">
				<form:input path="extension" cssClass="form-control input-sm" />
			</div>
		</div>
		&nbsp;

		<div class="mfaInfo">
			<span>Due to a CMS mandate you are required to use
				Multi-Factor Authentication (MFA). You will be presented with a
				verification page each time you log into MyRRMed. If you would like
				to use your mobile phone to receive a code for authentication,
				please enter your mobile phone and carrier in the fields below. You
				will also have the option to use your registered email address on
				file for authentication.</span>
		</div>
		&nbsp;
		<div class="form-group">
			<label class="control-label col-sm-2" for="mobilePhone">Mobile
				Phone:</label><span aria_labeledby="phoneExampleLabel">123-456-7890</span>
			<div class="col-sm-3">
				<form:input path="mobileNumber"   cssClass="form-control input-sm" />
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-sm-2" for="smsCarrier">Carrier:</label>
			<div class="col-sm-3">
				<form:select path="smsCarrier" cssClass="form-control input-sm">
					<form:option value="" label="--SELECT A CARRIER--" />
					<c:forEach items="${sessionScope.smsCarriersMap}" var="smsCarriers">
						<form:option value="${smsCarriers.key}"
							label="${smsCarriers.value}" />
					</c:forEach>
				</form:select>

				<%-- <spring:bind path="formData.smsCarrier">
					<select class="form-control input-sm"
						id="<c:out value='${status.expression}'/>"
						name="<c:out value='${status.expression}'/>"
						value="<c:out value='${status.value}'/>"
						title="Enter the mobile carrier name">
						<option value=""></option>
						<c:forEach items="${smsCarriersMap}" var="smsCarrier">
							<option value='${smsCarrier.key}'<c:if test='${smsCarrier.key == smsCarrier.smsCarrierId}'>selected</c:if>>${smsCarrier.value}</option>

						</c:forEach>
					</select>
				</spring:bind>  --%>
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
				<c:if test="${!isProfileVerified}">
					<a href="#" class="btn  btn-success" id="reqNewVerfEmail">Request
						New Verification Email</a>
				</c:if>
				&nbsp;&nbsp;
				<c:if test="${(hideSubmit==null)||(!hideSubmit)}">
					<a href="#" class="btn  btn-success myProfileSubmit"
						id="myProfileSubmit">Submit</a>&nbsp;&nbsp; 
					<a href="/ecx_rrbPortal/login" class="btn btn-default ">Clear</a>
				</c:if>
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
		<input type="hidden" name="<c:out value='${status.expression}'/>"
			id="<c:out value='${status.expression}'/>"
			value="<c:out value='${status.value}'/>" />
	</spring:bind>
	<spring:bind path="formData.userId">
		<input type="hidden" name="<c:out value='${status.expression}'/>"
			id="<c:out value='${status.expression}'/>"
			value="<c:out value='${status.value}'/>" />
	</spring:bind>
	

</form:form>
<%@include file="footer.jsp"%>
<script src="<c:url value="/resources/js/myProfile.js" />"></script>
<script src="<c:url value="/resources/js/jasny-bootstrap.min.js" />"></script>
&nbsp;
</body>
</html>


























