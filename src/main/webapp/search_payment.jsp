<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.JDBConnect"%>
<%@ include file="IsLoggedIn.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제하기</title>
<link rel="icon" type="image/png" sizes="32x32" href="/hotel/images/favicon-32x32.png">
<link rel="stylesheet" href="styles.css" />
</head>
<body>
    <div id="wrap">
        <jsp:include page="header.jsp"></jsp:include>
        <section class="main-section">
            <h2>결제하기</h2>
            <br>
            <table border="1" style="margin:0 auto; text-align:center;">
                <tr>
                    <th>예약번호</th>
                    <th>회원명</th>
                    <th>회원번호</th>
                    <th>분류코드</th>
                    <th>예약장소</th>
                    <th>상품코드</th>
                    <th>렌트료</th>
                </tr>
<%
    JDBConnect jdbc = new JDBConnect();

    String CustNo = (String) session.getAttribute("CustNo");
    int number = Integer.parseInt(CustNo);
    try {
        String sql = "select a.custno, " +
        			 "a.custname, " + 
                     "b.resegb, b.reseno, " +
                     "b.area_code, " +
                     "b.kind_code, " +
                     "b.price " +
                     "from musthave.hotel_member_tbl_02 a " +
                     "join musthave.hotel_reservation_tbl_02 b ON a.custno = b.custno " +
                     "left join musthave.hotel_payment_tbl_02 c ON b.resegb = c.resegb " +
                     "and b.custno = c.custno AND b.reseno = c.reseno " +
                     "where a.custno = ? " +
                     "and (b.resegb = '01' OR b.resegb = '02') " +
                     "and b.canyn = 'N' " +
                     "and c.payment_date IS NULL " +
                     "ORDER BY b.out_date DESC";
        
        PreparedStatement pstmt = jdbc.con.prepareStatement(sql);
        pstmt.setInt(1, number);
        
        ResultSet rs = pstmt.executeQuery();
        
        while (rs.next()) {
            String reseno = rs.getString("reseno");
            String custno = rs.getString("custno");
            String custname = rs.getString("custname");
            String resegb = rs.getString("resegb");
            String area_code = rs.getString("area_code");
            String kind_code = rs.getString("kind_code");
            String price = rs.getString("price");
%>
            <tr>
                <td><a class="number" href="payment.jsp?mod_reseno=<%=reseno%>&custno=<%=custno%>&resegb=<%=resegb%>"><%=reseno %></a></td>                                
                <td><%= custname %></td>
                <td><%= custno %></td>
                <td><%= resegb %></td>
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
    	JSFunction.alertBack("예약조회내역을 조회할 수 없습니다.", out);
    }
%>
            </table>
            <input type="hidden" name="resegb" value="02">
        </section>
        <jsp:include page="footer.jsp"></jsp:include>
    </div>
</body>
</html>
