<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>With You</title>
    <link rel="stylesheet" href="/css/main.css">
</head>
<body>
<!-- -------------------------------- -->
<div class="main_wrap">
    <!-- -------------------------------- -->
    <div class="container_1">
        <a href="${pageContext.request.contextPath}/api/main" id="logo">
            <img src="/images/login/Frame.png" alt="경로 에러">
            <h2>With You</h2>
        </a>



        <div class="box_2">
            <a href="${pageContext.request.contextPath}/api/main">홈</a>
            <a href="#소개">소개</a>
            <a href="${pageContext.request.contextPath}/api/boards">커뮤니티</a>
            <a href="${pageContext.request.contextPath}/api/map">지도</a>
            <a href="${pageContext.request.contextPath}/api/rank">랭킹</a>
            <a href="${pageContext.request.contextPath}/api/faq">문의하기</a>
            <a href="${pageContext.request.contextPath}/api/club/list/account">동호회</a>

        </div>
        <div class="box_3">
            <button onclick="location.href='${pageContext.request.contextPath}/api/boards'">시작하기</button>
        </div>


    </div>

    <!-- -------------------------------- -->

    <div class="container_2">
        <div class="left_box">
            <div id="div_top">
                <p id="p_2">이웃과 함께</p>
                <p>우리 동네 최고의 커뮤니티</p>
            </div>

            <h1 id="h_1">신뢰할 수 있는</h1>
            <h1 id="h_2">우리 동네 커뮤니티</h1>
            <br>
            <p>당신의 동네가 중요합니다. 이웃들과 정보를 공유하고, 모임을 만들고, 지역 활동에</p>
            <p>참여하세요. 모든 것이 한곳에서 이루어집니다.</p>

            <div id="div_bottom">
                <button id="left_btn" onclick="location.href='${pageContext.request.contextPath}/api/boards'">커뮤니티 시작하기</button>
                <button id="right_btn" onclick="location.href='${pageContext.request.contextPath}/api/boards'">동네 둘러보기</button>
            </div>

        </div>



        <div class="right_box">
            <img src="/images/main/mainImage.png" alt="이미지가 없습니다.">

        </div>
    </div>

    <!-- -------------------------------- -->
    <div class="container_3">
        <div class="wrap">
            <h2>Wity You와 함께하는 즐거운 동네생활</h2>
            <br>
            <p id="p_1">이웃과 함께 만들어가는 따뜻한 우리 동네</p>
            <div class="wrap-box_1">
                <div class="info_box">
                    <img src="/images/main/main_btm_1.png" alt="이미지가 없습니다." width="48">
                    <h3>동네 기반 커뮤니티</h3>
                    <p>실제 거주지 인증을 통해 신뢰할 수 있는 이웃들과<br>소통하세요</p>
                </div>
                <div class="info_box">
                    <img src="/images/main/main_btm_2.png" alt="이미지가 없습니다." width="48">
                    <h3>이웃 평가 시스템</h3>
                    <p>매너 온도로 신뢰할 수 있는 이웃을 만나보세요</p>
                </div>
                <div class="info_box">
                    <img src="/images/main/main_btm_3.png" alt="이미지가 없습니다." width="48">
                    <h3>지도 기반 모임</h3>
                    <p>우리 동네 모임 장소를 쉽게 공유하고 만나보세요</p>
                </div>
                <div class="info_box">
                    <img src="/images/main/main_btm_4.png" alt="이미지가 없습니다." width="48">
                    <h3>커뮤니티 안전</h3>
                    <p>부적절한 콘텐츠 신고 및 모니터링 시스템</p>
                </div>
                <div class="info_box">
                    <img src="/images/main/main_btm_5.png" alt="이미지가 없습니다." width="48">
                    <h3>동네 소통</h3>
                    <p>이웃들과 실시간으로 소통하고 정보를 공유하세요</p>
                </div>
                <div class="info_box">
                    <img src="/images/main/main_btm_6.png" alt="이미지가 없습니다." width="48">
                    <h3>동네 랭킹</h3>
                    <p>매월 가장 활발한 동네를 선정하고 특별한 혜택을<br>제공합니다</p>
                </div>
            </div>

        </div>


    </div>


</div>

</body>
</html>