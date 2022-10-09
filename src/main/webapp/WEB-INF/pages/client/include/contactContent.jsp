<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <title>Liên hệ</title>
    <style>
      .ctcbtn {
        padding: 10px 20px;
        color: #fff;
        background: #9b3651;
        border: 1px solid #9b3651;
        border-radius: 50px;
        margin-top: 10px;
        transition: 0.25s;
        font-weight: bold;
      }
      .ctcbtn:hover {
        color: #9b3651;
        background: #fff;
      }
    </style>
  </head>
  <body>
    <div class="container">
      <br /><br /><br /><br /><br /><br /><br /><br />
      <p style="font-size: 30px; font-weight: bold">Liên hệ với chúng tôi</p>
      <hr />
      <!-- 		<form>		
			<label>Địa chỉ emai của bạn:</label> <br>
			<p id="emailWarning" style="color: red"></p>
			<input id="email" type="text">
			<br>
			<label>Nội dung liên hệ:</label> <br>
			<p id="contentWarning" style="color: red"></p>
			<textarea id="content" rows="4" cols="50"></textarea>
			<br>	
		</form>
		<button >Gửi yêu cầu</button> -->

      <form>
        <div class="form-group">
          <label for="email">Địa chỉ email của bạn:</label>
          <p id="emailWarning" style="color: red"></p>
          <input
            style="width: 500px"
            type="email"
            class="form-control"
            id="email"
          />
        </div>
        <div class="form-group">
          <label for="content">Thông tin liên hệ:</label>
          <p id="contentWarning" style="color: red"></p>
          <textarea
            style="width: 500px; height: 100px"
            class="form-control"
            id="content"
          ></textarea>
        </div>
      </form>
      <button onClick="sendContact()" class="ctcbtn">Gửi liên hệ</button>
    </div>
    <script src="<c:url value='/js/client/contactAjax.js'/>"></script>
  </body>
</html>
