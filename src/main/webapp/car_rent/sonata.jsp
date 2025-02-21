<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>소나타</title>
    <link rel="icon" type="image/png" sizes="32x32" href="/hotel/images/favicon-32x32.png">
  </head>
  <body>
    <div id="wrap">
      <jsp:include page="../header.jsp"></jsp:include>
      <section class="main-section1">
        <section id="car">
          <div class="page-title">
            <h2>소나타</h2>
          </div>
          <div class="content">
            <div class="photo">
              <img
                src="/hotel/images/SONATA.jpg"
                alt="소나타"
                style="border: 1px solid white; border-radius: 50%"
              />
            </div>
            <div class="text1">
              <ol>
                <li class="text1">1일 렌트료 : 80,000원</li>
                <li class="text1">
                  해당요금은 24년 4월 15일자 기준 요금입니다.(VAT 포함 가격)
                </li>
                <li class="text1">
                  보험연령 만 26세 이상 사고시 고객부담금 30만원, 대물 5천만원,
                  대인 무제한, 자손 5천만원 기준 대여료입니다.
                </li>
                <li class="text1">
                  보험조건 및 보험연령에 따라 대여료는 변동될 수 있으며,
                  세부사항은 상담을 통해 확인하실 수 있습니다.
                </li>
                <li class="text1">
                  위 표에 없는 차종은 상담 신청을 통해 확인하실 수 있습니다.
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
