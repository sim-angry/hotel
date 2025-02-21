<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="common.JDBConnect"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ include file="IsLoggedIn.jsp"%> <!--로그인 확인-->

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>렌트카예약프로그램</title>
   <link rel="stylesheet" href="styles.css" />
<script src = "script_calulate.js" ></script>
</head>
<body>
   <div id="wrap">
    <%
    System.out.println(session.getAttribute("CustNo"));
    
    if (session.getAttribute("CustNo") != null) {  // 로그인 상태 확인
        // 로그인 상태

    %>   
   <jsp:include page ="header.jsp"></jsp:include>

<section class="main-section">
 <h2>렌터카예약하기</h2> <br>
 
 <form name = "frm" method = "post" action="action.jsp"> 
 <input type = "hidden" name ="mode" id="mode" value="rese_car_insert">
 <input type = "hidden" name ="resegb" value="02">
        
<table>
       <tr>
            <th>체크인</th>
            <td><input type="date" id="joindate1" name="joinfrdate" placeholder="예)2015-12-12" required></td>
            <th>체크아웃</th>
            <td><input type="date" id="joindate2" name="jointodate" placeholder="예)2015-12-12" required></td>            
      </tr>
      <tr>
         <th>회원명</th>
         <td><input type="text" name="name" value="<%=session.getAttribute("UserName")%>" readonly></td> 
      </tr>
      <tr>
         <th>회원번호</th>
         <td><input type="text" name="number" value="<%=session.getAttribute("CustNo")%>" readonly></td>
      </tr>
      <tr>
         <th>예약장소</th>
         <td>
         <select name="c_name1" id="c_name1">
         <option value="">예약장소</option>
         <option value="01">전라남도</option>         
         <option value="02">전라북도</option>         
         <option value="03">경상남도</option>         
         <option value="04">경상북도</option>         
         <option value="05">충청남도</option>
         <option value="06">충정북도</option>
         <option value="07">강원도</option>
         <option value="08">제주도</option>         
         </select>      
         </td>   
      </tr>
      <tr>
         <th>자동차</th>
         <td>
         <select name="c_name2" id="c_name2">
         <option value="">자동차종류</option>
         <option value="01">아반떼</option>         
         <option value="02">소나타</option>         
         <option value="03">그랜저</option>         
         <option value="04">산타페</option>               
         </select>      
         </td>   
      </tr>
      <tr>
         <th>렌트료</th>
         <td><input type="text" name="rent" id="result" readonly> 원</td>
         <td style="text-align:center;" colspan="2">
         <button class="btn" type="button" id="login5" onclick="fn_calulate(); return false;" >렌트료계산하기</button>
         </td>
      </tr>
      <tr>
         <td style="text-align:center;" colspan="2">
         <button class="btn" type="submit" id="login2" onclick="fn_submit(); return false;">예약하기</button>
         <button class="btn" type="button" id="login2" onclick="fn_reset();" >다시쓰기</button>
         </td>         
      </tr>   
</table>
</form>
</section>
  <jsp:include page="footer.jsp"></jsp:include>
   </div>
 <%
    } else { // 로그 아웃 상태 상태
    %>
        <a href="LoginForm.jsp">[로그아웃]</a>
    <%
    }
    %>   
</body>
</html>