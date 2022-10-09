<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<link href="Frontend/css/style.css" rel="stylesheet" type="text/css"
	media="all" />
<link
	href='//fonts.googleapis.com/css?family=Londrina+Solid|Coda+Caption:800|Open+Sans'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet" href="Frontend/css/responsiveslides.css">
<link rel="stylesheet" href="Frontend/css/stylele.css">
<script src="Frontend/js/jquery.min.js"></script>
<script src="Frontend/js/responsiveslides.min.js"></script>
<script src="js/client/accounting.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(window).scroll(function(){
	  var sticky = $('.sticky'), rightScroll = $('.right-scroll'),
	  		logo = $('.logo'), topNav = $('.top-nav'), sbr = $('.sbr'),
	  		rightSearchDot = $('.right-search > .right-dot'), rsi = $('.right-search-icon'), rightSearch = $('#right-search'),
	      scroll = $(window).scrollTop();

	  if (scroll > 80) {
		// sticky.addClass('fixed');
		sticky.css("margin-top", "-95px");
		sticky.css("transition", ".25s");
		rightScroll.css("margin-right", "0");
		logo.css("top", "89px");
		logo.css("width", "100px");
		topNav.css("padding-left", "487px");
		// sbr.css("width", "222px");
	}
	  else {
		sticky.css("margin-top", "0");
		sticky.removeClass('fixed');
		rightScroll.css("margin-right", "-80px");
		logo.css("top", "0");
		logo.css("width", "150px");
		sbr.css("width", "0");
		sbr.css("visibility", "hidden");
		sbr.css("opacity", "0");
		topNav.css("padding-left", "0");
		rightSearchDot.css("background", "#fff");
		rightSearchDot.css("border", "rgb(188, 188, 188) 1px solid");
		rightSearch.css("border", "rgb(188, 188, 188) 1px solid");
		rsi.css("color", "rgb(41, 41, 41)");
	}
	});

</script>

<style>

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
.fixed {
    position: fixed;
    top:0; left:0;
    width: 100%;
}
.right-scroll{
	position: fixed;
	right: 10px;
	top: 260px;
	transition: 0.5s;
	margin-right: -80px;
	z-index: 1000;
}
.right-btn{
	padding: 9px 11px !important;
	border: 1px solid rgb(188, 188, 188);
	cursor: pointer;
	transition: 0.3s;
	position: relative;
	background: #fff;
}
.right-scroll span{
	color: rgb(41, 41, 41);
	transition: 0.3s;
	font-size: 20px;
	width: 20px;
	height: 20px;
}
.right-btn:hover{
	border: 1px solid #9b3651 !important;
	color: #9b3651 !important;
	z-index: 888;
}
.right-btn:hover span{
	color: #9b3651 !important;
}
.right-btn:hover .right-dot{
	border: 1px solid #9b3651 !important;
	background: #9b3651 !important;
}
.mtso{
	margin-top: -1px;
}
.right-dot{
	position: absolute;
	width: 10px;
	height: 10px;
	right: -20px;
	left: 50px;
	top: 15px;
	background: rgb(255, 255, 255);
	border: 1px solid rgb(188, 188, 188);
	transition: 0.3s;
	transform: rotate(45deg);
}
.right-cart::after{
	top: 15.5px;
}
.right-cart cr{
	position: absolute;
	top: 4px;
	left: 22px;
	transition: 0.3s;
}
.right-cart li{
	display: none;
}
.sbr{
	position: absolute;
	top: 65px;
	right: 42px;
	transition: 0.3s;
	width: 0;
	visibility: hidden;
	opacity: 0;
	overflow: hidden;
	display: flex;
}
/* @keyframes sbrit {
	0%{
		width: 0;
		height: 0;
	}
	50%{
		width: 222px;
		height: 0;
	}
	100%{
		width: 222px;
		height: 42px;
	}
} */
.sbr::before{
	content: "";

}
.sbri{
	height: 42px !important;
	border: 1px solid #9b3651 !important;
	transition: 0.5s;
}
.right-search{
	height: 43px !important;
}
.right-search-icon{
	height: 20px !important;
}
.right-account{
	padding: 9px 0 !important;
}
.right-account > a{
	padding: 9px 11px !important;
}
.right-cart-icon{
	padding: 9px 11px !important;
}
.right-cart{
	padding: 9px 0 !important;
}
.bi-chevron-double-right{
	color: #9b3651;
	font-size: 30px;
}
.close-sbr{
	padding: 10px 5px 9px;
	margin-right: -1px;
	border: 1px solid #9b3651;
	background: #fff;
	height: 42px;
	cursor: pointer;
}
</style>


</head>
<body>
<div class="right-scroll">
	<div class="right-cart right-btn" href="<%=request.getContextPath()%>/cart">
		<div class="right-dot"></div>
		<a class="right-cart-icon" href="<%=request.getContextPath()%>/cart">
			<span class="glyphicon glyphicon-shopping-cart"></span>
		</a>
		<div id="here2"><c:if test = "${checkEmpty >0}" ><cr style="font-size: 10px;font-weight: bold;color: white;background: #772239;border-radius: 100%;padding: 1px 5px;">${checkEmpty}</cr></c:if>
		</div>
	</div>
	<div class="right-account right-btn mtso" id="right-account">
		<div class="right-dot"></div>
		<a href="<%=request.getContextPath()%>/account">
			<span class="glyphicon glyphicon-user account-icon"></span>
		</a>
	</div>
	<div class="right-search right-btn mtso" id="right-search">
		<div class="right-dot"></div>
		<span class="glyphicon glyphicon-search right-search-icon"></span>
	</div>
	<div class="back-to-top right-btn mtso" id="back-to-top">
		<div class="right-dot"></div>
		<span class="glyphicon glyphicon-arrow-up back-to-top-icon"></span>
	</div>
	<div class="search-bar sbr" id="sbr">
		<div class="close-sbr">
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-double-right" viewBox="0 0 16 16">
				<path fill-rule="evenodd" d="M3.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L9.293 8 3.646 2.354a.5.5 0 0 1 0-.708z"/>
				<path fill-rule="evenodd" d="M7.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L13.293 8 7.646 2.354a.5.5 0 0 1 0-.708z"/>
			</svg>
		</div>
		<form action="/swispshop/search" id="form-sbr">
			<input class="sbri" id="sbri" type="text" placeholder="Nhập tên sản phẩm" name="name">
		</form>
	</div>
</div>

<div class="sticky" style="
    background: url('Frontend/img/bg-top.jpg');background-size: 100% 500px;position: fixed;width: 100%;    z-index: 1000;top: 0">
	<div class="wrap">
	
		<!----start-Header---->
		<div class="header">
		
			<!----start-logo---->
			<div class="logo">
				<a href="<%=request.getContextPath()%>/"><img
					src="Frontend/img/logo_ss.png" style="width: 150px;" title="logoshop" /></a>
			</div>
			<!----end-logo---->
			<div class="search-bar">
				<form action="/swispshop/search">
					<input type="text" placeholder="Nhập tên sản phẩm" name="name"><input id="searchHome" type="submit"
						value="Tìm kiếm" />
				</form>
			</div>
			<div class="clear"></div>

			<div class="header-top-nav ">
				<c:if test="${pageContext.request.userPrincipal.name != null}">

					<ul>
						
						<li id="userId" value="${loggedInUser.id}"></li>
						<!-- <li>Xin chào ${loggedInUser.hoTen}!</li> -->
                        <li >
						<sec:authorize access="hasRole('ADMIN')">
							<a href="<%=request.getContextPath()%>/admin" style="color: #9d022b;font-size: 15px" >Trang admin</a>
						</sec:authorize>
						<sec:authorize access="hasRole('EMPLOYEE')">
<a href="<%=request.getContextPath()%>/employee" style="color: #9c012a;font-size: 15px" >Trang
								employee</a>
						</sec:authorize>
						</li>
						<li><a href="<%=request.getContextPath()%>/account">Tài
								khoản</a></li>
						<li id="here"><a id="cartHv" href="<%=request.getContextPath()%>/cart"> <span>Giỏ
									hàng </span><span class="glyphicon glyphicon-shopping-cart"></span></a>
									<c:if  test = "${checkEmpty >0}" ><span style="font-size: 12px;font-weight: bold;color: white;background: red;border-radius: 100%;padding: 0px 5px;">${checkEmpty}</span></c:if>
						</li>
						<li><a id="dx" href="<%=request.getContextPath()%>/logout"> Đăng
								xuất</a></li>
					</ul>
				</c:if>

				<c:if test="${pageContext.request.userPrincipal.name == null}">
					<ul>
						<li><a href="<%=request.getContextPath()%>/register">Đăng
								ký</a></li>
						<li><a href="<%=request.getContextPath()%>/login">Đăng
								nhập</a></li>
						<li id="here"><a href="<%=request.getContextPath()%>/cart"> <span>Giỏ
									hàng </span><span class="glyphicon glyphicon-shopping-cart"></span></a>
									<c:if  test = "${checkEmpty >0}" ><span style="font-size: 12px;font-weight: bold;color: white;background: red;border-radius: 100%;padding: 0px 5px;">${checkEmpty}</span></c:if>
									</li>

					</ul>
				</c:if>

			</div>
			<div class="clear"></div>
		</div>
	</div>
	
	<div class="clear"></div>
	
	<div class="top-header">

		<div class="wrap">

			<!----start-top-nav---->
			<div class="top-nav" style="display: flex;">
				<ul >
					<li class="hmi"><a style="text-decoration: none"  href="<%=request.getContextPath()%>/"><span class="hmiu"><span class="hmia">Trang chủ</span></span></a></li>

					<li class="dropdown ctgd hmi"><a style="text-decoration: none" class="dropdown-toggle"
						data-toggle="dropdown" href="#"><span class="hmiu"><span class="hmia">Cửa hàng <span class="caret"></span></span></span></a>
						<ul class="dropdown-menu" style="background: #fff;width: 222px;display: flex;flex-direction: column;font-size: 12px;margin-top: 0;border-radius: 0;"
							id="danhmuc2">
						</ul></li>
					<li class="hmi"><a style="text-decoration: none" href="<%=request.getContextPath()%>/shipping"><span class="hmiu"><span class="hmia">Vận
							chuyển</span></span></a></li>
					<li class="hmi"><a style="text-decoration: none" href="<%=request.getContextPath()%>/guarantee"><span class="hmiu"><span class="hmia">Chính
							sách đổi trả hàng</span></span></a></li>

					<li class="hmi"><a style="text-decoration: none" href="<%=request.getContextPath()%>/contact"><span class="hmiu"><span class="hmia">Liên
							hệ</span></span></a></li>
					<li>
						<div class="animated bounce" style="display: none;width: 350%; color: #fff;font-family:sans-serif;" >
							<script language="javascript">
								function getDateTime() {
									var now = new Date();
									var year = now.getFullYear();
									var month = now.getMonth() + 1;
									var day = now.getDate();
									var hour = now.getHours();
									var minute = now.getMinutes();
									var second = now.getSeconds();
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
									var dateTime = year + '/' + month + '/'
											+ day + ' ' + hour + ':' + minute
											+ ':' + second;
									return dateTime;
								}

								setInterval(
										function() {
											currentTime = getDateTime();
											document
													.getElementById("digital-clock").innerHTML = currentTime;
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
							</script>
							<div class="d-flex align-items-center mb-4 pb-4 border-bottom">
								<div class="ms-3">
								<ul>
								<li style="color: #fff"><span class="glyphicon glyphicon-time">&nbsp;</span></li>
								<!-- class="glyphicon glyphicon-bell" -->
								<li><p><div id="digital-clock" ></div></p></li>
								</ul>
									
									
								</div>
							</div>
					</li>
				</ul>
			</div>
			<div class="clear"></div>
		</div>
		
	</div>
	</div>
	
	<!----End-top-nav---->
	<!----End-Header---->

<script src="<c:url value='/js/client/header.js'/>"></script>
<script src="<c:url value='/Frontend/js/header2.js'/>"></script>

