<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제주신라호텔</title>
<link rel="icon" type="image/png" sizes="32x32" href="/hotel/images/favicon-32x32.png">
</head>
<body>
    <div id="wrap">
   <jsp:include page ="../header.jsp"></jsp:include>
   <section class="main-section1">
      <section id="hotel">
        <div class="page-title">
          <h2>제주신라호텔</h2>
        </div>
        <div class="content">
          <div class="photo1">
            <img src="/hotel/images/jeju_hotel.jpg" alt="제주호텔" style="border: 1px solid white; border-radius: 50%"/>
          	<div class="photo2" style="border: 1px solid white; border-radius: 50%;overflow:hidden;">
          	<jsp:include page="jeju_api.html"></jsp:include>
          	</div>
          </div>
          <div class="text1">
            <ol>
              <li class="text1">
                1인 : 600,000원<br>
                2인 : 650,000원
              </li>
              <li class="text1">
				인원추가비 : 37개월 ~ 성인 : 24,200원 (1인/1박 기준)
              </li>
              <li class="text1">
				객실 1실 당 성인은 최대 3인까지만 투숙 가능하며, 소인(37개월 이상~만 12세 이하)은 최대 2인까지만 동반 투숙 가능합니다.
				</li>
              <li class="text1">
				조식 이용 원하실 경우 현장에서 10% 투숙객 할인된 금액으로 이용 가능<br>
				조식 정상가 : 성인 70,000원, 소인 40,000원<br>
				투숙객 할인가 : 성인 63,000원, 어린이 36,000원
				</li>
              <li class="text1">
                영업일 17시 기준, 주말 및 공휴일 취소 산정일에서 제외/취소불가          
              </li>
              <li class="text1">
				성수기 및 연휴 : 별도 문의요망
              </li>
            </ol>
          </div>
        </div>
      </section>
  </section>
  <jsp:include page="../footer.jsp"></jsp:include>
</div>
</body>
</html>