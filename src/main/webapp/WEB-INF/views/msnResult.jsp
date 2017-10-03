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


	<div class="main" style="margin-left: 10px">
		<div class="container" style="width: 100% !important;">
			<div class="row">
				<div class="col-sm-10">
					<div class="page-header">
						<h3>Medicare Summary Notice Lookup</h3>
					</div>


					<div class="col-sm-10">
						<p class="text-info">To view a MSN, click on the link options
							next to the date you wish to view.</p>
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

				<div class="col-sm-8 " id="msnDataTableDiv">  
					<!-- create table dynamically -->
					<table id="msnResultTable" class="display">
						<thead>
							<tr>
								<th colspan="2">Lookup Results</th>
							</tr>
							<tr>
								<th class="col-sm-5"><span class="msnLoadDateLbl">MSN
										Load Date</span></th>
								<th class="col-sm-5"><span class="pdfLbl">PDF</span></th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="entry" items="${msnMap}">
							<tr>
								<td class="col-sm-5"><c:out value="${entry.value}"/></td>
								<td class="col-sm-5"><a href="msnResultPDF?url=<c:out value="${entry.key}"/>" target="_blank"><img src="<c:url value="/resources/imgs/pdf.gif"/>" alt="pdfImage" id="pdf"></td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
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
</form:form>
<%@include file="footer.jsp"%>
<script src="<c:url value="/resources/js/msnResult.js" />"></script>
<script src="<c:url value="/resources/js/jquery.dataTables.min.js" />"></script>
<script src="<c:url value="/resources/js/dataTables.buttons.min.js" />"></script>
<script src="<c:url value="/resources/js/pdfmake.min.js" />"></script>
<script src="<c:url value="/resources/js/jszip.min.js" />"></script>
<script src="<c:url value="/resources/js/buttons.flash.min.js" />"></script>
</body>
</html>



























