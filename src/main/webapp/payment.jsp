<%@page import="java.sql.SQLException"%>
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
    <title>결제하기 - 결제 상세</title>
    <link rel="icon" type="image/png" sizes="32x32" href="/hotel/images/favicon-32x32.png">
    <link rel="stylesheet" href="styles.css" />
</head>
<body>
    <div id="wrap">
        <jsp:include page="header.jsp"></jsp:include>
        <section class="main-section">
            <h2>결제 상세</h2>
            <br>
<%
    JDBConnect jdbc = new JDBConnect();
    ResultSet rs = null;
    PreparedStatement pstmt = null;
    String reseno = request.getParameter("mod_reseno");
    String custno = request.getParameter("custno");
    String resegb = request.getParameter("resegb");

    if (reseno == null || reseno.isEmpty()) {
    	JSFunction.alertBack("잘못된 예약번호입니다.", out);
    } else {
        try {
        	String sql = "select a.custname, " + 
                    	 "a.custno, " +
                     	 "b.resegb, " +
                     	 "b.area_code, " +
                     	 "b.kind_code, " +
                     	 "b.price, " +
                     	 "case when b.resegb = '01' then b.area_code " +
                         "     else b.kind_code " +
                         " end as discount_type " +       
                         "from musthave.hotel_reservation_tbl_02 b " +
                         "join musthave.hotel_member_tbl_02 a ON a.custno = b.custno " +
                         "where b.reseno = ?" +
                         "and b.resegb = ?" +
                         "and b.custno = ?";
                         	 
            pstmt = jdbc.con.prepareStatement(sql);
            pstmt.setString(1, reseno);
            pstmt.setString(2, resegb);
            pstmt.setString(3, custno);

            rs = pstmt.executeQuery();

            if (rs.next()) {
            	custno = rs.getString("custno");
            	String custname = rs.getString("custname");
                resegb = rs.getString("resegb");
                String area_code = rs.getString("area_code");
                String kind_code = rs.getString("kind_code");
                String price = rs.getString("price");
                String discount_type = rs.getString("discount_type");
%>
                <form action="process_payment.jsp" method="post">
                    <input type="hidden" name="reseno" value="<%= reseno %>">
                    <input type="hidden" name="price" value="<%= price %>">
                    <input type="hidden" name="custno" value="<%= custno %>">
                    <input type="hidden" name="resegb" value="<%= resegb %>">
                    <input type="hidden" name="discount_type" value="<%= discount_type %>">                  
                    <button class="btn" type="button" id="login7" onclick="fn_calulate(); return false;">결제진행</button>
                </form>
                <table border="1" style="margin:0 auto; text-align:center;">
                    <tr>
                        <th>회원명</th>
                        <th>예약번호</th>
                        <th>분류코드</th>
                        <th>예약장소</th>
                        <th>상품코드</th>
                        <th>렌트료</th>
                    </tr>
                    <tr>
                        <td><%= custname %></td>
                        <td><%= reseno %></td>
                        <td><%= resegb %></td>
                        <td><%= area_code %></td>
                        <td><%= kind_code %></td>
                        <td><%= price %></td>
                    </tr>
                </table>
<%
            } else {
            	JSFunction.alertBack("예약 정보를 찾을 수 없습니다.", out);
            }
        } catch (Exception e) {
            e.printStackTrace();
            JSFunction.alertBack("오류가 발생했습니다. 나중에 다시 시도해주세요.", out);
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    }
%>
        </section>
        <jsp:include page="footer.jsp"></jsp:include>
    </div>
    
    
    <script>
    function fn_calulate() {
        var price = parseFloat(document.querySelector('input[name="price"]').value);
        
        if (isNaN(price) || price <= 0) {
            alert("유효한 금액이 아닙니다. 다시 확인해주세요.");
            return;
        }
        
        var confirmPayment = confirm("결제를 진행하시겠습니까?\n 금액: " + price + "원");
        
        if (confirmPayment) {
            document.querySelector('form').submit();
        }
    }
</script>
</body>
</html>
