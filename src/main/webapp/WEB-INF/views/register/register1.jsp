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
            overflow: auto;
        }

        h3 {
            display: flex;
            justify-content: center;
            align-items: center;
            font-weight: bold;
        }

        h5 {
            display: flex;
            justify-content: center;
            align-items: center;
            color: #4B5563;
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

        form {
            display: flex;
            flex-direction: column;
            align-items: center;
            background-color: white;
            padding: 30px 32px;
            border-radius: 16px;
            width: 448px;
            box-sizing: border-box;
        }

        .input-group {
            width: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-bottom: 15px;
        }

        .input-group input {
            width: 100%;
            border-radius: 8px;
            padding: 10px;
            max-height: 50px;
            border: 1px solid #d1d5db;
            box-sizing: border-box;

        }

        .button-group {
            width: 100%;
            display: flex;
            justify-content: flex-end;
            margin-top: 10px;
        }

        label {
            align-self: flex-start;
            font-weight: 500;
            font-size: 11.9px;
            color: #374151;
            margin-bottom: 5px;
        }

        input {
            width: 100%;
            border-radius: 8px;
            padding: 10px;
            max-height: 50px;
            border: 1px solid #d1d5db;
            box-sizing: border-box;
        }

        button {
            background-color: #3B82F6;
            color: #ffffff;
            border-radius: 9999px;
            width: 127px;
            height: 48px;
            border: none;
            margin-top: 20px;
            cursor: pointer;
        }

        button:hover {
            background-color: #2563EB;
        }

        .login-link {
            margin-top: 15px;
            font-size: 13px;
            color: #6B7280;
            text-align: center;
        }

        .login-link a {
            color: #3B82F6;
            text-decoration: none;
            margin-left: 5px;
            font-weight: 500;
        }

        .login-link a:hover {
            text-decoration: underline;
        }

        .progress-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin: 30px 0 20px;
            width: 100%;
            max-width: 448px;
        }

        .progress-step {
            flex: 1;
            text-align: center;
            position: relative;
            font-size: 14px;
            font-weight: bold;
            color: #9CA3AF;
        }

        .progress-step::before {
            content: "";
            position: absolute;
            top: 50%;
            left: 0;
            height: 4px;
            background-color: #D1D5DB;
            width: 100%;
            z-index: -1;
            transform: translateY(-50%);
        }

        .progress-step span {
            background-color: #D1D5DB;
            border-radius: 50%;
            padding: 6px 12px;
            color: white;
            position: relative;
            z-index: 1;
        }

        .progress-step.active span {
            background-color: #3B82F6;
        }

        .progress-step.active {
            color: #3B82F6;
        }

        .progress-step:first-child::before {
            width: 50%;
            left: 50%;
        }

        .progress-step:last-child::before {
            width: 50%;
        }

        .progress-step.completed span {
            background-color: #3B82F6;
        }

        .progress-step.completed::before {
            background-color: #3B82F6;
        }
    </style>
</head>

<body>
<div class="all">
    <div class="headline">
        <img src="/images/register/Frame.png" />
        <h3 id="With-You">With You</h3>
    </div>
    <h3>회원가입</h3>
    <h5>계정 정보를 입력해주세요</h5>
    <div class="progress-container">
        <div class="progress-step active"><span>1</span></div>
        <div class="progress-step"><span>2</span></div>
        <div class="progress-step"><span>3</span></div>
    </div>

    <form action="${pageContext.request.contextPath}/api/register" method="post">
        <div class="input-group">
            <label for="name">아이디</label>
            <input type="text" id="name" name="name" placeholder="사용하실 아이디를 입력해주세요" required />
        </div>

        <div class="input-group">
            <label for="password">비밀번호</label>
            <input type="password" id="password" name="password" placeholder="8자 이상 입력해주세요" required />
        </div>

        <div class="input-group">
            <label for="confirm-password">비밀번호 확인</label>
            <input type="password" id="confirm-password" name="confirm-password" placeholder="비밀번호를 다시 입력해주세요"
                   required />
        </div>

        <div class="button-group">
            <button type="submit">다음으로 ➔</button>
        </div>
    </form>

    <p class="login-link">
        이미 계정이 있으신가요?
        <a href="/api/login">로그인하기</a>
    </p>
</div>
</body>

</html>

