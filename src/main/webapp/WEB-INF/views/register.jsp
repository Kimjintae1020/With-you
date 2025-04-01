<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>회원가입</title>
</head>
<body>
<h2>회원가입</h2>

<form action="${pageContext.request.contextPath}/api/register" method="post">


    <label for="name">이름 (name):</label><br/>
    <input type="text" id="name" name="name" required/><br/><br/>

    <label for="password">비밀번호:</label><br/>
    <input type="password" id="password" name="password" required/><br/><br/>

    <label for="role">역할 (선택):</label><br/>
    <select name="role" id="role">
        <option value="ROLE_USER">일반 사용자</option>
        <option value="ROLE_ADMIN">관리자</option>
    </select><br/><br/>

    <button type="submit">가입하기</button>
</form>
</body>
</html>
