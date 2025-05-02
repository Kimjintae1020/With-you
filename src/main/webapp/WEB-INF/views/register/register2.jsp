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

        .input-group label {
            align-self: flex-start;
            font-weight: 500;
            font-size: 11.9px;
            color: #374151;
            margin-bottom: 5px;
        }

        .birthday-inputs {
            display: flex;
            gap: 10px;
            width: 100%;
        }

        .headline {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        #With-You {
            color: #3B82F6;
            margin-left: 15px;
        }

        .birthday-inputs input {
            flex: 1;
            border-radius: 8px;
            padding: 10px;
            border: 1px solid #d1d5db;
            box-sizing: border-box;
        }

        .input-group input[type="text"],
        .input-group input[type="email"] {
            width: 100%;
            border-radius: 8px;
            padding: 10px;
            border: 1px solid #d1d5db;
            box-sizing: border-box;
        }

        .button-group {
            width: 100%;
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .btn {
            border-radius: 9999px;
            width: 127px;
            height: 48px;
            border: none;
            cursor: pointer;
            font-weight: 500;
            font-size: 15px;
        }

        .btn-prev {
            background-color: #AAAAAA;
            color: white;
        }

        .btn-next {
            background-color: #3B82F6;
            color: white;
        }

        .btn-next span {
            margin-left: 4px;
        }

        .btn-prev:hover {
            background-color: #999999;
        }

        .btn-next:hover {
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
        <div class="progress-step completed"><span>1</span></div>
        <div class="progress-step active"><span>2</span></div>
        <div class="progress-step"><span>3</span></div>
    </div>


<%--    <form action="${pageContext.request.contextPath}/api/register" method="post">--%>
        <div class="input-group">
            <label>생일</label>
            <div class="birthday-inputs">
                <input type="text" name="year" placeholder="년" required />
                <input type="text" name="month" placeholder="월" required />
                <input type="text" name="day" placeholder="일" required />
            </div>
        </div>

        <div class="input-group">
            <label for="email">이메일</label>
            <input type="email" id="email" name="email" placeholder="이메일을 입력해주세요" required />
        </div>

        <div class="button-group">
            <button type="button" class="btn btn-prev"><span
                    style="display: inline-block; transform: rotate(180deg);">➔</span> 이전으로</button>
            <button type="submit" class="btn btn-next">다음으로 <span>➔</span></button>
        </div>
    </form>

    <p class="login-link">
        이미 계정이 있으신가요?
        <a href="/api/login">로그인하기</a>
    </p>
</div>
</body>

</html>