<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shopping Cart</title>
</head>
<body>
<h2> Welcome to Shopping Cart</h2>


${message} <br>


<a href="Login"> Login Here</a>
<a href="Register"> New User</a>
<hr color="blue">
<c:if test="${UserClickedRegisterHere}==true">
<jsp:include page="Registration.jsp"></jsp:include>
</c:if>

<c:if test="${UserClickedLoginHere}==true">
<jsp:include page="Login.jsp"></jsp:include>
</c:if>

</body>
</html>