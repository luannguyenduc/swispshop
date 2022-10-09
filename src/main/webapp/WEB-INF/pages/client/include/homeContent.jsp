<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="<c:url value='/js/client/homeAjax.js'/>"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link
	rel="stylesheet"
	type="text/css"
	href="Frontend/css/slick.css"
/>
<link
	rel="stylesheet"
	type="text/css"
	href="Frontend/css/slider.css"
/>
<link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />
<!--start-image-slider---->

<div class="wrap">

	<div class="slider" style="margin-top: 150px;">
		<!-- Slideshow 1 -->
			<div class="slider-item">
				<img style="
					height: 422px;
					width: 100%;" src="Frontend/img/slider_1.jpg" alt="">
			</div>
			<div class="slider-item">
				<img style="
					height: 422px;
					width: 100%;" src="Frontend/img/slider_2.jpg" alt="">
			</div>
			<div class="slider-item">
				<img style="
					height: 422px;
					width: 100%;" src="Frontend/img/slider_3.jpg" alt="">
			</div>
			<div class="slider-item">
				<img style="
					height: 422px;
					width: 100%;" src="Frontend/img/slider_4.jpg" alt="">
			</div>

			
		<!--  <ul class="rslides" id="slider1">
			<li><img src="Frontend/img/slidegom1.jpg" alt=""></li>
			<li><img src="Frontend/img/slidegom2.jpg" alt=""></li>
			<li><img src="Frontend/img/slidegom3.jpg" alt=""></li>
		</ul>  -->
		<!-- Slideshow 2 -->
	</div>
	
</div>
<!--End-image-slider---->
<div class="clear"></div>
<div class="wrap">
	<div class="content">
		<div class="top-3-grids">
			<div class="section group">
				<div class="grid_1_of_3 images_1_of_3">
					<a href="/swispshop/store?brand=BÌNH TÀI LỘC"><img
						src="Frontend/img/noibat1.jpg"></a>
					<h3>Sản Phẩm Nổi Bật</h3>
				</div>
				<div class="grid_1_of_3 images_1_of_3 ">
					<a href="/swispshop/store?brand=HỒ LÔ GỐM SỨ"><img
						src="Frontend/img/noibat2.jpg" style="background-color: white"></a>
					<h3>Sản Phẩm Nổi Bật</h3>
				</div>
				<div class="grid_1_of_3 images_1_of_3 ">
					<a href="/swispshop/store?brand=BÌNH HOA - LỌ HOA"><img
						src="Frontend/img/noibat3.jpg" style="background-color: white"></a>
					<h3>Sản Phẩm Nổi Bật</h3>
				</div>
			</div>
		</div>
		<div class="content-grids" >
			<div class="title-new-product" style="font-size: 30px;";><b style="color: #9b3651">Danh sách sản phẩm mới nhất</b></div>

		</div>
	</div>
	<div class="content-sidebar">
		<div style="font-size: 25px;font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;border-bottom: #9b3651 1px solid;padding-bottom: 6px;"><b style="color: #9b3651;">Danh mục</b></div>
		<ul id="danhmuc" style="list-style: none;">

		</ul>
	</div>
</div>
<div class="clear"></div>
</div>
<div style="background: #ffffff !important; border-top: 1px solid #ccc; border-bottom: 1px solid #ccc; margin-top: 60px; padding: 30px 10px;display: flex;text-align: center!important;text-align: center; font-weight: bold;">
	<div style="width: 400px";>
		<img style="height: 40px;" class="img1 uk-responsive-width" uk-img=""
			data-src="/logos/icon-giao-hang-nhanh.png"
			alt="Giao hàng nhanh chóng"
			src="https://xuonggombattrang.vn/wp-content/themes/xgbtvn-v2/images/icon-featured/ship.svg">
		<br>
		<div style="font-size: 0.8rem !important; color: #000;">
			<strong style="font-size: 16px">Giao hàng nhanh chóng</strong>
		</div>
	</div>
	<div style="width: 400px";>
		<img style="height: 40px;" class="img1 uk-responsive-width" uk-img=""
			data-src="/logos/icon-bao-hanh-tron-doi.png" alt="Bảo hành trọn đời"
			src="https://xuonggombattrang.vn/wp-content/themes/xgbtvn-v2/images/icon-featured/affection.svg">
		<br>
		<div class="" style="font-size: 0.8rem !important; color: #000;">
			<strong style="font-size: 16px">Bảo hành trọn đời</strong>
		</div>
	</div>
	<div style="width: 400px";>
		<img style="height: 40px;" class="img1 uk-responsive-width" uk-img=""
			data-src="/logos/icon-tu-van-24-7.png" alt="Tư vấn 24/7"
			src="https://xuonggombattrang.vn/wp-content/themes/xgbtvn-v2/images/icon-featured/scientist.svg">
		<br>
		<div class="title_2 uk-text-uppercase"
			style="font-size: 0.8rem !important; color: #000;">
			<strong style="font-size: 16px">Tư vấn 24/7</strong>
		</div>
	</div>
	<div style="width: 400px";>
		<img style="height: 40px;" class="img1 uk-responsive-width" uk-img=""
			data-src="/logos/icon-cam-ket.png" alt="Cam kết gốm chính hãng"
			src="https://xuonggombattrang.vn/wp-content/themes/xgbtvn-v2/images/icon-featured/package.svg"> <br>
		<div class="title_2 uk-text-uppercase"
			style="font-size: 0.8rem !important; color: #000;">
			<strong style="font-size: 16px">Cam kết gốm chính hãng</strong>
		</div>
	</div>
</div>



</div>
<div id="content">
	<div class="content-section">
		<h1 style="font-size: 36px; font-weight: bold;" class="section-heading">THE SWISP</h1>
		<p class="section-sub-heading">We love swisp</p>
		<p style="text-indent: 30px;margin-top: 50px;" class="about-text">Sản phẩm gốm sứ Bát Tràng được tiêu thụ khá
			phổ biến trên thị trường. Tuy nhiên, khi đất nước mở cửa, hội nhập
			sâu rộng vào nền kinh tế thế giới, gốm sứ Bát Tràng cũng phải tham
			gia vào cuộc cạnh tranh gay gắt với các sản phẩm gốm sứ khác trên thị
			trường khiến không ít các cơ sở sản xuất có nguy cơ đình trệ sản
			xuất. Sử dụng cách tiếp cận từ phía cầu và tiếp cận theo vùng, kết
			quả nghiên cứu phản ánh đánh giá của người tiêu dùng về sản phẩm gốm
			sứ Bát Tràng trên các phương diện số lượng và chất lượng, đặc điểm
			người tiêu dùng, tần suất, mục đích sử dụng sản phẩm... Nghiên cứu
			cũng xác định các yếu tố chính ảnh hưởng đến nhu cầu tiêu dùng sản
			phẩm gốm sứ Bát Tràng bao gồm: số lượng, kiểu dáng mẫu mã, giá sản
			phẩm, thông tin, trong đó giá sản phẩm chính là yếu tố quan trọng
			nhất làm giảm nhu cầu sử dụng. Từ đó, bài viết đã đề xuất một số giải
			pháp giúp cho các cơ sở sản xuất gốm sứ Bát Tràng có định hướng phát
			triển đáp ứng nhu cầu tiêu dùng của thị trường.</p>
		<div class="members-list">
			<div class="member-item">
				<img src="Frontend/img/contentanh.png" alt="" class="member-img">
				<p style="margin-top: 10px;" class="member-name">Vò bí chim trĩ hoa đào</p>
			</div>
			<div class="member-item">
				<img src="Frontend/img/contentanh2.jpg" alt="" class="member-img">
				<p style="margin-top: 10px;" class="member-name">Đèn trứng đại CNLH</p>
			</div>
			<div class="member-item">
				<img src="Frontend/img/contentanh3.jpg" alt="" class="member-img">
				<p style="margin-top: 10px;" class="member-name">Vò cao ngàn hoa sứ khử</p>
			</div>
		</div>
	</div>
	<div class="clear"></div>
	<div class="content-section">

		<h2 style="font-size: 36px;font-weight: bold;margin-top: 50px;" class="section-heading">TOUR DATES</h2>
		<p class="section-sub-heading">Remember to book your ticjets!</p>
		<p style="text-indent: 30px;margin-top: 50px;" class="about-text">Gốm là một trong những phát minh quan trọng của tổ tiên ta từ
			ngàn đời nay, đồ gốm đã gắn bó mật thiết với cuộc sống của nhân dân
			ta. Với trí sáng tạo và đôi bàn tay khéo léo của người thợ gốm, gốm
			cổ Việt Nam đã trở thành một loại hình nghệ thuật mang tính dân gian
			sâu sắc.Nghề gốm, xem ra phát triển rải rác khắp đất nước. Ở tỉnh nào
			cũng có những vùng làm nghề gốm. Cứ ven các dòng sông, chúng ta gặp
			nhiều mảnh sành, mảnh gốm còn vương sót lại. Hoặc chúng ta gặp những
			dãy lò gốm đang ăn khói nghi ngút. Những trung tâm sứ gốm ở nước ta,
			xuất hiện từ thời Lý - Trần mà đến nay vẫn còn hưng thịnh nghề
			nghiệp, đó là Bát Tràng (Hà Nội), Thổ Hà, Phù Lãng (Bắc Ninh), Hương
			Canh (Vĩnh Phúc), Quế Quyển (Hà Nam Ninh), Chum Thanh (Thanh Hóa)...
			Mỗi vùng quê gốm lại giữ kỹ nghệ riêng biệt. Và mỗi nơi, lại có mặt
			hàng gốm đặc trưng riêng của mình, tạo thêm cái đa dạng và phong phú
			của công nghệ gốm Việt Nam. Nếu nói trung tâm gốm ở nước ta, phải nói
			tới Bát Tràng - Thổ Hà – Hương Canh. Một đặc điểm riêng biệt và rõ
			nét nhất của nghề gốm là đều phát triển dọc sát các triền sông. Bởi
			lẽ nó tiện đường chuyên chở, và đất sét dọc các triền sông là thứ
			nguyên liệu quý để sản xuất gốm, sứ.</p>
	</div>
	<div class="content-section" style="padding-top: 0;">
		<img alt="" src="Frontend/img/cuahang.png"
			style="display: block; margin-left: auto; margin-right: auto;">
		<p class="section-sub-heading">Swisp Shop</p>
	</div>
</div>

<script
	type="text/javascript"
	src="https://code.jquery.com/jquery-1.11.0.min.js"
></script>
<script
	type="text/javascript"
	src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"
></script>
<script
	type="text/javascript"
	src="<c:url value='/js/slick.min.js'/>"
></script>
<script src="<c:url value='/Frontend/js/slider.js'/>"></script>