<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>EMAIL Services - Profile Information</title>
</head>
<body>

	<h1>
		Current Loaded Profile - <c:out value="${CurrentProfile}" />
    </h1>
    
    <h1>
		Email Response - <c:out value="${EmailResponse}" />
    </h1>
  	<h1>
		Transaction ID - <c:out value="${TransactionId}" />
	</h1>
		
</body>
</html>