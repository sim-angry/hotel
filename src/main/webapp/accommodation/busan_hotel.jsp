<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>롯데호텔 부산</title>
<link rel="icon" type="image/png" sizes="32x32" href="/hotel/images/favicon-32x32.png">
</head>
<body>
    <div id="wrap">
   <jsp:include page ="../header.jsp"></jsp:include>
   <section class="main-section1">
      <section id="hotel">
        <div class="page-title">
          <h2>롯데호텔 부산</h2>
        </div>
        <div class="content">
          <div class="photo1">
            <img src="/hotel/images/busan_hotel.jpg" alt="부산호텔" style="border: 1px solid white; border-radius: 50%;"/>
            <div class="photo2" style="border: 1px solid white; border-radius: 50%;overflow:hidden;">
          	<jsp:include page="busan_api.html"></jsp:include>
          	</div>
          </div>
          <div class="text1">
            <ol>
              <li class="text1">
                1인 : 300,000원<br>
                2인 : 350,000원
              </li>
              <li class="text1">
                14세 미만의 고객은 클럽 라운지 이용에 제한이 있습니다.</li>
              <li class="text1">
				예약 시 소아와 같이 투숙하시는 경우 소아 나이 기재 필요합니다. (고객메모 기재 / 2인투숙 상품에만 인원추가 가능)</li>
              <li class="text1">
				클럽 라운지 혜택 1인 포함 상품을 구매했으나 실 체크인 인원이 2인일 경우 라운지 혜택 1인 추가 요금(60,500원)이 발생합니다.</li>
              <li class="text1">
 			    라운지의 경우 14세 이상부터 이용이 가능하며 유아 동반이 불가능합니다.</li>
              <li class="text1">
				영업일 17시 기준, 주말 및 공휴일 취소 산정일에서 제외/취소불가</li>
            </ol>
          </div>
        </div>
      </section>
  </section>
  <jsp:include page="../footer.jsp"></jsp:include>
</div>
</body>
</html>