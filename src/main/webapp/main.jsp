<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>국내숙박예약사이트</title>
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <link rel="stylesheet" href="styles.css" />
  </head>
  <body>
    <div id="wrap">
      <div id="header">
        <div class="logo"></div>
        <div class="nav">
          <ul>
            <li>
              <a href="#">국내숙박</a>
              <ul class="choice">
                <li><a href="#">전라남도</a></li>
                <li><a href="#">전라북도</a></li>
                <li><a href="#">경상남도</a></li>
                <li><a href="#">경상북도</a></li>
                <li><a href="#">충청남도</a></li>
                <li><a href="#">충청북도</a></li>
                <li><a href="#">강원도</a></li>
              </ul>
            </li>
            <li>
              <a href="#">렌터카</a>
              <ul class="choice">
                <li><a href="#">아반떼</a></li>
                <li><a href="#">소나타</a></li>
                <li><a href="#">그랜저</a></li>
                <li><a href="#">산타페</a></li>
              </ul>
            </li>
            <li>
              <a href="#">이벤트 특가</a>
              <ul class="choice">
                <li><a href="#">호텔 기획전</a></li>
                <li><a href="#">렌터카 할인특가</a></li>
              </ul>
            </li>
            <li>
              <a href="#">고객센터</a>
              <ul class="choice">
                <li><a href="#">예약취소</a></li>
                <li><a href="#">건의사항</a></li>
                <li><a href="#">사용후기</a></li>
              </ul>
            </li>
          </ul>
        </div>
      </div>
      <!-- //header -->

      <div id="slider"></div>
      <div id="slider1"></div>

      <!-- //slider -->

      <div id="contents">
        <div class="content1"></div>
        <div class="content2"></div>
        <div class="content3"></div>
      </div>
      
      <div id="contents1">
        <div class="content1"></div>
        <div class="content2"></div>
        <div class="content3"></div>
      </div>

      <!-- //contents -->

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
                  href="#"
                  >개인 정보 보호 정책</a
                >
              </li>
              <li>
                <a
                  href="#"
                  >쿠키 정책</a
                >
              </li>
              <li>
                <a
                  href="#"
                  >이용 약관</a
                >
              </li>
              <li>
                <a
                  href="#"
                  >고객센터</a
                >
              </li>
            </ul>
          </div>
          <div class="copy">
            <p>호텔스컴바인 | email : CS@koreasupport.hotels.com</p>
            <p>전화: 02-3483-5335 | 매일 09:00 ~ 21:00</p>
          </div>
          <div class="familysite">
            <select name="sitelist">
              <option value="#">관련사이트</option>
              <option value="1">국내숙박</option>
              <option value="2">렌터카</option>
              <option value="3">이벤트 특가</option>
              <option value="4">고객센터</option>
            </select>
          </div>
          <div id="sns">
            <ul>
              <li>
                <a href="#"><img src="images/sns-1.png" /></a>
              </li>
              <li>
                <a href="#"><img src="images/sns-2.png" /></a>
              </li>
              <li>
                <a href="#"><img src="images/sns-3.png" /></a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <!-- //wrap -->
    <script src="script.js"></script>
  </body>
</html>
