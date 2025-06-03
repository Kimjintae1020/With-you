<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="ko">

<head>
  <title>커뮤니티</title>
  <meta charset="UTF-8">
  <style>
    body {
      margin: 0;
      font-family: Arial, sans-serif;
    }

    .navbar {
      height: 28px;
      display: flex;
      justify-content: center;
      align-items: center;
      gap: 6px;
      background-color: #3b82f6;
    }

    .nav-button {
      width: 126px;
      height: 28px;
      border: none;
      border-radius: 29.5px;
      font-size: 16px;
      font-weight: bold;
      cursor: pointer;
      text-decoration: none;
      color: #c5d7f2;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .nav-button.active {
      background-color: #7fb3fa;
      color: #fff7f2;
    }

    .container {
      display: flex;
      padding: 20px 5%;
      gap: 30px;
    }

    .sidebar,
    .rightbar {
      width: 20%;
    }

    .main {
      width: 60%;
    }

    .section {
      background-color: #3b82f6;
      border-radius: 50px;
      padding: 16px;
      margin-bottom: 20px;
      box-shadow: 0 0 5px rgba(0, 0, 0, 0.05);
      display: flex;
      flex-direction: column;
      align-items: center;
    }

    .section-1 {
      margin-bottom: 20px;
      padding: 16px;
    }

    .section h3 {
      margin-top: 0;
    }

    .button {
      display: flex;
      width: 90px;
      height: 45px;
      font-size: 14px;
      font-weight: bold;
      background-color: #EDF1FF;
      color: #000000;
      border-radius: 10px;
      cursor: pointer;
      text-align: center;
      text-decoration: none;
      justify-content: center;
      align-items: center;
    }

    .search-container {
      display: flex;
      justify-content: flex-end;
      margin-top: 10px;
    }

    #keywordInput {
      padding: 6px 10px;
      border: 1px solid #ccc;
      border-radius: 6px;
      font-size: 14px;
      width: 200px;
    }

    .board {
      display: flex;
      flex-direction: column-reverse;
      gap: 16px;
      margin-top: 24px;
    }

    .post {
      background-color: #ffffff;
      border: 1px solid #e5e7eb;
      border-radius: 10px;
      padding: 16px;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
      transition: box-shadow 0.2s;
      cursor: pointer;
    }

    .post:hover {
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.08);
    }

    .post-title {
      font-size: 18px;
      font-weight: bold;
      color: #1f2937;
      margin: 0 0 8px 0;
    }

    .post-info {
      font-size: 14px;
      color: #6b7280;
      display: flex;
      align-items: center;
    }

    .post-info span {
      padding: 0 10px;
    }

    .post-info span:not(:first-child) {
      border-left: 1px solid #d1d5db;
    }

    .post-stats {
      font-size: 16px;
      color: #374151;
      display: flex;
      gap: 16px;
      justify-content: flex-end;
    }

    .comments,
    .likes {
      display: flex;
      align-items: center;
      gap: 6px;
    }

    .top-navbar {
      height: 88px;
      background-color: #ffffff;
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding: 0 5%;
      border-bottom: 1px solid #e5e7eb;
      position: sticky;
      top: 0;
      z-index: 999;
    }

    .logo {
      font-size: 20px;
      font-weight: bold;
      color: #3b82f6;
    }

    .menu {
      display: flex;
      gap: 40px;
    }

    .menu-button {
      text-decoration: none;
      color: #374151;
      font-size: 16px;
      font-weight: 500;
      transition: color 0.2s;
    }

    .menu-button:hover {
      color: #1d4ed8;
    }

    .start-button {
      background-color: #2563eb;
      color: white;
      padding: 8px 16px;
      border-radius: 20px;
      text-decoration: none;
      font-size: 14px;
      font-weight: bold;
      transition: background-color 0.3s;
    }

    .start-button:hover {
      background-color: #2563eb;
    }

    #With-You {
      color: #3B82F6;
      margin-left: 15px;
    }

    .headline {
      display: flex;
      justify-content: center;
      align-items: center;
    }

    .pagination {
      text-align: center;
      margin-top: 30px;
    }

    .pagination a {
      margin: 0 6px;
      text-decoration: none;
      color: #000;
    }

    .pagination .active {
      font-weight: bold;
      color: #007bff;
    }

    .post-link {
      text-decoration: none;
      color: inherit;
    }

    .post-item {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 16px;
      border: 1px solid #e5e7eb;
      border-radius: 10px;
      background-color: #f9fafb;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
      transition: box-shadow 0.2s;
    }

    .post-item:hover {
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .post-content {
      display: flex;
      flex-direction: column;
      gap: 8px;
    }

    .post-title {
      font-size: 18px;
      font-weight: bold;
      margin: 0;
      color: #1f2937;
    }

    .post-meta {
      font-size: 14px;
      color: #6b7280;
      display: flex;
      gap: 12px;
    }

    .post-stats {
      display: flex;
      align-items: center;
      gap: 16px;
    }

    .stat {
      display: flex;
      align-items: center;
      gap: 6px;
      font-size: 14px;
      color: #374151;
    }

    .icon {
      font-size: 16px;
    }

    /* ------------------ */
    /* ---short rank ---- */

    .wrap_R {
      border: 1px black solid;
      /* padding: 25px; */
      padding-left: 25px;
      padding-right: 25px;
      padding-bottom: 25px;

      width: 266px;
      border-radius: 40px;
      box-sizing: border-box;
    }


    .content_R {
      display: flex;
      height: 55px;
      padding: 5px;
      margin: auto;
      text-align: center;


    }

    .left_R {
      width: 20%;
    }

    .center_R {
      width: 50%;
    }


    .right_R {
      width: 30%;
    }

    .title_R {
      width: 100%;
      font-size: 25px;
      font-weight: bold;

    }

    .setContent_R {
      background: #2563EB;
      color: white;
      transition: all 1s;
    }

    /* ---short rank ---- */
    /* ------------------ */

    #logo {
      display: flex;
      align-items: center;
      justify-content: center;
      text-decoration-line: none;

      margin-left: 100px;
    }

    #logo h2 {
      margin-left: 10px;
      color: #3B82F6;
    }
  </style>
</head>

<body>

<div class="top-navbar">
  <div class="headline">
    <a href="${pageContext.request.contextPath}/api/main" id="logo">
      <img src="/images/login/Frame.png" alt="경로 에러">
      <h2>With You</h2>
    </a>
  </div>
  <div class="menu">
    <a href="${pageContext.request.contextPath}/api/main" class="menu-button">홈</a>
    <a href="${pageContext.request.contextPath}/api/introduction">소개</a>
    <a href="${pageContext.request.contextPath}/api/boards" class="menu-button">커뮤니티</a>
    <a href="${pageContext.request.contextPath}/api/map" class="menu-button">지도</a>
    <a href="${pageContext.request.contextPath}/api/rank" class="menu-button">랭킹</a>
    <a href="${pageContext.request.contextPath}/api/faq" class="menu-button">문의하기</a>
    <a href="${pageContext.request.contextPath}/api/club/list/account" class="menu-button">동호회</a>
    <a href="${pageContext.request.contextPath}/api/login" class="menu-button">로그인</a>
    <a href="${pageContext.request.contextPath}/api/register" class="menu-button">회원가입</a>
    <a href="${pageContext.request.contextPath}/api/mypage" class="menu-button">마이페이지</a>



  </div>
  <a href="${pageContext.request.contextPath}/api/boards" class="start-button">시작하기 ⟶</a>
</div>

<div class="navbar">
  <a href="/boards?type=전체" class="nav-button">전체</a>
  <a href="/boards?type=인기" class="nav-button active">인기</a>
  <a href="/boards?type=자유" class="nav-button">자유</a>
  <a href="/boards?type=유머" class="nav-button">유머</a>
  <a href="/boards?type=질문" class="nav-button">질문</a>
  <a href="/boards?type=소통" class="nav-button">소통</a>
</div>

<div class="container">
  <div class="sidebar">
    <div class="section">
      <p style="display: flex; justify-content: center; font-weight:bold; font-size: 32px; color: #ffffff;">
        <c:out value="${nickname}" />
      </p>
      <div
              style="width: 187px; height: 129px; border-radius: 10px; background-color: rgba(210, 232, 116, 0.25); display: flex; justify-content: center; align-items: center;">
        <p style="font-weight: bold; font-size: 30px; color: #57e24b;">
          <c:out value="${grade}" />
        </p>
      </div>


      <div style="display: flex; justify-content: space-between; gap: 10px; margin-top: 20px;">
        <a href="/api/board" class="button">글쓰기</a>
        <a href="${pageContext.request.contextPath}/api/mypage" class="button">내 정보</a>
      </div>
    </div>


  </div>

  <div class="main">
    <h1 style="color:#111827;" id="main_title"></h1>

    <form id="searchForm" action="/boards" method="get" class="search-container">
      <input type="text" name="keyword" id="keywordInput" placeholder="게시글 제목 검색" />
      <input type="hidden" name="type" value="인기" />
    </form>

    <div class="board">
      <c:forEach var="post" items="${boards}">
        <a href="/api/board/detail/${post.boardid}" class="post-link">
          <div class="post-item">
            <div class="post-content">
              <h2 class="post-title">${post.title}</h2>
              <div class="post-meta">
                                    <span class="date">
                                        <span class="date" data-date="${post.createdAt}"></span>
                                    </span>
                | <span class="nickname">${post.writerNickname}</span> |
                <span class="region">${post.regionLabel}</span>
              </div>
            </div>
            <div class="post-stats">
              <div class="stat">
                <span class="icon">💬</span>
                <span class="count">${post.commentCount}</span>
              </div>
              <div class="stat">
                <span class="icon">❤️</span>
                <span class="count">${post.likecount}</span>
              </div>
            </div>
          </div>
        </a>
      </c:forEach>
    </div>


    <div class="pagination">
      <c:forEach begin="1" end="${totalPages}" var="i">
        <a href="/api/boards?page=${i}&size=10" class="${i == currentPage ? 'active' : ''}">
          [${i}]
        </a>
      </c:forEach>
    </div>
  </div>

  <div class="rightbar">
    <div class="section-1">
      <p>
        <a href="/clubCreate"
           style="font-weight: bold; font-size: 18px; color: #2563eb; text-decoration: none;">
          동호회
        </a>
      </p>
      <p>같은 관심사를 가진 사람들끼리 자유롭게 모이고 소통하는 공간이에요.</p>
      <p>당신의 취미를 공유해보세요!</p>
    </div>

    <div class="wrap_R">
      <div class="content_R">
        <p class="title_R">동네 랭킹</p>
      </div>


      <div class="content_R" id="c-1">
        <p class="left_R">1</p>
        <p class="center_R">서북구 성정2동</p>
        <p class="right_R">89점</p>
      </div>

      <div class="content_R" id="c-2">
        <p class="left_R">2</p>
        <p class="center_R">동남구 봉명동</p>
        <p class="right_R">85점</p>
      </div>

      <div class="content_R" id="c-3">
        <p class="left_R">3</p>
        <p class="center_R">동남구 신안동</p>
        <p class="right_R">82점</p>
      </div>

      <div class="content_R" id="c-4">
        <p class="left_R">4</p>
        <p class="center_R">서북구 부성1동</p>
        <p class="right_R">78점</p>
      </div>

      <div class="content_R" id="c-5">
        <p class="left_R">5</p>
        <p class="center_R">서북구 성정1동</p>
        <p class="right_R">70점</p>
      </div>

    </div>




  </div>
</div>

<script>
  const input = document.getElementById("keywordInput");
  const form = document.getElementById("searchForm");


  const params = location.href.split("?")[1];
  console.log(params);

  const regionList = {
    map1: "서북구 부성1동",
    map2: "서북구 부성2동",
    map3: "동남구 신안동",
    map4: "서북구 성정2동",
    map5: "서북구 백석동",
    map6: "서북구 성정1동",
    map7: "동남구 문성동",
    map8: "동남구 원성1동",
    map9: "서북구 불당2동",
    map10: "서북구 불당1동",
    map11: "서북구 쌍용3동",
    map12: "동남구 봉명동",
    map13: "동남구 중앙동",
    map14: "동남구 원성2동",
    map15: "서북구 쌍용1동",
    map16: "서북구 쌍용2동",
    map17: "동남구 일봉동",
    map18: "동남구 청룡동",
    map19: "동남구 신방동"
  }

  const eleTitle = document.getElementById("main_title");

  (params === undefined) ? eleTitle.innerHTML = "인기" :
          eleTitle.innerHTML = regionList[params];


  input.addEventListener("input", function () {
    clearTimeout(window.searchTimeout);
    window.searchTimeout = setTimeout(() => {
      form.submit();
    }, 1000);
  });

  /* ------------------ */
  /* ---short rank ---- */
  var n = 0;
  var eleContent = null;


  const ele1 = document.getElementById('c-1');
  const ele2 = document.getElementById('c-2');
  const ele3 = document.getElementById('c-3');
  const ele4 = document.getElementById('c-4');
  const ele5 = document.getElementById('c-5');


  function setContent() {

    setClear();

    n += 1;

    eleContent = document.getElementById('c-' + n);
    eleContent.style.background = "#2563EB";
    eleContent.style.color = "white";
    eleContent.style.transition = "all 1s";

    if (n >= 5) {
      n = 0;
    }

  }

  function setClear() {
    ele1.style.background = "white";
    ele1.style.color = "black";

    ele2.style.background = "white";
    ele2.style.color = "black";

    ele3.style.background = "white";
    ele3.style.color = "black";

    ele4.style.background = "white";
    ele4.style.color = "black";

    ele5.style.background = "white";
    ele5.style.color = "black";
  }

  setInterval(() => { setContent() }, 3000);

  function getRelativeDate(dateString) {
    var safeDateString = dateString.replace(/-/g, '/');
    const today = new Date();
    const created = new Date(safeDateString);
    created.setHours(0, 0, 0, 0);
    today.setHours(0, 0, 0, 0);
    const diffTime = today - created;
    const diffDays = Math.floor(diffTime / (1000 * 60 * 60 * 24));
    if (diffDays === 0) {
      return "오늘";
    } else if (diffDays < 30) {
      return diffDays + "일 전";
    } else if (diffDays < 365) {
      const months = Math.floor(diffDays / 30);
      return months + "달 전";
    } else {
      const years = Math.floor(diffDays / 365);
      return years + "년 전";
    }
  }

  document.querySelectorAll('.date').forEach(function (el) {
    const dateStr = el.getAttribute('data-date');
    if (dateStr) {
      el.textContent = getRelativeDate(dateStr);
    }
  });
</script>

</body>

</html>