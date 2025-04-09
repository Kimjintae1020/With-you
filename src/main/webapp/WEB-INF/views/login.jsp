<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>로그인</title>
</head>
<body>
<h2>로그인</h2>

<form action="${pageContext.request.contextPath}/api/login" method="post">


    <label for="name">이름 (name):</label><br/>
    <input type="text" id="name" name="name" required/><br/><br/>

    <label for="password">비밀번호:</label><br/>
    <input type="password" id="password" name="password" required/><br/><br/>

    <button type="submit">로그인</button>
</form>
</body>
</html>
