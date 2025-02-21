<%@ page import="model1.board.BoardDAO"%>
<%@ page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./IsLoggedIn.jsp"%>
<%
// 폼값 받기
String title = request.getParameter("title");
String content = request.getParameter("content");
String type = request.getParameter("type"); 


// 폼값을 DTO 객체에 저장
BoardDTO dto = new BoardDTO();
dto.setTitle(title);
dto.setContent(content);
dto.setCustno(session.getAttribute("CustNo").toString());
dto.setType(type);

// DAO 객체를 통해 DB에 DTO 저장
BoardDAO dao = new BoardDAO(application);

// 기존 코드
int iResult = dao.insertWrite(dto);

// 더미 데이터를 삽입하기 위한 코드
dao.close();

// 성공 or 실패? 
if (iResult == 1) {
	String redirectUrl = "/hotel/09PagingBoard/List.jsp?type=" + type;          			
	JSFunction.alertLocation("성공적으로 등록되었습니다.", redirectUrl, out);

} else {
	JSFunction.alertBack("글쓰기에 실패하였습니다.", out);
}
%>