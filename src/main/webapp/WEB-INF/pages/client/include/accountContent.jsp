<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<script src="<c:url value='/js/client/information.js'/>"></script>
<script src="<c:url value='/js/client/password.js'/>"></script>

<script type="text/javascript">

      
		
		function searchByStatus() {
			  var input, filter, table, tr, td, i;
			  input = document.getElementById("mylist");
			  filter = input.value.toUpperCase();
			  table = document.getElementById("myTable");
			  tr = table.getElementsByTagName("tr");
			  for (i = 0; i < tr.length; i++) {
			    td = tr[i].getElementsByTagName("td")[6];
			    if (td) {
			      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
			        tr[i].style.display = "";
			      } else {
			        tr[i].style.display = "none";
			      }
			    }       
			  }
			}
		function searchById() {
			  var input, filter, table, tr, td, i, txtValue;
			  input = document.getElementById("myInput");
			  filter = input.value.toUpperCase();
			  table = document.getElementById("myTable");
			  tr = table.getElementsByTagName("tr");
			  for (i = 0; i < tr.length; i++) {
			    td = tr[i].getElementsByTagName("td")[0];
			    if (td) {
			      txtValue = td.textContent || td.innerText;
			      if (txtValue.toUpperCase().indexOf(filter) > -1) {
			        tr[i].style.display = "";
			      } else {
			        tr[i].style.display = "none";
			      }
			    }       
			  }
			}
		function searchByDate() {
			  var input, filter, table, tr, td, i, txtValue;
			  input = document.getElementById("myDate");
			  filter = input.value.toUpperCase();
			  table = document.getElementById("myTable");
			  tr = table.getElementsByTagName("tr");
			  for (i = 0; i < tr.length; i++) {
			    td = tr[i].getElementsByTagName("td")[1];
			    if (td) {
			      txtValue = td.textContent || td.innerText;
			      if (txtValue.toUpperCase().indexOf(filter) > -1) {
			        tr[i].style.display = "";
			      } else {
			        tr[i].style.display = "none";
			      }
			    }       
			  }
			}
</script>
<body>

	<div class="container">
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-12">
				<br>
				<p style="font-size: 20px"><b>Thông tin tài khoản:</b></p>
				<br>
				<h3 style="line-height: 2;">
					<span style="font-weight: bold">Họ tên: </span>${user.getHoTen()}</h3>
				<h3 style="line-height: 2;">
					<span style="font-weight: bold">Số điện thoại: </span>${user.getSoDienThoai()}</h3>
				<h3 style="line-height: 2;">
					<span style="font-weight: bold">Email: </span>${user.getEmail()}</h3>
				<h3 style="line-height: 2;">
					<span style="font-weight: bold"> Địa chỉ: </span>${user.getDiaChi()}</h3>
				<br> <a style="padding: 5px 15px 8px 15px; background: #fff;border: 1px solid #9b3651;border-radius: 50px;color: #9b3651;cursor: pointer;text-decoration: none;font-weight: bold;" data-toggle="modal"
					data-target="#modalInformation">Cập nhật thông tin cá nhân</a>
				&nbsp;<a style="padding: 5px 15px 8px 15px; background: #9b3651;border: 1px solid #9b3651;border-radius: 50px;color: #fff;cursor: pointer;text-decoration: none;font-weight: bold;" data-toggle="modal"
					data-target="#modalChangePassword">Đổi mật khẩu</a> <br> <br>
				<br>
				<h1>
					<b style="font-size: 21px">Lịch sử mua hàng:</b>
				</h1>
				<p><h3>Lọc theo trạng thái</h3></p>
				<p>
				
			<select id="mylist" onchange="searchByStatus()" class='form-control'>
			<option value="">Tất cả</option>
<option value="Vui lòng đợi nhân viên xác nhận">Chờ xác nhận</option>
				<option value="Đang giao">Đang giao</option>
				<option value="Hoàn thành">Hoàn thành</option>
				<option value="Đã bị hủy">Đã bị hủy</option>
</select>
<p><h3>Tìm kiếm theo mã đơn hàng</h3></p>
			<input type="text" class='form-control' id="myInput" onkeyup="searchById()" placeholder="Nhập id đơn hàng">
				<p><h3>Tìm kiếm theo ngày mua hàng</h3></p>
				<div class="form-group">
				<input id="myDate" class="form-control" type="date" 
					onChange="searchByDate()">
			</div>
				
				<br>
				<table id="myTable" class="table-cart-checkout mytable">
					<tr>
						<th>Mã đơn hàng</th>
						<th>Ngày đặt</th>
						<th>Ngày xác nhận đơn hàng</th>
						<th>Ngày nhận hàng</th>
						<th>Sản phẩm</th>
						<th>Tổng tiền</th>
						<th>Trạng thái đơn hàng</th>
						<th>Hành động</th>
						
					</tr>

					<c:forEach var="donHang" items="${list}" varStatus="loop">
			
					
					
					
						<tr style="text-align: center;">
						
							<td>${donHang.id}</td>	
							<td>${donHang.ngayDatHang}</td>
							<td>${donHang.ngayGiaoHang}</td>
							<td>
							<c:if test='${(donHang.trangThaiDonHang == "Hoàn thành")}'> 
							 ${donHang.ngayNhanHang}
							 </c:if>
							</td>
							
                            
							<td><c:forEach var="chiTiet"
									items="${donHang.danhSachChiTiet}">
									<p>
									<a href='<c:url value="/sp?id=${chiTiet.sanPham.id}" />'>${chiTiet.sanPham.tenSanPham} </a>
									<br>
									</p>
									<c:set var="donGia"
												value=" ${chiTiet.sanPham.donGia}" />
									<p class="donGia">${chiTiet.sanPham.donGia}</p>	
										
									<c:choose>
										<c:when 
											test='${(donHang.trangThaiDonHang == "Đang chờ xác nhận khách mua" || donHang.trangThaiDonHang == "Đã bị hủy")}'>
											<p>Số lượng đặt: ${chiTiet.soLuongDat }</p>
											<hr>
											<c:set var="tongGiaTri"
												value="${tongGiaTri + chiTiet.soLuongDat*chiTiet.sanPham.donGia}" />
										</c:when>
										<c:otherwise >
											<p>Số lượng đặt: ${chiTiet.soLuongDat }</p>
											<p>Số lượng nhận: ${chiTiet.soLuongNhanHang }</p>
											<hr>
											<c:set var="tongGiaTri"
												value="${tongGiaTri + chiTiet.soLuongNhanHang*chiTiet.sanPham.donGia}" />
										</c:otherwise>
									</c:choose> 
								</c:forEach>
							
								
								</td>
							<td class="tongGiaTri">${tongGiaTri}</td>
							<c:remove var="tongGiaTri"/>
							<td>
							<c:choose>
										<c:when test='${(donHang.trangThaiDonHang == "Đang chờ xác nhận khách mua")}'>
							                Vui lòng đợi nhân viên xác nhận
							           </c:when>
							            <c:otherwise >
							           ${donHang.trangThaiDonHang}
							           </c:otherwise>
							</c:choose> 
							</td>
                            <td>
                            <c:if test='${(donHang.trangThaiDonHang == "Đang giao")}'> 
							<input class="donHangId hidden" type="text" value="${donHang.id}"/>                        
							<button class="btn btn-primary btnDaNhanHang">Đã nhận hàng </button>
                            </c:if>
                            <!-- <hr> -->
                            <input class="baoCaoId hidden" type="text" value="${donHang.id}"/>
                              <!-- <button type="button" class="btn btn-danger btnSuCo" >Báo cáo sự cố</button>                   -->
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="col-md-1"></div>
		</div>
	</div>
	
	 	
	
	
	
	
	<!-- Modal cập nhật thông tin -->
	<div class="modal fade" id="modalInformation" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header" style="display: grid;grid-template-columns: 0fr 10fr 0fr 0fr;">
					<h5 class="modal-title" id="exampleModalLabel">
						<b>Cập nhật thông tin tài khoản</b>
					</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div class="modal-body">
					<div class="form-group ">
						<label style="line-height: 2">Họ tên khách hàng*:</label><br>
						<label id="nameWarning" style="color: red"></label> <input
							class="form-control" id="name" name="name" type="text"
							value="${user.getHoTen()}">
					</div>
					<div class="form-group ">
						<label style="line-height: 2">Số điện thoại*:</label><br> <label
							id="phoneWarning" style="color: red"></label> <input
							class="form-control" id="phone" name="phone" type="text"
							value=${user.getSoDienThoai()}>
					</div>
					<div class="form-group">
						<label style="line-height: 2">Địa chỉ*:</label><br> <label
							id="addressWarning" style="color: red"></label>
						<textarea rows="3" cols="1" class="form-control" id="address">${user.getDiaChi()}</textarea>
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Hủy</button>
					<button type="button" class="btn btn-primary"
						onclick="changeInformation()">Cập nhật</button>
				</div>

			</div>
		</div>
	</div>

	<div class="modal fade" id="modalChangePassword" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header" style="display: grid;grid-template-columns: 0fr 10fr 0fr 0fr;">
					<h5 class="modal-title" id="exampleModalLabel">
						<b>Thay đổi mật khẩu</b>
					</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-group ">
						<label style="line-height: 2">Mật khẩu cũ*:</label><br> <label
							id="oldWarning" style="color: red"></label> <input
							class="form-control" id="old" name="old" type="password">
					</div>
					<div class="form-group ">
						<label style="line-height: 2">Mật khẩu mới*:</label><br> <label
							id="new1Warning" style="color: red"></label> <input
							class="form-control" id="new1" name="new1" type="password">
					</div>
					<div class="form-group ">
						<label style="line-height: 2">Xác nhận lại mật khẩu mới*:</label><br>
						<label id="new2Warning" style="color: red"></label> <input
							class="form-control" id="new2" name="new2" type="password">
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Hủy</button>
					<button type="button" class="btn btn-primary"
						onClick="changePass()">Đổi mật khẩu</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>