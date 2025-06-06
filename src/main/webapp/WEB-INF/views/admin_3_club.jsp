<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>관리자 - 동호회 목록</title>
    <style>
        body {
            margin: 0;
            font-family: 'Pretendard', sans-serif;
            background-color: #f9fafb;
            color: #111827;
        }

        .container {
            max-width: 1000px;
            margin: 40px auto;
            padding: 20px;
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
        }

        h1 {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 12px 16px;
            border-bottom: 1px solid #e5e7eb;
            text-align: left;
            font-size: 14px;
        }

        th {
            background-color: #f3f4f6;
            font-weight: bold;
        }

        .status-active {
            color: #22c55e;
            font-weight: bold;
        }

        .status-inactive {
            color: #9ca3af;
            font-weight: bold;
        }

        .details-button, .update-button {
            padding: 6px 12px;
            font-size: 14px;
            background-color: #2563eb;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            text-decoration: none;
            margin-left: 8px;
        }

        .details-button:hover, .update-button:hover {
            background-color: #1d4ed8;
        }

        select {
            padding: 4px 8px;
            border-radius: 4px;
            border: 1px solid #d1d5db;
            font-size: 14px;
        }

        /* ---------------------- */
        nav {
            width: 220px;
            background-color: #ffffff;
            padding: 20px;
            box-shadow: 2px 0 8px rgba(0, 0, 0, 0.05);
            display: flex;
            flex-direction: column;
            align-items: flex-start;
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


        .main_wrap {
            display: flex;
            height: 100vh;
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

    <div class="container">
        <h1>동호회 목록 (관리자)</h1>

        <table>
            <thead>
            <tr>
                <th>동호회 이름</th>
                <th>카테고리</th>
                <th>인원</th>
                <th>상태</th>
                <th>관리</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="club" items="${clubs}">
                <tr>
                    <td>${club.clubName}</td>
                    <td>${club.category}</td>
                    <td>${club.currentMembers} / ${club.maxMembers}</td>
                    <td>
                        <c:choose>
                            <c:when test="${club.status == 'ACTIVE'}">
                                <span class="status-active">활성</span>
                            </c:when>
                            <c:otherwise>
                                <span class="status-inactive">비활성</span>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <a href="${pageContext.request.contextPath}/api/club/detail/${club.clubId}" class="details-button">상세 보기</a>

                        <!-- 상태 변경 폼 -->
                        <form action="${pageContext.request.contextPath}/api/admin/club/status/${club.clubId}" method="post" style="display: inline;">
                            <select name="status">
                                <option value="ACTIVE" ${club.status == 'ACTIVE' ? 'selected' : ''}>활성</option>
                                <option value="INACTIVE" ${club.status == 'INACTIVE' ? 'selected' : ''}>비활성</option>
                            </select>
                            <button type="submit" class="update-button">변경</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

</div>

</body>
</html>
