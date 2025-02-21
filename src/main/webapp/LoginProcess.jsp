<%@page import="utils.JSFunction"%>
<%@ page import="common.MemberDTO"%>
<%@ page import="common.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 로그인 폼으로부터 받은 아이디와 패스워드
String userId = request.getParameter("hotel_id"); 
String userPwd = request.getParameter("hotel_password");  

// web.xml에서 가져온 데이터베이스 연결 정보
String oracleDriver = application.getInitParameter("OracleDriver");
String oracleURL = application.getInitParameter("OracleURL");
String oracleId = application.getInitParameter("OracleId");
String oraclePwd = application.getInitParameter("OraclePwd");
System.out.println("userId" + userId);
System.out.println("userPwd" + userPwd);
// 회원 테이블 DAO를 통해 회원 정보 DTO 획득
MemberDAO dao = new MemberDAO(oracleDriver, oracleURL, oracleId, oraclePwd);
MemberDTO memberDTO = dao.getMemberDTO(userId, userPwd);
dao.close();

// 로그인 성공 여부에 따른 처리
if (memberDTO.getCustid() != null) {
    // 로그인 성공
    
    session.setAttribute("UserId", memberDTO.getCustid()); 
    session.setAttribute("UserName", memberDTO.getCustname());
    session.setAttribute("CustNo", memberDTO.getCustno());
    String redirectUrl = "/hotel/index.jsp";  
    JSFunction.alertLocation(memberDTO.getCustname() + "님 로그인이 성공하였습니다", redirectUrl, out);
}
else {
    // 로그인 실패
    JSFunction.alertBack("로그인이 실패하였습니다.", out);
    //request.setAttribute("LoginErrMsg", "로그인 오류입니다."); 
    //request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
} 
%>