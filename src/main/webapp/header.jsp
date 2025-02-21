<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="icon" type="image/png" sizes="32x32" href="/hotel/images/favicon-32x32.png">
    <title>Dynamic Header Include</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {
            function checkScreenSize() {
                let width = window.innerWidth;
                let pageToInclude = (width <= 767) ? "/hotel/mobile_header.jsp" : "/hotel/main_header.jsp";

                $.ajax({
                    url: pageToInclude,
                    method: "GET",
                    success: function(data) {
                        $("#dynamicHeader").html(data);
                        initializeDynamicContent(); // 동적 콘텐츠 초기화 함수 호출
                    },
                    error: function() {
                        console.log("Error loading the header.");
                    }
                });
            }

            function initializeDynamicContent() {
                // 동적으로 로드된 콘텐츠에서 필요한 JavaScript 초기화 코드
                // 예: 특정 이벤트 바인딩
                console.log("Dynamic content initialized");
            }

            checkScreenSize();

            $(window).resize(function() {
                checkScreenSize();
            });
        });
    </script>
</head>
<body>
    <div id="dynamicHeader">
        <!-- 여기에 AJAX로 로드된 내용을 삽입합니다. -->
    </div>
</body>
</html>