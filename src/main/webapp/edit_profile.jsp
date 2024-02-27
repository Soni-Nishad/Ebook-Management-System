<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    	<%@page isELIgnored = "false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-3">
					<div class="card-body ">
						<h5 class="text-center text-primary p-1">Edit Profile</h5>
						<c:if test="${not empty failedMsg }">
							<h5 class = "text-center text-danger">${failedMsg}</h5>
							<c:remove var = "failedMsg" scope="session" />
						</c:if>
					
						<c:if test="${not empty succMsg }">
							<h5 class = "text-center text-success">${succMsg}</h5>
							<c:remove var = "succMsg" scope="session" />
						</c:if>			
						
						<form action="update_profile" method="post">
						<input type="hidden" value="${userobj.id}" name="id">
							<div class="form-group">
								<label for="exampleInputEmail1">Enter Full Name</label><input
									name="name" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"  value="${userobj.name}">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label><input
									name="email" type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"  value="${userobj.email}">
							</div>

							<div class="form-group">
								<label for="exampleInputPassword1">Phone No</label><input
									name="phone" type="number" class="form-control"
									id="exampleInputPassword1"  value="${userobj.phno}">
							</div>

							<div class="form-group">
								<label for="exampleInputPassword1">Password</label><input
									name="password" type="password" class="form-control"
									id="exampleInputPassword1" >
							</div>

							<button type="submit" class="btn btn-primary btn-block btn-sm">Update</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>