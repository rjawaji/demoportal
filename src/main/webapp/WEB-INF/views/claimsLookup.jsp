<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page import="java.util.Date, java.text.SimpleDateFormat"%>
<jsp:directive.page contentType="text/html; charset=UTF-8" />
<link href="<c:url value="/resources/css/jquery.dataTables.min.css" />"  rel="stylesheet">
<link href="<c:url value="/resources/css/buttons.dataTables.min.css" />"  rel="stylesheet">
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- <link rel="stylesheet" href="/resources/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="/resources/css/buttons.dataTables.min.css ">-->

<%@include file="header_Tabs.jsp"%> 

<title>MyRRMed : Claim Status</title>

<div id="breadcrumbs" class="noprint">
	<ol class="breadcrumb container">
		<li><a href='<c:url value="/" />'>MyRRMed</a></li>
		<li><a href="/ecx_rrbPortal/initClaimsLookup"> Claim Status Information</a></li>
	</ol>
</div>

		<div id="errorSummary-0" class="errorSummaryContainer hide " tabindex="-1" role="group" aria-live ="assertive">
			<h3 id="errorSummaryHeading-0" class="errorSummaryHeading" role="alert">
				<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>&nbsp;Please review the data entered &nbsp;
			</h3>
		</div>
		&nbsp;
<form:form commandName="formData" action="" method="POST" role="form"
	class="form-horizontal">


	<div class="main" >
		<div class="container" >
			<div class="row">
				<div class=" col-sm-6">
					<div class="page-header">
						<h3>List of Claim Status Information</h3>
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
				</div>

				<br>


				<div class="col-sm-10" id="claimDataTableDiv">
					<!-- create table dynamically -->


					<table id="claimStatusTable" width="100%"  class="display" >
						 <thead>
							<tr>

								<th colspan="6" >Claim Status Information</th>

							</tr>
							<tr>
							<th><span class="claimNumberLbl">Claim Number</span></th>
								<th><span class="dateOfServiceLbl">Date of Service</span></th>
								<th><span class="billAmtLbl">Bill Amt</span></th>
								<th><span class="processDateLbl">Paid Amt</span></th>
								<th><span class="checkNumberLbl">Process Date</span></th>
								<th><span class="claimStatusLbl">Claim Status</span></th>
								<th><span class="claimStatusLbl">You May Be Billed</span></th>
								<th><span class="claimStatusLbl">Provider Name</span></th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="claimm" items="${claimsList}" varStatus="i">
							<tr>
								<td><c:out value="${claimm.ccn}" /> </td>
								<td><c:out value="${claimm.fromMMDDYY}" /> -<c:out value="${claimm.thruMMDDYY}" /> </td>
								<td><fmt:formatNumber value = "${claimm.billedAmount}" type = "currency"/></td>
								<td><fmt:formatNumber value = "${claimm.paidAmount}" type = "currency"/></td>
								<td><c:out value="${claimm.paidDate}" /></td>
								<td><c:out value="${claimm.statusDesc}" /></td>
								<td><fmt:formatNumber value = "${claimm.patientResponsible}" type = "currency"/></td>
								<th><c:out value="${claimm.providerName}" /></th>
							</tr>
							</c:forEach>
							

						</tbody>

					</table>
				</div>
			</div>
		</div>
	</div>



	</div>
	<%-- <spring:bind path="formData.validationErrorData">
		<input type="hidden" name="<c:out value='${status.expression}'/>"
			id="<c:out value='${status.expression}'/>"
			value="<c:out value='${status.value}'/>" />
	</spring:bind> --%>
	&nbsp;
		<spring:bind path="formData.validationErrorData">
<input type="hidden" name="<c:out value='${status.expression}'/>" id="<c:out value='${status.expression}'/>" value="<c:out value='${status.value}'/>" />
</spring:bind>
</form:form>
<%@include file="footer.jsp"%>
<script src="<c:url value="/resources/js/claims.js" />"></script>

<script src="<c:url value="/resources/js/jquery.dataTables.min.js" />"></script>
<script src="<c:url value="/resources/js/dataTables.buttons.min.js" />"></script>
<script src="<c:url value="/resources/js/pdfmake.min.js" />"></script>
<script src="<c:url value="/resources/js/jszip.min.js" />"></script>
<script src="<c:url value="/resources/js/buttons.flash.min.js" />"></script>

<!--
<script src="//cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
<script src="//cdn.datatables.net/buttons/1.2.1/js/dataTables.buttons.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js "></script>
<script src="//cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/pdfmake.min.js "></script>
<script src="//cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/vfs_fonts.js  "></script>
 <script src="//cdn.datatables.net/buttons/1.4.0/js/buttons.html5.min.js "></script> --><!--
<script src="//cdn.datatables.net/buttons/1.0.3/js/buttons.flash.min.js"></script>
 <script src="/resources/js/jquery.dataTables.min.js"></script>
<script src="/resources/js/dataTables.buttons.min.js"></script>
<script src="/resources/js/pdfmake.min.js"></script> -->
&nbsp;
</body>
</html>



























