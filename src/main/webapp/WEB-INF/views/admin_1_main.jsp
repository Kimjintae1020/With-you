<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 페이지</title>
    <link rel="stylesheet" href="/css/admin_1_main.css">
</head>
<body>
<div class="main_wrap">

    <nav>
        <a href="${pageContext.request.contextPath}/api/main" id="logo">
            <img src="/images/login/Frame.png" alt="경로 에러">
            <h2>With You</h2>
        </a>
        <h1>관리자 페이지</h1>
        <ul class="menus">
            <li>
                <a id="menu_1" href="${pageContext.request.contextPath}/api/admin_1_main">
                    <img src="/images/admin/report_icon.png" alt="" height="15">
                    <p>신고 관리</p>
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/api/admin_2_approve">
                    <img src="/images/admin/approve_icon.png" alt="" height="15">
                    <p>회원 승인</p>
                </a>
            </li>
        </ul>
    </nav>


    <div class="manage_menus">
        <h1>신고 관리</h1>
    </div>



    <div class="content">
        <table border="1px solid black">
            <tr class="title">
                <td id="title_1">신고된 사용자</td>
                <td id="title_2">사유</td>
                <td id="title_3">상태</td>
                <td id="title_4">날짜</td>
                <td id="title_5" colspan="2">액션</td>

            </tr>
            <!-- 테이블 제목 -->

            <!-- 레코드 -->
            <tr class="data">
                <td>userName</td>
                <td class="reason_1">사유1</td>
                <td>상태1</td>
                <td>0000-00-00</td>
                <td><a href="">상세보기</a></td>
                <td><a href="">제재하기</a></td>
            </tr>
            <c:forEach var="account" items="${accounts}">
                <tr class="data">
                    <td>${account.accountname}</td>
                    <td>사유</td>
                    <td>상태</td>
                    <td>${account.createdAt}</td>
                    <td>상세보기</td>
                    <td>제재하기</td>
                </tr>
            </c:forEach>
            <!-- 레코드 -->
        </table>

        <table>


        </table>
    </div>

















</div>
</body>
</html>