<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <link
      rel="stylesheet"
      href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"
    />
    <link
      rel="stylesheet"
      href="http://cdnjs.cloudflare.com/ajax/libs/animate.css/3.2.3/animate.min.css"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />
    <link rel="stylesheet" href="<c:url value='/css/admin.css' />" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />
  </head>

  <body>
    <nav
      class="navbar navbar-inverse navbar-fixed-top"
      style="background-color: #25383c; border-color: rgb(0 0 0 / 25%)"
    >
      <div class="container">
        <div class="navbar-header">
          <button
            class="navbar-toggle"
            data-toggle="collapse"
            data-target=".navbar-collapse"
          >
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span></button
          ><a class="navbar-brand" href="<c:url value='/'/>"
            ><span class="glyphicon glyphicon-home">&nbsp;</span>Trang chủ</a
          >
          <a
            style="margin-left: 10px"
            class="navbar-brand"
            href="<c:url value='/admin'/>"
            ><span class="glyphicon glyphicon-lock">&nbsp;</span>Swisp Shop -
            Trang Quản Trị</a
          >
        </div>
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav navbar-right">
            <li hidden id="here1">
              <p hidden id="list">${listCongViec.soLienHeMoi}</p>
            </li>
            <li>
              <a
                id="here"
                style="color: #ffd700"
                href="<c:url value='/admin/lien-he'/>"
                ><span class="glyphicon glyphicon-bell">
                  <c:if test="${listCongViec.soLienHeMoi > 0}">
                    (${listCongViec.soLienHeMoi})
                    <p hidden id="listCurrent">${listCongViec.soLienHeMoi}</p>
                  </c:if>

                  <c:if test="${listCongViec.soLienHeMoi > 0}">
                    <div hidden id="lienHeMoi">${listCongViec.soLienHeMoi}</div>
                  </c:if>
                </span>
                Liên hệ mới
              </a>
            </li>
            <li>
              <a href="<c:url value='/admin/profile' />">
                <span class="glyphicon glyphicon-user">&nbsp;</span>Xin chào:
                ${loggedInUser.hoTen }</a
              >
            </li>
            <li>
              <a href="<c:url value='/logout' />"
                ><span class="glyphicon glyphicon-log-out"></span> Đăng xuất</a
              >
            </li>
          </ul>
        </div>
      </div>
    </nav>
  </body>
</html>
