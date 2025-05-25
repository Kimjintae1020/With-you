<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>문의하기 페이지</title>
    <link rel="stylesheet" href="/css/faq.css">
</head>
<body>
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
                <a href="#문의하기">문의하기</a>

            </div>
            <div class="box_3">
                <button onclick="location.href='${pageContext.request.contextPath}/api/boards'">시작하기<img id="btn_img" src="/images/main/arrow.png" alt="" width="16"></button>
            </div>
        </div> <!-- container_1 -->
        <!-- -------------------------------- -->
        <div class="contentWrap">
            <div class="container_2">
                <h1>Q&A</h1>
            </div>

            <div class="container_3">
                <p>자주 묻는 질문</p>
            </div>

            <div class="container_4">

            </div>
        </div>



    </div> <!-- main_wrap -->

</body>
</html>