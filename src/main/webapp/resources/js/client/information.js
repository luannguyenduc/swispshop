$(document).ready(function () {
  $(".mytable .tongGiaTri ").each(function () {
    var value = accounting.formatMoney($(this).text()) + " VND";

    $(this).html(value);
  });

  $(".mytable .donGia ").each(function () {
    var value = accounting.formatMoney($(this).text()) + " VND";

    $(this).html("Đơn giá: " + value);
  });
  $(document).on("click", ".btnDaNhanHang", function (event) {
    event.preventDefault();
    var donHangId = $(this).prev(".donHangId").val();
    var confirmation = confirm("Bạn đã nhận được đơn hàng này?" + donHangId);
    console.log(donHangId);
    if (confirmation) {
      ajaxPostNhanHang(donHangId);
    }
  });

  function ajaxPostNhanHang(donHangId) {
    $.ajax({
      async: false,
      type: "POST",
      contentType: "application/json",
      url:
        "http://localhost:8080/swispshop/api/don-hang/update?donHangId=" +
        donHangId +
        "&ghiChu=" +
        "",
      success: function (response) {
        alert("Cám ơn bạn đã mua hàng!");
        location.reload();
      },
      error: function (e) {
        alert("Error!");
        console.log("ERROR: ", e);
      },
    });
  }

  $(document).on("click", ".btnSuCo", function (event) {
    event.preventDefault();
    var donHangId = $(this).prev(".baoCaoId").val();
    var confirmation = confirm(
      "Bạn chắc chắn muốn báo cáo sự cố này về đơn hàng " + donHangId + "?"
    );
    console.log(donHangId);
    if (confirmation) {
      ajaxPostSuCo(donHangId);
    }
  });

  function ajaxPostSuCo(donHangId) {
    $.ajax({
      async: false,
      type: "POST",
      contentType: "application/json",
      url:
        "http://localhost:8080/swispshop/api/don-hang/Problem?donHangId=" +
        donHangId,
      success: function (response) {
        alert("Phản hồi sự cố thành công!");
        location.reload();
      },
      error: function (e) {
        alert("Error!");
        console.log("ERROR: ", e);
      },
    });
  }
});
function changeInformation() {
  var name = document.getElementById("name").value;
  var phone = document.getElementById("phone").value;
  var address = document.getElementById("address").value;
  var flag = 0;
  if (name.length == 0) {
    flag = 1;
    document.getElementById("nameWarning").innerHTML =
      "Tên không được để trống";
  }
  if (phone.length == 0) {
    flag = 1;
    document.getElementById("phoneWarning").innerHTML =
      "Số điện thoại không được để trống";
  }
  if (address.length == 0) {
    flag = 1;
    document.getElementById("addressWarning").innerHTML =
      "Địa chỉ không được để trống";
  }
  var pat = "[0-9]+{9,10}";
  if (!/((0)+([0-9]{9})\b)/.test(phone)) {
    flag = 1;
    document.getElementById("phoneWarning").innerHTML =
      "Hãy nhập số điện thoại 10 số";
  }
  if (flag == 1) {
    return;
  }
  var send = new Object();
  send.hoTen = name;
  send.soDienThoai = phone;
  send.diaChi = address;
  var data = JSON.stringify(send);
  $.ajax({
    type: "POST",
    data: data,
    contentType: "application/json",
    url: "http://localhost:8080/swispshop/updateInfo",
    success: function (result) {
      alert("Thông tin đã cập nhật");
      window.location.href = "/swispshop/account";
    },
    error: function (e) {
      alert("Error: ", e);
      console.log("Error", e);
    },
  });
}
