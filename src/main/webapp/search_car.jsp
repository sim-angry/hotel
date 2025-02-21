<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.JDBConnect"%>
<%@ include file="IsLoggedIn.jsp"%> <!--로그인 확인-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약조회/수정</title>
<link rel="icon" type="image/png" sizes="32x32" href="/hotel/images/favicon-32x32.png">
<link rel="stylesheet" href="styles.css" />
</head>
<body>
	<div id="wrap">
	<jsp:include page="header.jsp"></jsp:include>
	<section class="main-section">
	<h2>렌터카예약조회/수정</h2>
	<br>
	<table border = "1" style="margin:0 auto; text-align:center;">
	<tr>
		<th>예약번호</th>
		<th>회원명</th>
		<th>체크인</th>
		<th>체크아웃</th>
		<th>예약장소</th>
		<th>자동차종류</th>
		<th>렌트료</th>
	</tr>
<%
	JDBConnect jdbc = new JDBConnect();

	String CustNo = (String)session.getAttribute("CustNo");
	int number = Integer.parseInt(CustNo);
	
	try {
		
		String sql = "SELECT b.reseno"
        		   + "     ,a.custname"
        		   + "     ,to_char(b.in_date,'yyyy-mm-dd') as in_date"
        		   + "     ,to_char(b.out_date,'yyyy-mm-dd') as out_date"
        		   + "     ,b.area_code"
        		   + "     ,b.kind_code"
        		   + "     ,b.price"
        		   + "  FROM hotel_member_tbl_02 A"
        		   + "     , hotel_reservation_tbl_02 B"
        		   + " WHERE a.custno = b.custno"
        		   + "   and a.custno = ?"
        		   + "   and b.resegb = '02'"
        		   + "   and b.canyn = 'N'"
        		   + " ORDER BY OUT_DATE DESC";
		

			PreparedStatement pstmt = jdbc.con.prepareStatement(sql);
			pstmt.setInt(1, number);

			ResultSet rs = pstmt.executeQuery();
			
		while (rs.next()) {
			String reseno = rs.getString("reseno");
			String custname = rs.getString("custname");
			String in_date = rs.getString("in_date");
			String out_date = rs.getString("out_date");
			String area_code = rs.getString("area_code");
			String kind_code = rs.getString("kind_code");
			String price = rs.getString("price");
			%>
			<tr>
				<td><a class="number" href ="modify_car.jsp?mod_reseno=<%=reseno%>"><%=reseno %></a></td>
				<td><%= custname %></td>
				<td><%= in_date %></td>
				<td><%= out_date %></td>
				<td><%= area_code %></td>
				<td><%= kind_code %></td>
				<td><%= price %></td>
			</tr>

		<%
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();

		}
		%>
		</table>
		 <input type = "hidden" name ="resegb" value="02">
		</section>
		 <jsp:include page="footer.jsp"></jsp:include>
	</div>
	</body>
	</html>