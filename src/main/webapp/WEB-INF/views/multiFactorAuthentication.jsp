<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<jsp:directive.page contentType="text/html; charset=UTF-8" />

<%@include file="header.jsp"%>
<link href="<c:url value="/resources/css/multifactorauth.css" />"  rel="stylesheet">
<title>MyRRMed : MultiFactorAuthentication</title>
	<div id="breadcrumbs" class="noprint">
		<ol class="breadcrumb container">
			<li><a href="#">MyRRMed</a></li>
			<li><a href="#">MultiFactorAuthentication</a></li>
		</ol>
	</div>
	<div class="container mfaAdjustCss">
		<div class="page-header">
			<h2>Welcome to MyRRMed</h2>
		</div>

		<div class="page-description">
			<p>Multi-Factor Authentication is enabled for your account. To
				verify your identity we're going to send you a verification code to
				enter.</p>
		</div>
		<br />
		<c:if test="${error == null || empty error}">
			<c:set value="hide" var="hideError" />
		</c:if>
		<div id="errorSummary-0" class="errorSummaryContainer ${hideError}" tabindex="-1" role="group" aria-live ="assertive">
			<h3 id="errorSummaryHeading-0" class="errorSummaryHeading" role="alert">
				<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>&nbsp;Please review the data entered &nbsp;
			</h3>
			<ul class='errorSummaryList ' id='errorList'>
			  <li class='errorSummaryItem'>
			  	<span class="error-text" id="errorText"><c:out value="${error}" /></span>
			  </li>
		 	</ul>
		</div>
		
		<form:form id="mfaForm" action="" method="POST"  role="form">
			<div class= "jumbotron mfa-jumbotron">
				<div class="verification-header">How do you want to be verified?</div>
	
				<div class="form-group ">
					<label class="control-label col-md-5" for="phone">
						<span class="glyphicon glyphicon-earphone gi-2x">&nbsp;</span>
						<span class="mfaVerticalAlign" id="mobilePhone"><c:out value='${mobilePhone}' /></span>
					</label>
					</label>
					
					<c:choose>
						<c:when test="${mobilePhone == 'No mobile number on file.'}">
							<c:set var="textBtnCss" value="hide"/>
						</c:when>
						<c:otherwise>
						<c:set var="textBtnCss" value="hide"/>
							<c:if test="${!codeExists}">
								<c:set var="textBtnCss" value="show"/>
							</c:if>
						</c:otherwise>
					</c:choose>
					
					<div class="col-md-7">
						<a href="#" id="generateText" class="btn btn-sm btn-success  mfaBtn mfaVerticalAlign ${textBtnCss}" title="Text Me">Text Me</a>
					</div>
				</div>
				
				<br/>
	
				<div class="form-group">
					<label class="control-label col-md-5" for="email"> 
						<span class="glyphicon glyphicon-envelope gi-2x">&nbsp;</span>
						<span class="mfaVerticalAlign"><c:out value='${emailId}' /></span>
					</label>
					
					<c:if test='${codeExists}'>
						<c:set var="hideEmail" value="hide" />
					</c:if>
					
					<div class="col-md-7">
						<a href="#" id="generateEmail" class="btn btn-sm btn-success  mfaBtn mfaVerticalAlign ${hideEmail}" title="Email Me">Email Me</a>
					</div>
				</div>
				&nbsp;
				<c:if test='${!codeExists}'>
					<c:set var="hideCss" value="hide" />
				</c:if>
				<div id="enterMfa" class="form-group ${hideCss}">
					<label class="control-label col-md-6">Please enter the verification code you received via your RRB Portal registered email address or mobile phone number on file. If you did not receive one, click on the 'Didn't get the code?' link.</label>
					<div class="col-md-3">
						<input type="text" class="form-control input input-sm"  placeholder="Enter the code here" id="mfaCode" name="mfaCode" title="Enter the code here" size="35" maxlength="10">
					</div>
					<div class="col-md-3">
						<a href="#" type="submit" class="btn btn-sm btn-success mfaBtn mfaVerticalAlign" id="submitMfa" title="Submit">Submit</a>&nbsp;
						<label class="control-label mfaVerticalAlign"><a href="#" id="regenerateMfa" class="mfaBtn verticalMiddleAlign">Didn't get the code ?</a></label>
					</div>
				</div>
				&nbsp;
			</div>
		</form:form>
	</div>
</body>
<%@include file="footer.jsp"%>
&nbsp;
<script src="<c:url value="/resources/js/multifactorauth.js" />"></script>
</html>