<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
  <meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>국내숙박예약사이트</title>
    <link rel="stylesheet" href="/hotel/styles.css" />
	<link rel="icon" type="image/png" sizes="32x32" href="/hotel/images/favicon-32x32.png">
  </head>
  
  <script>
$(function () {
    $(".nav > ul >li").mouseover(function(){
        $(this).find(".choice").stop().slideDown();
    });

    $(".nav > ul >li").mouseout(function(){
        $(this).find(".choice").stop().slideUp();
    });
});
</script>
  
  <body>
    <div id="wrap">
      <div id="header">
        <img src="/hotel/images/hotel.jpg" alt="로고 이미지" class="logo">
        <div class="nav">
          <ul>
            <li>
              <a href="/hotel/reserve.jsp">숙박예약</a>
              <ul class="choice">
                <li><a class="trip" href="/hotel/accommodation/gwangju_holiday.jsp">홀리데이인 광주호텔</a></li>
                <li><a class="trip" href="/hotel/accommodation/busan_hotel.jsp">롯데호텔 부산</a></li>
                <li><a class="trip" href="/hotel/accommodation/daegu_hotel.jsp">호텔인터불고 대구</a></li>
                <li><a class="trip" href="/hotel/accommodation/daejeon_hotel.jsp">롯데시티호텔 대전</a></li>
                <li><a class="trip" href="/hotel/accommodation/cheonan_hotel.jsp">신라스테이 천안</a></li>
                <li><a class="trip" href="/hotel/accommodation/Ulsan_hotel.jsp">롯데호텔 울산</a></li>
                <li><a class="trip" href="/hotel/accommodation/Gangneung_hotel.jsp">강릉 씨마크호텔</a></li>
                <li><a class="trip" href="/hotel/accommodation/jeju_hotel.jsp">제주신라호텔</a></li>               
              </ul>
            </li>
            <li>
              <a href="/hotel/car.jsp">렌터카예약</a>
              <ul class="choice">
                <li><a href="/hotel/car_rent/avante.jsp">아반떼</a></li>
                <li><a href="/hotel/car_rent/sonata.jsp">소나타</a></li>
                <li><a href="/hotel/car_rent/grandeur.jsp">그랜저</a></li>
                <li><a href="/hotel/car_rent/santafe.jsp">산타페</a></li>
              </ul>
            </li>
            <li>
              <a href="#">이벤트</a>
              <ul class="choice">
                <li><a href="/hotel/event/time_sale1.jsp">호텔 할인특가</a></li>
                <li><a href="/hotel/event/time_sale2.jsp">렌터카 할인특가</a></li>
              </ul>
            </li>
            <li>
              <a href="#">고객센터</a>
              <ul class="choice">
                <li><a href="/hotel/search.jsp">숙박예약조회/취소</a></li>
                <li><a href="/hotel/search_car.jsp">렌트카예약조회/취소</a></li>
                <li><a href="/hotel/search_payment.jsp">결제하기</a></li>
                <li><a href="/hotel/09PagingBoard/List.jsp?type=01">문의사항</a></li>
                <li><a href="/hotel/09PagingBoard/List.jsp?type=02">숙박후기</a></li>
              </ul>
            </li>
            <li>
              <a href="/hotel/index.jsp">Home</a>
              <ul class="choice">
              </ul>
            </li>
          </ul>
        </div>
      <jsp:include page="Link.jsp" />        	
      </div>
    </div>
</body>
</html>