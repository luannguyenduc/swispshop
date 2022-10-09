<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Swisp Shop</title>
  </head>
  <body>
    <div>
      <div style="position: relative; z-index: 1">
        <jsp:include page="include/homeHeader.jsp"></jsp:include>
      </div>

      <div><jsp:include page="include/shippingContent.jsp"></jsp:include></div>

      <div><jsp:include page="include/homeFooter.jsp"></jsp:include></div>
    </div>
  </body>
</html>
