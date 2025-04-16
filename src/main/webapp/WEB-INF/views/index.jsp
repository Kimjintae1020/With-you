<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Index Page</title>
    <script>
        function handleLogout() {
            fetch('/api/logout', {
                method: 'POST'
            })
                .then(response => {
                    if (response.ok) {
                        alert("로그아웃 되었습니다."); // 토스트처럼 간단하게 alert 사용
                        location.reload(); // 페이지 리로드
                    } else {
                        alert("로그아웃 실패");
                    }
                })
                .catch(error => {
                    console.error('에러:', error);
                });
        }
    </script>
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

<a href="/api/login">로그인</a>
<br><br>
<a href="/api/register">회원가입</a>
<br><br>
<a href="/api/board">게시글</a>
<br><br>
<a href="javascript:void(0);" onclick="handleLogout()">로그아웃</a>

<br><br>
<a href="/api/boards">게시글목록</a>
<br><br>

</body>
</html>
