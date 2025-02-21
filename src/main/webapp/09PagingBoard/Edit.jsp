<%@ page import="model1.board.BoardDAO"%>
<%@ page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./IsLoggedIn.jsp"%> 
<%
String num = request.getParameter("num");  // 일련번호 받기 
String type = request.getParameter("type");
BoardDAO dao = new BoardDAO(application);  // DAO 생성
System.out.println("NUM :" + num + "TYPE : " + type);

BoardDTO dto = dao.selectView(num,type);        // 게시물 가져오기 
String sessionId = session.getAttribute("CustNo").toString(); // 로그인 ID 얻기 
if (!sessionId.equals(dto.getCustno())) {      // 본인인지 확인
    JSFunction.alertBack("작성자 본인만 수정할 수 있습니다.", out);
    return;
}
dao.close();  // DB 연결 해제
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <jsp:include page="../Common/Link.jsp" />
    <title>회원제 게시판</title>
    <link rel="icon" type="image/png" sizes="32x32" href="/hotel/images/favicon-32x32.png">
    <script type="text/javascript">
      function validateForm(form) {
        // 폼 내용 검증
        if (form.title.value == "") {
          alert("제목을 입력하세요.");
          form.title.focus();
          return false;
        }
        if (form.content.value == "") {
          alert("내용을 입력하세요.");
          form.content.focus();
          return false;
        }
      }
    </script>
  </head>
  <body>
    <div id="wrap">
      <jsp:include page="../header.jsp"></jsp:include>
      <section class="main-section">
        <jsp:include page="../Common/Link.jsp" />
        <h2>수정하기(Edit)</h2>
        <br>
        <form name="writeFrm" method="post" action="EditProcess.jsp" onsubmit="return validateForm(this);">
          <input type="hidden" name="num" value="<%= dto.getNum() %>">
          <input type="hidden" name="type" value="<%= type %>">
          <table border="1" style="width: 90%;margin: 0 auto;">
            <tr>
              <td>제목</td>
              <td>
                <input type="text" name="title" style="width: 90%" value="<%= dto.getTitle() %>"/>
              </td>
            </tr>
            <tr>
              <td>내용</td>
              <td style="text-align: left;">
                <textarea name="content" style="width: 90%; height: 100px;">
				<%= dto.getContent() %></textarea
                >
              </td>
            </tr>
            <tr>
              <td colspan="2" align="center">
                <button type="submit" id="login6">작성 완료</button>
                <button type="reset"  id="login6">다시 입력</button>
                <button type="button" id="login6" onclick="location.href='List.jsp';">목록 보기</button>
              </td>
            </tr>
          </table>
        </form>
      </section>
      <jsp:include page="../footer.jsp"></jsp:include>
    </div>
  </body>
</html>