<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>${club.clubName} - 동호회 상세</title>
    <style>
        body {
            margin: 0;
            font-family: 'Pretendard', sans-serif;
            background-color: #f9fafb;
            color: #111827;
        }

        .container {
            max-width: 1200px;
            margin: 40px auto;
            padding: 20px;
            display: flex;
            gap: 24px;
        }

        .left-box {
            flex: 3;
            background-color: white;
            padding: 24px;
            border-radius: 12px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
        }

        .right-box {
            flex: 1;
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .card {
            background-color: white;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
        }

        .badge {
            display: inline-block;
            background-color: #e0f2fe;
            color: #0ea5e9;
            padding: 4px 10px;
            font-size: 12px;
            font-weight: bold;
            border-radius: 20px;
        }

        .status-badge {
            background-color: #dcfce7;
            color: #22c55e;
        }

        .club-title {
            font-size: 24px;
            font-weight: bold;
            margin: 12px 0;
        }

        .club-description {
            margin: 16px 0;
            color: #4b5563;
            line-height: 1.5;
        }

        .info-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 12px;
        }

        .info-item {
            font-size: 14px;
            background-color: #f9fafb;
            padding: 8px 12px;
            border-radius: 8px;
        }

        .join-button {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            font-weight: bold;
            color: white;
            background-color: #2563eb;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .join-button:hover {
            background-color: #1d4ed8;
        }

        .member-progress {
            width: 100%;
            height: 8px;
            background-color: #e5e7eb;
            border-radius: 4px;
            margin: 10px 0;
        }

        .member-progress-bar {
            height: 100%;
            background-color: #3b82f6;
            border-radius: 4px;
        }

        .member-list {
            margin-top: 20px;
        }

        .member-item {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 8px 0;
            border-bottom: 1px solid #e5e7eb;
        }

        .member-item:last-child {
            border-bottom: none;
        }

        .member-name {
            font-weight: bold;
        }

        .member-status {
            font-size: 12px;
            padding: 2px 6px;
            border-radius: 12px;
            font-weight: bold;
        }

        .member-status.active {
            color: #22c55e;
            background-color: #dcfce7;
        }

        .member-status.inactive {
            color: #f97316; /* 주황색 */
            background-color: #fef3c7;
        }

        .member-status.banned {
            color: #ef4444;
            background-color: #fee2e2;
        }


    </style>
</head>
<body>

<div class="container">
    <!-- 왼쪽 박스 -->
    <div class="left-box">
        <span class="badge">${club.category}</span>
        <span class="badge status-badge">${club.status == 'ACTIVE' ? '활성' : '비활성'}</span>
        <h1 class="club-title">${club.clubName}</h1>
        <p class="club-description">${club.description}</p>

        <div class="info-grid">
            <div class="info-item">📍 지역: ${club.region}</div>
            <div class="info-item">🗓️ 주기: ${club.meetingFrequency}</div>
            <div class="info-item">🕒 시간: ${club.meetingTime}</div>
            <div class="info-item">💸 회비: ${club.dues}원</div>
            <div class="info-item" style="grid-column: span 2;">🏠 장소: ${club.meetingLocation}</div>
        </div>

        <div class="member-list">
            <h3>회원 목록</h3>
            <c:forEach var="member" items="${members}">
                <div class="member-item">
        <span class="member-name">
          ${member.nickname}
          <c:if test="${member.role == 'LEADER'}"> 👑 </c:if>
        </span>
                  <span class="member-status
                  <c:choose>
                    <c:when test='${member.status == "ACTIVE"}'> active</c:when>
                    <c:when test='${member.status == "INACTIVE"}'> inactive</c:when>
                    <c:when test='${member.status == "BANNED"}'> banned</c:when>
                  </c:choose>
                ">
                  <c:choose>
                      <c:when test="${member.status == 'ACTIVE'}">활성</c:when>
                      <c:when test="${member.status == 'INACTIVE'}">가입 검토중</c:when>
                      <c:when test="${member.status == 'BANNED'}">차단됨</c:when>
                      <c:otherwise>알 수 없음</c:otherwise>
                  </c:choose>
                </span>


                </div>

            </c:forEach>
        </div>
    </div>

    <!-- 오른쪽 박스 -->
    <div class="right-box">
        <div class="card">
            <h3>동호회장</h3>
            <p>${club.leaderNickname} (${club.leaderAccountName})</p>
            <button class="join-button">연락처 보기</button>
        </div>

        <div class="card">
            <h3>멤버십 현황</h3>
            <p>${club.currentMembers} / ${club.maxMembers}명</p>
            <div class="member-progress">
                <div class="member-progress-bar" style="width: ${(club.currentMembers / club.maxMembers) * 100}%"></div>
            </div>

            <form action="${pageContext.request.contextPath}/api/club/join/${club.clubId}" method="post"
                  onsubmit="return confirmJoin()">
                <button type="submit" class="join-button">가입 신청하기</button>
            </form>


        </div>

        <div class="card">
            <h3>활동 장소</h3>
            <p>${club.meetingLocation}</p>
        </div>
    </div>
</div>

<script>
    function confirmJoin() {
        return confirm("가입 신청을 하시겠습니까?");
    }
</script>

</body>
</html>
