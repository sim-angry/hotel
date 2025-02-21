<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신라스테이 천안</title>
<link rel="icon" type="image/png" sizes="32x32" href="/hotel/images/favicon-32x32.png">
</head>
<body>
    <div id="wrap">
   <jsp:include page ="../header.jsp"></jsp:include>
   <section class="main-section1">
      <section id="hotel">
        <div class="page-title">
          <h2>신라스테이 천안</h2>
        </div>
        <div class="content">
          <div class="photo1">
            <img src="/hotel/images/ulsan_hotel.jpg" alt="천안호텔" style="border: 1px solid white; border-radius: 50%"/>
            <div class="photo2" style="border: 1px solid white; border-radius: 50%;overflow:hidden;">
          	<jsp:include page="cheonan_api.html"></jsp:include>
          	</div>
          </div>
          <div class="text1">
            <ol>
              <li class="text1">
                1인 : 300,000원<br>
                2인 : 350,000원
              </li>
              <li class="text1">
                애완동물 관련한 별도의 법규 및 규정이 없는 경우, 시각 장애 고객 안내견(보조견)을 제외한 애완 동물 동반 고객은 호텔의 공용 지역 혹은 영업장 출입이 제한합니다.
                </li>            
              <li class="text1">
				시각 장애 고객의 안내를 위한 맹인 안내견(보조견)은 호텔의 공용 지역 및 모든 영업장 내 출입이 가능합니다.
              <li class="text1">
				클럽 라운지 혜택 1인 포함 상품을 구매했으나 실 체크인 인원이 2인일 경우 라운지 혜택 1인 추가 요금(60,500원)이 발생합니다.
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