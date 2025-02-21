<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.JDBConnect"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="icon" type="image/png" sizes="32x32" href="/hotel/images/favicon-32x32.png">
</head>
<body>
<script src = "script.js" ></script>
	<div id="wrap">
   <jsp:include page ="header.jsp"></jsp:include>
   	  <section class="main-section">
	<h2>아이디 페스워드 찾기</h2><br>
    <form method="post" action="LoginFind.jsp">
       <label id="hotel_id">전화번호 :</label><br>
       <input type="text" name="hotel_phon" placeholder="010-1111-5555" required><br>
       <br>
       <input type="submit" id="login1" value="아이디 페스워드 찾기">   
      	
    </form>
   	  </section>
  <jsp:include page="footer.jsp"></jsp:include>
</div>
</body>
</html>