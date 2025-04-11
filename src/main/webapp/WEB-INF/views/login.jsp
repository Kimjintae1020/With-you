<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {

            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;

            background: #EFF6FF;
        }

        /* --------------------------- */
        .container_1 {

            text-align: center;
            align-items: center;
            justify-content: center;
            margin-top: 40px;
        }

        .flex_center_box {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 10px;
        }

        .flex_center_box h2 {
            margin-left: 10px;
            color: #3B82F6;
        }

        .container_1 h3 {
            margin-bottom: 10px;
        }



        /* --------------------------- */

        .container_2 {
            text-align: center;
            align-items: center;
            justify-content: center;
            margin-top: 40px;
        }

        .container_2 .container_2_box_1 {
            width: 400px;
            border-radius: 16px;
            background: white;
        }

        .container_2 .container_2_box_1 p {
            text-align: left;
            margin-left: 40px;
            padding-top: 30px;
            font-size: 11px;
        }

        .container_2 .container_2_box_1 #name, #password  {
            width: 320px;
            height: 40px;
            margin-top: 10px;
            padding-left: 20px;
            opacity: 0.7;
        }

        /* --------------------------- */



        .container_2 .container_2_box_2 {
            width: 100%;
            height: 40px;

            align-items: center;
            text-align: left;

            margin-top: 20px;

        }


        .container_2 .container_2_box_2 #stayLogin {
            margin-left: 40px;
        }

        .container_2 .container_2_box_2 label {
            margin-left: 5px;
            font-size: 11px;
        }


        .container_2 .container_2_box_1 .container_2_box_2 #findAcount

        {margin-left: 85px;

            font-size: 11px;
        }

        /* --------------------------- */

        .container_2 .container_2_box_1 #LoginBtn {
            width: 320px;
            height: 40px;
            border-radius: 40px;
            border: 0;
            margin-bottom: 20px;
            background-color: #3B82F6;
            color: white;
            font-size: 11px;
        }



        /* --------------------------- */

        .container_3 {
            width: 400px;
            display: flex;
            margin-top: 30px;
            margin-left: 200px;



        }

        .container_3 p {

            font-size: 11px;
        }

        .container_3 a {
            margin-left: 20px;
            font-size: 11px;
            text-decoration-line: none;
        }


        /* --------------------------- */

        .container_4 {
            width: 400px;
            margin-top: 30px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .container_4 a {
            text-decoration-line: none;
        }


        /* --------------------------- */


        .container_5 {
            width: 350px;
            margin-top: 20px;
            display: flex;
            justify-content: space-between;
        }


        .container_5 button {
            font-size: 11px;
            border-radius: 12px;
            border: 0.5px solid black;
            width: 170px;
            height: 40px;
            background-color: transparent;

            opacity: 0.7;
        }

        /* --------------------------- */
    </style>
</head>
<body>
<!-- ------------------------------------------- -->
<div class="container_1">
    <div class="flex_center_box">
        <img src="${pageContext.request.contextPath}/webapp/WEB-INF/views/images/Frame.png" alt="이미지 에러">
        <h2>With You</h2>
    </div>
    <h3>로그인</h3>
    <p>이웃들과 함께 하는 즐거운 동네생활</p>
</div>
<!-- ------------------------------------------- -->
<div class="container_2" >
    <form class="container_2_box_1" action="${pageContext.request.contextPath}/api/login" method="post">
        <p>아이디</p>
        <input type="text" id="name" name="name" required placeholder="아이디를 입력해주세요">

        <p>비밀번호</p>
        <input type="password" id="password" name="password" required placeholder="비밀번호를 입력해주세요">

        <div class="container_2_box_2">
            <input type="checkbox" id="stayLogin">
            <label for="stayLogin">로그인 상태 유지</label>
            <a id="findAcount" href="#">아이디/비밀번호 찾기</a>
        </div>

        <button type="submit"id="LoginBtn">로그인</button>
    </form>
</div>
<!-- ------------------------------------------- -->
<div class="container_3">
    <p>아직 계정이 없으신가요?</p>
    <a href="#">회원가입하기</a>
</div>

<!-- ------------------------------------------- -->
<div class="container_4">
    <a href="#메인 페이지">With You 둘러보기</a>
</div>
<!-- ------------------------------------------- -->
<div class="container_5">
    <button id="goTo_nPage_Btn" onclick="location.href='#인기 동네 페이지'">인기 동네 구경하기</button>
    <button id="goTo_nnPage_Btn" onclick="location.href='#인기 글 페이지'">실시간 인기 글 보기</button>

</div>


</body>
</html>