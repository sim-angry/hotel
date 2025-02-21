<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>footer</title>
<link rel="stylesheet" href="/hotel/styles.css" />
</head>
<body>
<div id="footer">
        <div class="footer1"></div>
        <div class="footer2"></div>
        <div class="footer3"></div>
        </div>
      <!-- //footer -->
      <div id="footer4">
        <div class="bottom">
          <!--bottom: 하단메뉴 + Copyright-->
          <div class="btmenu">
            <ul>
              <li>
                <a
                  href="/hotel/list/personal.jsp"
                  >개인 정보 보호 정책</a
                >
              </li>
              <li>
                <a
                  href="/hotel/list/cookie.jsp"
                  >쿠키 정책</a
                >
              </li>
              <li>
                <a
                  href="/hotel/list/notication.jsp"
                  >이용 약관</a
                >
              </li>
            </ul>
          </div>
          <div class="copy">
            <p>앵보컴바인 | email : CS@koreasupport.hotels.com</p>
            <p>전화: 02-3483-5335 | 매일 09:00 ~ 21:00</p>
          </div>
          <div class="familysite">
		<select name="sitelist" onchange="location = this.value;">
    		<option value="#">관련사이트</option>
    		<option value="https://www.agoda.com/">아고다</option>
    		<option value="https://www.hanatour.com/">하나투어</option>
    		<option value="https://www.hotelscombined.co.kr/">호텔스컴바인</option>
    		<option value="https://www.yanolja.com/">야놀자</option>
		</select>
          </div>
          <div id="sns">
            <ul>
              <li>
                <a href="#"><img src="/hotel/images/sns-1.png" /></a>
              </li>
              <li>
                <a href="#"><img src="/hotel/images/sns-2.png" /></a>
              </li>
              <li>
                <a href="#"><img src="/hotel/images/sns-3.png" /></a>
              </li>
            </ul>
          </div>
        </div>
      </div>
</body>
</html>