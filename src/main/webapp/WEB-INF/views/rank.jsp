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
            <a href="${pageContext.request.contextPath}/api/faq">문의하기</a>


        </div>
        <div class="box_3">
            <button>시작하기</button>
        </div>
    </div>
    <!-- -------------------------------- -->

    <div id="contentWrap">
        <div class="set_flex" id="btns">
            <button onclick="changeRank_left()">동네 랭킹</button>
            <button onclick="changeRank_right()">동호회 랭킹</button>
        </div>
<%--        btn     --%>





        <div id="left_Rank">
            <div class="container_2">
                <div class="container_2_box_1">
                    <h1>동네 랭킹</h1>
                    <p>함께 만들어가는 우리 동네 커뮤니티</p>
                </div>
            </div>
            <!-- -------------------------------- -->
            <div class="bottom_wrap">
                <div class="container_3">
                    <div class="rank_2">
                        <img src="/images/rank/rank_2.png" alt="">
                        <h2>2위</h2>
                        <p class="name">동남구 봉명동</p>
                        <p class="point">85점</p>
                        <p class="play">활동 142건</p>
                    </div>
                    <div class="rank_1">
                        <div>
                            <img src="/images/rank/rank_1.png" alt="">
                            <h2>1위</h2>
                            <p class="name">서북구 성정2동</p>
                            <p class="point">89점</p>
                            <p class="play">활동 156건</p>
                        </div>

                    </div>
                    <div class="rank_3">
                        <img src="/images/rank/rank_3.png" alt="">
                        <h2>3위</h2>
                        <p class="name">동남구 신안동</p>
                        <p class="point">82점</p>
                        <p class="play">활동 132건</p>
                    </div>
                </div>
            </div>
            <!-- -------------------------------- -->

            <div class="bottom_wrap">
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
<%--            left--%>








        <div id="right_Rank">
            <div class="container_2">
                <div class="container_2_box_1">
                    <h1>동호회 랭킹</h1>
                    <p>함께 만들어가는 우리 동네 커뮤니티</p>
                </div>
            </div>
            <!-- -------------------------------- -->
            <div class="bottom_wrap">
                <div class="container_3">
                    <div class="rank_2">
                        <img src="/images/rank/rank_2.png" alt="">
                        <h2>2위</h2>
                        <p class="name">불당1동 맛집 투어</p>
                        <p class="point">90점</p>
                        <p class="play">활동 28건</p>
                    </div>
                    <div class="rank_1">
                        <div>
                            <img src="/images/rank/rank_1.png" alt="">
                            <h2>1위</h2>
                            <p class="name">성정1동 러닝 크루</p>
                            <p class="point">91점</p>
                            <p class="play">활동 30건</p>
                        </div>

                    </div>
                    <div class="rank_3">
                        <img src="/images/rank/rank_3.png" alt="">
                        <h2>3위</h2>
                        <p class="name">월곡동 자전거 모임</p>
                        <p class="point">87점</p>
                        <p class="play">활동 25건</p>
                    </div>
                </div>
            </div>
            <!-- -------------------------------- -->

            <div class="bottom_wrap">
                <div class="container_4">
                    <div class="left_box">
                        <p>4</p>
                    </div>
                    <div class="center_box">
                        <p class="title1">동남구 원성2동 산책 모임</p>
                        <p class="content1">활동 23건</p>
                    </div>
                    <div class="right_box">
                        <p class="title2">84점</p>
                        <p class="content2">- 순위</p>
                    </div>
                </div>

                <div class="container_4">
                    <div class="left_box">
                        <p>5</p>
                    </div>
                    <div class="center_box">
                        <p class="title1">동남구 신안동 보드게임 모임</p>
                        <p class="content1">활동 20건</p>
                    </div>
                    <div class="right_box">
                        <p class="title2">79점</p>
                        <p class="content2">+1 순위</p>
                    </div>
                </div>

                <div class="container_4">
                    <div class="left_box">
                        <p>6</p>
                    </div>
                    <div class="center_box">
                        <p class="title1">서북구 쌍용1동 돈까스 투어</p>
                        <p class="content1">활동 17건</p>
                    </div>
                    <div class="right_box">
                        <p class="title2">74점</p>
                        <p class="content2">-1 순위</p>
                    </div>
                </div>

                <div class="container_4">
                    <div class="left_box">
                        <p>7</p>
                    </div>
                    <div class="center_box">
                        <p class="title1">서북구 불당2동 영화 모임</p>
                        <p class="content1">활동 13건</p>
                    </div>
                    <div class="right_box">
                        <p class="title2">68점</p>
                        <p class="content2">- 순위</p>
                    </div>
                </div>

                <div class="container_4">
                    <div class="left_box">
                        <p>8</p>
                    </div>
                    <div class="center_box">
                        <p class="title1">서북구 백석동 떡볶기 모임</p>
                        <p class="content1">활동 10건</p>
                    </div>
                    <div class="right_box">
                        <p class="title2">65점</p>
                        <p class="content2">+2 순위</p>
                    </div>
                </div>

                <div class="container_4">
                    <div class="left_box">
                        <p>9</p>
                    </div>
                    <div class="center_box">
                        <p class="title1">동남구 청룡동 피자 모임</p>
                        <p class="content1">활동 8건</p>
                    </div>
                    <div class="right_box">
                        <p class="title2">63점</p>
                        <p class="content2">+1 순위</p>
                    </div>
                </div>

                <div class="container_4">
                    <div class="left_box">
                        <p>10</p>
                    </div>
                    <div class="center_box">
                        <p class="title1">동남구 신방동 카페 모임</p>
                        <p class="content1">활동 7건</p>
                    </div>
                    <div class="right_box">
                        <p class="title2">60점</p>
                        <p class="content2">-1 순위</p>
                    </div>
                </div>
            </div>

        </div>

<%--        right--%>




















    <%--        contentWrap--%>
    </div>

</div>

<script>

    var state = false;
    const left_div = document.getElementById('left_Rank');
    const right_div = document.getElementById('right_Rank');

    right_div.style.display = "none";

    function changeRank_left() {
        if ( state === true) {
            left_div.style.display = "block";
            right_div.style.display = "none";
            state = false;
        }

    }

    function changeRank_right() {
        if ( state === false ) {
            left_div.style.display = "none";
            right_div.style.display = "block";
            state = true;
        }
    }
</script>

</body>
</html>