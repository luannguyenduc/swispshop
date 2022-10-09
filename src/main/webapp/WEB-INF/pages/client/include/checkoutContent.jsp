<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Thanh toán</title>
<style>
	.ck-btn{
		padding: 8px 15px;
		border: #9b3651 1px solid;
		transition: 0.25s;
		border-radius: 5px;
		font-weight: bold;
	}
	.return-cart-btn{
		color: #9b3651;
		background: #fff;
	}
	.return-cart-btn:focus{
		color: #9b3651;
		text-decoration: none;
	}
	.purchase-btn{
		color: #fff;
		background: #9b3651;
	}
	.return-cart-btn:hover{
		color: #fff;
		background: #9b3651;
		text-decoration: none;
	}
	.purchase-btn:hover{
		color: #9b3651;
		background: #fff;
		text-decoration: none;
	}
	button[disabled], button[disabled]:hover{
		background: #545454;
		border: #545454 1px solid;
		color: #fff;
	}
</style>
</head>

<script type="text/javascript">
function checkPhoneNumber(phone) {
	if(!/((0)+([0-9]{9})\b)/.test(phone))
	{
		document.getElementById("phoneWarning").innerHTML = "Hãy nhập số điện thoại phải đủ 10 số ";
	}else{document.getElementById("phoneWarning").innerHTML = "";}
	
	}

function muaHo() {
	
	 document.getElementById("hoTenNguoiNhanHang").value = "";
	 document.getElementById("soDienThoaiNguoiNhanHang").value = "";
	 document.getElementById("diaChiNguoiNhanHang").value = "";

	  };
	  	  
	$(document).ready(function() {
		$(".mytable .donGia .check").each(function() {
			var value = accounting.formatMoney($(this).text()) + ' VND';
			$(this).html(value);
		});

		$(".mytable .total").each(function() {
			var value = accounting.formatMoney($(this).text()) + ' VND ';
			$(this).html(value);
		});
	});
	
	
	function choToi() {
		
		document.getElementById("hoTenNguoiNhanHang").value = document.getElementById("hotenAcc").value;
		 document.getElementById("soDienThoaiNguoiNhanHang").value = document.getElementById("soDienThoaiAcc").value;
		 document.getElementById("diaChiNguoiNhanHang").value = document.getElementById("diaChiAcc").value;
		  };
</script>

<body>
	<br /><br /><br /><br /><br />
	<div class="container" style="width: 1300px">
		<form method="POST" action="<%=request.getContextPath()%>/thankyou">
			<div class="row">
				<br>
				<br>
				<c:if test="${pageContext.request.userPrincipal.name != null}">
					<div class="col-md-3" style="width: 30%" hidden>
						<br>
						<p class="border-p" style="line-height: 1.8;font-size: 20px;">
							<b>Thông tin khách hàng</b>
						</p>

						<p style="line-height: 2;">Họ tên Quý khách</p>
						<input class="form-control" style="font-size: medium;" id="hotenAcc" size="27" value="${user.hoTen}" disabled>

						<p style="line-height: 2;">Địa chỉ Email</p>
						<input class="form-control"  style="font-size: medium;"size="27" value="${user.email}" >

						<p style="line-height: 2;">Số điện thoại</p>
						<input class="form-control"  style="font-size: medium;"id="soDienThoaiAcc" size="27" value="${user.soDienThoai}" disabled>

						<p style="line-height: 2;">Địa chỉ(số nhà, đường, tỉnh thành)
						</p>
						<textarea class="form-control"  style="font-size: medium;"id="diaChiAcc" rows="5" cols="29" >${user.diaChi}</textarea>
						<br>
						<br>
					</div>

					<div class="col-md-3" style="width: 30%" >
						<br>	
						<p class="border-p" style="line-height: 1.8;font-size: 20px;">
							
							<form id="myForm">
							
							<b>Thông tin khách hàng</b>

						</p>

						<p style="line-height: 2;">Họ tên người nhận*</p>
						
						<input class="form-control"  style="font-size: medium;" id="hoTenNguoiNhanHang" size="27" value="${user.hoTen}" name="hoTenNguoiNhan" required >

						<label
							id="phoneWarning" style="color: red"></label>
						<p style="line-height: 2;">Số điện thoại nhận hàng*</p>
<input class="form-control" onkeyup="checkPhoneNumber(this.value)"  style="font-size: medium;" id="soDienThoaiNguoiNhanHang" size="27" value="${user.soDienThoai}" name="sdtNhanHang" required>


						<p style="line-height: 2;">Địa chỉ nhận hàng(số nhà, đường, tỉnh thành)*</p>
						<textarea class="form-control"  style="font-size: medium;" id="diaChiNguoiNhanHang" rows="5" cols="29" name="diaChiNhan" required>${user.diaChi}</textarea>
                     </form>

						<br>
						<br> <input  type="hidden" id="tongGiaTri" name="tongGiaTri">
					</div>

					<div class="col-md-6" style="width: 70%">
						<br>
						<p class="border-p" style="line-height: 1.8;font-size: 20px;">
							<b>Giỏ hàng</b>
						</p>
						<br>

						<table class="table-cart-checkout mytable">
							<tr>
								<th>Ảnh</th>
								<th>Tên sản phẩm</th>
								<th>Đơn giá</th>
								<th>Tổng</th>
							</tr>
							<c:forEach items="${cart}" var="sanpham">

								<tr style="text-align: center;">
									<td><img src="/swispshop/img/${sanpham.id}.png"
										alt="not found img" class="img-reponsive fix-size-img">
									</td>
									<td style="color: #222222">${sanpham.tenSanPham}</td>

									<td class="donGia">
										<div class="check " style="display: inline-block;">${sanpham.donGia}</div>
										<div style="display: inline-block;">x
											${quanity[sanpham.id]}</div>
									</td>

									<td>

										<div class="total">${sanpham.donGia*quanity[sanpham.id]}</div>
									</td>
								</tr>
							</c:forEach>
							<c:forEach items="${cartNew}" var="sanpham">

								<tr style="text-align: center;">
									<td><img src="/swispshop/img/${sanpham.id}.png"
										alt="not found img" class="img-reponsive fix-size-img">
									</td>
									<td style="color: #222222">${sanpham.tenSanPham}</td>

									<td class="donGia">
										<div class="check " style="display: inline-block;">${sanpham.donGia}</div>
										<div style="display: inline-block;">x
											${quanityNew[sanpham.id]}</div>
									</td>

									<td>
										<div class="total">${sanpham.donGia*quanityNew[sanpham.id]}</div>
									</td>
								</tr>
							</c:forEach>
						</table>


						<br>
						<p>
							Tổng giá trị đơn hàng: <b id="ordertotal"> </b>
						</p>
						<br><a
							href="<%=request.getContextPath()%>/cart" class="return-cart-btn ck-btn">Quay lại giỏ hàng</a> &nbsp; <span style="color: #9b3651;">&#9770</span> &nbsp;

						<button class="purchase-btn ck-btn pull-center" type="submit"
							id="submit">Gửi đơn hàng</button>

						<br>
						<br>

					</div>
				</c:if>
				<c:if test="${pageContext.request.userPrincipal.name == null}">
	<h1 style="font-size: 40px; color: red; text-align: center;font-family:cursive;margin-bottom: 10px;">Vui lòng đăng nhập để thanh toán</h1>
	<img alt="" src="http://quanggom.vn/wp-content/uploads/2018/04/banner2a.jpg">
	 <script type="text/javascript"  >
$(document).ready(function() { 
		Swal.fire({
			  icon: 'warning',
title: 'VUI LÒNG ĐĂNG NHẬP VÀ QUAY LẠI GIỎ HÀNG',
background: '#fff',
			  text: 'NHẤN OK ĐỂ ĐÓNG',
			  footer: '<a href="http://localhost:8080/swispshop/login" style="color: #32CD32; font-size: 20px"><b>ĐĂNG NHẬP</b></a>'
			})
	  });
	</script> 
	</c:if>
	</div>
	</form>
</div>

<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="<c:url value='/js/client/checkoutAjax.js'/>" ></script>	
</body>
</html>