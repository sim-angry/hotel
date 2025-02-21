<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="IsLoggedIn.jsp"%> <!--로그인 확인-->
<%
String type = request.getParameter("type");
%>	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
<link rel="icon" type="image/png" sizes="32x32" href="/hotel/images/favicon-32x32.png">
<script type="text/javascript">
function validateForm(form) {  // 폼 내용 검증
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
   <jsp:include page ="../header.jsp"></jsp:include>
   <section class="main-section">
<jsp:include page="../Common/Link.jsp" />
<h2>글쓰기</h2>
<br>
<form name="writeFrm" method="post" action="WriteProcess.jsp" onsubmit="return validateForm(this);">
    <input type="hidden" name="type" value="<%= type %>"> <!-- 숨은 필드 추가 -->
    <table border="1" width="90%">
        <tr>
            <td>제목</td>
            <td>
                <input type="text" name="title" style="width: 90%;" />
            </td>
        </tr>
        <tr>
            <td>내용</td>
            <td>
                <textarea name="content" style="width: 90%; height: 100px;"></textarea>
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