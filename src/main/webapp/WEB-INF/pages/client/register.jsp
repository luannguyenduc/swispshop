<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>Swisp Shop - Đăng ký</title>
<link rel="stylesheet" href="Frontend/css/login.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>

<body>
	<div style="position: relative; z-index: 1000">
        <jsp:include page="include/homeHeader.jsp"></jsp:include>
    </div>
	<br><br><br>
	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	<div class="login-page">
		<div class="form form-dk">
			<form:form method="POST" action='register' modelAttribute="newUser">
				<h2 class="form-signin-heading" style="text-align: center;
				font-family: Arial, Helvetica, sans-serif;
				font-size: 30px;
				font-weight: bold;" >Đăng ký tài khoản</h2>
				<hr/>
				<div class="form-group">
					<form:input style="font-size: 16px;font-family: Arial, sans-serif;" type="email" path="email" class="form-control"
						placeholder="Email*" autofocus="true" required="required"></form:input>
					<form:errors class="error" path="email"></form:errors>
				</div>

				<div class="form-group">
					<form:input type="password" path="password" class="form-control"
						required="required" placeholder="Mật khẩu*"></form:input>
					<form:errors class="error" path="password"></form:errors>
				</div>

				<div class="form-group">
					<form:input type="password" path="confirmPassword"
						class="form-control" placeholder="Nhắc lại mật khẩu*"
						required="required"></form:input>
					<form:errors class="error" path="confirmPassword"></form:errors>
				</div>

				<div class="form-group">
					<form:input type="text" path="hoTen" class="form-control"
						placeholder="Họ và tên*" required="required"></form:input>
					<form:errors class="error" path="hoTen"></form:errors>
				</div>

				<div class="form-group">
					<form:input style="font-size: 16px;font-family: Arial, sans-serif;" type="number" path="soDienThoai" class="form-control"
						placeholder="Số điện thoại*" required="required"></form:input>
					<form:errors class="error" path="soDienThoai"></form:errors>
				</div>

				<div class="form-group">
					<form:input type="text" path="diaChi" class="form-control"
						placeholder="Địa chỉ*" required="required"></form:input>
					<form:errors class="error" path="diaChi"></form:errors>
				</div>
				<input class="dktk" id="submit" type="submit" value="Đăng ký">
				<p class="message" style="font-size: 18; padding:0;margin-top: 10px;"> Đã có tài khoản? <b><a class="dn2" href="<c:url value='/login'/> ">Đăng nhập</a></b></p>
			</form:form>
		</div>
	</div>
	<div><jsp:include page="include/homeFooter.jsp"></jsp:include></div>
	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

</body>
</html>