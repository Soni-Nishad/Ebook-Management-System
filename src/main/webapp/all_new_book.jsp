<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBconnect"%>
<%@page import="com.dao.BookDAOImpl"%>
<%@page import= "java.util.List" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    	<%@page isELIgnored = "false" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All New Book</title>
<%@include file = "all_component/allCss.jsp" %>
<style>
.crd-ho:hover {
	background-color: #fcf7f7;
}
</style>
</head>
<body>
<%@include file="all_component/navbar.jsp"%>

<%
	User u = (User) session.getAttribute("userobj");
	%>


<c:if test="${not empty addCart }">
<div id = "toast"> ${addCart}</div>
<script type = "text/javascript">
showToast();
function showToast(content){
	$('#toast').addClass("display");
	$('#toast').html(content);
	setTimeout(() => {
		$('#toast').removeClass("display");
	}, 2000)
}

</script>

<c:remove var="addCart" scope="session"/>

</c:if>

<div class="container-fluid">
		<div class="row p-3">
			
			<%BookDAOImpl dao1 = new BookDAOImpl(DBconnect.getCon());
			List<BookDtls> list = dao1.getAllNewBook();
			for(BookDtls b : list){
			%>
			<div class="col-md-3.1 ml-4">
				<div class="card crd-ho mt-2">
					<div class="card-body text-center">
						<img alt="" src="<%=b.getPhotoName() %>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getBookName() %></p>
						<p><%=b.getAuthor() %></p>
						<p>Categories : <%=b.getBookCategory() %></p>
						<div class="row">
						
						<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-2"><i
								class="fa-solid fa-cart-shopping"></i> Add Cart</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>&&" class="btn btn-danger btn-sm ml-2"><i
								class="fa-solid fa-cart-shopping"></i> Add Cart</a>
						<%
						}
						%>
						
						
							 <a href="view_books.jsp?bid=<%=b.getBookId()%>"	class="btn btn-success btn-sm ml-1">View Details</a>
							 
							 <a href=""class="btn btn-danger btn-sm ml-1"><%=b.getPrice() %>
							  <i class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>
					</div>
				</div>
			</div>
			<% 	
			}
			%>
	</div>
</body>
</html>