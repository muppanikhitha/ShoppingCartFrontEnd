<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<h1>Add Supplier</h1>
<c:url var="addAction" value="supplier/add"></c:url>
<form:form action="${addAction}" commandName="supplier">
<table>
	<tr>
			<td><form:label path="supe_id"> <spring:message text="ID"/></form:label></td>
					<c:choose>
							<c:when test="${!empty supplier.supe_id}">
							<td><form:input path="supe_id" readonly="true"/> </td>
							</c:when>
									
							 <c:otherwise>
							 <td><form:input path="supe_id" pattern="{5,10}" required="true" title="id should be between 5 to 10 characters"/> </td>
							 </c:otherwise>
					</c:choose>
			</tr>
		<tr>
			<td><form:label path="supe_name"> <spring:message text="name"/></form:label></td>
			<td><form:input path="supe_name" required="true"/> </td>
		</tr>
		
		<tr>
			<td><form:label path="supe_address"> <spring:message text="address"/></form:label></td>
			<td><form:input path="supe_address" required="true"/> </td>
		</tr>
		<tr>
			<td colspan="2">
			<c:if test="${!empty supplier.supe_name}">
			<input type="submit" value="<spring:message text="Edit supplier"/> "> 
			</c:if>
			<c:if test="${empty supplier.supe_name}">
			<input type="submit" value="<spring:message text="Add supplier"/> "> 
			</c:if>
			</td>

		</tr>
</table>
</form:form>
<br>


<h3>Supplier List</h3>
	<c:if test="${!empty supplierList}">
		<table class="tg">
		<tr>
				<th width="80">Supplier Id</th>
				<th	width="120">Supplier Name</th>
				<th width="120">Supplier address</th>
				<th width="60">Edit</th>
				<th width="60">Delete</th>
		</tr>
		<c:forEach items="${supplierList}" var="supplier">
			<tr>
				<td>${supplier.supe_id}</td>
				<td>${supplier.supe_name}</td>
				<td>${supplier.supe_address}</td>
				<td><a href="<c:url value="supplier/update/${supplier.supe_id}"/>">Edit</a></td>
				<td><a href="<c:url value="supplier/remove/${supplier.supe_id}"/>">Delete</a></td>
			</tr>
		</c:forEach>
		</table>
	</c:if>


</body>
</html>