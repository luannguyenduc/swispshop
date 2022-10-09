<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%> <%@
taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <%@ taglib
prefix="form" uri="http://www.springframework.org/tags/form"%> <%@page
contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>Swisp Shop - Đăng nhập</title>
    <link rel="stylesheet" href="Frontend/css/login.css" />
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
    />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  </head>

  <body>
    <form action="logout" align="center">
      <h1>Tài khoản của bạn đã bị khóa</h1>
      <p>Liên hệ CSKH để biết thêm chi tiết</p>
      <input id="userId" type="hidden" value="${loggedInUser.id}" />
      <button class="return-client" type="submit">
        Quay lại với tư cách là khách
      </button>
      <div class="blocked-img" style="text-align: center; margin-top: 40px">
        <img src="Frontend/img/account-is-locked.png" width="280px" alt="" />
      </div>

      <script type="text/javascript">
        $(document).ready(function () {
          Swal.fire({
            icon: "error",
            title: "TÀI KHOẢN BẠN ĐÃ BỊ KHÓA",
            text: "NHẤN OK ĐỂ ĐÓNG",
            background: "#fff",
            footer:
              '<a href="http://localhost:8080/swispshop/logout">QUAY LẠI TRANG ĐĂNG NHẬP</a>',
          });
        });
      </script>
    </form>

    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="<c:url value='/js/client/header.js'/>"></script>
  </body>
</html>
