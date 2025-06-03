<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>With You Intro Page</title>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <link rel="stylesheet" href="/css/intro_style.css">
</head>
<body>
<h1 class="logo">
  <a href="${pageContext.request.contextPath}/api/main" style="display:inline-block;vertical-align:middle;">
    <img src="/images/intro/with_you.png" alt="로고 아이콘" style="width:42px;height:52px;vertical-align:middle;margin-right:8px;">
  </a>
  <a href="${pageContext.request.contextPath}/api/main" class="logo">With You</a>
</h1>
<h2>우리 동네의 새로운 이야기가</h2>
<h2>시작됩니다</h2>
<p>이웃과 함께 만들어가는 따뜻한 커뮤니티</p>

<script>

  let observer = new InntersectionObserver(()=>{})

  let div = document.querySelector('.popular-container')
  observer.observe(div[0])

</script>
<div class="popular-container button-link" onclick="location.href='${pageContext.request.contextPath}/api/rank'" tabindex="0" role="button">
  <h4 class="left_up-coner">
    <span style="font-size:28px;vertical-align:middle;">🔥</span>
    실시간 인기 동네
  </h4>
  <div class="village-container">
    <h4 class="title">안서1동</h4>
    <p class="percent">+12%</p>
    <p class="neighbor">2400명의 이웃이 활동중</p>
  </div>
  <div class="village-container">
    <h4 class="title">백석2동</h4>
    <p class="percent">+8%</p>
    <p class="neighbor">1800명의 이웃이 활동중</p>
  </div>
  <div class="village-container">
    <h4 class="title">성정1동</h4>
    <p class="percent">+10%</p>
    <p class="neighbor">2100명의 이웃이 활동중</p>
  </div>
</div>

<div class="invisible_container">
  <div class="withyou-info button-link" onclick="location.href='${pageContext.request.contextPath}/api/boards'" tabindex="0" role="button">
    <img src="/images/intro/활동_이웃.png" alt="이웃 아이콘" style="width:42px;height:42px;object-fit:contain;margin-bottom:12px;display:block;margin-left:auto;margin-right:auto;">
    <h4 class="info-detail_num" style="display:block; margin:0 auto;">42,000+</h4>
    <p class="info_detail">활동 이웃</p>
  </div>
  <div class="withyou-info button-link" onclick="location.href='${pageContext.request.contextPath}/api/club/list/account'" tabindex="0" role="button">
    <img src="/images/intro/진행중인_모임.png" alt="모임 아이콘" style="width:42px;height:42px;object-fit:contain;margin-bottom:12px;display:block;margin-left:auto;margin-right:auto;">
    <h4 class="info-detail_num" style="display:block; margin:0 auto;">1200+</h4>
    <p class="info_detail">진행중인 모임</p>
  </div>
  <div class="withyou-info button-link" onclick="location.href='${pageContext.request.contextPath}/api/map'" tabindex="0" role="button">
    <img src="/images/intro/참여_지역.png" alt="지역 아이콘" style="width:42px;height:42px;object-fit:contain;margin-bottom:12px;display:block;margin-left:auto;margin-right:auto;">
    <h4 class="info-detail_num" style="display:block; margin:0 auto;">25개구</h4>
    <p class="info_detail">참여 지역</p>
  </div>
</div>

<div class="join" style="display:flex;align-items:center;">
  <img src="/images/intro/방금전.png" alt="방금 전 아이콘" style="margin-left:12px; width:54px; height:54px; object-fit:contain; margin-right:20px;">
  <div>
    <p class="now" style="top:5px;left:11px">방금 전</p>
    <p class="join_now" style="margin-top:0px;left:10px">새로운 이웃 12명이 가입했어요!</p>
  </div>
</div>

<button type="button" class="start-button" onClick="location.href='${pageContext.request.contextPath}/api/main'">With You 시작하기</button>

<div class="invisible_container1">
  <p>이미 계정이 있으신가요?</p>
  <p class="login_button"><a href="${pageContext.request.contextPath}/api/login">로그인하기</a></p>
</div>
<footer>
  <p>© 2025 With You. All rights reserved.</p>
  <p>이용약관 | 개인정보처리방침</p>

</body>
</html>