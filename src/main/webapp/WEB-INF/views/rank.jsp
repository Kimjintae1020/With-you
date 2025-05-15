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
        <div class="box_1">
            <img src="/images/rank/Frame.png" alt="이미지가 없습니다">
            <h2>With You</h2>

        </div>

        <div class="box_2">
            <a href="#홈">홈</a>
            <a href="#소개">소개</a>
            <a href="#커뮤니티">커뮤니티</a>
            <a href="#지도">지도</a>
            <a href="#랭킹">랭킹</a>
            <a href="#문의하기">문의하기</a>

        </div>
        <div class="box_3">
            <button>시작하기<img id="btn_img" src="/images/rank/arrow.png" alt="" width="16"></button>
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

        <table class="other_box">
            <tr>
                <td>등수</td>
                <td>동네 이름</td>
                <td>회원 수</td>
                <td>좋아요 수</td>
                <td>평점</td>
            </tr>

            <tr>
                <td>4</td>
                <td>성정동</td>
                <td>100</td>
                <td>100</td>
                <td>78점</td>
            </tr>
            <tr>
                <td>5</td>
                <td>성정동</td>
                <td>100</td>
                <td>100</td>
                <td>78점</td>
            </tr>
            <tr>
                <td>6</td>
                <td>성정동</td>
                <td>100</td>
                <td>100</td>
                <td>78점</td>
            </tr>
        </table>

        <!--
            <div class="other_box">
                <p class="other_rank">등수</p>
                <p class="other_name">동네 이름</p>
                <p class="other_account">회원 수</p>
                <p class="other_like">좋아요 수</p>
                <p class="other_point">평점</p>
            </div>

            <div class="other_box">
                <p class="other_rank">4</p>
                <p class="other_name">성정동</p>
                <p class="other_account">78</p>
                <p class="other_like">78</p>
                <p class="other_point">78점</p>
            </div> -->
    </div>

</div>

</body>
</html>