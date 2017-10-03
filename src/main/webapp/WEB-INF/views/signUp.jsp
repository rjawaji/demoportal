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

<title>MyRRMed : Signup</title>

<form:form commandName="formData" action="" method="POST" role="form"
	class="form-horizontal">

	<div class="stepwizard">
		<div class="stepwizard-row setup-panel">
			<div class="stepwizard-step col-xs-3">
				<a href="#step-1" type="button" class="btn btn-success btn-circle">1</a>
				<h4>Sign Up</h4>
			</div>
			<div class="stepwizard-step col-xs-3">
				<a href="#step-2" type="button" class="btn  btn-default btn-circle"
					disabled="disabled">2</a>
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
			<h3>Sign Up for MyRRMed!</h3>
		</div>

		<div id="errorSummary-0" class="errorSummaryContainer hide"
			tabindex="-1" role="group" aria-live="assertive">
			<h3 id="errorSummaryHeading-0" class="errorSummaryHeading"
				role="alert">
				<span class="glyphicon glyphicon-exclamation-sign"
					aria-hidden="true"></span>&nbsp;Please review data entered &nbsp;
			</h3>
		</div>

		<div class="form-group">
			<p class="text-info">
				Fields marked with an asterisk <span class="required">*</span> are
				required.
			</p>
		</div>

		&nbsp;

		<div class="form-group">
			<label class="control-label col-sm-2" for="medicareNumber">Medicare
				Number&nbsp;:&nbsp;<span class="required">*</span>
			</label>
			<button type="button" class="btn btn-info btn-xs"
				title="Enter the RRB Medicare number of the primary account holder in the field without any dashes or spacing.">
				info <span class="glyphicon glyphicon-info-sign"></span>
			</button>
			<div class="col-sm-3">
				<!-- <input type="text" class="form-control " id="medicareNumber"
					name="medicareNumber" title="Medicare Number"> -->
					<spring:bind path="formData.medicareNumber">
						<input type="text" class="form-control input-sm"  title="Medicare Number" 
							id="<c:out value='${status.expression}'/>"
							name="<c:out value='${status.expression}'/>"
							value="<c:out value='${status.value}'/>" >
					</spring:bind>
			</div>

		</div>
		&nbsp;
		<div class="form-group">
			<label class="control-label col-sm-2" for="lastname">Last
				Name&nbsp;:&nbsp;<span class="required">*</span>
			</label>

			<div class="col-sm-3">
				<!-- <input type="text" class="form-control " id="lastname"
					name="lastname" title="Enter Your Last Name"> -->
					<spring:bind path="formData.lastName">
						<input type="text" class="form-control input-sm" title="Enter Your Last Name"
							id="<c:out value='${status.expression}'/>"
							name="<c:out value='${status.expression}'/>"
							value="<c:out value='${status.value}'/>" >
					</spring:bind>
			</div>

		</div>

		&nbsp;
		<div class="form-group">
			<label class="control-label col-sm-2" for="firstname">First
				Name&nbsp;:&nbsp;<span class="required">*</span>
			</label>

			<div class="col-sm-3">
				<!-- <input type="text" class="form-control" id="firstname"
					name="firstname" title="Enter Your First Name"> -->
					<spring:bind path="formData.firstName">
						<input type="text" class="form-control input-sm"  title="Enter Your First Name"
							id="<c:out value='${status.expression}'/>"
							name="<c:out value='${status.expression}'/>"
							value="<c:out value='${status.value}'/>" >
					</spring:bind>
			</div>
		</div>
		&nbsp;
		
		<div class="form-group">
			<label class="control-label col-sm-2" for="dateOfBirth">Date of
				Birth&nbsp;:&nbsp;<span class="required">*</span>
			</label>
			<div class="col-sm-3">
				 <input type="text" class="form-control" id="dateOfBirth"
					name="dateOfBirth" title="Select Date Of Birth" placeholder="mm/dd/yyyy"> 
			</div>
		</div>
		&nbsp;
		<%-- <div class="form-group">
			<label class="control-label col-sm-2" for="Gender">Gender&nbsp;:&nbsp;<span
				class="required">*</span></label>
			<div class="col-sm-3">
			<spring:bind path="formData.gender">
				<select class="form-control " title="Select Gender"
				id="<c:out value='${status.expression}'/>"
				name="<c:out value='${status.expression}'/>"
				value="<c:out value='${status.value}'/>">
					<option value="">--SELECT A GENDER--</option>
					<option value="MALE">Male</option>
					<option value="FEMALE">Female</option>
				</select>
			</spring:bind>
			</div>
		</div>
		&nbsp;


		<div class="form-group">
			<label class="control-label col-sm-2" for="zipCode">Zip
				Code&nbsp;:&nbsp;<span class="required">*</span>
			</label>
			<div class="col-sm-3">
				<!-- <input type="text" class="form-control" id="zipCode" name="zipCode"
					title="Enter Zip Code"> -->
					<spring:bind path="formData.zipCode">
						<input type="text" class="form-control input-sm"
							id="<c:out value='${status.expression}'/>"
							name="<c:out value='${status.expression}'/>"
							value="<c:out value='${status.value}'/>" 
							title="Enter Zip Code">
					</spring:bind>
			</div>
		</div> 
		&nbsp;--%>


		<div class="form-group">
			<label class="control-label col-sm-2" for="effectiveDate">Effective
				Date for Part B&nbsp;:&nbsp;<span class="required">*</span>
			</label>
			<div class="col-sm-3">
				 <input type="text" class="form-control" id="effectiveDate"
					name="effectiveDate" title="Select Month and Year"> 
			</div>
		</div>
		&nbsp; &nbsp;
<!-- 
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<div class="g-recaptcha"
					data-sitekey="6LfFIAYTAAAAAOnqFzH_Z7Df3esfR26uE99vBSlw"></div>
			</div>
		</div>-->
		&nbsp;
		<!-- 
		<div class="form-group">
			<label class="form-check-label"> <input
				class="form-check-input" type="checkbox" value="">&nbsp;&nbsp;<span
				class="required">*</span>&nbsp; By checking this box, you agree to
				the rules and regulations regarding the use of this site. Please
				view the <a href="http://google.com"> Online Services and Web
					Confidentiality Agreements</a> here.
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; You must
				accept the agreements to continue with registration.
			</label>
		</div>  -->

		<div class="form-group">
		<spring:bind path="formData.agreeToCert">
			<label class="form-check-label"> 
			 <input class="form-check-input" type="checkbox" 
			 name="${status.expression}" 
			 id="agreeToCert1" 
			 value="1" <c:if test="${status.value=='true'}">checked</c:if>>&nbsp;&nbsp;
				<span class="required">*</span>&nbsp; 
				By checking this box, you certify
				that the information listed above is true and complete to the best
				of your knowledge.
			</label>
		</spring:bind>	
		</div> 

		&nbsp;
		
		<div class="form-group">
		<spring:bind path="formData.agreeToRules">
			<label class="form-check-label"> 
			 <input class="form-check-input" type="checkbox" 
			 name="${status.expression}" 
			 id="agreeToRules1" 
			 value="1" <c:if test="${status.value=='true'}">checked</c:if>>&nbsp;&nbsp;
				<span class="required">*</span>&nbsp; 
				 By checking this box, you agree to
				the rules and regulations regarding the use of this site. Please
				view the <a href="http://google.com"> Online Services and Web
					Confidentiality Agreements</a> here.
				You must accept the agreements to continue with registration.
			</label>
		</spring:bind>	
		</div> 
		&nbsp;
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<a href="#" class="btn  btn-success signUpSubmit" id="signUpSubmit">Continue</a>&nbsp;&nbsp; <a
					href="/ecx_rrbPortal/login" class="btn btn-default ">Cancel</a>
			</div>
		</div>
	</div>
	<spring:bind path="formData.validationErrorData">
		<input type="hidden" name="<c:out value='${status.expression}'/>"
			id="<c:out value='${status.expression}'/>"
			value="<c:out value='${status.value}'/>" />
	</spring:bind>
	&nbsp;
</form:form>

<%@include file="footer.jsp"%>
<script src="<c:url value="/resources/js/jasny-bootstrap.min.js" />"></script>
<script src="<c:url value="/resources/js/signUp.js" />"></script>
&nbsp;
</body>
</html>



























