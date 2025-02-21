<%@ page import="model1.board.BoardDAO"%>
<%@ page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./IsLoggedIn.jsp"%>
<%
// 수정 내용 얻기
String num = request.getParameter("num");
String type = request.getParameter("type");
String title = request.getParameter("title");
String content = request.getParameter("content");

System.out.println("num : " + num + "type : " + type);

// DTO에 저장
BoardDTO dto = new BoardDTO();
dto.setNum(num);
dto.setType(type);
dto.setTitle(title);
dto.setContent(content);

// DB에 반영
BoardDAO dao = new BoardDAO(application);
int affected = dao.updateEdit(dto);
dao.close();

// 성공/실패 처리
if (affected == 1) {
    // 성공 시 상세 보기 페이지로 이동
	String redirectUrl = "/hotel/09PagingBoard/View.jsp?num=" + dto.getNum() + "&type=" + type;          			
	JSFunction.alertLocation("성공적으로 수정되었습니다.", redirectUrl, out);
}

else {
    // 실패 시 이전 페이지로 이동
    JSFunction.alertBack("수정하기에 실패하였습니다.", out);
}
%>

