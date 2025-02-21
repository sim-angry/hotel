<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔인터불고 대구</title>
<link rel="icon" type="image/png" sizes="32x32" href="/hotel/images/favicon-32x32.png">
</head>
<body>
    <div id="wrap">
   <jsp:include page ="../header.jsp"></jsp:include>
   <section class="main-section1">
      <section id="hotel">
        <div class="page-title">
          <h2>호텔인터불고 대구</h2>
        </div>
        <div class="content">
          <div class="photo1">
            <img src="/hotel/images/daegu_hotel.jpg" alt="대구호텔" style="border: 1px solid white; border-radius: 50%"/>
            <div class="photo2" style="border: 1px solid white; border-radius: 50%;overflow:hidden;">
          	<jsp:include page="daegu_api.html"></jsp:include>
          	</div>
          </div>
          <div class="text1">
            <ol>
              <li class="text1">
                1인 : 200,000원<br>
                2인 : 250,000원
              </li>
              <li class="text1">
                수영장 및 휘트니스센터는 매월 첫째, 셋째주 일요일 휴관일 입니다.
              </li>
              <li class="text1">
				호텔 내 아기침대는 1개입니다. (소진 시 제공불가하며, 별도의 안전 가드는 없습니다.)
				</li>
              <li class="text1">
				모든 추가비용 현장결제
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
            <br>
      </section>
  </section>
  <jsp:include page="../footer.jsp"></jsp:include>
</div>
</body>
</html>