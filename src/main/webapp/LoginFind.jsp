<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="icon" type="image/png" sizes="32x32" href="/hotel/images/favicon-32x32.png">
  <title>아이디찾기 및 비밀번호 재설정</title>
</head>
<body>


    <div id="wrap">
   <jsp:include page ="header.jsp"></jsp:include>
   <section class="main-section">
   <form method="post" action="pwaction.jsp">	
   <h2>아이디찾기 및 비밀번호 재설정</h2>
   <br>
	<%
	 String phone = request.getParameter("hotel_phon");
	 
     JDBConnect jdbc = new JDBConnect();

    try (PreparedStatement pstmt = jdbc.con.prepareStatement("SELECT * FROM hotel_member_tbl_02 WHERE PHONE = ?")) {
        pstmt.setString(1, phone);
        ResultSet rs = pstmt.executeQuery();

        if (rs.next()) {
            String custid = rs.getString("custid");            
     %>
            <label id="hotel_id">회원 아이디 :</label><br>
            <input type="text" name="hotel_id" value="<%=custid%>" readonly><br>
     <%
        } else {
            out.println("<script>alert('해당 전화번호로 등록된 회원이 없습니다.'); location.href='phone.jsp';</script>");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
	 %>
       <label id="hotel_password">회원 패스워드 :</label><br>
       <input type="text" name="hotel_password" value=""><br>
       <br>
       <button type="submit" id="login1" >비밀번호재설정</button>
    </form>
  </section>
  <jsp:include page="footer.jsp"></jsp:include>
</div>
</body>
</html>