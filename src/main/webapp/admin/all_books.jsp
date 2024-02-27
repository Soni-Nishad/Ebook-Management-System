<%@page import="com.DB.DBconnect"%>
<%@page import="com.dao.BookDAOImpl"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin : All Books</title>
<%@include file="allCss.jsp"%>
</head>
<body>

<c:if test="${empty userobj}">
		<c:redirect url="../login.jsp" />
	</c:if>

	<%@include file="navbar.jsp"%>
	<h3 class="text-center">Hello Admin</h3>

	<c:if test="${not empty succMsg}">
		<p class="text-center text-success">${succMsg}</p>
		<c:remove var="succMsg" scope="session" />
	</c:if>
	<c:if test="${not empty failedMsg}">
		<p class="text-center text-danger">${failedMsg}</p>
		<c:remove var="failedMsg" scope="session" />
	</c:if>

	<table class="table table-striped">
		<thead class="bg-primary text-white">
			<tr>
				<th scope="col">ID</th>
				<th scope="col">Image</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author Name</th>
				<th scope="col">Price</th>
				<th scope="col">Categories</th>
				<th scope="col">Status</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>

			<%
			BookDAOImpl dao1 = new BookDAOImpl(DBconnect.getCon());
			List<BookDtls> list = dao1.getAllBooks();
			for (BookDtls b : list) {
				
			%>
			<tr>
				
				<td><%=b.getBookId() %></td>
				<%--<td><img src="../book/<%=b.getPhotoName()%>"
					style="width: 50px;"></td> --%>
					<td><%=b.getPhotoName() %></td>
				<td><%=b.getBookName()%></td>
				<td><%=b.getAuthor()%></td>
				<td><%=b.getPrice()%></td>
				<td><%=b.getBookCategory()%></td>
				<td><%=b.getStatus()%></td>
				
				<td>
				<a href="edit_books.jsp?id=<%=b.getBookId() %>"
					class="btn btn-sm btn-primary"><i class="fa-solid fa-pen-to-square"></i> Edit</a>
				<a href="../delete?id=<%=b.getBookId() %>"
					class="btn btn-sm btn-danger"><i class="fa-solid fa-trash"></i> Delete</a></td>
			</tr>
			<%
			}
			%>


		</tbody>
	</table>

	<div style="margin-top: 195px;">
		<%@include file="footer.jsp"%></div>
</body>
</html>