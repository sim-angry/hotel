<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" sizes="32x32" href="/hotel/images/favicon-32x32.png">
<title>Insert title here</title>
</head>
<body>
<div id="wrap">
<jsp:include page ="header.jsp"></jsp:include>
  <section class="main-section">
        
        <h2>회원가입</h2><br>

        <form name='frm' method='post' action="action.jsp">
        <input type = "hidden" name ="mode" value="insert">
        <table>
        <% 
        String custno = "";
        JDBConnect jdbc = new JDBConnect();
        
        try {
    		String sql = "select nvl(max(custno),100000)+1 custno from hotel_member_tbl_02";
        	PreparedStatement pstmt = jdbc.con.prepareStatement(sql);
    		ResultSet rs = pstmt.executeQuery();

    		rs.next(); // 제목줄 넘기기
			custno = rs.getString("custno"); // 마지막 번호 가져오기
        }
        catch(Exception e) {
        	e.printStackTrace();
        }
        
        %>
        <tr>
            <td><label for="custno">회원번호(자동발생)</label></td>
            <td><input type="text"  name="custno" value="<%=custno %>" readonly></td>
        </tr>
        <tr>
            <td><label for="custid">회원id</label></td>
            <td><input type="text"  name="custid" required></td>
        </tr>                
        <tr>
            <td><label for="custpw">비밀번호</label></td>
            <td><input type="password"  name="custpw" required></td>
        </tr>                
        <tr>
            <td><label for="custname">회원성명</label></td>
            <td><input type="text" id="custname" name="custname" required></td>
        </tr>
        <tr>
            <td><label for="phone">회원전화</label></td>
            <td><input type="tel" id="phone" name="phone" placeholder="예)010-1111-5555" required></td>
        </tr>
        <tr>
            <td><label for="address">회원주소</label></td>
            <td><input type="text" id="address" name="address" placeholder="예)제주도 제주시 감나무골" required></td>
        </tr>
        <tr>
            <td><label for="joindate">가입일자</label></td>
            <td><input type="date" id="joindate" name="joindate" placeholder="예)2015-12-12" required></td>
        </tr>
        <tr>
            <td><label for="grade">고객등급 [A:VIP, B:일반, C:직원]</label></td>
            <td><input type="text" id="grade" name="grade" required></td>
        </tr>
        <tr>
            <td colspan="2">
            	<button type="submit" id="login2" onclick="fn_join_submit(); return false;">등록</button>
                <input type="button" id="login2" value="조회" onclick="location='search.jsp'">
            </td>
        </tr>
    </table>
</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</div>
</body>
</html>