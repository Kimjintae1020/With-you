<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <link rel="stylesheet" href="/css/login_page.css">
</head>
<body>
<!-- ------------------------------------------- -->
<div class="container_1">
    <div class="flex_center_box">
        <img src="/images/Frame.png" alt="이미지 에러">
        <h2>With You</h2>
    </div>
    <h3>로그인</h3>
    <p>이웃들과 함께 하는 즐거운 동네생활</p>
</div>
<!-- ------------------------------------------- -->
<div class="container_2" >
    <form class="container_2_box_1" action="${pageContext.request.contextPath}/api/login" method="post">
        <p>아이디</p>
        <input type="text" id="name" name="accountname" required placeholder="아이디를 입력해주세요">

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