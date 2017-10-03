<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn" %>
<%@page import="java.util.Date, java.text.SimpleDateFormat"%>
<jsp:directive.page contentType="text/html; charset=UTF-8" />
<%@include file="header.jsp"%>    
<link href="<c:url value="resources/css/login.css" />"  rel="stylesheet">
<c:url var="loginAction" value="/login"></c:url>
<form:form action="${loginAction}" method="POST"  role="form" >
<div id="breadcrumbs" class="noprint">
	<ol class="breadcrumb container">
		<li> <a href="<c:url value="/"/>">MyRRMed</a> </li>
		<li> <a href="<c:url value="/login"/>">Login</a> </li>
	</ol>
</div>
<div class="jumbotron jumbotronInline" >
<c:if test="${error != null}">
	<div id="errorSummary-0" class="errorSummaryContainer marginzero " tabindex="-1" role="group" aria-live ="assertive">
		<ul class='errorSummaryList' id='errorList'>
		  <li class='errorSummaryItem'>
		  	<span class="error-text">${error}</span>
		  </li>
	 	</ul>
	</div>
</c:if>
<c:if test="${successfulMessage != null}">
	<div id="errorSummary-0" class="errorSummaryContainer marginzero " tabindex="-1" role="group" aria-live ="assertive">
		<ul class='errorSummaryList' id='errorList'>
		  <li class='errorSummaryItem'>
		  	<span class="text-success">${successfulMessage}</span>
		  </li>
	 	</ul>
	</div>
</c:if>
<div>
	<div class="container">
		<div class="row loginContainercDiv">
				<div class="col-sm-6">
					<p class="loginp1" >Developed in 2016, MyRRMed by Palmetto GBA allows you to:</p>
						<ul>
							<li>Check the status of a claim.</li>
							<li>Review and update the authorized individuals you have allowed to review your healthcare and Medicare billing and information.</li>
							<li>Obtain historical Medicare Summary Notices.</li>
						</ul>
					<p class="loginp2"><a>MyRRMed Manual (PDF, 148 KB)</a> is available in print.</p>
				</div>
					<div class="col-sm-3">
						<div id="errorSummary-0" class="errorSummaryContainer hide" tabindex="-1" role="group" aria-live ="assertive">
			<h3 id="errorSummaryHeading-0" class="errorSummaryHeading" role="alert">
				<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>&nbsp;
			</h3>
		</div>
						<h3 class="loginCurrentUser" >Current Users</h3>
						<input tabindex="100"  class="input loginUserId" placeholder="User ID" id="userId" name="userId" type="text" size="35" maxlength="10" title="User ID" />
						
							
						<input tabindex="101"  class="input loginPassword" placeholder="Password" id="password" name="password" type="password" size="35" maxlength="20"  title="Password"/>

						<input type="submit" id="loginBtn" class="btn btn btn-success loginSubmit" value="Login" title="Login"/>
						<div class="text-center"><a href="<c:url  value="/passwordReset/passwordReset"/>" title="Forgot Username or Password">Forgot Username or Password?</a></div>	
					</div>
					<div class="col-sm-3">
						<h3 class="loginNewUser" >New Users</h3> 
						<a class="btn btn btn-warning loginRegister" href="<c:url value="/register/initSignUp"/>" title="Register Now">Register Now!</a>									
					</div>						
		</div>
		


	</div>

</div>
	<div class="container">
		<div class="row">
		</div>
	</div>
</div>
<div class="maincontainer">
	<div class="container main">
		<div class="row">
			<div class="col-sm-12">
				<h1>About MyRRMed</h1>
<p>MyRRMed is a part of the Palmetto GBA Railroad Medicare website.  This is a free, self-service tool that you can use to check the status and details of a claim, as well as to verify that only those individuals you designate have access to your personal health information.   You will also be able to view and print historical Medicare Summary Notices (MSNs).  Please note: MSNs are generated quarterly, so you may see current claims and their status but not yet have an MSN generated.</p>
				<p class="loginp4"><a href="<c:url value="/register/initSignUp"/>" title="Register Now">Register Now</a></p>		
				<hr/>					
				<h2>About Railroad Medicare</h2>
				<p>Palmetto GBA is the Railroad Specialty Medicare Administrative Contractor (RRB SMAC) and processes Part B claims for Railroad Retirement beneficiaries nationwide. Palmetto GBA is contracted by the independent federal agency Railroad Retirement Board (RRB), which administers comprehensive retirement-survivor and unemployment-sickness benefit programs for railroad workers and their families under the Railroad Retirement and Railroad Unemployment Insurance Acts.</p>

				<hr/>				
				<h3>Disclaimer</h3>
<p>You are accessing a U.S. Government information system, which includes:(1) this computer, (2) this computer network, (3) all computers connected to this network, and (4) all devices and storage media attached to this network or to a computer on this network. This information system is provided for U.S. Government-authorized use only. Unauthorized or improper use of this system may result in disciplinary action, as well as civil and criminal penalties. By using this information system, you understand and consent to the following:</p>
<ul><li>You have no reasonable expectation of privacy regarding any communication or data transiting or stored on this information system. At any time, and for any lawful Government purpose, the Government may monitor, intercept, and search and seize any communication or data transiting or stored on this information system.</li>
<li>Any communication or data transiting or stored on this information system may be disclosed or used for any lawful Government purpose. </li>
</ul>

			</div>
		</div>
	</div>
</div>
</form:form>

<%@include file="footer.jsp"%>
</body>
</html>