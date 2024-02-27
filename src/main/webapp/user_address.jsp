<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Address</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card mt-3">
					<div class="card-body">
						<h3 class="text-center text-success">Add Address</h3>
						<form>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Address</label> <input type="text"
										class="form-control" id="inputEmail4" >
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Landmark</label> <input type="email"
										class="form-control" id="inputPassword4" >
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">City</label> <input
										type="number" class="form-control" id="inputEmail4" >
								</div>
								<div class="form-group col-md-3">
									<label for="inputEmail4">State</label> <input type="text"
										class="form-control" id="inputEmail4" >
								</div>
								<div class="form-group col-md-3">
									<label for="inputPassword4">Pin Code</label> <input type="text"
										class="form-control" id="inputPassword4" >
								</div>
							</div>

							<div class="text-center">
								<button href="" class="btn btn-warning">Add Address</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>