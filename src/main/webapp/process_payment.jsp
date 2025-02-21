<%@page import="utils.JSFunction"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>결제 처리</title>
    <link rel="stylesheet" href="styles.css" />
    <link rel="icon" type="image/png" sizes="32x32" href="/hotel/images/favicon-32x32.png">
</head>
<body>
    <div id="wrap">
        <jsp:include page="header.jsp"></jsp:include>
        <section class="main-section">
            <h2>결제 처리 결과</h2>
            <br>
<%
    JDBConnect jdbc = new JDBConnect();
    PreparedStatement pstmt = null;
    PreparedStatement pstmt1 = null;
    PreparedStatement pstmt2 = null; 
    ResultSet rs1 = null;
    ResultSet rs2 = null; 

    String reseno = request.getParameter("reseno");
    String price = request.getParameter("price");
    String custno = request.getParameter("custno"); 
    String resegb = request.getParameter("resegb");
	String discount_type = request.getParameter("discount_type");
    String paymentDay = "";
    String paymentPrice = "0";
    String paymentno = "PAY" + System.currentTimeMillis(); 
    
    if (reseno == null || price == null) {
    	JSFunction.alertBack("잘못된 요청입니다.", out);
    } else {
        try {

            String discountSql = "select nvl(min(discount_rate), 0) AS discount_rate " +
            					 "from hotel_sale_tbl_02 " +
            					 "where resegb = ? " +
            		             "and to_char(sysdate, 'DY', 'NLS_DATE_LANGUAGE=ENGLISH') = 'MON' " +
            					 "and trunc(sysdate) between trunc(start_date) and trunc(end_date) " +
            					 "and discount_type = ? ";
            
            pstmt2 = jdbc.con.prepareStatement(discountSql);
            pstmt2.setString(1, resegb);
            pstmt2.setString(2, discount_type); 
            rs2 = pstmt2.executeQuery();

            int discountRate = 0;
            if (rs2.next()) {
                discountRate = rs2.getInt("discount_rate");
            }


            int originalPrice = Integer.parseInt(price);
            paymentPrice = String.valueOf(originalPrice - (originalPrice * discountRate / 100));


            String insertSql = "INSERT INTO HOTEL_payment_TBL_02 (RESEGB, CUSTNO, RESENO, PAYMENTNO, PAYMENT_DATE, PRICE, PAYMENT_PRICE) " +
                               "VALUES (?, ?, ?, ?, SYSDATE, ?, ?)";
            pstmt = jdbc.con.prepareStatement(insertSql);
            pstmt.setString(1, resegb);
            pstmt.setInt(2, Integer.parseInt(custno));
            pstmt.setString(3, reseno);
            pstmt.setString(4, paymentno);
            pstmt.setInt(5, originalPrice);
            pstmt.setInt(6, Integer.parseInt(paymentPrice));

            int result = pstmt.executeUpdate();

            if (result > 0) {
                String selectSql = "SELECT resegb, custno, reseno, paymentno, " +
                                   "TO_CHAR(payment_date, 'yyyy-mm-dd') AS payment_date, " +
                                   "price, payment_price " +
                                   "FROM hotel_payment_tbl_02 " + 
                                   "WHERE resegb = ? AND custno = ? AND reseno = ? AND paymentno = ?";
                
                pstmt1 = jdbc.con.prepareStatement(selectSql);
                pstmt1.setString(1, resegb);
                pstmt1.setInt(2, Integer.parseInt(custno));
                pstmt1.setString(3, reseno);
                pstmt1.setString(4, paymentno);
                rs1 = pstmt1.executeQuery();

                if (rs1.next()) {
                    custno = rs1.getString("custno");
                    resegb = rs1.getString("resegb");
                    reseno = rs1.getString("reseno");
                    paymentno = rs1.getString("paymentno");
                    paymentDay = rs1.getString("payment_date");
                    price = rs1.getString("price");
                    paymentPrice = rs1.getString("payment_price");               
%>
                    <table border="1" style="margin:0 auto; text-align:center;">
                        <tr>
                            <th>예약종류</th>
                            <th>회원번호</th>
                            <th>예약번호</th>
                            <th>결제번호</th>
                            <th>결제날짜</th>
                            <th>결제금액</th>
                            <th>할인된 결제금액</th>
                        </tr>
                        <tr>
                            <td><%= resegb %></td>
                            <td><%= custno %></td>                                   
                            <td><%= reseno %></td>
                            <td><%= paymentno %></td>
                            <td><%= paymentDay %></td>
                            <td><%= price %></td>
                            <td><%= paymentPrice %></td>
                        </tr>
                    </table>
<%
                } else {
                	JSFunction.alertBack("결제에 실패했습니다. 나중에 다시 시도해주세요.", out);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        	JSFunction.alertBack("오류가 발생했습니다. 나중에 다시 시도해주세요.", out);
        } finally {
            if (pstmt != null) {
                try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
            if (pstmt1 != null) {
                try { pstmt1.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
            if (pstmt2 != null) {
                try { pstmt2.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
            if (rs1 != null) {
                try { rs1.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
            if (rs2 != null) {
                try { rs2.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
            jdbc.close();
        }
    }
%>
        </section>
        <jsp:include page="footer.jsp"></jsp:include>
    </div>
</body>
</html>
