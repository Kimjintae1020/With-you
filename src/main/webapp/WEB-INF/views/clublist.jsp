<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>동호회 페이지</title>
  <style>
    body {
      margin: 0;
      font-family: Arial, sans-serif;
      background-color: #f9fafb;
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

    .club-container {
      max-width: 1200px;
      margin: 0 auto;
      padding: 20px;
    }
    .club-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 20px;
    }
    .club-header h1 {
      font-size: 24px;
      color: #111827;
    }
    .club-header button {
      background-color: #2563eb;
      color: white;
      border: none;
      border-radius: 6px;
      padding: 8px 16px;
      cursor: pointer;
      font-size: 14px;
    }
    .filters {
      display: flex;
      gap: 10px;
      margin-bottom: 20px;
    }
    .filter-button {
      padding: 6px 12px;
      border: none;
      border-radius: 20px;
      background-color: #f1f5f9;
      color: #374151;
      font-size: 14px;
      cursor: pointer;
    }
    .filter-button.active {
      background-color: #2563eb;
      color: white;
    }
    .club-list {
      display: grid;
      grid-template-columns: repeat(3, 1fr);
      gap: 20px;
    }
    .club-card {
      background-color: white;
      border: 1px solid #e5e7eb;
      border-radius: 12px;
      padding: 16px;
      box-shadow: 0 1px 3px rgba(0,0,0,0.1);
      display: flex;
      flex-direction: column;
      gap: 10px;
    }
    .club-status {
      background-color: #22c55e;
      color: white;
      font-size: 12px;
      padding: 4px 8px;
      border-radius: 12px;
      align-self: flex-start;
    }
    .club-category {
      background-color: #e0f2fe;
      color: #0ea5e9;
      font-size: 12px;
      padding: 4px 8px;
      border-radius: 12px;
      display: inline-block;
      font-weight: bold;

    }
    .club-title {
      font-size: 18px;
      font-weight: bold;
      margin: 0;
    }
    .club-description {
      font-size: 14px;
      color: #6b7280;
    }
    .club-info {
      font-size: 14px;
      color: #6b7280;
      display: flex;
      align-items: center;
      gap: 8px;
    }
    .club-info span {
      display: flex;
      align-items: center;
      gap: 4px;
    }
    .details-button {
      background: none;
      border: none;
      color: #2563eb;
      font-size: 14px;
      cursor: pointer;
      align-self: flex-start;
    }

    .details-button {
      display: inline-block;
      padding: 6px 12px;
      font-size: 14px;
      font-weight: bold;
      color: #2563eb;
      border: 1px solid #2563eb;
      border-radius: 6px;
      text-decoration: none;
      transition: all 0.3s;
      align-self: flex-end; /* 카드 오른쪽 아래 정렬 */
      margin-top: auto; /* 항상 아래쪽에 붙도록 */
    }

    .details-button:hover {
      background-color: #2563eb;
      color: white;
      transform: translateY(-2px);
      box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
    }



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

<div class="club-container">
  <div class="club-header">
    <h1>동호회</h1>
    <a href="/api/clubcreate" class="start-button">동호회 만들기</a>
  </div>


  <div class="filters">
    <button class="filter-button active">전체</button>
    <button class="filter-button">운동</button>
    <button class="filter-button">취미</button>
    <button class="filter-button">스터디</button>
    <button class="filter-button">문화</button>
    <button class="filter-button">봉사</button>
  </div>

  <%-- 동호회 목록 부분 --%>
  <div class="club-list">
    <c:forEach var="club" items="${clubs}">
      <div class="club-card">
        <c:choose>
          <c:when test="${club.status == 'ACTIVE'}">
            <span class="club-status">모집중</span>
          </c:when>
          <c:otherwise>
            <span class="club-status" style="background-color: #9ca3af;">가입 검토중</span>
          </c:otherwise>
        </c:choose>

        <span class="club-category">${club.category}</span>
        <h2 class="club-title">${club.clubName}</h2>

        <div class="club-info">
          <span>📍 ${club.region}</span>
          <span>👥 ${club.currentMembers}명</span>
          <span>🗓️ ${club.meetingFrequency}</span>
        </div>

        <c:url var="clubDetailUrl" value="/api/club/detail/${club.clubId}" />
        <a href="${clubDetailUrl}" class="details-button">자세히 보기</a>






      </div>
    </c:forEach>
  </div>


</div>

</body>
</html>