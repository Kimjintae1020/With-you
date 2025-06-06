<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 - 회원 승인 관리</title>
    <style>
        body {
            margin: 0;
            font-family: 'Pretendard', sans-serif;
            background-color: #f9fafb;
            color: #111827;
        }

        .main_wrap {
            display: flex;
            height: 100vh;
        }

        nav {
            width: 220px;
            background-color: #ffffff;
            padding: 20px;
            box-shadow: 2px 0 8px rgba(0, 0, 0, 0.05);
            display: flex;
            flex-direction: column;
            align-items: flex-start;
        }

        #logo {
            display: flex;
            align-items: center;
            margin-bottom: 40px;
            text-decoration: none;
            color: #2563eb;
        }

        #logo img {
            height: 28px;
            margin-right: 10px;
        }

        #logo h2 {
            font-size: 24px;
            font-weight: bold;
            margin: 0;
        }

        h1 {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .menus {
            list-style: none;
            padding: 0;
            width: 100%;
        }

        .menus li {
            margin-bottom: 12px;
        }

        .menus a {
            display: flex;
            align-items: center;
            gap: 8px;
            padding: 10px 12px;
            text-decoration: none;
            color: #374151;
            border-radius: 6px;
            font-size: 18px;
            transition: background-color 0.2s, color 0.2s;
        }

        .menus a:hover {
            background-color: #e0f2fe;
            color: #2563eb;
        }

        .menus a img {
            height: 16px;
        }

        .content {
            flex: 1;
            padding: 40px;
            overflow-y: auto;
        }

        .content h1 {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            padding: 12px 16px;
            border-bottom: 1px solid #e5e7eb;
            text-align: center;
            font-size: 18px;
        }

        th {
            background-color: #f3f4f6;
            font-weight: bold;
        }

        .status-pending {
            color: #f59e0b;
            font-weight: bold;
        }

        .status-resolved {
            color: #22c55e;
            font-weight: bold;
        }

        .status-rejected {
            color: #ef4444;
            font-weight: bold;
        }

        .action-button {
            padding: 6px 12px;
            font-size: 14px;
            background-color: #f59e0b;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        .action-button:hover {
            background-color: #d97706;
        }

        .empty-message {
            text-align: center;
            padding: 20px;
            color: #9ca3af;
        }

        .approve {
            font-weight: bold;
            color: #2563eb;
        }


    </style>
</head>
<body>

<div class="main_wrap">
    <nav>
        <a href="${pageContext.request.contextPath}/api/main" id="logo">
            <img src="/images/login/Frame.png" alt="With You 로고">
            <h2>With You</h2>
        </a>
        <h1>관리자 페이지</h1>
        <ul class="menus">
            <li>
                <a id="menu_1" href="${pageContext.request.contextPath}/api/admin_1_report">
                    <img src="/images/admin/report_icon.png" alt="">
                    <span>신고 관리</span>
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/api/admin_2_approve">
                    <img src="/images/admin/approve_icon.png" alt="">
                    <span>회원 승인</span>
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/api/admin/club/list">
                    <img src="/images/admin/approve_icon.png" alt="">
                    <span>동호회 관리</span>
                </a>
            </li>
        </ul>
    </nav>

    <div class="content">
        <h1>회원 승인 관리</h1>

        <table>
            <thead>
            <tr>
                <th>사용자 닉네임</th>
                <th>사용자 아이디</th>
                <th>승인 상태</th>
                <th>탄생년도</th>
                <th>액션</th>
            </tr>
            </thead>
            <tbody>
            <c:choose>
                <c:when test="${not empty accounts}">
                    <c:forEach var="accounts" items="${accounts}">
                        <tr>
                            <td>${accounts.accountname}</td>
                            <td>${accounts.accountid}</td>
                            <td>
                                <span class="my-cell status-pending" >승인 대기</span>
                            </td>
                            <td>${fn:substring(accounts.createdAt, 0, 10)}</td>
                            <td> <%-- 여기도 자바스크립트로 처리 --%>
                                <button class="action-button" onclick="changeText(${accounts.accountid})">승인하기</button>
                            </td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="5" class="empty-message">신규 유저가 없습니다.</td>
                    </tr>
                </c:otherwise>
            </c:choose>
            </tbody>
        </table>
    </div>
</div>

<script>
    function changeText(id) {
        const cells = document.querySelectorAll('.my-cell');
        cells[id - 1].innerText = "승인 완료";
        cells[id -1].classList.remove('status-pending');
        cells[id - 1].classList.add('approve');
    }
</script>

</body>
</html>
