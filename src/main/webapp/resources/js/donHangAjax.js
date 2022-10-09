$(document).ready(function () {
  // load first when coming page
  ajaxGet(1);

  function ajaxGet(page) {
    var data = {
      trangThai: $("#trangThai").val(),
      tuNgay: $("#fromDate").val(),
      denNgay: $("#toDate").val(),
    };
    $.ajax({
      type: "GET",
      data: data,
      contentType: "application/json",
      url: "http://localhost:8080/swispshop/api/don-hang/all" + "?page=" + page,
      success: function (result) {
        $.each(result.content, function (i, donHang) {
          // tính giá trị đơn hàng\
          var sum = 0;
          var check =
            donHang.trangThaiDonHang == "Hoàn thành" ||
            donHang.trangThaiDonHang == "Chờ duyệt";
          if (check) {
            $.each(donHang.danhSachChiTiet, function (i, chiTiet) {
              sum += chiTiet.sanPham.donGia * chiTiet.soLuongNhanHang;
            });
          } else {
            $.each(donHang.danhSachChiTiet, function (i, chiTiet) {
              sum += chiTiet.sanPham.donGia * chiTiet.soLuongDat;
            });
          }

          var donHangRow =
            "<tr>" +
            "<td>" +
            donHang.id +
            "</td>" +
            "<td>" +
            donHang.hoTenNguoiNhan +
            "</td>" +
            "<td>" +
            donHang.sdtNhanHang +
            "</td>" +
            "<td>" +
            donHang.trangThaiDonHang +
            "</td>" +
            "<td>" +
            sum +
            "</td>" +
            "<td>" +
            donHang.ngayDatHang +
            "</td>" +
            "<td>" +
            donHang.ngayNhanHang +
            "</td>" +
            '<td width="0%">' +
            '<input type="hidden" class="nguoiDatId" value=' +
            donHang.nguoiDat.id +
            ">" +
            "</td>" +
            '<td width="0%">' +
            '<input type="hidden" class="donHangId" value=' +
            donHang.id +
            ">" +
            "</td>" +
            '<td><button class="btn btn-warning btnChiTiet" >Chi Tiết</button>';
          if (donHang.trangThaiDonHang == "Đang chờ xác nhận khách mua") {
            $("#date1").html("Ngày đặt");
            $("#date2").html("");
            $("#date3").html("");
          } else if (donHang.trangThaiDonHang == "Đang chờ giao") {
            $("#date1").html("Ngày đặt");
            $("#date2").html("");
            $("#date3").html("Ngày xác nhận đơn hàng");
          } else if (donHang.trangThaiDonHang == "Đang giao") {
            $("#date1").html("Ngày đặt");
            $("#date2").html("Ngày xác nhận đơn hàng");
            $("#date3").html("");
          } else if (donHang.trangThaiDonHang == "Hoàn thành") {
            $("#date1").html("Ngày đặt");
            $("#date2").html("Ngày giao hàng");
            $("#date3").html("");
          } else if (donHang.trangThaiDonHang == "Chờ khách xác nhận") {
            $("#date1").html("Ngày đặt");
            $("#date2").html("");
            $("#date3").html("");
          } else if (donHang.trangThaiDonHang == "Đã bị hủy") {
            $("#date1").html("Ngày đặt");
            $("#date2").html("Ngày hủy đơn");
            $("#date3").html("");
          }

          /* if(donHang.trangThaiDonHang == "Đang chờ giao" || donHang.trangThaiDonHang == "Đang giao"){
					    	 donHangRow += ' &nbsp;<button class="btn btn-primary btnPhanCong">Phân công</button>'+
					    	               ' &nbsp;<button class="btn btn-danger btnHuy">Hủy đơn</button>' ;
					     } else if (donHang.trangThaiDonHang == "Chờ duyệt"){
					         donHangRow += ' &nbsp;<button class="btn btn-primary btnCapNhat" >Duyệt hoàn thành </button> </td>';
					     }else{
					     donHangRow += ' &nbsp;<label>Đang đợi nhân viên xác nhận khách</label> </td>';
					     } */

          $(".donHangTable tbody").append(donHangRow);

          $("td").each(function (i) {
            if ($(this).html() == "null") {
              $(this).html("");
            }
          });
        });

        if (result.totalPages > 1) {
          for (
            var numberPage = 1;
            numberPage <= result.totalPages;
            numberPage++
          ) {
            var li =
              '<li class="page-item "><a class="pageNumber">' +
              numberPage +
              "</a></li>";
            $(".pagination").append(li);
          }

          // active page pagination
          $(".pageNumber").each(function (index) {
            if ($(this).text() == page) {
              $(this).parent().removeClass().addClass("page-item active");
            }
          });
        }
      },
      error: function (e) {
        alert("Error: ", e);
        console.log("Error", e);
      },
    });
  }

  // event khi click vào button Chi tiết đơn
  $(document).on("click", ".btnPhanCong", function (event) {
    event.preventDefault();
    var donHangId = $(this).parent().prev().children().val();
    $("#donHangId").val(donHangId);
    console.log(donHangId);
    $("#phanCongModal").modal();
  });

  $(document).on("click", "#btnPhanCongSubmit", function (event) {
    var email = $("select[name=employee]").val();
    var donHangId = $("#donHangId").val();
    console.log(donHangId);
    ajaxPostPhanCongDonHang(email, donHangId);
  });

  function ajaxPostPhanCongDonHang(email, donHangId) {
    $.ajax({
      async: false,
      type: "POST",
      contentType: "application/json",
      url:
        "http://localhost:8080/swispshop/api/don-hang/assign?employee=" +
        email +
        "&donHangId=" +
        donHangId,
      enctype: "multipart/form-data",

      success: function (response) {
        alert("Phân công đơn hàng thành công");
        var trangThai = $("#trangThai").val();
        location.href = window.location.href;
      },
      error: function (e) {
        alert("Error!");
        console.log("ERROR: ", e);
      },
    });
  }

  $(document).on("click", "#btnDuyetDonHang", function (event) {
    event.preventDefault();
    resetData();
  });

  // reset table after post, put, filter
  function resetData() {
    var page = $("li.active").children().text();
    $(".donHangTable tbody tr").remove();
    $(".pagination li").remove();
    ajaxGet(page);
  }

  // event khi click vào phân trang Đơn hàng
  $(document).on("click", ".pageNumber", function (event) {
    //		event.preventDefault();
    var page = $(this).text();
    $(".donHangTable tbody tr").remove();
    $(".pagination li").remove();
    ajaxGet(page);
  });

  // event khi click vào button Chi tiết đơn
  $(document).on("click", ".btnChiTiet", function (event) {
    event.preventDefault();

    var donHangId = $(this).parent().prev().children().val();
    //		console.log(donHangId);
    var href = "http://localhost:8080/swispshop/api/don-hang/" + donHangId;
    $.get(href, function (donHang) {
      $("#maDonHang").text("Mã đơn hàng: " + donHang.id);
      $("#hoTenNguoiNhan").text("Người nhận: " + donHang.hoTenNguoiNhan);
      $("#sdtNhanHang").text("SĐT: " + donHang.sdtNhanHang);
      $("#diaChiNhan").text("Địa chỉ: " + donHang.diaChiNhan);
      $("#trangThaiDonHang").text(
        "Trạng thái đơn: " + donHang.trangThaiDonHang
      );
      $("#ngayDatHang").text("Ngày đặt: " + donHang.ngayDatHang);

      if (donHang.ngayNhanHang != null) {
        $("#ngayNhanHang").text("Ngày nhận: " + donHang.ngayNhanHang);
      }

      if (donHang.ghiChu != null) {
        $("#ghiChu").html("<strong>Ghi chú</strong>:<br> " + donHang.ghiChu);
      }

      if (donHang.nguoiDat != null) {
        $("#nguoiDat").html(
          "<strong>Người đặt</strong>:  " + donHang.nguoiDat.hoTen
        );
      }

      if (donHang.employee != null) {
        $("#employee").html(
          "<strong>Employee Xác nhận</strong>: " + donHang.employee.hoTen
        );
      }

      var check =
        donHang.trangThaiDonHang == "Hoàn thành" ||
        donHang.trangThaiDonHang == "Chờ duyệt";
      if (check) {
        $(".chiTietTable")
          .find("thead tr")
          .append(
            '<th id="soLuongNhanTag" class="border-0 text-uppercase small font-weight-bold"> SỐ LƯỢNG NHẬN </th>'
          );
      }
      if (donHang.trangThaiDonHang == "Đang chờ xác nhận khách mua") {
      } else if (donHang.trangThaiDonHang == "Đang giao") {
        $("#ngayNhanHang").text(
          "Ngày xác nhận đơn hàng: " + donHang.ngayNhanHang
        );
      } else if (donHang.trangThaiDonHang == "Hoàn thành") {
        $("#ngayNhanHang").text("Ngày nhận hàng: " + donHang.ngayNhanHang);
      } else {
        $("#ngayNhanHang").text("Ngày hủy đơn hàng: " + donHang.ngayNhanHang);
      }
      // thêm bảng:
      var sum = 0; // tổng giá trị đơn
      var stt = 1;
      $.each(donHang.danhSachChiTiet, function (i, chiTiet) {
        var chiTietRow =
          "<tr>" +
          "<td>" +
          stt +
          "</td>" +
          "<td>" +
          chiTiet.sanPham.tenSanPham +
          "</td>" +
          "<td>" +
          chiTiet.sanPham.donGia +
          "</td>" +
          "<td>" +
          chiTiet.soLuongDat +
          "</td>";

        if (check) {
          chiTietRow += "<td>" + chiTiet.soLuongNhanHang + "</td>";
          sum += chiTiet.sanPham.donGia * chiTiet.soLuongNhanHang;
        } else {
          sum += chiTiet.sanPham.donGia * chiTiet.soLuongDat;
        }

        $(".chiTietTable tbody").append(chiTietRow);
        stt++;
      });

      $("#tongTien").text("Tổng: " + sum + " VND");
    });

    $("#chiTietModal").modal();
  });

  // event khi click vào nhấn phím vào ô tìm kiếm đơn hàng theo id
  $(document).on("keyup", "#searchById", function (event) {
    event.preventDefault();
    var donHangId = $("#searchById").val();
    console.log(donHangId);
    if (donHangId != "") {
      $(".donHangTable tbody tr").remove();
      $(".pagination li").remove();
      var href = "http://localhost:8080/swispshop/api/don-hang/" + donHangId;
      $.get(href, function (donHang) {
        // tính giá trị đơn hàng
        var sum = 0;
        var check =
          donHang.trangThaiDonHang == "Hoàn thành" ||
          donHang.trangThaiDonHang == "Chờ duyệt";

        if (check) {
          $.each(donHang.danhSachChiTiet, function (i, chiTiet) {
            sum += chiTiet.sanPham.donGia * chiTiet.soLuongNhanHang;
          });
        } else {
          $.each(donHang.danhSachChiTiet, function (i, chiTiet) {
            sum += chiTiet.sanPham.donGia * chiTiet.soLuongDat;
          });
        }

        var donHangRow =
          "<tr>" +
          "<td>" +
          donHang.id +
          "</td>" +
          "<td>" +
          donHang.hoTenNguoiNhan +
          "</td>" +
          "<td>" +
          donHang.trangThaiDonHang +
          "</td>" +
          "<td>" +
          sum +
          "</td>" +
          "<td>" +
          donHang.ngayDatHang +
          "</td>" +
          "<td>" +
          donHang.ngayNhanHang +
          "</td>" +
          '<td width="0%">' +
          '<input type="hidden" id="donHangId" value=' +
          donHang.id +
          ">" +
          "</td>" +
          '<td><button class="btn btn-primary btnChiTiet" >Chi Tiết</button>';

        if (
          donHang.trangThaiDonHang == "Đang chờ giao" ||
          donHang.trangThaiDonHang == "Đang giao"
        ) {
          donHangRow +=
            ' &nbsp;<button class="btn btn-danger btnPhanCong">Phân công</button>';
        } else if (donHang.trangThaiDonHang == "Chờ duyệt") {
          donHangRow +=
            ' &nbsp;<button class="btn btn-warning btnCapNhat" >Duyệt hoàn thành</button> </td>';
        }

        $(".donHangTable tbody").append(donHangRow);
        $("td").each(function (i) {
          if ($(this).html() == "null") {
            $(this).html("");
          }
        });
      });
    } else {
      resetData();
    }
  });

  // event khi click vào button cập nhật đơn
  $(document).on("click", ".btnCapNhat", function (event) {
    event.preventDefault();
    var donHangId = $(this).parent().prev().children().val();
    $("#idDonHangXacNhan").val(donHangId);
    var href = "http://localhost:8080/swispshop/api/don-hang/" + donHangId;
    $.get(href, function (donHang) {
      // thêm bảng:
      var stt = 1;
      $.each(donHang.danhSachChiTiet, function (i, chiTiet) {
        var chiTietRow =
          "<tr>" +
          "<td>" +
          stt +
          "</td>" +
          "<td>" +
          chiTiet.sanPham.tenSanPham +
          "</td>" +
          "<td>" +
          chiTiet.sanPham.donGia +
          "</td>" +
          "<td>" +
          chiTiet.soLuongDat +
          "</td>" +
          "<td>" +
          chiTiet.soLuongNhanHang +
          "</td>" +
          '<td><input type="hidden" value="' +
          chiTiet.id +
          '" ></td>';
        $(".chiTietTable tbody").append(chiTietRow);
        stt++;
      });
      var sum = 0;
      $.each(donHang.danhSachChiTiet, function (i, chiTiet) {
        sum += chiTiet.sanPham.donGia * chiTiet.soLuongNhanHang;
      });
      $("#tongTienXacNhan").text("Tổng: " + sum);
    });
    $("#capNhatTrangThaiModal").modal();
  });

  $(document).on("click", "#btnXacNhan", function (event) {
    event.preventDefault();
    ajaxPostXacNhanHoanThanh();
    resetData();
  });

  // post request xác nhận hoàn thành đơn hàng
  function ajaxPostXacNhanHoanThanh() {
    $.ajax({
      async: false,
      type: "POST",
      contentType: "application/json",
      url:
        "http://localhost:8080/swispshop/api/don-hang/update?donHangId=" +
        $("#idDonHangXacNhan").val() +
        "&ghiChu=" +
        $("#ghiChuAdmin").val(),
      enctype: "multipart/form-data",
      success: function (response) {
        $("#capNhatTrangThaiModal").modal("hide");
        alert("Xác nhận hoàn thành đơn hàng thành công");
      },
      error: function (e) {
        alert("Error!");
        console.log("ERROR: ", e);
      },
    });
  }

  $(document).on("click", ".btnHuy", function (event) {
    //var
    var donHangId = $(this).parent().prev().children().val();
    var idNguoiDat = $(this).parent().prev().prev().children().val();
    console.log("donhang id =" + donHangId);
    console.log("nguoi dat id =" + idNguoiDat);

    var date;

    var spamCountMax = 3;
    var arr = JSON.parse(localStorage.getItem(idNguoiDat));
    var clickCount;
    var boo;

    if (arr == null) {
      arr = [];
      clickCount = 0;
    } else {
      arr = JSON.parse(localStorage.getItem(idNguoiDat));
      clickCount = arr.length;
    }
    //
    var confirmation = confirm("Bạn chắc chắn hủy đơn hàng này?");
    if (confirmation) {
      if (clickCount < spamCountMax) {
        clickCount++;
        date = new Date().toDateString();
        var obj = { date: date, clickCount: clickCount };
        arr.push(obj);
        localStorage.setItem(idNguoiDat, JSON.stringify(arr));
      } else if (clickCount >= spamCountMax) {
        var item = JSON.parse(localStorage.getItem(idNguoiDat));
        localStorage.setItem(idNguoiDat, null);
        boo = false;
        if (item[0].date == item[1].date && item[2].date == item[1].date) {
          boo = true;
          console.log(boo);
        }
      }
      if (boo) {
        ajaxPUTKhoaTaiKhoanDen(idNguoiDat);
        localStorage.removeItem(idNguoiDat);
        window.location.reload();
      }
      ajaxPostHuyDon(donHangId);
      alert("Huỷ thành công");
      resetData();
    }
  });

  // post request xác nhận hủy đơn hàng
  function ajaxPostHuyDon(donHangId) {
    $.ajax({
      async: false,
      type: "POST",
      contentType: "application/json",
      url:
        "http://localhost:8080/swispshop/api/don-hang/cancel?donHangId=" +
        donHangId,
      success: function (response) {
        alert("Hủy đơn hàng thành công");
      },
      error: function (e) {
        alert("Error!");
        console.log("ERROR: ", e);
      },
    });
  }

  // event khi ẩn modal chi tiết
  $("#chiTietModal,#capNhatTrangThaiModal").on("hidden.bs.modal", function (e) {
    e.preventDefault();
    $("#chiTietForm p").html(""); // reset text thẻ p
    $("#capNhatTrangThaiForm h4").text("");
    $("#ghiChuAdmin").text("");
    $(".chiTietTable #soLuongNhanTag").remove();
    $(".chiTietTable tbody tr").remove();
    $(".chiTietCapNhatTable tbody tr").remove();
  });
  function ajaxPUTKhoaTaiKhoanDen(idNguoiDat) {
    alert("Khóa tài khoản ID" + idNguoiDat + " hủy quá 3 lần đơn hàng");
    if (typeof idNguoiDat !== "undefined") {
      $.ajax({
        type: "PUT",
        url:
          "http://localhost:8080/swispshop/api/tai-khoan/setBlockToDate/" +
          idNguoiDat,
      });
    }
  }
});
