<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <tr>
        <td align="center">
        <!-- 로그인 여부에 따른 메뉴 변화 -->
        <% if (session.getAttribute("UserId") == null) { %>
           	<button type="button" id="login3" onclick="location.href='/hotel/LoginForm.jsp';">로그인</button>         	
      
        <% } else { %>
      		<button type="button" id="login3" onclick="location.href='/hotel/Logout.jsp';">로그아웃</button>  
        <% } %>
        </td>
    </tr>
