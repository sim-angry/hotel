<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>국내숙박예약사이트</title>
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <link rel="stylesheet" href="/hotel/styles.css" />
	<link rel="icon" type="image/png" sizes="32x32" href="/hotel/images/favicon-32x32.png">
</head>
<body>
    <div id="wrap">
        <div id="header">
            <img src="/hotel/images/hotel.jpg" alt="로고 이미지" class="logo">
            <div class="nav">
                <ul>
                    <li><a href="/hotel/index.jsp">Home</a></li>
                    <li><a href="/hotel/reserve.jsp">숙박예약</a></li>
                    <li><a href="/hotel/car.jsp">렌터카예약</a></li>
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
                </ul>
            </div>
            <jsp:include page="Link.jsp" />
        </div>
    </div>
    <script>
        $(function () {
            $(".nav > ul > li").click(function() {
                $(this).find(".choice").stop().slideToggle();
                $(".nav > ul > li").not(this).find(".choice").slideUp();
            });
        });
    </script>
</body>
</html>
