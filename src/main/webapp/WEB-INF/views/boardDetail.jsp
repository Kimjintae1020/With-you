<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
  <title>게시글 상세</title>
</head>
<body>

<h1>${board.title}</h1>
<p>${board.content}</p>

<hr>

<h2>댓글</h2>
<c:forEach var="comment" items="${comments}">
  <p><strong>${comment.account.nickname}</strong>: ${comment.content}</p>
</c:forEach>

<!-- 댓글 작성 폼 -->
<form id="commentForm" data-board-id="${board.boardId}" method="post">
  <textarea name="content" placeholder="댓글 입력" required></textarea>
  <button type="submit">댓글 작성</button>
</form>

<!-- 토스트 메시지 영역 -->
<div id="toast" style="display: none; position: fixed; bottom: 30px; left: 50%; transform: translateX(-50%);
    background: #333; color: #fff; padding: 10px 20px; border-radius: 5px; z-index: 10000;"></div>

<!-- 스크립트 -->
<script>
  document.addEventListener("DOMContentLoaded", function () {
    const commentForm = document.getElementById("commentForm");
    const boardId = commentForm.dataset.boardId;

    commentForm.addEventListener("submit", function (e) {
      e.preventDefault();

      fetch(`/api/comment/${boardId}`, {
        method: 'POST',
        body: new FormData(commentForm)
      })
              .then(response => response.text().then(text => {
                return { status: response.status, message: text };
              }))
              .then(result => {
                showToast(result.message);
                if (result.status === 200) {
                  setTimeout(() => {
                    window.location.href = `/api/board/detail/${boardId}`;
                  }, 1500);
                }
              })
              .catch(error => {
                showToast("댓글 작성 중 오류가 발생했습니다.");
                console.error("Error:", error);
              });
    });
  });

  function showToast(message) {
    const toast = document.getElementById("toast");
    toast.textContent = message;
    toast.style.display = "block";
    setTimeout(() => {
      toast.style.display = "none";
    }, 1500);
  }
</script>

</body>
</html>
