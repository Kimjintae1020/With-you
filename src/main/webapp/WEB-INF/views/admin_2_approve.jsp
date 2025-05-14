
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 페이지</title>
    <link rel="stylesheet" href="/css/admin_2_approve.css">
</head>
<body>
<div class="main_wrap">

    <nav>
        <div class="box_1">
            <img src="/images/admin/Frame.png" alt="이미지가 없습니다">
            <h2>With You</h2>

        </div>
        <h1>관리자 페이지</h1>
        <ul class="menus">
            <li>
                <a id="menu_1" href="${pageContext.request.contextPath}/api/admin_1_main">
                    <img src="/images/admin/report_icon.png" alt="" height="15">
                    <p>신고 관리</p>
                </a>
            </li>
            <li>
                <a id="menu_2" href=${pageContext.request.contextPath}/api/admin_2_approve">
                    <img src="/images/admin/approve_icon.png" alt="" height="15">
                    <p>회원 승인</p>
                </a>
            </li>
        </ul>
    </nav>


    <div class="manage_menus">
        <h1>회원 승인</h1>
    </div>



    <div class="content">
        <table border="1px solid black">
            <tr class="title">
                <td id="title_1">사용자 닉네임</td>
                <td id="title_2">사용자 아이디</td>
                <td id="title_3">승인 상태</td>
                <td id="title_4">탄생년도</td>
                <td id="title_5" colspan="2">액션</td>

            </tr>
            <!-- 테이블 제목 -->

            <!-- 레코드 -->
            <tr class="data">
                <td>userName</td>
                <td>userId123</td>
                <td>상태1</td>
                <td>0000-00-00</td>
                <td><a href="">상세보기</a></td>
                <td><a href="">승인하기</a></td>
            </tr>
            <!-- 레코드 -->
            <tr class="data">
                <td>userName</td>
                <td>userId123</td>
                <td><img src="/images/admin/test.svg" alt="" height="30px"></td>
                <td>0000-00-00</td>
                <td><a href="">상세보기</a></td>
                <td>승인 됨</td>
            </tr>
            <tr class="data">
                <td>userName</td>
                <td>userId123</td>
                <td><img src="/images/admin/pending_icon.svg" alt="" height="30px"></td>
                <td>0000-00-00</td>
                <td><a href="">상세보기</a></td>
                <td><a href="">승인하기</a></td>
            </tr>
            <tr class="data">
                <td>userName</td>
                <td>userId123</td>
                <td>상태1</td>
                <td>0000-00-00</td>
                <td><a href="">상세보기</a></td>
                <td><a href="">승인하기</a></td>
            </tr>
            <tr class="data">
                <td>userName</td>
                <td>userId123</td>
                <td>상태1</td>
                <td>0000-00-00</td>
                <td><a href="">상세보기</a></td>
                <td><a href="">승인하기</a></td>
            </tr>
            <c:forEach var="account" items="${accounts}">
                <tr class="data">
                    <td>${account.accountname}</td>
                    <td>${account.accountid}</td>
                    <td>상태</td>
                    <td>${account.createdAt}</td>
                    <td>상세보기</td>
                    <td>제재하기</td>
                </tr>
            </c:forEach>

        </table>
    </div>

















</div>
</body>
</html>