<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="Frontend/css/cartTable.css">
<style>
html
{
    font-size: 100%;
}
.btn-cart{
	padding: 8px 15px;
	border: #9b3651 1px solid;
	transition: 0.25s;
	border-radius: 5px;
	font-weight: bold;
}
.btn-cart:hover{
	text-decoration: none;

}
.buy-more-btn{
	color: #9b3651;
}
.buy-more-btn:focus{
	color: #9b3651;
	text-decoration: none;
}
.checkout-btn{
	color: #fff;
	background: #9b3651;
}
.checkout-btn:focus{
	color: #fff;
	text-decoration: none;
}
.buy-more-btn:hover{
	color: #fff;
	background: #9b3651;
}
.checkout-btn:hover{
	color: #9b3651;
	background: #fff;
}
</style>
</head>

<script type="text/javascript">	  
function showAlert(id){$("#errorQua"+ id).show();}

	$(document).ready(function() { 
		
		 $(".table-convert-price .covertPriceProduct ").each(function() {
			  var value = accounting.formatMoney($(this).text())+ ' VND';
			  $(this).html(value);
			});
		 $(".table-convert-price .total ").each(function() {
			  var value = accounting.formatMoney($(this).text());
			  $(this).html(value);
			});
		 $(".table-convert-price  .covertPriceProductNew").each(function() {
			  var value = accounting.formatMoney($(this).text())+ ' VND';
			  $(this).html(value);
			});
		 $(".table-convert-price  .totalNew").each(function() {
			  var value = accounting.formatMoney($(this).text());
			  $(this).html(value);
			});
	  });
	</script>

<body>
	<br /><br /><br /><br /><br /><br />
<br>
<br>
<div class="container" id="ctn">
  <div class="row">
  <h2 style="font-weight: bold;font-size: 22px;"><span class="glyphicon glyphicon-shopping-cart"></span>&nbsp; GIỎ HÀNG</h2> <br>
  <div class="col-10">
  <table class="table-cart-checkout mytable table-convert-price" id="table-cart">
 <tr>
		<td>STT</td>
		<td>Ảnh</td>
		<td>Tên sản phẩm</td>
		<td>Đơn giá</td>
		<td>Số lượng</td>
		<td>Tổng</td>
		<td>Xóa</td>
</tr>
<input  id="lengthCartNew"  hidden type="number" value="${fn:length(cartNew)}" >
<c:forEach var="sanpham" items="${cartOld}" varStatus="loop">			
<tr class="cart_line" id="item${sanpham.id}">
		<div>
		<td>${loop.index+1}</td>
		<td><img src="/swispshop/img/${sanpham.id}.png" style="width: 150px" class="cart-img"></td>
		<td style="text-align: center;">
			<p class="cart_ten"><a href="<c:url value="/sp?id=${sanpham.id}" />"><span>${sanpham.tenSanPham}</span></a></p>
			<p class="cart_masanpham">Mã sản phẩm: <span>${sanpham.id}</span></p>
			<p class="">Bảo hành: ${sanpham.thongTinBaoHanh}</p>
		</td>
		<td class="covertPriceProduct">${sanpham.donGia}</td>
		<td>
		
		<c:if test="${fn:length(cartNew)==0 }">
		
		<input id="soLuongSp${sanpham.id}" class="input_num_cart" 
        type="number" value="${quanity[sanpham.id]}" 
			min="1" max ="20" onchange="changeQuanity(${sanpham.id},this.value,${sanpham.donGia})"
			<%-- onkeyUp="changeQuanity(${sanpham.id},this.value,${sanpham.donGia})" --%>
			>
			<input id="soLuongKho${sanpham.id}" type="hidden" value="${sanpham.soLuong}" />			
			<div  style="display: none;color: red;" id="errorQua${sanpham.id}" >
			Hiện tại sản phẩm này có thể không đủ số lượng yêu cầu!!!</div>
			 <c:if test="${quanity[sanpham.id]>sanpham.soLuong}">
<script type="text/javascript">
	       showAlert(${sanpham.id});
	     </script>
	     </c:if>
		</c:if>
		<c:if test="${fn:length(cartNew)>0 }">
		<c:forEach var="sanpham1" items="${cartNew}" varStatus="loop">
			<c:if test="${sanpham.id eq sanpham1.id }">
			<c:set var="ID01" value="${sanpham.id}" /> 
			<c:set var="quanity02" value="${quanityNew[sanpham1.id]}" /> 
			</c:if>
			
		</c:forEach>
			
		
		<c:if test="${quanity02>0 &&  sanpham.id == ID01}">	
					
		 <input id="inputQuanity"
		 <c:if test="${quanity[sanpham.id]+ quanity02 >=20}">
        <c:out value="value=${20 - quanity02}"/></c:if>
max =${20 - quanity02}
		 id="soLuongSp${sanpham.id}"class="input_num_cart" 
         type="number" value="${quanity[sanpham.id]}" 
	     min="1" onChange="changeQuanity(${sanpham.id},this.value,${sanpham.donGia})"
	    <%--  onkeyUp="changeQuanity(${sanpham.id},this.value,${sanpham.donGia})" --%>
	     > 		
	     <c:set var="soLuongKho" value="${sanpham.soLuong}" /> 	
	     <input id="soLuongKho${sanpham.id}" type="hidden" value="${sanpham.soLuong}" />
	     <div  style="display: none;color: red;" id="errorQua${sanpham.id}">
	     Hiện tại sản phẩm này có thể không đủ số lượng yêu cầu!!!</div>
	     <c:if test="${quanity[sanpham.id]>sanpham.soLuong}">
	     <script type="text/javascript">
	       showAlert(${sanpham.id});
	     </script>
	     </c:if>
		</c:if>
		<c:if test="${sanpham.id != ID01}">
		 <input id="soLuongSp${sanpham.id}"class="input_num_cart" 
          type="number" value="${quanity[sanpham.id]}" 
			min="1" max ="20" onChange="changeQuanity(${sanpham.id},this.value,${sanpham.donGia})"
			<%-- onkeyUp="changeQuanity(${sanpham.id},this.value,${sanpham.donGia})" --%>
			> 
			<c:set var="soLuongKho" value="${sanpham.soLuong}" /> 
			<input id="soLuongKho${sanpham.id}" type="hidden" value="${sanpham.soLuong}" />			
			<div  style="display: none;color: red;" id="errorQua${sanpham.id}" >
			Hiện tại sản phẩm này có thể không đủ số lượng yêu cầu!!!</div>
			 <c:if test="${quanity[sanpham.id]>sanpham.soLuong}">
	     <script type="text/javascript">
	       showAlert(${sanpham.id});
	     </script>
	     </c:if>
		
		</c:if>
		</c:if>	
		
		
		
		</td>
		<td><b><span class="total" id="item${sanpham.id}_total" name="total_price">${sanpham.donGia*quanity[sanpham.id]}</span> VND</b></td>
		<td class="cart-img">
			<a style="padding: 10px 12px !important;" class="btn btn-danger" onClick="deleteFromCart(${sanpham.id})"><span class="glyphicon glyphicon-trash"></span></a>
		</td>
		</div>
	
</tr>
</c:forEach>
<c:if test="${fn:length(cartNew)>0 }">
<td colspan="7"><b style="color: #ff7272; ">THÊM VÀO TRƯỚC KHI ĐĂNG NHẬP</b></td>
<tr>
		<td>STT</td>
		<td>Ảnh</td>
		<td>Tên sản phẩm</td>
		<td>Đơn giá</td>
		<td>Số lượng</td>
		<td>Tổng</td>
		<td>Xóa</td>
</tr>
</c:if> 
 
<c:forEach var="sanpham" items="${cartNew}" varStatus="loop">		
<tr class="cart_line" id="itemNew${sanpham.id}">

<div>
		<td>${loop.index+1}</td>
<td><img src="/swispshop/img/${sanpham.id}.png" style="width: 150px" class="cart-img"></td>
		<td style="text-align: center;">
		<!-- <h1>THÊM VÀO TRƯỚC KHI ĐĂNG NHẬP</h1>	 -->
			<p class="cart_ten"><a href="<c:url value="/sp?id=${sanpham.id}" />"><span>${sanpham.tenSanPham}</span></a></p>
			<p class="cart_masanpham">Mã sản phẩm: <span>${sanpham.id}</span></p>
			<p class="">Bảo hành: ${sanpham.thongTinBaoHanh}</p>
		</td>
		<td class="covertPriceProductNew">${sanpham.donGia}</td>
		<td>
		<c:if test="${empty loggedInUser}">
    <h1>You're not logged in!</h1>>
</c:if>

 <c:if test="${fn:length(cartOld)>0 }">
		<c:forEach var="sanpham1" items="${cartOld}" varStatus="loop">		
        <c:if test="${ sanpham.id eq sanpham1.id}">
        <c:set var="quanityCookie" value="${quanity[sanpham1.id]}" />
        <c:set var="idCO" value="${sanpham1.id}" />
        <input id="quanityCookie"  value="${quanity[sanpham1.id]}" hidden ></input>      
        </c:if>
        </c:forEach>
		</c:if>
		<input id="soLuongKhoNew${sanpham.id}" type="hidden" value="${sanpham.soLuong}" />
		<input 
        <c:if test="${sanpham.id == idCO }">
        <c:out value="disabled='disabled'"/></c:if>  
        id="soLuongSpNew${sanpham.id}"class="input_num_cart" 
        type="number" value="${quanityNew[sanpham.id]}" 
        min="1"  max="20" onChange="changeQuanityNew(${sanpham.id},this.value,${sanpham.donGia})"
       <%--  onkeyUp="changeQuanityNew(${sanpham.id},this.value,${sanpham.donGia})" --%>> 
    <input id="soLuongKhoNew${sanpham.id}" type="hidden" value="${sanpham.soLuong}" />			
			<div  style="display: none;color: red;" id="errorQuaNew${sanpham.id}" >
			Hiện tại sản phẩm này có thể không đủ số lượng yêu cầu!!!</div>
			 <c:if test="${quanityNew[sanpham.id]>sanpham.soLuong}">
	     <script type="text/javascript">
	       showAlert(${sanpham.id});
	     </script>
	     </c:if>
		</td>
		<td><b><span class="totalNew" id="itemNew${sanpham.id}_totalNew" name="total_price">${sanpham.donGia*quanityNew[sanpham.id]} </span> VND</b></td>
		<td class="cart-img">
			<a style="padding: 10px 12px !important;" class="btn btn-danger" onClick="deleteFromCartNew(${sanpham.id})"><span class="glyphicon glyphicon-trash"></span></a>
		</td>
		</div>
</tr>
</c:forEach>
<tr>
<c:if test="${checkEmpty != 0 }">
		<td colspan="3" style="padding: 25px;">
		<a class="buy-more-btn btn-cart" href="<%=request.getContextPath()%>/"><span class="glyphicon glyphicon-hand-left"></span> Mua thêm sản phẩm khác</a>
		&nbsp;  <span style="color: #9b3651;">&#9775;</span>  &nbsp;
		<a class="checkout-btn btn-cart" href="<%=request.getContextPath()%>/checkout"><span class="glyphicon glyphicon-check"></span> Thanh toán</a>
		</td>
		</c:if>
		
		<c:if test="${checkEmpty == 0 }">
		<td colspan="3" style="padding: 25px;">
		<a class="buy-more-btn btn-cart" href="<%=request.getContextPath()%>/"><span class="glyphicon glyphicon-hand-left"></span> Mua thêm sản phẩm khác</a>
		</td>
		</c:if>
		<td id="total" colspan="4">
<p hidden class="cart_tongdonhang">Tổng giá trị đơn hàng Old: <span id="ordertotal"></span></p>
			<p hidden class="cart_tongdonhang">Tổng giá trị đơn hàng New: <span id="ordertotalNew"></span> VND</p>
		
			<p class="cart_tongdonhang">Tổng giá trị đơn hàng: <span id="myElementJS"></span> VND</p>
		
		</td>
</tr>
</table>
</div>  
  <div class="col-xs-1">
  </div>
  </div>
</div>

<script src="<c:url value='/js/client/cartAjax.js'/>" ></script>	 

</body>
</html>