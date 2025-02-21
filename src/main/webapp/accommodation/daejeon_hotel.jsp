<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>롯데시티호텔 대전</title>
<link rel="icon" type="image/png" sizes="32x32" href="/hotel/images/favicon-32x32.png">
</head>
<body>
    <div id="wrap">
   <jsp:include page ="../header.jsp"></jsp:include>
   <section class="main-section1">
      <section id="hotel">
        <div class="page-title">
          <h2>롯데시티호텔 대전</h2>
        </div>
        <div class="content">
          <div class="photo1">
            <img src="/hotel/images/daejeon_hotel.jpg" alt="대전호텔" style="border: 1px solid white; border-radius: 50%"/>
            <div class="photo2" style="border: 1px solid white; border-radius: 50%;overflow:hidden;">
          	<jsp:include page="daejeon_api.html"></jsp:include>
          	</div>
          </div>
          <div class="text1">
            <ol>
              <li class="text1">
                1인 : 250,000원<br>
                2인 : 300,000원
              </li>
              <li class="text1">
                조식 추가 결제 시 투숙기간 내 사용 가능하며, 이용하지 않은 내역에 대해서는 환불 및 상품 교체가 불가합니다.
              </li>
              <li class="text1">
				Re:think" 캠페인의 일환으로 일회용품 사용 줄이기에 동참하고자 칫솔, 치약은 제공되지 않습니다. (22년 4월 15일 부 시행)
				</li>
              <li class="text1">
				주차공간이 협소하여 금/토요일은 주차 이용에 불편을 드릴 수 있는 점 양해 부탁 드립니다.
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