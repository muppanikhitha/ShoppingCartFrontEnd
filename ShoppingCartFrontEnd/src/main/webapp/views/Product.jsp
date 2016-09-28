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
<h1>Add product</h1>
<c:url var="addAction" value="product/add"></c:url>
<form:form action="${addAction}" commandName="product">
<table>
	<tr>
			<td><form:label path="prt_id"> <spring:message text="ID"/></form:label></td>
					<c:choose>
							<c:when test="${!empty product.prt_id}">
							<td><form:input path="prt_id" readonly="true"/> </td>
							</c:when>
									
							 <c:otherwise>
							 <td><form:input path="prt_id" pattern="{5,10}" required="true" title="id should be between 5 to 10 characters"/> </td>
							 </c:otherwise>
					</c:choose>
			</tr>
		<tr>
			<td><form:label path="prt_name"> <spring:message text="NAME"/></form:label></td>
			<td><form:input path="prt_name" required="true"/> </td>
		</tr>
		
		<tr>
			<td><form:label path="prt_description"> <spring:message text="DESCRIPTION"/></form:label></td>
			<td><form:input path="prt_description" required="true"/> </td>
		</tr>
		
		<tr>
			<td><form:label path="prt_price"> <spring:message text="PRICE"/></form:label></td>
			<td><form:input path="prt_price" required="true"/> </td>
		</tr>
			<tr>
					<td>Image:</td>
					<td><form:input type="file"
							class=" btn btn-default btn-block form-control" path="image"
							required="true" /></td>
				</tr> 				
	       <tr>
	  <td><form:label path="supplier"><spring:message text="Supplier"/></form:label></td>
	  
	  <td><form:select path="suppr_id">
	           <c:forEach items="${supplierList}" var="supplier">
								<form:option class="input1" value="${supplier.supe_id}">${supplier.supe_name}</form:option>
							</c:forEach>
							</form:select>
							</td>
	           </tr>
	           
	       <tr>
	  <td><form:label path="category"><spring:message text="Category"/></form:label></td>
	  <td><form:select path="catey_id"  >
	           <c:forEach items="${categoryList}" var="category">
								<form:option class="input1" value="${category.caty_id}">${category.caty_name}</form:option>
							</c:forEach>
							</form:select>
							</td>
	           </tr> 
		<tr>
			<td colspan="2">
			<c:if test="${!empty product.prt_name}">
			<input type="submit" value="<spring:message text="Edit product"/> "> 
			</c:if>
			<c:if test="${empty product.prt_name}">
			<input type="submit" value="<spring:message text="Add product"/> "> 
			</c:if>
			</td>

		</tr>
</table>
</form:form>
<br>

	              
	             
	            <h3>Product List</h3>
<c:if test="${!empty productList}">
	<table class="tg">
	<tr>
		<th > Product Id</th>
		<th >Product Name</th>
		<th >Product Description</th>
				<th>Product Price</th>
				<th>image</th>
					<th>Category</th>
						<th>Supplier</th>
		<th>Edit</th>
		<th>Delete</th>
	</tr>
	<c:forEach items="${productList}" var="product">
		<tr>
			<td>${product.prt_id}</td>
			<td>${product.prt_name}</td>
			<td>${product.prt_description}</td>
			<td>${product.prt_price}</td>
			<td>${product.catey_id}<td>
			<td>${product.suppr_id} </td>
			<img height="100px" width="100px" alt="${product.prt_id }"
									src="<c:url value="/resources/images/${product.prt_id }.jpg"></c:url>">
							</div>
			<td><a href="<c:url value="product/edit/${product.prt_id}"/>" >Edit</a></td>
			<td><a href="<c:url value="product/remove/${product.prt_id}"/>" >Delete</a></td>
		</tr>
	</c:forEach>
	</table>
</c:if>
</body>
</html> 