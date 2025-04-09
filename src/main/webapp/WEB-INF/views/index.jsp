<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>index page</h1>
<%
    String name = (String) session.getAttribute("LoginAccountName");
    if (name != null) {
%>
<p>안녕하세요, <%= name %> 님!</p>
<%
    }
%>

<a href="/api/login" style="display: inline-block; padding: 8px 16px; background: #007bff; color: white; border-radius: 4px; text-decoration: none;">로그인</a>
<br><br>
<a href="/api/register" style="display: inline-block; padding: 8px 16px; background: #28a745; color: white; border-radius: 4px; text-decoration: none;">회원가입</a>
<br><br>
<a href="/api/logout" style="display: inline-block; padding: 8px 16px; background: #dc3545; color: white; border-radius: 4px; text-decoration: none;">로그아웃</a>

</body>
</html>