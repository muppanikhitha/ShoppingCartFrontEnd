<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>

<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Login</title>
</head>
<body>
	${LoginMsg}<br><br>
		<form:form action="login" commandName="userDetails" method="post">
		<table>

			<tr>
				<td><form:label path="Id"><spring:message text="ID" /></form:label></td>
				<td><form:input path="id" /></td>
			</tr>
			
			<tr>
			<td><form:label path="password"><spring:message text="PASSWORD" /></form:label></td>
			<td><form:password path="password" /></td>
		</tr>
	</table>
	<div >
		<input type="submit"  value="Login" />
		</div>
</form:form>
</body>
</html>