<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Quản lý Đơn hàng</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style>
.form-chiTiet input {
	border: 0;
}
</style>
</head>
<body>

	<jsp:include page="template/header.jsp"></jsp:include>
	<jsp:include page="template/sidebar.jsp"></jsp:include>

	<div class="col-md-9 animated bounce">
		<h3 class="page-header form-inline">Quản lý Đơn hàng - Employee</h3>
		<form class="form-inline" id="searchForm" name="searchObject">
			<input id="idEmployee" type="hidden" value="${loggedInUser.id }">
			<select class="form-control" id="trangThai">		
			    <option value="Đang chờ xác nhận khách mua">Đang chờ xác nhận khách mua</option>
				<option value="Đang giao">Đang giao</option>
				<option value="Hoàn thành">Hoàn thành</option>
				<option value="Đã bị hủy">Đã bị hủy</option>
			</select>

			<div class="form-group">
				<input class="form-control" type="text" id="fromDate"
					placeholder="Từ ngày">
			</div>

			<div class="form-group">
				<input class="form-control" type="text" id="toDate"
					placeholder="Đến ngày">
			</div>
			&nbsp;&nbsp; &nbsp;&nbsp;
			<button type="button" class="btn btn-primary" id="btnDuyetDonHang">Duyệt
				Đơn</button>
			<div class="form-group" style="float: right; margin-right: 20px">
				<input class="form-control" type="number" id="searchById"
					placeholder="Nhập mã để tìm nhanh"> <span
					class="glyphicon glyphicon-search" aria-hidden="true"
					style="left: -30px; top: 4px"></span>
			</div>
		</form>
		<hr>
		
	
		<div class="col-md-2" >
    <a class="btn btn-default" id="export-btn" style="background-color:#008000;color: white;">Xuất Excel</a>
  </div><br>
		<table class="table table-hover donHangTable" id="resultsTable"
			style="text-align: center;margin-top: 20px;">
			<thead>
				<tr>
					<th>Mã</th>
					<th>Người nhận</th>
					<th>Số điện thoại</th>
					<th>Trạng thái</th>
					<th>Giá trị</th>
					<th id="date1"></th>
					
					<th id="date3"></th>
				</tr>
			</thead>
			<tbody>
			
			</tbody>
    <p hidden id="intro">${fn:length(employee.listDonHang)}</p>

		</table>

		<ul class="pagination">
		</ul>
	</div>
	<div class="row col-md-6">
		<form class="chiTietForm">
			<div class="modal fade" id="chiTietModal" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog " role="document">
					<div class="modal-content">
						<div class="modal-header" style="display: grid;grid-template-columns: 10fr 0fr;">
							<p class="h4 modal-title" id="maDonHang"></p>
							<button type="button" class="close" data-dismiss="modal"
aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<div class="row">
								<div class="col-12">
									<div class="card" style="padding: 10px 40px">
										<div class="row pb-5 p-5">
											<div class="col-md-6">
												<h5 class="font-weight-bold mb-4">
													<strong>Thông tin khách</strong>
												</h5>
												<p class="mb-1" id="hoTenNguoiNhan"></p>
												<p class="mb-1" id="diaChiNhan"></p>
												<p class="mb-1" id="sdtNhanHang"></p>
											</div>

											<div class="col-md-6 text-right"
												style="padding-left: 65px; text-align: left">
												<h5 class="font-weight-bold mb-4">
													<strong>Thông tin đơn hàng</strong>
												</h5>
												<p class="mb-1" id="trangThaiDonHang"></p>
												<p class="mb-1" id="ngayDatHang"></p>
												<p class="mb-1" id="ngayShipHang"></p>
												<p class="mb-1" id="ngayNhanHang"></p>
											</div>
										</div>
										<hr />
										<div class="row p-5">
											<div class="col-md-12">
												<table class="table chiTietTable"
													style="text-align: center;">
													<thead>
														<tr>
															<th
																class="border-0 text-uppercase small font-weight-bold">STT</th>
															<th
																class="border-0 text-uppercase small font-weight-bold">Tên
																sản phẩm</th>
															<th
																class="border-0 text-uppercase small font-weight-bold">Đơn
																giá</th>
															<th
																class="border-0 text-uppercase small font-weight-bold">Số
																lượng đặt</th>

																
														</tr>
													</thead>
													<tbody>
													</tbody>
												</table>
											</div>
										</div>

										<div class="d-flex flex-row-reverse bg-dark text-white p-4">
											<div class="py-3 px-5 text-right">
												<div class="mb-2">
													<p id="tongTienCapNhat2"></p>
												</div>
											</div>
										</div>
										<hr />

										<div class="col-md-6" >
											<h5 class="font-weight-bold mb-4">
												<strong>Thông tin khác</strong>
											</h5>
											<p class="mb-1" id="employee"></p>
											
											<p class="mb-1" id="ghiChu"></p>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div   class="container" id="modalId" style="
    padding-left: 90px;
" hidden>
   
    <div class="container" >
        <div class="row">
            <div class="col-md-6  body-main">
<div class="col-md-12">
                    <div class="row">
                    
                        <div style="font-family:inherit;" class="col-md-8 text-left">
                            <p>Swisp Shop</p>
                            <p>SĐT: 0995625354</p>
                            <p>Địa chỉ: 22 Hồ Tùng Mậu - Mai Dịch - Cầu Giấy - Hà Nội</p>
                        </div>
                     <div class="col-md-4 text-right">
                        <img style="width: 150px" alt="" src="${ pageContext.request.contextPath }/Frontend/img/logo_ss.png">
                        </div> 
                    </div> <br />
                    <div class="row">
                        <div class="col-md-12 text-center">
                            <h2>HÓA ĐƠN BÁN HÀNG</h2>
                            <h5 style="color: red;"><p class="h4 modal-title" id="maDonHangHoaDon"></p></h5>
                            
                        </div>
                        <div class="col-md-8 text-left">
                        <b style="font-size: 18px">Thông tin khách hàng</b>
												
							<p  id="hoTenNguoiNhanHoaDon"></p>
							<p  id="diaChiNhanHoaDon"></p>
							<p  id="sdtNhanHangHoaDon"></p>
							</div>
                    </div> <br />
                    <div>
                       <table class="table chiTietTable"
													style="text-align: center;">
													<thead>
														<tr>
															<th
																class="border-0 text-uppercase small font-weight-bold">STT</th>
															<th
																class="border-0 text-uppercase small font-weight-bold">Tên
																sản phẩm</th>
															<th
																class="border-0 text-uppercase small font-weight-bold">Đơn
																giá</th>
															<th
																class="border-0 text-uppercase small font-weight-bold">Số Lượng Đặt</th>
																
														</tr>
													</thead>
													<tbody>
													</tbody>
												</table>
												<div class="d-flex flex-row-reverse bg-dark text-white p-4">
											<div class="py-3 px-5 text-right">
												<div class="mb-2">
													<p id="tongTienHoaDon"><b>VND</b></p>
												</div>
											
										</div>
										
                    </div>
                    <div>
                        <div class="col-md-12">
                           <p class="mb-1" id="ngayDatHang"></p>
                            <p><b>NGƯỜI MUA HÀNG</b> <b style="padding-left: 180px;">NHÂN VIÊN GIAO HÀNG</b></p>
                            <p><b style="margin-left: 20px">(Ký rõ họ tên)</b> <b style="padding-left: 230px;">(Ký rõ họ tên)</b></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div></div>
						<div class="modal-footer">
						<button type="button" class="btn btn-warning"
								 id="exportPDFbyId">Xuất PDF</button>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Đóng</button>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
<div class="row col-md-6">
		<form class="chiTietForm">
			<div class="modal fade" id="chiTietModal" tabindex="-1" role="dialog"
aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog " role="document">
					<div class="modal-content">
						<div class="modal-header" style="display: grid;grid-template-columns: 10fr 0fr;">
							<p class="h4 modal-title" id="maDonHang"></p>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<div class="row">
								<div class="col-12">
									<div class="card" style="padding: 10px 40px">
										<div class="row pb-5 p-5">
											<div class="col-md-6">
												<h5 class="font-weight-bold mb-4">
													<strong>Thông tin khách</strong>
												</h5>
												<p class="mb-1" id="hoTenNguoiNhan"></p>
												<p class="mb-1" id="diaChiNhan"></p>
												<p class="mb-1" id="sdtNhanHang"></p>
											</div>

											<div class="col-md-6 text-right"
												style="padding-left: 65px; text-align: left">
												<h5 class="font-weight-bold mb-4">
													<strong>Thông tin đơn hàng</strong>
												</h5>
												<p class="mb-1" id="trangThaiDonHang"></p>
												<p class="mb-1" id="ngayDatHang"></p>
												<p class="mb-1" id="ngayShipHang"></p>
												<p class="mb-1" id="ngayNhanHang"></p>
											</div>
										</div>
										<hr />
										<div class="row p-5">
											<div class="col-md-12">
												<table class="table chiTietTablexacNhanKhach"
													style="text-align: center;">
													<thead>
														<tr>
															<th
																class="border-0 text-uppercase small font-weight-bold">STT</th>
															<th
																class="border-0 text-uppercase small font-weight-bold">Tên
																sản phẩm</th>
															<th
																class="border-0 text-uppercase small font-weight-bold">Đơn
																giá</th>
															<th
																class="border-0 text-uppercase small font-weight-bold">Số
																lượng đặt</th>
<!-- 															<th
																class="border-0 text-uppercase small font-weight-bold">Số
																lượng nhận</th> -->
														</tr>
													</thead>
													<tbody>
													</tbody>
												</table>
											</div>
										</div>

										<div class="d-flex flex-row-reverse bg-dark text-white p-4">
											<div class="py-3 px-5 text-right">
												<div class="mb-2">
													<p id="tongTien"></p>
												</div>
											</div>
										</div>
										<hr />

										<div class="col-md-6" >
											<h5 class="font-weight-bold mb-4">
												<strong>Thông tin khác1</strong>
											</h5>
											<p class="mb-1" id="employee"></p>
											
											<p class="mb-1" id="ghiChu"></p>
										</div>
									</div>
								</div>
							</div>
						</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"
        integrity="sha512-GsLlZN/3F2ErC5ifS5QtgpiJtWd43JWSuIgh7mbzZ8zBps+dvLusV+eNQATqgA/HdeKFVgA5v3S/cIrLF7QnIg=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
						
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Đóng</button>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	<div class="row col-md-6">
		<form class="capNhatTrangThaiForm" id="form">
			<div>
				<div class="modal fade" id="capNhatTrangThaiModal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true" data-backdrop="static" data-keyboard="false">
					<div class="modal-dialog modal-lg" role="document">
						<div class="modal-content">
							<div class="modal-header" style="display: grid;grid-template-columns: 10fr 0fr;">
								<h3 class="modal-title" id="exampleModalLabel">Xác nhận khách nhận hàng</h3>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<div class="form-group">
									<input type="hidden" id="donHangId" value="">
								</div>
								<div class="form-group">
									<div class="col-md-12">
										<table class="table chiTietCapNhatTable"
											style="text-align: center;">
											<thead>
												<tr>
													<th class="border-0 text-uppercase small font-weight-bold">STT</th>
													<th class="border-0 text-uppercase small font-weight-bold">Tên
														sản phẩm</th>
													<th class="border-0 text-uppercase small font-weight-bold">Đơn
														giá</th>
													<th class="border-0 text-uppercase small font-weight-bold">Số
														lượng khách yêu cầu</th>
													<th class="border-0 text-uppercase small font-weight-bold">Số
														lượng nhận</th>
												</tr>
											</thead>
											<tbody>
											</tbody>
										</table>
										<h4 id="tongTienCapNhat2"
											style="float: right; font-weight: bold;padding-right: 50px"></h4>
									</div>

									<div>
									<h4>Cập nhật trạng thái</h4>
         <input type="hidden" id="donHangId" value="">
        <label><input checked type="radio" value="Hoàn thành" name="status1"> Hoàn thành</label>
        <label style="margin-left: 10px;"><input type="radio" value="Hủy đơn hàng" name="status1"> Hủy đơn hàng</label>
										<h5 id="ghiChu" style="font-weight: bold; padding-top: 10px">Ghi
											chú</h5>
										<textarea rows="3" cols="117" id="ghiChuEmployee"></textarea>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">Hủy</button>
									<input class="btn btn-primary" id="btnXacNhan" type="button"
										value="Xác nhận" />
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	
	
	
	
	
	
		<div class="row col-md-6">
		<form class="xacNhanKhachMuaForm" id="form">
			<div>
				<div class="modal fade" id="xacNhanKhachMuaModal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
aria-hidden="true" data-backdrop="static" data-keyboard="false">
					<div class="modal-dialog modal-lg" role="document">
						<div class="modal-content">
							<div class="modal-header" style="display: grid;grid-template-columns: 10fr 0fr;">
								<h3 class="modal-title" id="exampleModalLabel">Xác nhận khách mua hàng</h3>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<div class="form-group">
									<input type="hidden" id="donHangId" value="">
								</div>
								<div class="form-group">
									<div class="col-md-12">
										<table class="table chiTietCapNhatTablexacNhanKhach"
											style="text-align: center;">
											<thead>
												<tr>
													<th class="border-0 text-uppercase small font-weight-bold">STT</th>
													<th class="border-0 text-uppercase small font-weight-bold">Tên
														sản phẩm</th>
													<th class="border-0 text-uppercase small font-weight-bold">Đơn
														giá</th>
													<th class="border-0 text-uppercase small font-weight-bold">Số
														lượng đặt</th>
													 <th class="border-0 text-uppercase small font-weight-bold">Số
														lượng khách yêu cầu</th>  
														<th class="border-0 text-uppercase small font-weight-bold"></th> 
														<th class="border-0 text-uppercase small font-weight-bold"></th> 
														 
														<th class="border-0 text-uppercase small font-weight-bold">Mã SP</th> 
												</tr>
											</thead>
											<tbody>
											</tbody>
										</table>
										<h4 id="tongTienCapNhat1"
											style="float: right; font-weight: bold;padding-right: 50px"></h4>
									</div>

									<div>
									
									<h4>Cập nhật trạng thái</h4>
								

<input type="hidden" id="donHangId" value="">
        <label><input checked type="radio" value="Xác nhận thành công" name="status"> Xác nhận thành công</label>
        <label style="margin-left: 10px;"><input type="radio" value="Hủy đơn hàng" name="status"> Hủy đơn hàng</label>


                                    <h5 id="ghiChu" style="font-weight: bold; padding-top: 10px">Ghi
											chú</h5>
										<textarea rows="3" cols="117" id="ghiChuEmployeeXacNhan"></textarea>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">Hủy</button>
									<input class="btn btn-primary" id="btnXacNhanTrangThai" type="button"
										value="Xác nhận" />
										
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>

	</div>

	<jsp:include page="template/footer.jsp"></jsp:include>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	<script type="text/javascript">
		$(function() {
			
			if (${param.trangThai != null}){
				$("#trangThai").val('${param.trangThai}');
 				console.log('${param.trangThai}'); 
			};
			
			var from = $("#fromDate").datepicker({
				dateFormat : "dd-mm-yy",
				changeMonth : true
			}).on("change", function() {
				to.datepicker("option", "minDate", getDate(this));
			}), to = $("#toDate").datepicker({
				dateFormat : "dd-mm-yy",
changeMonth : true
			}).on("change", function() {
				from.datepicker("option", "maxDate", getDate(this));
			});

			function getDate(element) {
				var date;
				var dateFormat = "dd-mm-yy";
				try {
					date = $.datepicker.parseDate(dateFormat, element.value);
				} catch (error) {
					date = null;
				}

				return date;
			}
		});
		
		
	</script>
	
<script src="//cdn.rawgit.com/rainabba/jquery-table2excel/1.1.0/dist/jquery.table2excel.min.js"></script>
	<script src="<c:url value='/js/employee/donHangEmployeeAjax.js'/>"></script>
</body>
</html>
