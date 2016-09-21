<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<link rel="stylesheet"href="<c:url value="/resources/admin.css"/>">
<html>
<head>
<title>Product Page</title>
</head>
<body>
${msg}
<h1>
	Add a Product
</h1>

<c:url var="addAction" value="/product/add" ></c:url>
<form:form action="${addAction}" commandName="product">
<table>
	<tr>
	<td><form:label path="id"><spring:message text="ID"/></form:label></td>
	<c:choose>
	<c:when test="${!empty product.id}">
	<td><form:input path="id" readonly="true"   disabled="true"/> </td>
	</c:when>
	<c:otherwise>
	<td><form:input path="id"pattern="{6,7}"required="true"
		title="id should contains 6 to 7 characters" /> </td>
	 </c:otherwise>
	 </c:choose>
	  <tr>
	  <td><form:label path="name"><spring:message text="Name"/></form:label>
	  <td><form:input path="name"required="true"/></td>
	  </tr>
	  <tr>
	  <td><form:label path="description"><spring:message text="Description"/></form:label>
	  <td><form:input path="description"required="true"/></td>
	  </tr>
	  <tr>
	  <td><form:label path="price"><spring:message text="Price"/></form:label>
	  <td><form:input path="price"required="true"/></td>
	  </tr>
	  <tr>
	  <td colspan="2">	<c:if test="${!empty product.name}">
	         <input type="submit"value="<spring:message text="Edit Product"/>"/> 
	       </c:if>	<c:if test="${empty product.name}">
	           <input type="submit"value="<spring:message text="Add Product"/>"/>
	       </c:if></td>
	       </tr></table> 
	        </form:form>
	             <br>
	            <h3>Product List</h3>
<c:if test="${!empty ProductList}">
	<table class="tg">
	<tr>
		<th width="80"> ID</th>
		<th width="120">Product Name</th>
		<th width="120">Product Country</th>
		<th width="60">Edit</th>
		<th width="60">Delete</th>
	</tr>
	<c:forEach items="${ProductList}" var="Product">
		<tr>
			<td>${poduct.id}</td>
			<td>${product.name}</td>
			<td>${product.country}</td>
			<td><a href="<c:url value='product/edit/${product.id}' />" >Edit</a></td>
			<td><a href="<c:url value='product/remove/${product.id}' />" >Delete</a></td>
		</tr>
	</c:forEach>
	</table>
</c:if>
</body>
</html>