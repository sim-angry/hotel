<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>타임세일</title>
    <link rel="icon" type="image/png" sizes="32x32" href="/hotel/images/favicon-32x32.png">
  </head>
  <body>
    <div id="wrap">
      <jsp:include page="../header.jsp"></jsp:include>
      <section class="main-section1">
        <section id="car">
          <div class="page-title">
            <h2>타임세일</h2>
          </div>
          <div class="content">
            <div class="photo3">
              <img
                src="/hotel/images/time_sale.jpg"
                alt="time_sale"
                style="border: 1px solid white; border-radius: 50%"/>
            </div>
            <div class="text2">
              <ol>
                <li class="text2">
                소나타 30% 할인
                </li>
                <li class="text2">
                아반떼 10% 할인
                </li>
                <li class="text2">
                 그렌져 20% 할인
                </li>
                <li class="text2">
                 산타페 20% 할인
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
