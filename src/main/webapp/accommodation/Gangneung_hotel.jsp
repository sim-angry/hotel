<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강릉 씨마크호텔</title>
<link rel="icon" type="image/png" sizes="32x32" href="/hotel/images/favicon-32x32.png">
</head>
<body>
    <div id="wrap">
   <jsp:include page ="../header.jsp"></jsp:include>
   <section class="main-section1">
      <section id="hotel">
        <div class="page-title">
          <h2>강릉 씨마크호텔</h2>
        </div>
        <div class="content">
          <div class="photo1">
            <img src="/hotel/images/Gangneung_hotel.jpg" alt="강릉호텔" style="border: 1px solid white; border-radius: 50%"/>
            <div class="photo2" style="border: 1px solid white; border-radius: 50%;overflow:hidden;">
          	<jsp:include page="Gangneung_api.html"></jsp:include>
          	</div>
          </div>
          <div class="text1">
            <ol>
              <li class="text1">
                1인 : 550,000원<br>
                2인 : 600,000원
              </li>
              <li class="text1">
                소아 동반 투숙시 접수 할 때 정확한 소아 나이 기재 해주셔야 빠른 예약진행 도와드릴 수 있습니다.<br> 
                미기재 시 예약진행 불가한 점 참고바랍니다
              </li>
              <li class="text1">
              유아용품 대여서비스 : 아기침대(12개월 미만), 아기욕조, 젖병소독기
              </li>
              <li class="text1">
				클럽 라운지 혜택 1인 포함 상품을 구매했으나 실 체크인 인원이 2인일 경우 라운지 혜택 1인 추가 요금(60,500원)이 발생합니다.
			 </li>
              <li class="text1">
 			    엑스트라베드 추가: 55,000원(더블 객실에만 설치 가능)
			  </li>
              <li class="text1">
				영업일 17시 기준, 주말 및 공휴일 취소 산정일에서 제외/취소불가
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