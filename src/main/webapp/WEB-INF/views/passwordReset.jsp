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

	<div id="breadcrumbs" class="noprint">
		<ol class="breadcrumb container">
			<li><a href="initLogin">MyRRMed</a></li>
			<li><a href="#">Password Reset</a></li>
		</ol>
	</div>
	<div class="container">
		<div class="page-header">
			<h2>Password Reset</h2>
		</div>
		<div class="form-group">
			<p class="text-info">
				Fields marked with an asterisk <span class="required">*</span> are
				required.
			</p>
		</div>
		<div id="errorSummary-0" class="errorSummaryContainer hide" tabindex="-1" role="group" aria-live ="assertive">
			<h3 id="errorSummaryHeading-0" class="errorSummaryHeading" role="alert">
				<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>&nbsp;Please review the data entered &nbsp;
			</h3>
		</div>
		&nbsp;
		<form:form commandName="formData"  action="" method="POST"  role="form" >
			<div class="form-group">
				<label class="control-label col-xs-2 for="userId">Enter User
					ID:&nbsp;&nbsp;<span class="required">*</span></label>
				<div class="col-xs-3 marginbottom40"  >  
				<spring:bind path="formData.userId">
					<input type="text" class="form-control"  placeholder="user Id" id="<c:out value='${status.expression}'/>" name="<c:out value='${status.expression}'/>" value="<c:out value='${status.value}'/>" size="35" maxlength="10">
					
					</spring:bind>
				</div>
			</div>
			&nbsp;
			<div class="form-group" >                             
				<div class="col-sm-offset-2 col-sm-10 marginbottom15"  >      
					<a href="#"  id="passwordResetSubmit" type="submit" class="btn  btn-success ">Submit</a>&nbsp;&nbsp;
					<a href="passwordReset"  class="btn btn-default ">Clear</a>
				</div>
			</div>
			&nbsp;
			<div class="form-group  "  >    
				<div class="col-sm-offset-2 col-sm-10">
					<a href="#" target="_blank"><u>Need Help?</u></a>&nbsp; &nbsp; &nbsp; 
					<a href="/ecx_rrbPortal/login"><u>Return to Login</u></a>
				</div>
			</div>
		
	</div>
	<div class="passwordResetAdjustCss">&nbsp;</div>

	<spring:bind path="formData.validationErrorData">
<input type="hidden" name="<c:out value='${status.expression}'/>" id="<c:out value='${status.expression}'/>" value="<c:out value='${status.value}'/>" />
</spring:bind>
</form:form>
<%@include file="footer.jsp"%>
&nbsp;
<script src="<c:url value="/resources/js/passwordreset.js" />"></script> 
   </body>  
</html>