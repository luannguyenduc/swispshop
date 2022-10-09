function addToCart(id) {
  $.ajax({
    type: "GET",
    url: "http://localhost:8080/swispshop/api/gio-hang/addSanPham?id=" + id,
    success: function (result) {
      if (result.status == "false") {
        Swal.fire(
          "Thông báo",
          "Sản phẩm đang hết hàng, quý khách vui lòng quay lại sau",
          "warning"
        );
      } else if (result.status == "max") {
        Swal.fire(
          "Thông báo",
          "Nếu bạn muốn mua số lượng lớn vui lòng liên hệ trực tiếp với cửa hàng",
          "info"
        );
      } else {
        $("#here").load(window.location.href + " #here");
        $("#here2").load(window.location.href + " #here2");
        Swal.fire("Thông báo", "Đã thêm sản phẩm vào giỏ hàng!", "success");
      }
    },
    error: function (e) {
      alert("Error: ", e);
      console.log("Error", e);
    },
  });

  itemCount++;
  $("#itemCount").html(itemCount).css("display", "block");
}
