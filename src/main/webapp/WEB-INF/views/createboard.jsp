<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>게시글 작성</title>
</head>
<body>
<h1>게시글 작성</h1>

<form action="/api/create/board" method="post">
    <label for="boardtitle">제목ㅣ:</label>
    <input type="text" id="boardtitle" name="boardtitle" required>
    <br><br>

    <label for="boardcontent">내용:</label>
    <textarea id="boardcontent" name="boardcontent" rows="5" cols="30" required></textarea>
    <br><br>

    <button type="submit">작성</button>
</form>

</body>
</html>
