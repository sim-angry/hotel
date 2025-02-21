<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ page import="common.JDBConnect" %>    
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>숙박 예약수정/취소</title>
  <link rel="icon" type="image/png" sizes="32x32" href="/hotel/images/favicon-32x32.png">
  <link rel="stylesheet" href="styles.css"/>
  <script src = "script_calulate.js" ></script>
</head>
<body>
	<div id="wrap">
   <script src = "script.js" ></script>
   <jsp:include page ="header.jsp"></jsp:include>
   <section class="main-section">
 
 <h2>숙박 예약수정/취소</h2> <br>
 
 
 <form name="frm" method="post" action="action.jsp">
 <input type = "hidden" name ="mode" id="mode" value="rese_hotel_update">
 <input type = "hidden" name ="resegb" value="01">
  
 <table>
 
 <%
 	JDBConnect jdbc = new JDBConnect();
    
 	String CustNo = (String)session.getAttribute("CustNo");
	int number = Integer.parseInt(CustNo);
    String mod_reseno = request.getParameter("mod_reseno");
       
    try{    	
    	
     String sql = "select b.reseno, " +
 	        	  "a.custname, " +
 	        	  "to_char(b.in_date,'yyyy-mm-dd') as in_date, " +
 	        	  "to_char(b.out_date,'yyyy-mm-dd') as out_date, " +
 	        	  "b.area_code, " +
 	        	  "b.kind_code, " +
 	        	  "b.price " +
 	        	  "from hotel_member_tbl_02 A, " +
 	        	  "hotel_reservation_TBL_02 B " +
 	        	  "WHERE a.custno = b.custno " + 
 	        	  "and a.custno = ? " +
 	        	  "and b.reseno = ? " +
 	              "and b.resegb = '01' " +
 	        	  "and b.canyn = 'N' " +
 	        	  "order by out_date desc";
     PreparedStatement pstmt = jdbc.con.prepareStatement(sql);
     pstmt.setInt(1, number);
     pstmt.setString(2, mod_reseno);
	 ResultSet rs = pstmt.executeQuery();
	 
     if (rs.next()) {
    	 
    %>
 	<tr>
       <th>예약번호</th>
       <td><input type="text" id="mod_reseno" name="reseno" value="<%=mod_reseno %>" readonly></td>
    </tr>
    <tr>
       <th>회원명</th>
       <td><input type="text" name="custname" value="<%=rs.getString("custname") %>" readonly></td>
    </tr>
   	<tr>
        <th>체크인</th>
        <td><input type="date" id="joindate1" name="joinfrdate" value="<%=rs.getString("in_date") %>"></td>
        <th>체크아웃</th>
        <td><input type="date" id="joindate2" name="jointodate" value="<%=rs.getString("out_date") %>"></td>            
	</tr>
	<tr>
		<th>예약장소</th>
		<td>
        <select name="c_name1" id="c_name1">
		<option value="">예약장소</option>
		<option value="01" <%= "01".equals(rs.getString("area_code")) ? "selected" : "" %>>홀리데이인 광주호텔</option>	
		<option value="02" <%= "02".equals(rs.getString("area_code")) ? "selected" : "" %>>롯데호텔 부산</option>			
		<option value="03" <%= "03".equals(rs.getString("area_code")) ? "selected" : "" %>>호텔인터불고 대구</option>			
		<option value="04" <%= "04".equals(rs.getString("area_code")) ? "selected" : "" %>>롯데시티호텔 대전</option>			
		<option value="05" <%= "05".equals(rs.getString("area_code")) ? "selected" : "" %>>신라스테이 천안</option>
		<option value="06" <%= "06".equals(rs.getString("area_code")) ? "selected" : "" %>>롯데호텔 울산</option>
		<option value="07" <%= "07".equals(rs.getString("area_code")) ? "selected" : "" %>>강릉 씨마크호텔</option>
		<option value="08" <%= "08".equals(rs.getString("area_code")) ? "selected" : "" %>>제주신라호텔</option>			
		</select>		
	</td>	
	</tr>
	 <tr>
		  <th>숙박인원</th>
		  <td id="c_name2">
  		  <input style="float:none;" type="radio" name="c_name2" value="01"<%= "01".equals(rs.getString("kind_code")) ? "checked":"" %>>1인실	
		  <input style="float:none;" type="radio" name="c_name2" value="02"<%= "02".equals(rs.getString("kind_code")) ? "checked":"" %>>2인실	
	</td>	
	</tr>
		<tr>
	    <th>숙박료</th>
		<td><input type="text" id="result" name="rent" value="<%=rs.getString("price") %>" readonly>원</td>
		<td style="text-align:center;" colspan="2">
        <button class="btn" type="button" id="login5" onclick="fn_calulate(); return false;" >렌트료계산하기</button>
       </td>
	</tr>	
  <tr>	
  <td colspan="2">
  
   <button class="btn" id="login2" type="submit" onclick="document.getElementById('mode').value = 'mod_hotel_up';">예약수정</button>
   <button class="btn" id="login2" type="submit" onclick="document.getElementById('mode').value = 'mod_hotel_del';">예약취소</button>
  </td>
  </tr>
  <%
        }  //if  끝
    
    }catch(Exception e){
   	 e.printStackTrace();
    } //try 끝
    
  %>
 
</table>
<input type = "hidden" name ="number" value="<%=number%>">
 </form>
</section>
 <jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>