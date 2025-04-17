<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>마이페이지</title>
    <style>
        .mypage-container {
            width: 60%;
            margin: 50px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            background-color: #f9f9f9;
        }

        .mypage-container h2 {
            text-align: center;
        }

        .mypage-table {
            width: 100%;
            border-collapse: collapse;
        }

        .mypage-table th, .mypage-table td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .mypage-table th {
            background-color: #f0f0f0;
        }

        .btn-edit {
            display: block;
            width: 120px;
            margin: 20px auto;
            padding: 10px;
            text-align: center;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 4px;
        }

        .btn-edit:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

<div class="mypage-container">
    <h2>👤 마이페이지</h2>

    <table class="mypage-table">
        <tr>
            <th>아이디</th>
            <td>${mypage.accountname}</td>
        </tr>
        <tr>
            <th>비밀번호</th>
            <td>********</td>
        </tr>
        <tr>
            <th>닉네임</th>
            <td>${mypage.nickname}</td>
        </tr>
        <tr>
            <th>이메일</th>
            <td>${mypage.email}</td>
        </tr>
        <tr>
            <th>출생년도</th>
            <td>${mypage.birthYear}</td>
        </tr>
        <tr>
            <th>등급</th>
            <td>${mypage.grade.displayName} - ${mypage.grade.description}</td>
        </tr>
        <tr>
            <th>거주지</th>
            <td>${mypage.region.label}</td>
        </tr>
        <tr>
            <th>역할</th>
            <td>${mypage.role}</td>
        </tr>
        <tr>
            <th>평점</th>
            <td>${mypage.score}</td>
        </tr>
        <tr>
            <th>받은 평가 수</th>
            <td>${mypage.reviewCnt}</td>
        </tr>
        <tr>
            <th>가입일</th>
            <td>${mypage.createdAt}</td>
        </tr>
        <tr>
            <th>수정일</th>
            <td>${mypage.updatedAt}</td>
        </tr>
    </table>

    <a href="/mypage/edit" class="btn-edit">정보 수정</a>
</div>

</body>
</html>
