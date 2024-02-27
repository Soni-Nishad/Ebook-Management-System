<%@page import="com.entity.User"%>
<%@page import="java.sql.Connection" %>
<%@page import="com.DB.DBconnect" %>
<%@page import="com.dao.BookDAOImpl" %>
<%@page import="com.entity.BookDtls" %>
<%@page import= "java.util.List" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Recent Book</title>
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

<div class="container-fluid">
	<div class="row p-3">
		<%
			String ch = request.getParameter("ch");
			BookDAOImpl dao2 = new BookDAOImpl(DBconnect.getCon());
			List<BookDtls> list2 = dao2.getBookBySearch(ch);
			for(BookDtls b : list2){
			%>
			<div class="col-md-3">
				<div class="card crd-ho mt-2">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName() %>"
							style="width: 100px; height: 150px" class="img-thumblin">
						<p><%=b.getBookName() %></p>
						<p><%=b.getAuthor() %></p>
						<p>
						<%
						if(b.getBookCategory().equals("Old")){
						%>						
						Categories : <%=b.getBookCategory() %></p>
						<div class="row ml-5">
							 <a href=" view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-1">View Details</a>
							 <a href=""	class="btn btn-danger btn-sm ml-1"><%=b.getPrice() %>
							  <i class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>
						<%
						}else{
						%>
						Categories : <%=b.getBookCategory() %></p>
						<div class="row ml-3">
							
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
							
								<a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-1">View Details</a>
								<a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%>
								<i class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>
						<%
						}
						%>
					</div>
				</div>
			</div>
			<% 	
			}
			%>
	</div>
</div>
</body>
</html>