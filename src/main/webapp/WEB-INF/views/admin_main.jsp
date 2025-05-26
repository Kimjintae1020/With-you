<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 - 신고 관리</title>
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
            font-size: 14px;
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
        <h1>신고 관리</h1>
        <table>
            <thead>
            <tr>
                <th>신고 ID</th>
                <th>신고된 사용자</th>
                <th>신고 사유</th>
                <th>상태</th>
                <th>날짜</th>
                <th>액션</th>
            </tr>
            </thead>
            <tbody>
            <!-- 여기에 신고 데이터 표시 -->
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
