<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<script src="Frontend/js/jquery.min.js"></script>
<script src="Frontend/js/responsiveslides.min.js"></script>
<script src="js/client/accounting.js"></script>
<title>Thanh toán</title>
<style>
	.ctsp{
		padding: 10px 20px;
		background: #9b3651;
		color: #fff !important;
		border: 1px solid #9b3651;
		border-radius: 50px;
		transition: 0.25s;
		font-weight: bold;
		text-decoration: none;
		margin-top: 20px;
	}
	.ctsp:hover{
		color: #9b3651 !important;
		background: #fff;
		text-decoration: none;
	}
	.ctns{
		color: #a11e41;
		transition: 0.25s;
	}
	.ctns:hover{
		color: #ff4979;
		text-decoration: none;
	}
</style>
</head>

<script type="text/javascript">
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
</script>
<body>
	<br />
	<!----start-Header---->
	<div style="position: relative;z-index: 1"><jsp:include page="include/homeHeader.jsp"></jsp:include></div>
	<!----End-Header---->
	<br /><br /><br /><br /><br /><br />
	<div class="container">
		<div class="row">
			<div class="col-md-1"></div>
			<div style="margin-bottom: 30px;" class="col-md-10">
				<br>
				<c:if test="${fn:length(cartNew)+fn:length(cart)>0 }">
				<p>
					<b style="font-size: 28px;">QUÝ KHÁCH ĐÃ ĐẶT HÀNG THÀNH CÔNG</b>
				</p>
				<br>

				<p><b>Thông tin đơn hàng đã đặt:</b></p>
				<br>
				<p>
					<b>ID/Mã đơn hàng: </b> ${donhang.getId() }
				</p>
				<br>
				<p>
					<b>Họ tên người nhận hàng: </b> ${donhang.getHoTenNguoiNhan()}
				</p>
				<br>
				<p>
					<b>Số điện thoại nhận hàng: </b>${donhang.getSdtNhanHang()}</p>
				<br>
				<p>
					<b>Địa chỉ nhận hàng: </b>${donhang.getDiaChiNhan()}</p>
				<br>
				<p>
					<b>Ghi chú: </b>${donhang.getGhiChu() }
				</p>
				<br>
				<p>Vào lúc ${donhang.getNgayDatHang()} chúng tôi đã nhận được
					đơn đặt hàng với những sản phẩm như sau:</p>
				<br>



				<table class="table-cart-checkout mytable">
					<tr>
						<th>ID</th>
						<th>Ảnh</th>
						<th>Tên sản phẩm</th>
						<th>Đơn giá</th>
						<th>Tổng</th>
					</tr>
					<c:forEach items="${cart}" var="sanpham">

						<tr style="text-align: center;">
							<td style="color: #222222">${sanpham.id}</td>
							<td><img src="/swispshop/img/${sanpham.id}.png"
								alt="Not found img" class="img-reponsive fix-size-img"></td>
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
							<td style="color: #222222">${sanpham.id}</td>
							<td><img src="/swispshop/img/${sanpham.id}.png"
								alt="Not found img" class="img-reponsive fix-size-img"></td>
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
				<br>
				<p style="margin-bottom: 20px">Swisp Shop xin chân thành cảm ơn quý khách hàng đã tin tưởng
					sử dụng dịch vụ, sản phẩm của chúng tôi</p>
				<br> <a class="ctsp" href="<%=request.getContextPath()%>/">Quay lại trang chủ</a>
				</c:if>
				<c:if test="${fn:length(cartNew)+fn:length(cart)<=0 }">
					<br><br>
				<img alt="" src="https://gomsuthanhtam.com/userfile/config/BannerHome-5.jpg">
				<script type="text/javascript">	  
	                   $(document).ready(function() { 
		      Swal.fire({
			  icon: 'error',
              title: 'VUI LÒNG QUAY LẠI TRANG CHỦ ĐỂ MUA HÀNG',
			  text: 'NHẤN OK ĐỂ ĐÓNG',
			  background: '#fff',
			  footer: '<a class="ctns" href="http://localhost:8080/swispshop/" style="font-size: 20px"><b>TIẾP TỤC MUA HÀNG</b></a>'
			})
	  });
	</script> 
				</c:if>
				
			</div>
			<div class="col-md-1"></div>



		</div>


	</div>

	<!----start-Footder---->
	<jsp:include page="include/homeFooter.jsp"></jsp:include>
	<!----End-Footder---->
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="<c:url value='/js/client/checkoutAjax.js'/>"></script>
</body>
</html>
