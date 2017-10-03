<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<jsp:directive.page contentType="text/html; charset=UTF-8" />

<%@include file="header_Tabs.jsp"%>
<link href="<c:url value="/resources/css/passwordreset.css" />"  rel="stylesheet">
<title>MyRRMed : Change Password</title>
	<div id="breadcrumbs" class="noprint">
		<ol class="breadcrumb container">
			<li><a href="/ecx_rrbPortal/homepage">MyRRMed</a></li>
			<li><a href="#">Change Password</a></li>
		</ol>
	</div>

	<div class="container">
		<div class="page-header">
			<h2>Change Password</h2>
		</div>
		<div class="form-group">
			<p class="text-info">
				Fields marked with an asterisk <span class="required">*</span> are
				required.
			</p>
		</div>
	<div id="errorSummary-0" class="errorSummaryContainer hide"
		tabindex="-1" role="group" aria-live="assertive">
		<h3 id="errorSummaryHeading-0" class="errorSummaryHeading"
			role="alert">
			<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>&nbsp;Please
			review the data entered &nbsp;
		</h3>
	</div>
	<form:form commandName="formData"  action="" class="form-horizontal" method="POST"  role="form" >
				<div class="form-group">
			<label class="control-label col-sm-2" for="userId">User Id
				&nbsp;:&nbsp;
			</label>

			<div class="col-sm-3">

					<c:out value='${formData.userId}'/>
			</div>

		</div>
<br>
		<div class="form-group">
			<label class="control-label col-sm-2" for="currentPassword">Current
					Password:&nbsp;&nbsp;<span class="required">*</span>
			</label>

			<div class="col-sm-3">
				<!-- <input type="text" class="form-control " id="lastname"
					name="lastname" title="Enter Your Last Name"> -->
					<spring:bind path="formData.currentpassword">
						<input type="password" class="form-control input-sm marginbottom15" title="Enter Password"
							id="<c:out value='${status.expression}'/>"
							name="<c:out value='${status.expression}'/>"
							value="<c:out value='${status.value}'/>"  maxlength="20">
					</spring:bind>
			</div>

		</div>
		
				<div class="form-group">
			<label class="control-label col-sm-2" for="currentPassword">Enter
					New Password:&nbsp;&nbsp;<span class="required">*</span>
			</label>

			<div class="col-sm-3">
				<!-- <input type="text" class="form-control " id="lastname"
					name="lastname" title="Enter Your Last Name"> -->
					<spring:bind path="formData.newPassword">
						<input type="password" class="form-control input-sm marginbottom15" title="Enter New Password"
							id="<c:out value='${status.expression}'/>"
							name="<c:out value='${status.expression}'/>"
							value="<c:out value='${status.value}'/>"  maxlength="20">
					</spring:bind>
			</div>

		</div>
		
				<div class="form-group">
			<label class="control-label col-sm-2" for="reenterpassword">Re-enter
					New Password:&nbsp;&nbsp;<span class="required">*</span>
			</label>

			<div class="col-sm-3">
				<!-- <input type="text" class="form-control " id="lastname"
					name="lastname" title="Enter Your Last Name"> -->
					<spring:bind path="formData.reenterpassword">
						<input type="password" class="form-control input-sm marginbottom15" title="Re-Enter New Password"
							id="<c:out value='${status.expression}'/>"
							name="<c:out value='${status.expression}'/>"
							value="<c:out value='${status.value}'/>"  maxlength="20">
					</spring:bind>
			</div>

		</div>
		
		
	
			
			<div class="form-group passwordResetAdjustCss">
				<div class="col-sm-offset-2 col-sm-10">
					<a href="#" class="btn  btn-success changePwdSubmit" id="changePwdSubmit">Submit</a>
					<a href="/ecx_rrbPortal/passwordReset/changePassword" class="btn btn-default ">Clear</a>
				</div>
			</div>
			
<spring:bind path="formData.validationErrorData">
	<input type="hidden" name="<c:out value='${status.expression}'/>" id="<c:out value='${status.expression}'/>" value="<c:out value='${status.value}'/>" />
	</spring:bind>
		</form:form>
	</div>

</body>
<%@include file="footer.jsp"%>
&nbsp;
<script src="<c:url value="/resources/js/changepassword.js" />"></script> 
</html>

