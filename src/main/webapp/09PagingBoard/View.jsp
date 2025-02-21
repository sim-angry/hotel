<%@ page import="model1.board.BoardDAO"%>
<%@ page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%
String num = request.getParameter("num");  // 일련번호 받기
String type = request.getParameter("type");
System.out.println("일련번호 : " + num + "게시물 종류 : " + type);
BoardDAO dao = new BoardDAO(application);  // DAO 생성
dao.updateVisitCount(num,type);             // 조회수 증가
BoardDTO dto = dao.selectView(num,type);        // 게시물 가져오기
dao.close();                               // DB 연결 해제
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항</title>
<script>
function deletePost() {
    var confirmed = confirm("정말로 삭제하겠습니까?");
    if (confirmed) {
        var form = document.writeFrm;       // 이름(name)이 "writeFrm"인 폼 선택
        form.method = "post";               // 전송 방식
        form.action = "DeleteProcess.jsp";  // 전송 경로
        form.submit();                      // 폼값 전송
    }
}
</script>
</head>
<body>
    <div id="wrap">
   <jsp:include page ="../header.jsp"></jsp:include>
   <section class="main-section">
<jsp:include page="../Common/Link.jsp" />  <!-- 공통 링크 -->
<h2>문의사항</h2>
<br>
<form name="writeFrm">
    <input type="hidden" name="num" value="<%= num %>">
    <input type="hidden" name="type" value="<%= type %>">
    <table border="1" style="width: 90%;margin: 0 auto;text-align:center;">
        <tr>
            <td>번호</td>
            <td><%= dto.getNum() %></td>
            <td>작성자</td>
            <td><%= dto.getName() %></td>
        </tr>
        <tr>
            <td>작성일</td>
            <td><%= dto.getPostdate() %></td>
            <td>조회수</td>
            <td><%= dto.getVisitcount() %></td>
        </tr>
        <tr>
            <td>제목</td>
            <td colspan="3"><%= dto.getTitle() %></td>
        </tr>
        <tr>
            <td>내용</td>
            <td colspan="3" height="100" style="text-align: left; vertical-align: top;">
            <%= dto.getContent().replace("\r\n", "<br/>") %></td>
        </tr>
        <tr>
            <td colspan="4" align="center">
                <%
                if (session.getAttribute("UserId") != null
                    && session.getAttribute("CustNo").toString().equals(dto.getCustno())) {
                %>
                <button type="button" id="login6" onclick="location.href='Edit.jsp?num=<%= dto.getNum() %>&type=<%= type %>';">수정하기</button>
                <button type="button" id="login6" onclick="deletePost();">삭제하기</button> 
                <%
                }
                %>
                <button type="button" id="login6" onclick="location.href='List.jsp?type=<%= type %>';">목록보기</button>
            </td>
        </tr>
    </table>
</form>
   </section>
  <jsp:include page="../footer.jsp"></jsp:include>
</div>
</body>
</html>
