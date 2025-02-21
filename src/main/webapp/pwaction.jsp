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
  <title> 프로그램</title>
</head>
<body>

   <% 
   int result = 0;
   
   JDBConnect jdbc = new JDBConnect();
   
   Connection conn = null;
   
   String sql = "";
   
   PreparedStatement pstmt = null;
   
    try {
 		      String custid = request.getParameter("hotel_id");
    		  String custpw = request.getParameter("hotel_password");
    		  System.out.println("비밀번호 : " + custpw);
    		  
    	      if ((!(custid.equals(""))) && !(custpw.equals(""))) { 		  
        		  System.out.println("pwaction.jsp : " + custid);
        		  System.out.println("pwaction.jsp : " + custpw);
     		      
     		      sql = "update hotel_member_tbl_02 set custpw = ? where custid = ?"; 
    	     	  pstmt = jdbc.con.prepareStatement(sql);	

    	          pstmt.setString(1, custpw);
                  pstmt.setString(2, custid);

             	  result = pstmt.executeUpdate();
            	  pstmt.close();    			  
    		  
    	      }     
    	      
      		  if (result == 1) {
      			 JSFunction.alertLocation("비밀번호가 정상적으로 변경되었습니다.", "LoginForm.jsp", out); 

	          	 }else {
       	         JSFunction.alertBack("비밀번호 변경에 실패하였습니다.", out);	          		
   			  }
    	 
    }  catch(Exception e){
	 e.printStackTrace();
}
%> 
    
</body>
</html>