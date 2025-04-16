<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
  <title>게시판 목록</title>
  <style>
    table {
      width: 80%;
      border-collapse: collapse;
      margin: 20px auto;
    }
    th, td {
      border: 1px solid #ccc;
      padding: 8px;
      text-align: center;
    }
    th {
      background-color: #f5f5f5;
    }
  </style>
</head>
<body>
<h2 style="text-align:center;">📋 게시글 목록</h2>

<table>
  <thead>
  <tr>
    <th>번호</th>
    <th>제목</th>
    <th>작성자</th>
    <th>닉네임</th>
    <th>좋아요</th>
    <th>등록일</th>
  </tr>
  </thead>
  <tbody>
  <c:forEach var="board" items="${boards}">
    <tr>
      <td>${board.boardid}</td>
      <td>${board.title}</td>
      <td>${board.writerName}</td>
      <td>${board.writerNickname}</td>
      <td>${board.likecount}</td>
      <td>${board.createdAt}</td>
    </tr>
  </c:forEach>
  </tbody>
</table>

<div style="text-align:center;">
  <c:forEach begin="1" end="${totalPages}" var="i">
    <a href="/boards?page=${i}" style="margin:0 5px;">[${i}]</a>
  </c:forEach>
</div>

</body>
</html>
