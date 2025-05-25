<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>지도</title>
    <link rel="stylesheet" href="/css/map.css">
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
            <button onclick="location.href='${pageContext.request.contextPath}/api/boards'">시작하기<img id="btn_img" src="/images/main/arrow.png" alt="" width="16"></button>
        </div>
    </div>
    <!-- -------------------------------- -->
    <div class="container_2">
        <div class="map">
            <img id="map1" src="/images/map/map_1.svg" alt="" onclick="goToDetail(this)">
            <img id="map2" src="/images/map/map_2.svg" alt="" onclick="goToDetail(this)">
            <img id="map3" src="/images/map/map_3.svg" alt="" onclick="goToDetail(this)">
            <img id="map4" src="/images/map/map_4.svg" alt="" onclick="goToDetail(this)">
            <img id="map5" src="/images/map/map_5.svg" alt="" onclick="goToDetail(this)">
            <img id="map6" src="/images/map/map_6.svg" alt="" onclick="goToDetail(this)">
            <img id="map7" src="/images/map/map_7.svg" alt="" onclick="goToDetail(this)">
            <img id="map8" src="/images/map/map_8.svg" alt="" onclick="goToDetail(this)">
            <img id="map9" src="/images/map/map_9.svg" alt="" onclick="goToDetail(this)">
            <img id="map10" src="/images/map/map_10.svg" alt="" onclick="goToDetail(this)">
            <img id="map11" src="/images/map/map_11.svg" alt="" onclick="goToDetail(this)">
            <img id="map12" src="/images/map/map_12.svg" alt="" onclick="goToDetail(this)">
            <img id="map13" src="/images/map/map_13.svg" alt="" onclick="goToDetail(this)">
            <img id="map14" src="/images/map/map_14.svg" alt="" onclick="goToDetail(this)">
            <img id="map15" src="/images/map/map_15.svg" alt="" onclick="goToDetail(this)">
            <img id="map16" src="/images/map/map_16.svg" alt="" onclick="goToDetail(this)">
            <img id="map17" src="/images/map/map_17.svg" alt="" onclick="goToDetail(this)">
            <img id="map18" src="/images/map/map_18.svg" alt="" onclick="goToDetail(this)">
            <img id="map19" src="/images/map/map_19.svg" alt="" onclick="goToDetail(this)">
        </div>

    </div>




</div>

<script>
    function goToDetail(img) {
        const id = img.id;
        window.location.href = "main?" + encodeURIComponent(id);

    }
</script>
</body>
</html>