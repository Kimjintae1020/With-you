<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Pretendard', sans-serif;
            background-color: #f9fafb;
            color: #111827;
        }
        /* 네비게이션 바 스타일 */
        nav {
            width: 100%;
            background-color: #ffffff;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 16px 40px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
            position: sticky;
            top: 0;
            z-index: 1000;
        }
        #logo {
            display: flex;
            align-items: center;
            text-decoration: none;
            color: #2563eb;
        }
        #logo img {
            height: 20px;
            margin-right: 8px;
        }
        #logo h2 {
            font-size: 20px;
            font-weight: 600;
            color: #2563eb;
        }
        .nav-links a {
            margin-left: 24px;
            font-size: 15px;
            text-decoration: none;
            color: #111827;
            font-weight: 500;
            transition: color 0.2s, background-color 0.2s;
        }
        .nav-links a:hover {
            color: #2563eb;
        }
        .start-btn {
            margin-left: 24px;
            padding: 8px 20px;
            background-color: #2563eb;
            color: white;
            border-radius: 9999px;
            text-decoration: none;
            font-size: 14px;
            font-weight: 500;
            transition: background-color 0.2s;
        }
        .start-btn:hover {
            background-color: #1d4ed8;
        }

        /* 마이페이지 내용 */
        .wrapInside {
            max-width: 1000px;
            margin: 60px auto;
            padding: 0 20px;

            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }
        h1 {
            font-size: 20px;
            font-weight: bold;
            margin: 40px 0 10px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        hr.hr_info {
            border: 0;
            border-top: 1px solid #e5e7eb;
            margin-bottom: 20px;
        }
        table {
            width: 50%;
            border-collapse: collapse;
            background-color: white;
            border-radius: 8px;
            overflow: hidden;
            margin-bottom: 40px;

        }
        th, td {
            padding: 12px 16px;
            border-bottom: 1px solid #e5e7eb;
            text-align: center;
            font-size: 14px;
        }
        th {
            background-color: #f3f4f6;
            font-weight: bold;
        }
        .empty-message {
            text-align: center;
            padding: 20px;
            color: #9ca3af;
        }

        .wrapTable {
            width: 70%;
        }

        .wrapTable table {
            margin: auto;
            width: 100%;
        }

        .wrap_myInfo {
            display: flex;
            flex-direction: row;
            width: 100%;
        }

        .wrap_myInfo img {
            margin: auto;


        }
        .wrap_myInfo table {
            width: 400px;
            margin: auto;
        }


    </style>
</head>
<body>

<!-- 네비게이션 바 -->
<nav>
    <a href="${pageContext.request.contextPath}/api/main" id="logo">
        <img src="/images/login/Frame.png" alt="With You">
        <h2>With You</h2>
    </a>
    <div class="nav-links">
        <a href="${pageContext.request.contextPath}/api/main">홈</a>
        <a href="#소개">소개</a>
        <a href="${pageContext.request.contextPath}/api/boards">커뮤니티</a>
        <a href="${pageContext.request.contextPath}/api/map">지도</a>
        <a href="${pageContext.request.contextPath}/api/rank">랭킹</a>
        <a href="${pageContext.request.contextPath}/api/faq">문의하기</a>
        <a href="${pageContext.request.contextPath}/api/club/list/account">동호회</a>
        <a href="${pageContext.request.contextPath}/api/login">로그인</a>
        <a href="${pageContext.request.contextPath}/api/register">회원가입</a>
        <a href="${pageContext.request.contextPath}/api/mypage">마이페이지</a>

    </div>
    <a href="${pageContext.request.contextPath}/api/boards" class="start-btn">시작하기</a>
</nav>

<!-- 마이페이지 내용 -->
<div class="wrapInside">

    <div class="wrapTable">
        <h1>내 정보</h1>
        <hr class="hr_info">
        <div class="wrap_myInfo">
            <img src="/images/mypage/userImg.svg" alt="">
            <table>
                <tr><td>아이디</td><td>${mypage.accountname}</td></tr>
                <tr><td>닉네임</td><td>${mypage.nickname}</td></tr>
                <tr><td>이메일</td><td>${mypage.email}</td></tr>
                <tr><td>탄생년도</td><td>${mypage.birthYear}</td></tr>
                <tr><td>등급</td><td>${mypage.grade}</td></tr>
                <tr><td>거주지</td><td>${mypage.region}</td></tr>
                <tr><td>사용자 평점</td><td>${mypage.score} / 100</td></tr>
                <tr><td>받은 평가 수</td><td>${mypage.reviewCnt}</td></tr>
                <tr><td>가입일</td><td>${fn:substring(mypage.createdAt, 0, 10)}</td></tr>
            </table>
        </div>
    </div>


    <div class="wrapTable">
    <h1>작성한 게시글</h1>
    <hr class="hr_info">
        <table>
            <thead>
            <tr><th>제목</th><th>내용</th><th>작성일</th></tr>
            </thead>
            <tbody>
            <c:forEach var="board" items="${mypage.boardSummaries}">
                <tr>
                    <td>${board.title}</td>
                    <td>${board.content}</td>
                    <td>${board.createdAt}</td>
                </tr>
            </c:forEach>
            <c:if test="${empty mypage.boardSummaries}">
                <tr><td colspan="3" class="empty-message">작성한 게시글이 없습니다.</td></tr>
            </c:if>
            </tbody>
        </table>
    </div>


    <div class="wrapTable">

    <h1>작성한 댓글</h1>
    <hr class="hr_info">
        <table>
            <thead>
            <tr><th>게시판</th><th>댓글 내용</th><th>작성일</th><th>수정일</th></tr>
            </thead>
            <tbody>
            <c:forEach var="comment" items="${mypage.commentSummaries}">
                <tr>
                    <td>${comment.boardTitle}</td>
                    <td>${comment.content}</td>
                    <td>${comment.createdAt}</td>
                    <td>${comment.updatedAt}</td>
                </tr>
            </c:forEach>
            <c:if test="${empty mypage.commentSummaries}">
                <tr><td colspan="4" class="empty-message">작성한 댓글이 없습니다.</td></tr>
            </c:if>
            </tbody>
        </table>
    </div>

    <div class="wrapTable">
    <h1>참여한 소모임</h1>
    <hr class="hr_info">
        <table>
            <thead>
            <tr><th>동호회 이름</th><th>지역</th><th>등록일</th><th>수정일</th></tr>
            </thead>
            <tbody>
            <c:forEach var="club" items="${mypage.clubSummaries}">
                <tr>
                    <td>${club.clubName}</td>
                    <td>${club.region}</td>
                    <td>${club.joinedAt}</td>
                    <td>${club.updatedAt}</td>
                </tr>
            </c:forEach>
            <c:if test="${empty mypage.clubSummaries}">
                <tr><td colspan="4" class="empty-message">참여한 소모임이 없습니다.</td></tr>
            </c:if>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
