<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>gg</title>
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
            text-align: center;
            background-color: white;
            padding-top: 30px;
            box-sizing: border-box;
            border-radius: 16px;
            width: 448px;
            height: 398px;
        }

        .input-group {
            width: 75%;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            margin-bottom: 15px;
        }

        .button-group {
            width: 100%;
            max-width: 384px;
            display: flex;
            justify-content: flex-end;
        }

        label {
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
        }

        button {
            background-color: #3B82F6;
            color: #ffffff;
            border-radius: 9999px;
            width: 127px;
            height: 48px;
            border: none;
            margin-top: 20px;
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
    </style>
</head>

<body>
<div class="all">
    <div class="headline">
<%--        <img src="Frame.png" />--%>
        <h3 id="With-You">With You</h3>
    </div>
    <h3>회원가입</h3>
    <h5>계정 정보를 입력해주세요</h5>

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
            <label for="passwordConfirm">비밀번호 확인</label>
            <input type="password" id="passwordConfirm" name="passwordConfirm" placeholder="비밀번호를 다시 입력해주세요" required />
        </div>

        <div class="button-group">
            <button type="submit">가입하기</button>
        </div>

        <p class="login-link">
            이미 계정이 있으신가요?
            <a href="/api/login">로그인하기</a>
        </p>

    </form>
</div>
</body>

</html>

