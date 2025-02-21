<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ page import="common.JDBConnect" %>    
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title> 프로그램</title>
</head>
<body>
   
   <% 
   JDBConnect jdbc = new JDBConnect();
    System.out.println("action.jsp");
    
    
    Connection conn = null;
    int result = 0;
    String mode = request.getParameter("mode");  //히튼으로 넘어온 변수 체크
    
    
    String custno = request.getParameter("custno");
    String custname = request.getParameter("custname");
    String phone = request.getParameter("phone");
    String address = request.getParameter("address");
    String joindate = request.getParameter("joindate");
    String grade = request.getParameter("grade");
    String city = request.getParameter("city");
    
    
    try {
    	 switch(mode) {
    	 case "insert" :   //입력
    	    String sql = "INSERT INTO member_tbl_02 VALUES(?, ?, ?, ?, TO_DATE(?, 'yyyy-MM-dd'), ?, ?)";
    		PreparedStatement pstmt = jdbc.con.prepareStatement(sql);	
        	pstmt.setString(1, custno);
          	pstmt.setString(2, custname);
          	pstmt.setString(3, phone);
          	pstmt.setString(4, address);
          	pstmt.setString(5, joindate);
          	pstmt.setString(6, grade);
          	pstmt.setString(7, city);
   
           result = pstmt.executeUpdate();
           pstmt.close();
                 
         if(result == 1) {
                  response.sendRedirect("search.jsp");
         }else {
        		 out.println("<script>alert('회원입력 실패! \n 메인화면으로 이동합니다'); location.href='index.jsp';</script>");
      	}		 
    		 
         	  break;

    	 case "mod_up" :
    		 
    		 sql ="UPDATE member_tbl_02 SET " +
                     "custname=?, "+
                     "phone=?, "+
                     "address=?, "+
                     "joindate=TO_DATE(?,'yyyy-MM-dd'), "+
                     "grade=?, "+
                     "city=? "+
                   	"WHERE custno=?";
        		  PreparedStatement pstmt1 = jdbc.con.prepareStatement(sql);
        	       	pstmt1.setString(1,custname);	
            	pstmt1.setString(2,phone);	
       		  	pstmt1.setString(3,address);	
     		   	pstmt1.setString(4,joindate);	
         		pstmt1.setString(5,grade);	
         		pstmt1.setString(6,city);	
         		pstmt1.setString(7,custno);
    	        
         	   result = pstmt1.executeUpdate();
         	   pstmt1.close();
    		   
         if(result == 1) {
                  response.sendRedirect("search.jsp");
         }else {
        		 out.println("<script>alert('회원수정 실패! \n 메인화면으로 이동합니다'); location.href='index.jsp';</script>");
      	}
          
    	 break;
    	 
    	 case "mod_del" :
    	/* 	 out.println("<script>alert('삭제');</script>"); */
    		  sql = "DELETE FROM member_tbl_02 WHERE custno = ?";
    		  PreparedStatement pstmt2 = jdbc.con.prepareStatement(sql);
      	 	
    		  pstmt2.setString(1, custno);
              
              result = pstmt2.executeUpdate();
        	  pstmt2.close();
       	   
              if(result == 1) {
                       response.sendRedirect("search.jsp");
              }else {
             		 out.println("<script>alert('회원삭제 실패! \n 메인화면으로 이동합니다'); location.href='index.jsp';</script>");
           	}
              break;
    }
    	 
    }  catch(Exception e){
	 e.printStackTrace();
}
%> 
    
</body>
</html>