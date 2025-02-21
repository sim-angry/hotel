<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="common.JDBConnect" %>    
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>프로그램</title>
</head>
<body>
   <% 
   JDBConnect jdbc = new JDBConnect();
   System.out.println("action.jsp");
   
   SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
   Calendar c1 = Calendar.getInstance();
   String strToday = sdf.format(c1.getTime()); 
   System.out.println("Today=" + strToday);   
    
   Connection conn = null;
   
   int result = 0;
   int number = 0;
   String resegb = "";
   String reseno = "";
   String joinfrdate = "";
   String jointodate = "";
   String area_code = "";
   String kind_code = "";
   int price =  0;
   
   String mode = request.getParameter("mode");  //히튼으로 넘어온 변수 체크
   
   System.out.println("mode : ==>" + mode);
   
   String sql = "";
   PreparedStatement pstmt = null;
   
    try {
    	 switch(mode) {
    	 case "insert" :   //입력
   		    String custno = request.getParameter("custno");
   		    String custid = request.getParameter("custid");
   		    String custpw = request.getParameter("custpw");
   		    String custname = request.getParameter("custname");
   		    String phone = request.getParameter("phone");
   		    String address = request.getParameter("address");
   		    String joindate = request.getParameter("joindate");
   		    String grade = request.getParameter("grade");    	 
    	    sql = "INSERT INTO hotel_member_tbl_02 VALUES(?, ?, ?, ?, ?, ?, TO_DATE(?, 'yyyy-MM-dd'), ?)";
    		pstmt = jdbc.con.prepareStatement(sql);	
        	pstmt.setString(1, custno);
        	pstmt.setString(2, custid);
        	pstmt.setString(3, custpw);
          	pstmt.setString(4, custname);
          	pstmt.setString(5, phone);
          	pstmt.setString(6, address);
          	pstmt.setString(7, joindate);
          	pstmt.setString(8, grade);
   
           result = pstmt.executeUpdate();
           pstmt.close();
                 
         if(result == 1) {
        	 	session.setAttribute("UserId", custid); 
        	    session.setAttribute("UserPass", custpw);
                response.sendRedirect("LoginForm.jsp");
         }else {
        		 out.println("<script>alert('회원가입 실패! \n 메인화면으로 이동합니다'); location.href='index.jsp';</script>");
      	}		 
    		 
         	  break;
    	 case "rese_hotel_insert" :   //예약등록
    	 case "rese_car_insert" :
    		   resegb = request.getParameter("resegb"); //예약종류 
    		   number = Integer.parseInt(request.getParameter("number")); //회원번호
    		   reseno = strToday + request.getParameter("joinfrdate").substring(0,4) + request.getParameter("joinfrdate").substring(5,7) + request.getParameter("joinfrdate").substring(8,10); //예약번호
    		   
    		   joinfrdate = request.getParameter("joinfrdate"); //예약시작일자
    		   jointodate = request.getParameter("jointodate"); //역약종료일자
    		   area_code = request.getParameter("c_name1");       //예약장소
    		   kind_code = request.getParameter("c_name2");      //숙박장소
    		   price =  Integer.parseInt(request.getParameter("rent")); //숙박료
    		   
     	       sql = "INSERT INTO hotel_reservation_tbl_02 VALUES(?, ?, ?, TO_DATE(?,'yyyy-mm-dd'), TO_DATE(?,'yyyy-mm-dd'), ?, ?, ?, 'N')";
    		   pstmt = jdbc.con.prepareStatement(sql);
    		   pstmt.setString(1, resegb);
	           pstmt.setInt(2, number);
	           pstmt.setString(3, reseno);
         	   pstmt.setString(4, joinfrdate);
           	   pstmt.setString(5, jointodate);
           	   pstmt.setString(6, area_code);
           	   pstmt.setString(7, kind_code);
           	   pstmt.setInt(8, price);

               result = pstmt.executeUpdate();
               pstmt.close();
                  
          	   if(result == 1) {
          		   if (resegb.equals("01")){
          			String redirectUrl = "/hotel/search.jsp";          			
          		    JSFunction.alertLocation("예약이 완료되었습니다.", redirectUrl, out);
          		   } else {
          			String redirectUrl = "/hotel/search_car.jsp";  
           		    JSFunction.alertLocation("예약이 완료되었습니다.", redirectUrl, out);   
          		   }
	           }else {
         		 	out.println("<script>alert('예약등록 실패! \n 메인화면으로 이동합니다'); location.href='index.jsp';</script>");
       		   }		 
     		 
          	   break;
    	 case "mod_hotel_up" :   //예약수정
    	 case "mod_car_up" :
  		   	  resegb = request.getParameter("resegb"); //예약종류
  		   	  number = Integer.parseInt(request.getParameter("number")); //회원번호
  		      reseno = request.getParameter("reseno"); //예약번호
  		      joinfrdate = request.getParameter("joinfrdate"); //예약시작일자
  		      jointodate = request.getParameter("jointodate"); //역약종료일자
  		      area_code = request.getParameter("c_name1");       //예약장소
  		      kind_code = request.getParameter("c_name2");      //숙박장소
  		      price =  Integer.parseInt(request.getParameter("rent")); 
  		      
  		      sql = "update hotel_reservation_tbl_02 set in_date = ?, out_date = ?, area_code = ?, kind_code = ?, price = ? where resegb = ? and custno = ? and reseno = ?"; 
	     	  pstmt = jdbc.con.prepareStatement(sql);	

        	  pstmt.setString(1, joinfrdate);
         	  pstmt.setString(2, jointodate);
        	  pstmt.setString(3, area_code);
        	  pstmt.setString(4, kind_code);
        	  pstmt.setInt(5, price);
        	  pstmt.setString(6, resegb);
	          pstmt.setInt(7, number);
              pstmt.setString(8, reseno);

          	  result = pstmt.executeUpdate();
         	  pstmt.close();
               
         	   if(result == 1) {
          		   if (resegb.equals("01")){
           			String redirectUrl = "/hotel/search.jsp";          			
          		    JSFunction.alertLocation("예약이 수정되었습니다.", redirectUrl, out);
          		   } else {
          			 String redirectUrl = "/hotel/search_car.jsp";          			
           		    JSFunction.alertLocation("예약이 수정되었습니다.", redirectUrl, out);   
          		   }
	           }else {
         		 	out.println("<script>alert('예약수정 실패! \n 메인화면으로 이동합니다'); location.href='index.jsp';</script>");
       		   }			 
  		 
       	  	break;  
    	 case "mod_hotel_del" :
    	 case "mod_car_del" :    		 //예약삭제
  		      resegb = request.getParameter("resegb"); //예약종류
  		   	  number = Integer.parseInt(request.getParameter("number")); //회원번호
  		      reseno = request.getParameter("reseno"); //예약번호
  		      
  		      sql = "update hotel_reservation_tbl_02 set canyn = 'Y' where resegb = ? and custno = ? and reseno = ?"; 
	     	  pstmt = jdbc.con.prepareStatement(sql);	

	     	  pstmt.setString(1, resegb);
	          pstmt.setInt(2, number);
              pstmt.setString(3, reseno);

          	  result = pstmt.executeUpdate();
         	  pstmt.close();
                             	  
       	   if(result == 1) {
      		   if (resegb.equals("01")){
       			String redirectUrl = "/hotel/search.jsp";          			
      		    JSFunction.alertLocation("예약이 취소되었습니다.", redirectUrl, out);
      		   } else {
      			 String redirectUrl = "/hotel/search_car.jsp";          			
       		    JSFunction.alertLocation("예약이 취소되었습니다.", redirectUrl, out);   
      		   }
           }else {
     		 	out.println("<script>alert('예약수정 실패! \n 메인화면으로 이동합니다'); location.href='index.jsp';</script>");
   		   }	         	   
       	  	break;        	  	
    }
    	 
    }  catch(Exception e){
	 e.printStackTrace();
}
%> 
</body>
</html>