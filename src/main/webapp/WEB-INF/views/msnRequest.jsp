<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page import="java.util.Date, java.text.SimpleDateFormat"%>
<jsp:directive.page contentType="text/html; charset=UTF-8" />

<%@include file="header_Tabs.jsp"%> 

<title>MyRRMed : Medicare Summary Notice Lookup</title>

<div id="breadcrumbs" class="noprint">
	<ol class="breadcrumb container">
		<li><a href="#">MyRRMed</a></li>
		<li><a href="#"> Medicare Summary Notice Lookup</a></li>
	</ol>
</div>


<form:form commandName="formData" action="" method="POST" role="form"
	class="form-horizontal">

	<div class="container">
		<div class="page-header">
			<h3>Medicare Summary Notice Lookup</h3>
		</div>

		<div id="errorSummary-0" class="errorSummaryContainer hide"
			tabindex="-1" role="group" aria-live="assertive">
			<h3 id="errorSummaryHeading-0" class="errorSummaryHeading"
				role="alert">
				<span class="glyphicon glyphicon-exclamation-sign"
					aria-hidden="true"></span>&nbsp;Please review the data entered
				&nbsp;
			</h3>
		</div>
		&nbsp;
		<div class="dateSelection">
			<div class="form-group">
				<p class="lead">MSN Load Date(required)</p>
			</div>
			&nbsp; &nbsp;&nbsp;&nbsp;
			<div class="form-group">
				<label class="control-label col-sm-2" for="last30Days">Last
					30 Days&nbsp;:</label>
				<div class="col-sm-3">
					<spring:bind path="formData.dateRange">
						<input type="radio" id="<c:out value='${status.expression}'/>1"
							name="<c:out value='${status.expression}'/>" value="false"
							checked="checked">
					</spring:bind>
				</div>
			</div>

			&nbsp;
			<div class="form-group">
				<label class="control-label col-sm-2" for="dateRange">Select
					Specific Range&nbsp;:</label>
				<div class="col-sm-3">
					<spring:bind path="formData.dateRange">
						<input type="radio" id="<c:out value='${status.expression}'/>2"
							name="<c:out value='${status.expression}'/>" value="true">
					</spring:bind>
				</div>

				<label for="dateFrom">Date From&nbsp;:</label>&nbsp;&nbsp; <input
					id="dateFrom" class="dateInput" type="text" size="20"
					name="dateFromInput" title="mm/dd/yyyy" placeholder="mm/dd/yyyy"
					disabled="disabled"> <img
					src="<c:url value="/resources/imgs/clear.gif"/>" alt="Clear"
					id="dateFromClear">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

				<label>Date To&nbsp;:</label>&nbsp;&nbsp; <input id="dateTo"
					class="dateInput" type="text" size="20" name="dateToInput"
					title="mm/dd/yyyy" placeholder="mm/dd/yyyy" disabled="disabled">
				<img src="<c:url value="/resources/imgs/clear.gif"/>" alt="Clear"
					id="dateToClear">

			</div>
		</div>
		&nbsp;
		&nbsp;
		&nbsp;
		&nbsp;
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<a href="#" class="btn  btn-success msnSubmit" id="msnRequestSubmit">Submit</a>&nbsp;&nbsp;
				<a href="/ecx_rrbPortal/msnRequest" class="btn btn-default ">Clear</a>
			</div>
		</div>
		&nbsp;
		&nbsp;
		<div>
			<p><b>NOTE&nbsp;:</b> It may take a short time to retrieve this Medicare Summary Notice (MSN), as MSNs are printed quarterly.  MSNs more than 1 year old will take additional time to recall.  We thank you for your patience while we process your request.

</p>
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
<script src="<c:url value="/resources/js/msnLookup.js" />"></script>
&nbsp;
</body>
</html>



























