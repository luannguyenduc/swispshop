<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>Thông tin tài khoản</title>
  </head>

  <body>
    <br />
    <!----start-Header---->
    <div style="position: relative; z-index: 1">
      <jsp:include page="include/homeHeader.jsp"></jsp:include>
    </div>
    <!----End-Header---->
    <br /><br /><br /><br /><br /><br />
    <div><jsp:include page="include/accountContent.jsp"></jsp:include></div>

    <!----start-Footder---->
    <div><jsp:include page="include/homeFooter.jsp"></jsp:include></div>
    <!----End-Footder---->
  </body>
</html>