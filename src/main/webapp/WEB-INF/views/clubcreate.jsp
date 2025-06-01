<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>동호회 만들기</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
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


    .container {
      max-width: 600px;
      margin: 0 auto;
      padding: 40px 20px;
      background: white;
      border-radius: 12px;
      box-shadow: 0 2px 6px rgba(0,0,0,0.1);
      margin-top: 60px;
    }

    h1 {
      font-size: 24px;
      text-align: center;
      margin-bottom: 30px;
    }

    .form-step {
      display: flex;
      justify-content: center;
      margin-bottom: 20px;
    }

    .step {
      width: 30px;
      height: 30px;
      border-radius: 50%;
      background-color: #e5e7eb;
      color: #6b7280;
      display: flex;
      align-items: center;
      justify-content: center;
      font-weight: bold;
      margin: 0 5px;
    }

    .step.active {
      background-color: #3b82f6;
      color: white;
    }

    form {
      display: flex;
      flex-direction: column;
      gap: 16px;
    }

    label {
      font-weight: bold;
      font-size: 14px;
      color: #374151;
    }

    input, textarea, select {
      padding: 10px;
      font-size: 14px;
      border: 1px solid #d1d5db;
      border-radius: 6px;
      width: 95%;
    }

    textarea {
      height: 80px;
      resize: vertical;
    }

    .checkbox-container {
      display: flex;
      align-items: center;
      gap: 8px;
    }

    .form-buttons {
      display: flex;
      justify-content: space-between;
      margin-top: 20px;
    }

    .btn {
      padding: 10px 20px;
      font-size: 14px;
      border: none;
      border-radius: 6px;
      cursor: pointer;
    }

    .btn-next {
      background-color: #3b82f6;
      color: white;
    }

    .btn-prev {
      background-color: #e5e7eb;
      color: #374151;
    }

    .btn:hover {
      opacity: 0.9;
    }

    .checkbox-container {
      display: flex;
      justify-content: space-between;
      align-items: center;
      font-size: 14px;
      color: #374151;
      padding: 10px 0;
    }

    .checkbox-container input[type="checkbox"] {
      width: 18px;
      height: 18px;
      accent-color: #3b82f6;
      cursor: pointer;
    }

    .checkbox-wrapper {
      display: flex;
      justify-content: flex-end;
      padding: 10px 0;
    }

    .checkbox-label {
      display: flex;
      align-items: center;
      gap: 8px;
      font-size: 14px;
      color: #374151;
    }

    .checkbox-label input[type="checkbox"] {
      width: 18px;
      height: 18px;
      accent-color: #3b82f6;
      cursor: pointer;
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
    <a href="#연결필요" class="menu-button">소개</a>
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

<div class="container">
  <h1>동호회 만들기</h1>

  <div class="form-step">
    <div class="step active">1</div>
    <div class="step">2</div>
    <div class="step">3</div>
  </div>

  <form id="clubcreate-form" action="${pageContext.request.contextPath}/api/create/club" method="post">
    <label for="clubName">동호회 이름 *</label>
    <input type="text" id="clubName" name="clubName" placeholder="동호회 이름을 입력하세요" required />

    <label for="category">카테고리 *</label>
    <select id="category" name="category" required>
      <option value="">카테고리 선택</option>
      <option value="SPORTS">운동</option>
      <option value="HOBBY">취미</option>
      <option value="STUDY">스터디</option>
      <option value="CULTURE">문화</option>
      <option value="TRAVEL">여행</option>
      <option value="FOOD">맛집</option>
      <option value="LANGUAGE">어학</option>
      <option value="CAREER">직무</option>
      <option value="VOLUNTEER">봉사</option>
      <option value="SOCIAL">친목</option>
      <option value="OTHER">기타</option>
    </select>

    <label for="region">활동 지역 *</label>
    <select id="region" name="region" required>
      <option value="">지역 선택</option>
      <option value="SEOUL">서울특별시</option>
      <option value="BUSAN">부산광역시</option>
      <option value="DAEGU">대구광역시</option>
      <option value="INCHEON">인천광역시</option>
      <option value="GWANGJU">광주광역시</option>
      <option value="DAEJEON">대전광역시</option>
      <option value="ULSAN">울산광역시</option>
      <option value="SEJONG">세종특별자치시</option>
      <option value="GYEONGGI">경기도</option>
      <option value="GANGWON">강원도</option>
      <option value="CHUNGBUK">충청북도</option>
      <option value="CHUNGNAM">충청남도</option>
      <option value="JEONBUK">전라북도</option>
      <option value="JEONNAM">전라남도</option>
      <option value="GYEONGBUK">경상북도</option>
      <option value="GYEONGNAM">경상남도</option>
      <option value="JEJU">제주특별자치도</option>
    </select>

    <label for="description">동호회 소개 *</label>
    <textarea id="description" name="description" placeholder="동호회에 대한 소개를 작성해주세요" required></textarea>

    <label for="meetingFrequency">모임 주기 *</label>
    <input type="text" id="meetingFrequency" name="meetingFrequency" placeholder="예: 매주 토요일" required />

    <label for="meetingTime">모임 시간</label>
    <input type="text" id="meetingTime" name="meetingTime" placeholder="예: 오후 7시" />

    <label for="meetingLocation">모임 장소 *</label>
    <input type="text" id="meetingLocation" name="meetingLocation" placeholder="예: 신촌역 3번 출구 앞" required />

    <label for="dues">회비 (숫자)</label>
    <input type="number" id="dues" name="dues" placeholder="예: 10000" min="0" value="0" />

    <label for="maxMembers">최대 인원 *</label>
    <input type="number" id="maxMembers" name="maxMembers" min="1" value="10" required />

    <div class="checkbox-wrapper">
      <label for="isPublic" class="checkbox-label">
        <span>누구나 가입 가능</span>
        <input type="checkbox" id="isPublic" name="isPublic" checked />
      </label>
    </div>

    <div class="form-buttons">
      <button type="button" class="btn btn-prev" onclick="history.back()">이전</button>
      <button type="submit" class="btn btn-next">다음 →</button>
    </div>
  </form>

</div>

<script>
  document.getElementById("clubcreate-form").addEventListener("submit", async function (e) {
    e.preventDefault(); // 기본 form 제출 막기

    const isPublicChecked = document.getElementById("isPublic").checked;

    const data = {
      clubName: document.getElementById("clubName").value,
      description: document.getElementById("description").value,
      category: document.getElementById("category").value,
      region: document.getElementById("region").value,
      maxMembers: parseInt(document.getElementById("maxMembers").value),
      isPublic: isPublicChecked,
      meetingFrequency: document.getElementById("meetingFrequency").value,
      meetingTime: document.getElementById("meetingTime").value,
      meetingLocation: document.getElementById("meetingLocation").value,
      dues: parseInt(document.getElementById("dues").value)
    };

    console.log(JSON.stringify(data));

    try {
      const response = await fetch("${pageContext.request.contextPath}/api/create/club", {
        method: "POST",
        headers: {
          "Content-Type": "application/json"
        },
        body: JSON.stringify(data)
      });

      if (response.ok) {
        alert("동호회 생성되었습니다.");
        window.location.href = "/api/club/list/account";
      } else {
        const errorData = await response.json();
        alert("동호회 생성 실패: " + (errorData.message || "서버 오류"));
      }
    } catch (error) {
      console.error("Error:", error);
      alert("동호회 생성 중 오류가 발생했습니다.");
    }
  });

</script>


</body>
</html>
