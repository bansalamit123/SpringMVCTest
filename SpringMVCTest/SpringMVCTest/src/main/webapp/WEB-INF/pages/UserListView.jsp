
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<sf:form method="post" modelAttribute="form">
		<sf:hidden path="pageNo" />
	
		<table border="1">
			<tr>
				<th>Select</th>
				<th>S.NO.</th>
				<th>FirstName</th>
				<th>LastName</th>
				<th>Login</th>
				<th>Password</th>
				<th>DOB</th>
				<th>Address</th>
				<th>Edit</th>
			</tr>
			<c:forEach items="${list}" var="user">
				<tr>
					<td><sf:checkbox path="ids" value="${user.id}" /></td>
					<td><c:out value="${user.id }"></c:out></td>
					<td><c:out value="${user.firstName }"></c:out></td>
					<td><c:out value="${user.lastName }"></c:out></td>
					<td><c:out value="${user.login }"></c:out></td>
					<td><c:out value="${user.password }"></c:out></td>
					<td><c:out value="${user.dob }"></c:out></td>
					<td><c:out value="${user.address }"></c:out></td>
					<td><a href="<c:url value="/User?id=${user.id}" />">edit</a></td>
				</tr>
			</c:forEach>
		</table>
		<table>
			<tr>
				<td><input type="submit" name="operation" value="delete">
				</td>
			</tr>
		</table>
	</sf:form>
</body>
</html>
