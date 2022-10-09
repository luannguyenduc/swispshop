<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>/* ==========================================
    FOR DEMO PURPOSE
  ========================================== */
.holder {
	background: #f0efe9;
	min-height: 100vh;
}

.rounded {
	border-radius: 1rem !important;
}

.text-gray {
	color: #aaa;
}

input:checked+label {
	text-decoration: line-through;
	color: #adb5bd;
}

label {
	cursor: pointer;
}

a {
	text-decoration: none;
}

.thongke {
	display: grid;
	grid-template-columns: auto auto auto;
	grid-row-gap: 15px !important;
}

.thongke1 {
	background-color: #6dabd0;
	width: 300px;
	height: 125px;
	border: 3px solid #345d74;
	-moz-border-radius: 10px;
	-webkit-border-radius: 10px;
	-ms-border-radius: 10px;
	-o-border-radius: 10px;
	border-radius: 10px;
}

.thongke2 {
	background-color: #71d8a9;;
	width: 300px;
	height: 125px;
	border: 3px solid #358662;
	-moz-border-radius: 10px;
	-webkit-border-radius: 10px;
	-ms-border-radius: 10px;
	-o-border-radius: 10px;
	border-radius: 10px;
}

.thongke3 {
	background-color: #dab77f;
	width: 300px;
	height: 125px;
	border: 3px solid #907243;
	-moz-border-radius: 10px;
	-webkit-border-radius: 10px;
	-ms-border-radius: 10px;
	-o-border-radius: 10px;
	border-radius: 10px;
}

.thongke4 {
	background-color: #d08585;
	width: 300px;
	height: 125px;
	border: 3px solid #8d4949;
	-moz-border-radius: 10px;
	-webkit-border-radius: 10px;
	-ms-border-radius: 10px;
	-o-border-radius: 10px;
	border-radius: 10px;
}

.thongke5 {
	background-color: #b285d0;
	width: 300px;
	height: 125px;
	border: 3px solid #734b8e;
	-moz-border-radius: 10px;
	-webkit-border-radius: 10px;
	-ms-border-radius: 10px;
	-o-border-radius: 10px;
	border-radius: 10px;
}

.text {
	text-align: center;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 18px;
	color: #000000;
	letter-spacing: .1em;
	padding: 10px;
	height: 80px;
}

.soluong {
	width: 100%;
	text-align: center;
	font-size: 20px;
}

</style>

<div class="col-md-9 animated bounce">
	<script type="text/javascript">
	function formatDollar(num) {
		var p = num.toFixed(2).split(".");
		return p[0].split("").reverse().reduce(function(acc, num, i, orig) {
			return num + (num != "-" && i && !(i % 3) ? "," : "") + acc;
		}, "") + "." + p[1];
	}
		function getDateTime() {
			var now = new Date();
			var year = now.getFullYear();
			var month = now.getMonth() + 1;
			var day = now.getDate();
			var hour = now.getHours();
			var minute = now.getMinutes();
			var second = now.getSeconds();//
			var a=0;
			$.ajax({
				type:"GET",
				url:"http://localhost:8080/swispshop/api/queries/tongDoanhThuThang",
				success:function(data){
					document.getElementById("doanhThu").innerText=formatDollar(data);
			}
			
			})
			$.ajax({
				type:"GET",
				url:"http://localhost:8080/swispshop/api/queries/tongSoLuongNhanVien",
				success:function(data){
					document.getElementById("soLuongNV").innerText=data;
			}
			
			})
			$.ajax({
				type:"GET",
				url:"http://localhost:8080/swispshop/api/queries/tongSoLuongMatHang",
				success:function(data){
					document.getElementById("soLuongMH").innerText=data;
			}
			
			})
			$.ajax({
				type:"GET",
				url:"http://localhost:8080/swispshop/api/queries/tongDoanhThuTheoNgay",
				success:function(data){
					document.getElementById("doanhThuNgay").innerText=formatDollar(data);
			}
			
			})
			$.ajax({
				type:"GET",
				url:"http://localhost:8080/swispshop/api/queries/sodonhoanthanh",
				success:function(data){
					document.getElementById("donhoanthanh").innerText=(data);
			}
			
			})
			
			//
			if (month.toString().length == 1) {
				month = '0' + month;
			}
			if (day.toString().length == 1) {
				day = '0' + day;
			}
			if (hour.toString().length == 1) {
				hour = '0' + hour;
			}
			if (minute.toString().length == 1) {
				minute = '0' + minute;
			}
			if (second.toString().length == 1) {
				second = '0' + second;
			}
			var dateTime = year + '/' + month + '/' + day + ' ' + hour + ':'
					+ minute + ':' + second;
			return dateTime;
		}
		setInterval(function() {
			currentTime = getDateTime();
			document.getElementById("digital-clock").innerHTML = currentTime;
		}, 1000);

		var date = new Date();

		var current_day = date.getDay();

		var day_name = '';

		switch (current_day) {
		case 0:
			day_name = "Chủ nhật";
			break;
		case 1:
			day_name = "Thứ hai";
			break;
		case 2:
			day_name = "Thứ ba";
			break;
		case 3:
			day_name = "Thứ tư";
			break;
		case 4:
			day_name = "Thứ năm";
			break;
		case 5:
			day_name = "Thứ sáu";
			break;
		case 6:
			day_name = "Thứ bảy";
		}
		setInterval(
				function() {
					$("#here").load(window.location.href + " #here");
					$("#lienHeMoi").load(window.location.href + " #lienHeMoi");
					$("#donHangMoi")
							.load(window.location.href + " #donHangMoi");
					if (parseInt(document.getElementById("list").innerHTML) < parseInt(document
							.getElementById("listCurrent").innerHTML)) {
Swal.fire('Bạn có thông báo mới!', 'Nhấn "Ok" để hủy',
								'warning')
						$("#here1").load(window.location.href + " #here1");

					}

				}, 10000);

		
	</script>
	<div class="d-flex align-items-center mb-4 pb-4 border-bottom">
		<div class="ms-3">
			<img alt="" src="Frontend/img/lich.png"">
			<h2 class="text-uppercase fw-weight-bold mb-0">
				<script language="javascript">
					document.write(day_name);
				</script>
			</h2>
			<p class="text-gray fst-italic mb-0">
			<div id="digital-clock"></div>
			</p>
		</div>
	</div>



	<h2 class="page-header" style="margin-top: 20px;">Danh sách công việc</h2>
	<p style="font-size: 26px">Bạn có:
	<p>
	<ul class="list-group">
			<c:if test="${listCongViec.soLienHeMoi > 0}">
			<li
				class="list-group-item d-flex justify-content-between align-items-center"
				id="lienHeMoi"><img alt="" src="Frontend/img/lienhe.png"
				style="margin-right: 10px;"> <a
				href='<c:url value="/admin/lien-he" />'
				style="font-size: 20px; font-family: 'auto'; color: #286090"> <b>
						Liên hệ mới</b></a> <span
				style="font-size: 18px; font-family: Arial, Helvetica, sans-serif; background-color: #740025;margin-top: 3.5px;padding-top: 5px;"
				class="badge bg-primary rounded-pill">
					${listCongViec.soLienHeMoi}</span></li>
		</c:if>
	</ul>
	<div class="thongke">
		<div class="thongke1">
			<div class="text">Doanh thu tháng này (VND)</div>

			<div>
				<!-- <img src="Frontend/img/money.png" alt="" style="margin-top: 15px;"> -->
			</div>

			<div class="soluong">
				<b id="doanhThu"></b>
			</div>
		</div>
		<div class="thongke2">
			<div class="text">Số lượng nhân viên</div>

			<div>
				<!-- <img src="Frontend/img/user.png" alt=""> -->
			</div>
			<div class="soluong">
				<b id="soLuongNV"></b>
			</div>
		</div>
		<div class="thongke3">
			<div class="text">Số lượng mặt hàng hiện có</div>

			<div>
				<!-- <img src="Frontend/img/product.png" alt=""> -->
			</div>
			<div class="soluong">
				<b id="soLuongMH"></b>
			</div>

		</div>
		<div class="thongke4">
			<div class="text">Doanh thu trong ngày (VND)</div>

			<div>
				<!-- <img src="Frontend/img/guarantee.png" alt=""> -->
			</div>
			<div class="soluong">
				<b id="doanhThuNgay"></b>
			</div>

		</div>
		<!-- <div class="hihi"> -->
			<div class="thongke5">
				<div class="text">Số đơn hàng hoàn thành trong ngày</div>
	
				<div>
					<!-- <img src="Frontend/img/shopping_cart.png" alt=""> -->
				</div>
				<div class="soluong">
					<b id="donhoanthanh"></b>
				</div>
	
			</div>
	
		<!-- </div> -->
	</div>
	




</div>
