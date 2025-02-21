<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="icon" type="image/png" sizes="32x32" href="/hotel/images/favicon-32x32.png">
</head>
<body>
<script src = "script.js" ></script>
    <%
    String hotelId = "";
    String hotelPass = ""; 
    
    String UserId = (String) session.getAttribute("UserId");
    String UserPass = (String) session.getAttribute("UserPass");
    
    if (UserId == null) {
    	UserId = "";
    }
    
    if (UserPass == null) {
    	UserPass = "";
    }

    if (session.getAttribute("CustNo") == null) {  // 로그인 상태 확인
        // 로그아웃 상태
    %>
	<div id="wrap">
   <jsp:include page ="header.jsp"></jsp:include>
   	  <section class="main-section">
	<h2>로그인</h2><br>
    <form method="post" action="LoginProcess.jsp">
       <label id="hotel_id" style="color:#555651;font-weight: bolder;">회원 아이디 :</label><br>
       <input type="text" id="hotel_id" name="hotel_id" value="<%= UserId%>" required><br><br>
       <label id="hotel_password" style="color:#555651;font-weight: bolder;">회원 패스워드 :</label><br><br>
       <input type="password" name="hotel_password" value="<%= UserPass%>" required><br>
       <br>
       <button type="submit" id="login2" onclick="fn_submit(); return false;">로그인</button>
       <button type="button" id="login2" onclick="fn_reset()">다시쓰기</button>
       <button type="button" id="login1" onclick="location.href='phone.jsp';">아이디 페스워드 찾기</button>
       <button type="button" id="login2" onclick="location.href='JoinForm.jsp';">회원가입</button>
    </form>
   	  </section>
  <jsp:include page="footer.jsp"></jsp:include>
</div>

  <%
    } else { // 로그인된 상태
    %>
    	<script> alert("<%= session.getAttribute("UserName") %> 회원님, 로그인하셨습니다."); location.href = 'index.jsp';</script>
        <%-- %= session.getAttribute("UserName") %> 회원님, 로그인하셨습니다.<br / --%>
        <%-- a href="Logout.jsp">[로그아웃]</a> --%>
    <%
    }
    %>
</body>
</html>