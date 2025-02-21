<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ page import="common.JDBConnect" %>    
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>비용산출</title>
  <link rel="icon" type="image/png" sizes="32x32" href="/hotel/images/favicon-32x32.png">
  <link rel="stylesheet" href="styles.css"/>
</head>
<body>
	<div id="wrap">
   <script src = "script.js" ></script>
   <jsp:include page ="header.jsp"></jsp:include>
   
   <section class="main-section">
 
 <h2>예약수정/취소</h2> <br>
 
 
 <form name="frm" method="post" >
<!--   <input type="hidden"  name="mode" value="modify"> -->
  
 
 <%
    System.out.println("cost.jsp");
 	JDBConnect jdbc = new JDBConnect();
    String reset_type = request.getParameter("param1");
    String reser_area = request.getParameter("param2");
    String reser_kind = request.getParameter("param3");
    int dd_cnt = Integer.parseInt(request.getParameter("param4"));    
    String joinfrdate = request.getParameter("param5");
    String jointodate = request.getParameter("param6");
    String mode = request.getParameter("param7");
    String mod_reseno = request.getParameter("param8");
    
    String cost = "";
    
    System.out.println("mode:"+ mode + " " + "reset_type:"+ reset_type + " " + "reser_area:"+ reser_area + " " + "joinfrdate:"+ joinfrdate + " " + "reser_kind:"+ reser_kind + " " + "jointodate:"+ jointodate );
       
    try{    	
    	
     String sql = "SELECT nvl(? * unitprice,0) AS cost FROM HOTEL_UnitPricInfo_TBL_02 WHERE reser_type = ? AND reser_area = ? AND reser_kind = ? ";
     PreparedStatement pstmt = jdbc.con.prepareStatement(sql);
     pstmt.setInt(1, dd_cnt);
     pstmt.setString(2, reset_type);
     if (reset_type.equals("02")){
    	 pstmt.setString(3, "00");
     } else {
         pstmt.setString(3, reser_area);    	 
     }

     pstmt.setString(4, reser_kind);
	 ResultSet rs = pstmt.executeQuery();
	
     if (rs.next()) {
    	 cost = rs.getString("cost");
    %>
            <input type="text" name="cost" value="<%= cost %>" readonly>
            <input type="text" name="joinfrdate" value= "<%= joinfrdate %>" readonly>
            <input type="text" name="jointodate" value= "<%= jointodate %>" readonly>
            <input type="text" name="c_name1" value="<%= reser_area %>" readonly>
            <input type="text" name="c_name2" value="<%= reser_kind %>" readonly>

  <%
        }  //if  끝
     switch(mode) {
	 case "rese_hotel_insert" :   //예약등록
      	   response.sendRedirect("reserve.jsp?cost=" + cost + "&joinfrdate=" + joinfrdate + "&jointodate=" + jointodate + "&c_name1=" + reser_area + "&c_name2=" + reser_kind);
	       break;
	 case "rese_hotel_update" :
		   response.sendRedirect("modify.jsp?cost=" + cost + "&joinfrdate=" + joinfrdate + "&jointodate=" + jointodate + "&c_name1=" + reser_area + "&c_name2=" + reser_kind + "&mod_reseno=" + mod_reseno);
	       break;
	 case "rese_car_insert" :   //예약등록
    	   response.sendRedirect("car.jsp?cost=" + cost + "&joinfrdate=" + joinfrdate + "&jointodate=" + jointodate + "&c_name1=" + reser_area + "&c_name2=" + reser_kind);
	       break;
	 case "rese_car_update" :
		   response.sendRedirect("modify_car.jsp?cost=" + cost + "&joinfrdate=" + joinfrdate + "&jointodate=" + jointodate + "&c_name1=" + reser_area + "&c_name2=" + reser_kind + "&mod_reseno=" + mod_reseno);
	       break;	       
    }     
    }catch(Exception e){
   	 e.printStackTrace();
    } //try 끝
    

  %>

 </form>
</section>
 <jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>