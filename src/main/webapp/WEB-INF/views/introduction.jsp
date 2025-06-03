<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>With You - 하이퍼로컬 커뮤니티 소개</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            display: flex;
            flex-direction: column;
            align-items: center;
            background: #F9FAFB;
        }
        .main_wrap {
            width: 1400px;
            background: white;
        }
        .main_wrap .container_1 {
            width: 100%;
            height: 40px;
            display: flex;
            flex-direction: row;
            align-items: center;
            margin-top: 30px;
        }
        #logo {
            display: flex;
            align-items: center;
            justify-content: center;
            text-decoration-line: none;
            margin-left: 100px;
        }
        #logo h2 { margin-left: 10px; color: #3B82F6; }
        .main_wrap .container_1 .box_2 { margin-left: 100px; }
        .main_wrap .container_1 .box_2 a {
            margin-left: 30px; font-size: 15px; text-decoration: none; color: black; transition: color 0.2s;
        }
        .main_wrap .container_1 .box_2 a:hover { color: #2563EB; }
        .main_wrap .container_1 .box_3 { margin-left: 100px; }
        .main_wrap .container_1 .box_3 button {
            width: 150px; height: 40px; background: #2563EB; border-radius: 25px;
            border: 0px black solid; color: white; cursor: pointer; font-size: 16px; transition: background 0.2s;
        }
        .main_wrap .container_1 .box_3 button:hover { background: #3B82F6; }

        /* 소개 섹션 레이아웃 */
        .intro_section {
            width: 95vw;
            max-width: 1200px;
            margin: 80px auto 60px auto;
            background: #EFF6FF;
            border-radius: 30px;
            box-shadow: 0 8px 32px rgba(59, 130, 246, 0.08);
            display: flex;
            flex-direction: row;
            align-items: stretch;
            overflow: hidden;
            min-height: 420px;
            padding: 0 40px;
        }
        .intro_img_wrap {
            flex: 1 1 0;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #dbeafe;
        }
        .intro_img_wrap img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            aspect-ratio: 1/1;
            min-height: 320px;
            max-height: 500px;
        }
        .intro_text_wrap {
            flex: 1 1 0;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: flex-start;
            padding: 60px 50px;
            text-align: left;
        }
        .intro_text_wrap h1 {
            font-size: 40px;
            color: #2563EB;
            margin-bottom: 18px;
        }
        .intro_text_wrap h2 {
            font-size: 28px;
            color: #3B82F6;
            margin-bottom: 12px;
        }
        .intro_text_wrap p {
            font-size: 20px;
            color: #374151;
            margin-bottom: 16px;
            line-height: 1.7;
        }
        .intro_highlight {
            color: #22C55E;
            font-weight: bold;
        }
        @media (max-width: 1300px) {
            .main_wrap { width: 98%; }
            .intro_section { max-width: 98vw; padding: 0 10px; }
        }
        @media (max-width: 1000px) {
            .main_wrap { width: 98%; }
            .intro_section { flex-direction: column; max-width: 98vw; min-height: unset; padding: 0 5vw; }
            .intro_img_wrap, .intro_text_wrap { width: 100%; min-height: 220px; }
            .intro_text_wrap { padding: 30px 10px; align-items: center; text-align: center; }
        }
        @media (max-width: 600px) {
            .main_wrap { width: 100%; }
            .intro_section { padding: 0; }
            .intro_img_wrap img { min-height: 140px; }
            .main_wrap .container_1 { flex-direction: column; height: auto; }
            #logo { margin-left: 0; }
            .main_wrap .container_1 .box_2, .main_wrap .container_1 .box_3 { margin-left: 0; margin-top: 10px; }
        }
    </style>
</head>
<body>
<div class="main_wrap">
    <div class="container_1">
        <a href="/api/main" id="logo">
            <img src="/images/login/Frame.png" alt="로고" style="height:40px;">
            <h2>With You</h2>
        </a>
        <div class="box_2">
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
        <div class="box_3">
            <button onclick="location.href='/api/boards'">시작하기</button>
        </div>
    </div>
    <!-- 소개 섹션 -->
    <section class="intro_section" id="소개">
        <div class="intro_img_wrap">
            <img src="https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=600&q=80"
                 alt="동네 커뮤니티 이미지">
        </div>
        <div class="intro_text_wrap">
            <h1>With You</h1>
            <h2>우리 동네를 더 가깝게, 더 따뜻하게</h2>
            <p>
                <span class="intro_highlight">With You</span>는 하이퍼로컬 기반의 <b>지역 커뮤니티 서비스</b>입니다.<br>
                이웃들과 함께 소통하고, 정보를 나누며, 실제로 만나는 <span class="intro_highlight">온·오프라인 모임</span>을<br>
                누구나 쉽게 만들고 참여할 수 있도록 도와줍니다.
            </p>
            <p>
                동네별 커뮤니티 공간에서 이웃들과 다양한 주제로 이야기를 나누고,<br>
                취미, 관심사, 봉사활동 등 다양한 <b>모임</b>을 직접 개설하거나 참여해보세요.<br>
                <span class="intro_highlight">With You</span>가 여러분의 일상에 새로운 즐거움과 따뜻한 연결을 선물합니다.
            </p>
            <p>
                <b>지금, 당신의 동네에서 새로운 이야기를 시작하세요!</b>
            </p>
        </div>
    </section>
</div>
</body>
</html>
