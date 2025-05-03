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
  <div>
    <p>
      <strong>${comment.account.nickname}</strong>:
      <span id="date-comment-text-${comment.commentId}">${comment.content}</span>
      <button class="edit-btn"
              data-comment-id="${comment.commentId}"
              data-comment-content="${comment.content}">수정</button>
    </p>
  </div>
</c:forEach>

<!-- 댓글 작성 폼 -->
<form id="commentForm" data-board-id="${board.boardId}" method="post">
  <textarea name="content" placeholder="댓글 입력" required></textarea>
  <button type="submit">댓글 작성</button>
</form>

<!-- 토스트 메시지 영역 -->
<div id="toast" style="display: none; position: fixed; bottom: 30px; left: 50%; transform: translateX(-50%);
    background: #333; color: #fff; padding: 10px 20px; border-radius: 5px; z-index: 10000;"></div>

<!-- 댓글 수정 팝업 -->
<div id="edit-toast" style="display: none; position: fixed; bottom: 90px; left: 50%; transform: translateX(-50%);
    background: #222; color: #fff; padding: 15px; border-radius: 8px; z-index: 10001;">
  <textarea id="edit-toast-content" style="width: 250px; height: 60px;"></textarea>
  <button id="edit-toast-save">💾 저장</button>
</div>
<script>
  document.addEventListener("DOMContentLoaded", function () {
    const commentForm = document.getElementById("commentForm");
    const boardId = commentForm.dataset.boardId;

    let selectedCommentId = null;

    // 댓글 수정 버튼
    document.querySelectorAll(".edit-btn").forEach(button => {
      button.addEventListener("click", function () {
        selectedCommentId = this.dataset.commentId;
        const content = this.dataset.commentContent;

        console.log("🟡 선택된 댓글 ID:", selectedCommentId);

        document.getElementById("edit-toast-content").value = content;
        document.getElementById("edit-toast").style.display = "block";
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
