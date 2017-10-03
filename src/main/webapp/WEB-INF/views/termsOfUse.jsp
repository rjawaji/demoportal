<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<jsp:directive.page contentType="text/html; charset=UTF-8" />

<%@include file="header.jsp"%>


<title>MyRRMed : TermsOfUse</title>
	<div id="breadcrumbs" class="noprint">
		<ol class="breadcrumb container">
			<li><a href="#">MyRRMed</a></li>
			<li><a href="#">TermsOfUse</a></li>
		</ol>
	</div>

	<div class="container">

		<form>
			&nbsp;
			<div>
				<p>text</p>
			</div>
			&nbsp; &nbsp;
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-10">
					<label><input type="checkbox" value=""> I agree </label>
				</div>
			</div>
			&nbsp;
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-10">
					<button type="submit" class="btn  btn-sm">Submit</button>
				</div>
			</div>
		</form>
	</div>
<%@include file="footer.jsp"%>
&nbsp;
</body>
</html>