<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>This is Registration page</title>
</head>
<body>
<div align="center">
        <form:form action="register" method="post" commandName="userForm">
            <table border="0">
                <tr>
                    <td colspan="2" align="center"><h2>Registration</h2></td>
                </tr>
                <tr>
                    <td>Id:</td>
                     <td><input type="text" name="id" /></td>
                </tr>
                <tr>
                    <td> Name:</td>
                     <td><input type="text" name="userName" /></td>
                </tr>
                <tr>
                    <td>Password:</td>
                <td><input type="text" name="password" /></td>               
                 </tr>
                <tr>
                    <td>Mail:</td>
                     <td><input type="text" name="mail" /></td>
                </tr>
                <tr>
                    <td>Contact:</td>
                     <td><input type="text" name="contact" /></td>
                </tr>
                
                <tr>
                    <td></td>
                    <td><input type="submit" value="Submit" /></td>
                </tr>
            </table>
        </form:form>
    </div>


</body>
</html>