<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%> <%@
taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <%@ taglib
prefix="form" uri="http://www.springframework.org/tags/form"%> <%@page
contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>Đăng nhập</title>
    <link rel="stylesheet" href="Frontend/css/login.css" />
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
    />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  </head>

  <body>
    <div style="position: relative; z-index: 1000">
      <jsp:include page="include/homeHeader.jsp"></jsp:include>
    </div>
    <c:set var="contextPath" value="${pageContext.request.contextPath}" />
    <br /><br /><br /><br />
    <div class="login-page">
      <div class="form">
        <h1
          class="form-signin-heading"
          style="
            text-align: center;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 30px;
            font-weight: bold;
          "
        >
          ĐĂNG NHẬP
        </h1>
        <hr />
        <c:if test="${param.error != null}">
          <div class="alert alert-danger">
            <p>Tên đăng nhập hoặc mật khẩu không đúng.</p>
          </div>
        </c:if>
        <c:if test="${param.logout != null}">
          <div class="alert alert-success">
            <p>Bạn đã đăng xuất thành công.</p>
          </div>
        </c:if>
        <c:if test="${param.accessDenied != null}">
          <div class="alert alert-danger">
            <p>Bạn không có quyền truy cập vào trang này</p>
          </div>
        </c:if>

        <form
          style="font-size: 16px"
          class="login-form"
          method="POST"
          action="${contextPath}/login"
        >
          <input
            type="text"
            placeholder="Email"
            name="email"
            required="required"
            style="padding: 10px; font-size: 16px"
          />

          <input
            type="password"
            placeholder="Mật khẩu"
            name="password"
            required="required"
            style="padding: 10px; font-size: 16px"
          />

          <input
            type="hidden"
            name="${_csrf.parameterName}"
            value="${_csrf.token}"
          />

          <label
            style="padding-right: 130px; font-size: 16px; margin-bottom: 5px"
            id="label"
          >
            <input
              type="checkbox"
              class="form-check-input"
              id=""
              name="remember-me"
              style="padding-top: 5px !important"
            />
            Duy trì đăng nhập</label
          >
          <div class="login-register">
            <input
              class="dn dndk"
              id="submit"
              type="submit"
              value="Đăng nhập"
            />
            <a class="dk dndk" href="<c:url value='/register'/> ">Đăng ký</a>
          </div>
        </form>
      </div>
    </div>

    <%--
    <div class="main-w3layouts wrapper">
      <h1>Đăng nhập</h1>
      <div class="main-agileinfo">
        <div class="agileits-top">
          <c:if test="${param.error != null}">
            <div class="alert alert-danger">
              <p>Tên đăng nhập hoặc mật khẩu không đúng.</p>
            </div>
          </c:if>
          <c:if test="${param.logout != null}">
            <div class="alert alert-success">
              <p>Bạn đã đăng xuất thành công.</p>
            </div>
          </c:if>
          <c:if test="${param.accessDenied != null}">
            <div class="alert alert-danger">
              <p>Bạn không có quyền truy cập vào trang này</p>
            </div>
          </c:if>

          <!-- cái required có sẵn, nó bắt mấy lỗi cơ bản, có thể xóa đi rồi validate = javascript cũng đc -->
          <form method="POST" action="${contextPath}/login">
            <input
              class="text"
              type="text"
              name="email"
              placeholder="Tên đăng nhập"
              required
            />
            <input
              class="text"
              type="password"
              name="password"
              placeholder="Mật khẩu"
              required
            />
            <input
              type="hidden"
              name="${_csrf.parameterName}"
              value="${_csrf.token}"
            />
            <input type="submit" value="ĐĂNG NHẬP" />
          </form>
          <p>
            Chưa có Tài Khoản? <a href="${contextPath}/register"> Đăng ký!</a>
          </p>
        </div>
      </div>
      <!-- copyright -->
      <div class="colorlibcopy-agile">
        <p>© 2022 All rights reserved | Design by Group 51</p>
      </div>
    </div>
    --%>
    <div><jsp:include page="include/homeFooter.jsp"></jsp:include></div>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
  </body>
</html>
