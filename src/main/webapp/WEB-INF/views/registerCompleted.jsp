<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <style>
        body {
            background-color: #EFF6FF;
            margin: 0;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .headline {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-bottom: 10px;
        }

        #With-You {
            color: #3B82F6;
            margin-left: 15px;
        }

        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            background-color: white;
            padding: 40px 32px;
            border-radius: 16px;
            width: 448px;
            box-sizing: border-box;
        }

        .title {
            font-size: 40.8px;
            font-weight: bold;
            color: #111827;
            text-align: center;
            margin-bottom: 20px;
        }

        .subtitle {
            font-size: 16px;
            font-weight: bold;
            color: #111827;
            text-align: center;
            margin-bottom: 40px;
        }

        .button-group {
            width: 100%;
            display: flex;
            justify-content: flex-end;
        }

        .btn-next {
            background-color: #3B82F6;
            color: white;
            border-radius: 9999px;
            width: 127px;
            height: 48px;
            border: none;
            cursor: pointer;
            font-weight: 500;
            font-size: 15px;
        }

        .btn-next span {
            margin-left: 4px;
        }

        .btn-next:hover {
            background-color: #2563EB;
        }


        #logo {
            display: flex;
            align-items: center;
            justify-content: center;
            text-decoration-line: none;

        }

        #logo h2 {
            margin-left: 10px;
            color: #3B82F6;
        }
    </style>
</head>

<body>
<div class="container">
    <div class="headline">
        <a href="${pageContext.request.contextPath}/api/main" id="logo">
            <img src="/images/login/Frame.png" alt="경로 에러">
            <h2>With You</h2>
        </a>
    </div>

    <div class="title">계정 생성 완료</div>
    <div class="subtitle">이제 With You의 다양한 서비스를 경험해 보세요</div>

    <div class="button-group">
        <button class="btn-next" onclick="window.location.href='/api/login'">
            로그인으로 <span>➔</span>
        </button>
    </div>
</div>
</body>

</html>
