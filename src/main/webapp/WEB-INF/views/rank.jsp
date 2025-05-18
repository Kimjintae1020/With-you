<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>랭킹 페이지</title>
    <link rel="stylesheet" href="/css/rank.css">
</head>
<body>
<div class="main_wrap">
    <!-- -------------------------------- -->
    <div class="container_1">
        <!-- -------------------------------- -->

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
            <a href="#문의하기">문의하기</a>


        </div>
        <div class="box_3">
            <button>시작하기</button>
        </div>
    </div>
    <!-- -------------------------------- -->

    <div id="contentWrap">
        <!-- -------------------------------- -->
        <div class="container_2">
            <div class="container_2_box_1">
                <h1>동네 랭킹</h1>
                <p>함께 만들어가는 우리 동네 커뮤니티</p>
            </div>
        </div>
        <!-- -------------------------------- -->
        <div class="container_3">
            <div id="rank_2">
                <img src="/images/rank/rank_2.png" alt="">
                <h2>2위</h2>
                <p class="name">성북동</p>
                <p class="point">85점</p>
                <p class="play">활동 142건</p>
            </div>
            <div id="rank_1">
                <div>
                    <img src="/images/rank/rank_1.png" alt="">
                    <h2>1위</h2>
                    <p class="name">안서동</p>
                    <p class="point">89점</p>
                    <p class="play">활동 156건</p>
                </div>

            </div>
            <div id="rank_3">
                <img src="/images/rank/rank_3.png" alt="">
                <h2>3위</h2>
                <p class="name">월곡동</p>
                <p class="point">82점</p>
                <p class="play">활동 132건</p>
            </div>
        </div>
        <!-- -------------------------------- -->

        <div class="container_4">
            <div class="left_box">
                <p>4</p>
            </div>
            <div class="center_box">
                <p class="title1">서북구 부성1동</p>
                <p class="content1">활동 128건</p>
            </div>
            <div class="right_box">
                <p class="title2">78점</p>
                <p class="content2">-1 순위</p>
            </div>
        </div>

        <div class="container_4">
            <div class="left_box">
                <p>5</p>
            </div>
            <div class="center_box">
                <p class="title1">서북구 성정1동</p>
                <p class="content1">활동 110건</p>
            </div>
            <div class="right_box">
                <p class="title2">70점</p>
                <p class="content2">+1 순위</p>
            </div>
        </div>

        <div class="container_4">
            <div class="left_box">
                <p>6</p>
            </div>
            <div class="center_box">
                <p class="title1">서북구 불당2동</p>
                <p class="content1">활동 98건</p>
            </div>
            <div class="right_box">
                <p class="title2">65점</p>
                <p class="content2">-1 순위</p>
            </div>
        </div>

        <div class="container_4">
            <div class="left_box">
                <p>7</p>
            </div>
            <div class="center_box">
                <p class="title1">서북구 쌍용2동</p>
                <p class="content1">활동 84건</p>
            </div>
            <div class="right_box">
                <p class="title2">61점</p>
                <p class="content2">-2 순위</p>
            </div>
        </div>

        <div class="container_4">
            <div class="left_box">
                <p>8</p>
            </div>
            <div class="center_box">
                <p class="title1">동남구 문성동</p>
                <p class="content1">활동 79건</p>
            </div>
            <div class="right_box">
                <p class="title2">59점</p>
                <p class="content2">+2 순위</p>
            </div>
        </div>

        <div class="container_4">
            <div class="left_box">
                <p>9</p>
            </div>
            <div class="center_box">
                <p class="title1">서북구 쌍용1동</p>
                <p class="content1">활동 73건</p>
            </div>
            <div class="right_box">
                <p class="title2">57점</p>
                <p class="content2">-1 순위</p>
            </div>
        </div>

        <div class="container_4">
            <div class="left_box">
                <p>10</p>
            </div>
            <div class="center_box">
                <p class="title1">서북구 백석동</p>
                <p class="content1">활동 68건</p>
            </div>
            <div class="right_box">
                <p class="title2">54점</p>
                <p class="content2">-3 순위</p>
            </div>
        </div>
    </div>

</div>

</body>
</html>