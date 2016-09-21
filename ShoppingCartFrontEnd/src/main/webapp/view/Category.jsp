<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<link rel="stylesheet"href="<c:url value="/resources/admin.css"/>">
<html>
<head>

<title>Category Page</title>
</head>
<body>
${msg}
<h1>
	Add a Category
</h1>

<c:url var="addAction" value="/category/add" ></c:url>
<form:form action="${addAction}" commandName="category">
<table>
	<tr>
	<td><form:label path="id"><spring:message text="ID"/></form:label></td>
	<c:choose>
	<c:when test="${!empty category.id}">
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
	  <td><form:label path="description"><spring:message text="Description"/></form:label>
	  <td><form:input path="description"required="true"/></td>
	  </tr>
	  <tr>
	  <td colspan="2">	<c:if test="${!empty category.name}">
	         <input type="submit"value="<spring:message text="Edit Category"/>"/> 
	       </c:if>	<c:if test="${empty category.name}">
	           <input type="submit"value="<spring:message text="Add Category"/>"/>
	       </c:if></td>
	       </tr></table> 
	        </form:form>
	             <br>
	            <h3>Category List</h3>
<c:if test="${!empty CategoryList}">
	<table class="tg">
	<tr>
		<th width="80"> ID</th>
		<th width="120">Category Name</th>
		<th width="120">Category Country</th>
		<th width="60">Edit</th>
		<th width="60">Delete</th>
	</tr>
	<c:forEach items="${categoryList}" var="category">
		<tr>
			<td>${category.id}</td>
			<td>${category.name}</td>
			<td>${category.country}</td>
			<td><a href="<c:url value='category/edit/${category.id}' />" >Edit</a></td>
			<td><a href="<c:url value='category/remove/${category.id}' />" >Delete</a></td>
		</tr>
	</c:forEach>
	</table>
</c:if>
</body>
</html>