%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<link rel="stylesheet"href="<c:url value="/resources/admin.css"/>">
<html>
<head>
<title>Supplier Page</title>
</head>
<body>
<h1>Add a Supplier</h1>
<c:url var="addAction" value="/category/add" ></c:url>
<form:form action="${addAction}" commandName="supplier">
<table>
<tr>
	<td><form:label path="id"><spring:message text="ID"/></form:label></td>
	<c:choose>
	<c:when test="${!empty supplier.id}">
	<td><form:input path="id" readonly="true"   disabled="true"/> </td>
	</c:when>
	<c:otherwise>
	<td><form:input path="id"pattern="{4,7}"required="true"
		title="id should contains 4 to 7 characters" /> </td>
	 </c:otherwise>
	 </c:choose>
	  <tr>
	  <td><form:label path="name"><spring:message text="Name"/></form:label>
	  <td><form:input path="name"required="true"/></td>
	  </tr>
	  <tr>
	  <td><form:label path="address"><spring:message text="Address"/></form:label>
	  <td><form:input path="address"required="true"/></td>
	  </tr>
	   <tr>
	  <td colspan="2">	<c:if test="${!empty supplier.name}">
	         <input type="submit"value="<spring:message text="Edit Supplier"/>"/> 
	       </c:if>	<c:if test="${empty supplier.name}">
	           <input type="submit"value="<spring:message text="Add  Supplier"/>"/>
	       </c:if></td>
	       </tr></table> 
	        </form:form>
	             <br>
	            <h3>Supplier List</h3>
<c:if test="${!empty SupplierList}">
	<table class="tg">
	<tr>
		<th width="80"> ID</th>
		<th width="120">Supplier Name</th>
		<th width="120">Supplier Country</th>
		<th width="60">Edit</th>
		<th width="60">Delete</th>
	</tr>
	<c:forEach items="${supplierList}" var="supplier">
		<tr>
			<td>${supplier.id}</td>
			<td>${supplier.name}</td>
			<td>${supplier.country}</td>
			<td><a href="<c:url value='supplier/edit/${supplier.id}' />" >Edit</a></td>
			<td><a href="<c:url value='supplier/remove/${supplier.id}' />" >Delete</a></td>
		</tr>
	</c:forEach>
	</table>
</c:if>
</body>
</html>
	  
