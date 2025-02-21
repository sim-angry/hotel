<%@ page import="java.util.List"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ page import="model1.board.BoardDAO"%>
<%@ page import="model1.board.BoardDTO"%>
<%@ page import="utils.BoardPage"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// DAO를 생성해 DB에 연결
BoardDAO dao = new BoardDAO(application);

// 사용자가 입력한 검색 조건을 Map에 저장
Map<String, Object> param = new HashMap<String, Object>();
String searchField = request.getParameter("searchField");
String searchWord = request.getParameter("searchWord");
String type = request.getParameter("type");
if (type == null) {
	type = "01";
}

if (searchWord != null) {
    param.put("searchField", searchField);
    param.put("searchWord", searchWord);

}
param.put("type", type);

int totalCount = dao.selectCount(param);  // 게시물 수 확인
/*** 페이지 처리 start ***/
// 전체 페이지 수 계산
System.out.println(application.getInitParameter("POSTS_PER_PAGE"));
int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
int totalPage = (int)Math.ceil((double)totalCount / pageSize); // 전체 페이지 수

// 현재 페이지 확인
int pageNum = 1;  // 기본값
String pageTemp = request.getParameter("pageNum");
if (pageTemp != null && !pageTemp.equals(""))
    pageNum = Integer.parseInt(pageTemp); // 요청받은 페이지로 수정

// 목록에 출력할 게시물 범위 계산
int start = 0, end = 0;
start = (pageNum - 1) * pageSize + 1;  // 첫 게시물 번호
end = pageNum * pageSize; // 마지막 게시물 번호
System.out.println("쿼리실행했나 type:" + type + "start:" + start + "end:" + end);
param.put("start", start);
param.put("end", end);
/*** 페이지 처리 end ***/
List<BoardDTO> boardLists = dao.selectListPage(param);  // 게시물 목록 받기
dao.close();  // DB 연결 닫기
%>
 <!DOCTYPE html>
      <html>
        <head>
          <meta charset="UTF-8" />
          <title>문의사항</title>
          <link rel="icon" type="image/png" sizes="32x32" href="/hotel/images/favicon-32x32.png">         
          <script>
function submitForm(action, type) {
    // 폼 요소 생성
    var form = document.createElement("form");
    form.method = "POST";
    form.action = action;

    // 숨겨진 input 요소 생성
    var input = document.createElement("input");
    input.type = "hidden";
    input.name = "type";
    input.value = type;

    // 폼에 input 추가
    form.appendChild(input);

    // 폼을 문서에 추가하고 제출
    document.body.appendChild(form);
    form.submit();
}
</script>
        </head>
        <body>
          <div id="wrap">
            <jsp:include page="../header.jsp"></jsp:include>
            <section class="main-section">
              <jsp:include page="../Common/Link.jsp" />
              <!-- 공통 링크 -->
              <h2><%= "02".equals(type) ? "숙박후기" : "문의사항" %></h2>
              <br>
              <!-- 검색폼 -->
              <form method="get" style="width: 90%; margin: 0 auto; text-align:center;">
                <table border="1" style="width: 100%;">
                  <tr>
                    <td align="center">
                      <select name="searchField">
                        <option value="title">제목</option>
                        <option value="content">내용</option>
                      </select>
                      <input type="text" name="searchWord" />
                      <input type="submit" id="login6" value="검색하기" />
                    </td>
                  </tr>
                </table>
              </form>
              <!-- 게시물 목록 테이블(표) -->
              <table border="1" style="width: 90%;margin: 0 auto; text-align:center;">
                <!-- 각 칼럼의 이름 -->
                <tr>
                  <th width="10%">번호</th>
                  <th width="30%">제목</th>
                  <th width="20%">작성자</th>
                  <th width="10%">조회수</th>
                  <th width="30%">작성일</th>
                </tr>
        <!-- 목록의 내용 -->
		<%
		if (boardLists.isEmpty()) {
    	// 게시물이 하나도 없을 때
		%>
                <tr>
                  <td colspan="5" align="center">
                    등록된 게시물이 없습니다^^*
                  </td>
                </tr>
		<%
		}
		else {
    	// 게시물이 있을 때
    	int virtualNum = 0;  // 화면상에서의 게시물 번호
    	int countNum = 0;
    	for (BoardDTO dto : boardLists)
    	{
        // virtualNumber = totalCount--;  // 전체 게시물 수에서 시작해 1씩 감소
        virtualNum = totalCount - (((pageNum - 1) * pageSize) + countNum++);
		%>
        <tr align="center">
                  <td><%= virtualNum %></td>
                  <!--게시물 번호-->
                  <td align="left">
                    <!--제목(+ 하이퍼링크)-->
                    <a class="memo" href="View.jsp?num=<%= dto.getNum() %>&type=<%= type %>"><%= dto.getTitle() %></a>
                  </td>
                  <td align="center"><%= dto.getCustno() %></td>
                  <!--작성자 아이디-->
                  <td align="center"><%= dto.getVisitcount() %></td>
                  <!--조회수-->
                  <td align="center"><%= dto.getPostdate() %></td>
                  <!--작성일-->
                </tr>
                <% } } %>
              </table>
              <!--목록 하단의 [글쓰기] 버튼-->
              <table border="1" style="width: 90%; margin: 0 auto;text-align:center;">
                <tr align="center">
                  <!--페이징 처리-->
                  <td id="text">
                    <%= BoardPage.pagingStr(totalCount, pageSize, blockPage,
                    pageNum, request.getRequestURI()) %>
                  </td>
                  <!--글쓰기 버튼-->
                  <td>
                  <button type="button" id="login7" onclick="location.href='Write.jsp?type=<%= type %>';">글쓰기</button>
                  </td>
                </tr>
              </table>
            </section>
            <jsp:include page="../footer.jsp"></jsp:include>
          </div>
        </body>
      </html> 
