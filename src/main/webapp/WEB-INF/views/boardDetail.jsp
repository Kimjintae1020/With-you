<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<%
  String accountName = (String) session.getAttribute("LoginAccountName");
%>

<html lang="ko">
<head>
  <title>게시글 상세</title>
  <meta charset="UTF-8">
  <style>
    /* 기본 스타일 */
    body {
      margin: 0;
      font-family: Arial, sans-serif;
      background-color: #f9fafb;
    }

    .top-navbar {
      height: 88px;
      background-color: #ffffff;
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding: 0 5%;
      border-bottom: 1px solid #e5e7eb;
    }

    .headline {
      display: flex;
      align-items: center;
    }

    .headline h3 {
      color: #3B82F6;
      margin-left: 15px;
    }

    .menu {
      display: flex;
      gap: 40px;
    }

    .menu-button {
      text-decoration: none;
      color: #374151;
      font-size: 16px;
      font-weight: 500;
    }

    .menu-button:hover {
      color: #1d4ed8;
    }

    .start-button {
      background-color: #2563eb;
      color: white;
      padding: 8px 16px;
      border-radius: 20px;
      text-decoration: none;
      font-size: 14px;
      font-weight: bold;
    }

    .navbar {
      height: 28px;
      display: flex;
      justify-content: center;
      align-items: center;
      gap: 6px;
      background-color: #3b82f6;
    }

    .nav-button {
      width: 126px;
      height: 28px;
      border: none;
      border-radius: 29.5px;
      font-size: 16px;
      font-weight: bold;
      cursor: pointer;
      text-decoration: none;
      color: #c5d7f2;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .container {
      max-width: 800px;
      margin: 40px auto;
      padding: 0 20px;
    }

    h1 {
      font-size: 24px;
      margin-bottom: 10px;
      color: #111827;
    }

    .meta-info {
      font-size: 14px;
      color: #6b7280;
      margin-bottom: 20px;
    }

    .content {
      white-space: pre-wrap;
      font-size: 16px;
      line-height: 1.6;
      color: #374151;
      margin-bottom: 30px;
      padding: 20px;
      background-color: #ffffff;
      border-radius: 8px;
      box-shadow: 0 1px 3px rgba(0,0,0,0.08);
    }

    .button-group {
      display: flex;
      justify-content: space-between;
      margin-bottom: 40px;
    }

    .list-button, .like-button {
      padding: 10px 20px;
      font-size: 14px;
      background-color: #3b82f6;
      color: white;
      border: none;
      border-radius: 6px;
      cursor: pointer;
      text-decoration: none;
    }

    .list-button:hover, .like-button:hover {
      background-color: #2563eb;
    }

    /* 댓글 영역 */
    .comments {
      margin-top: 40px;
    }

    .comment-box {
      background-color: #ffffff;
      padding: 15px;
      border-radius: 8px;
      margin-bottom: 12px;
      box-shadow: 0 1px 2px rgba(0,0,0,0.06);
    }

    .comment-box strong {
      color: #1f2937;
    }

    .comment-box p {
      margin: 5px 0 0;
      color: #374151;
    }

    #commentForm {
      margin-top: 20px;
      display: flex;
      flex-direction: column;
      gap: 10px;
    }

    #commentForm textarea {
      padding: 10px;
      resize: vertical;
      border: 1px solid #d1d5db;
      border-radius: 6px;
      font-size: 14px;
      height: 100px;
    }

    #commentForm button {
      align-self: flex-end;
      background-color: #3b82f6;
      color: white;
      padding: 8px 16px;
      border-radius: 6px;
      border: none;
      cursor: pointer;
    }

    #commentForm button:hover {
      background-color: #2563eb;
    }

  </style>
</head>




<body>

<!-- 상단 네비게이션 -->
<div class="top-navbar">
  <div class="headline">
    <img src="/images/login/Frame.png" />
    <h3>With You</h3>
  </div>
  <div class="menu">
    <a href="/" class="menu-button">홈</a>
    <a href="/about" class="menu-button">소개</a>
    <a href="/boards" class="menu-button">커뮤니티</a>
    <a href="/map" class="menu-button">지도</a>
    <a href="/ranking" class="menu-button">랭킹</a>
    <a href="/contact" class="menu-button">문의하기</a>
  </div>
  <a href="/start" class="start-button">시작하기 ⟶</a>
</div>

<!-- 게시판 탭 -->
<div class="navbar">
  <a href="/boards?type=전체" class="nav-button">전체</a>
  <a href="/boards?type=인기" class="nav-button">인기</a>
  <a href="/boards?type=자유" class="nav-button">자유</a>
  <a href="/boards?type=유머" class="nav-button">유머</a>
  <a href="/boards?type=질문" class="nav-button">질문</a>
  <a href="/boards?type=소통" class="nav-button">소통</a>
</div>

<!-- 게시글 상세 -->
<div class="container">
  <h1>${board.title}</h1>
  <div class="meta-info">
    작성자: ${board.account.nickname} | 댓글 ${comments.size()}개
    | ${createdDate}
  </div>

  <div class="content">${board.content}</div>

  <div class="button-group">
    <a href="/api/boards" class="list-button">게시글 목록</a>

    <div style="display: flex; gap: 10px;">
      <button type="button" class="like-button" onclick="likePost(${board.boardId})">
        좋아요 ❤️ <span id="like-count">${board.likecount}</span>
      </button>
      <select id="reportType">
        <option value="INAPPROPRIATE_BEHAVIOR">부적절한 행동</option>
        <option value="HARASSMENT">괴롭힘</option>
        <option value="SPAM">스팸</option>
        <option value="FAKE_ACCOUNT">가짜 계정</option>
        <option value="OFFENSIVE_LANGUAGE">공격적인 언어 사용</option>
        <option value="OTHER">기타</option>
      </select>

      <input type="text" id="reportReason" placeholder="신고 사유 입력">
      <textarea id="evidenceText" placeholder="증거 내용을 입력하세요"></textarea>

      <button onclick="reportPost(${board.boardId})">신고하기</button>

    </div>
  </div>



  <!-- 댓글 목록 -->
  <div class="comments">
    <h2>댓글</h2>
    <c:forEach var="comment" items="${comments}">
      <div class="comment-box" id="comment-${comment.commentId}">
        <strong>${comment.account.nickname}</strong>

        <p id="content-${comment.commentId}">${comment.content}</p>

        <textarea id="editInput-${comment.commentId}" style="display: none;">${comment.content}</textarea>

        <div style="margin-top: 8px;">
          <button type="button" onclick="startEdit(${comment.commentId})">수정</button>
          <button type="button" onclick="submitEdit(${comment.commentId})" id="saveBtn-${comment.commentId}" style="display: none;">저장</button>
          <button type="button" onclick="deleteComment(${comment.commentId})">삭제</button>
        </div>
      </div>
    </c:forEach>



    <!-- 댓글 작성 폼 -->
    <form id="commentForm" data-board-id="${board.boardId}">
      <textarea name="content" placeholder="댓글을 작성하세요..." required></textarea>
      <button type="submit">댓글 작성</button>
    </form>

  </div>
</div>


</body>
<script>

  // 토스트 메시지 띄우기
  function showToastMessage(message) {
    const toast = document.createElement("div");
    toast.innerText = message;
    toast.style.position = "fixed";
    toast.style.bottom = "30px";
    toast.style.left = "50%";
    toast.style.transform = "translateX(-50%)";
    toast.style.backgroundColor = "#333";
    toast.style.color = "#fff";
    toast.style.padding = "10px 20px";
    toast.style.borderRadius = "6px";
    toast.style.zIndex = "9999";
    document.body.appendChild(toast);

    setTimeout(() => {
      toast.remove();
    }, 1500);
  }

  document.addEventListener("DOMContentLoaded", function () {
    const commentForm = document.getElementById("commentForm");
    const boardId = commentForm.dataset.boardId;

    commentForm.addEventListener("submit", function (e) {
      e.preventDefault(); // 기본 전송 막기

      const formData = new FormData(commentForm);

      fetch(`/api/comment/${boardId}`, {
        method: "POST",
        body: formData
      })
              .then(response => {
                if (!response.ok) throw new Error("댓글 작성 실패");
                return response.text();
              })
              .then(message => {
                showToastMessage(message);
                setTimeout(() => {
                  window.location.reload();
                }, 1500);
              })
              .catch(err => {
                showToastMessage("댓글 작성 중 오류 발생");
                console.error(err);
              });
    });
  });

  function likePost(boardId) {
    fetch(`/api/board/like/${boardId}`, {
      method: 'POST'
    })
            .then(response => {
              if (!response.ok) throw new Error("좋아요 실패");
              return response.text();
            })
            .then(message => {
              showToastMessage(message);

              // 좋아요 수 1 증가 (화면에 바로 반영)
              const countSpan = document.getElementById('like-count');
              const currentCount = parseInt(countSpan.textContent);
              countSpan.textContent = currentCount + 1;
            })
            .catch(err => {
              showToastMessage("이미 좋아요 누른 게시글입니다!");
              console.error(err);
            });
  }

  function startEdit(commentId) {
    console.log(commentId);
    console.log(${commentId})
    console.log("${commentId}")
    console.log(document.getElementById('content-' + commentId));
    const content = document.getElementById('content-' + commentId);
    const input = document.getElementById('editInput-'+commentId);
    const saveBtn = document.getElementById('saveBtn-'+commentId);

    console.log(content, input, saveBtn); // <- null이면 DOM이 아직 준비 안 된 것

    content.style.display = 'none';
    input.style.display = 'block';
    saveBtn.style.display = 'inline-block';
  }

  // 수정 저장
  function submitEdit(commentId) {
    const input = document.getElementById('editInput-'+commentId);
    console.log(input);
    const newContent = input.value;
    console.log(newContent);

    const formData = new FormData();
    formData.append("content", newContent);

    fetch('/api/comment/'+commentId+'/update', {
      method: 'PUT',
      body: formData,
    })
            .then(response => {
              if (!response.ok) throw new Error("수정 실패");
              return response.text(); // JSON이 아니면 .json() 말고 .text() 써야 에러 안 남
            })
            .then(() => {
              document.getElementById('content-' + commentId).textContent = newContent;
              document.getElementById('content-' + commentId).style.display = 'block';
              document.getElementById('editInput-' + commentId).style.display = 'none';
              document.getElementById('saveBtn-' + commentId).style.display = 'none';
            })
            .catch(err => {
              alert("댓글 수정에 실패했습니다.");
              console.error(err);
            });
  }


  // 삭제
  function deleteComment(commentId) {
    if (!confirm("정말 삭제하시겠습니까?")) return;

    fetch('/api/comment/'+commentId+'/delete', {
      method: 'DELETE',
    })
            .then(response => {
              if (!response.ok) throw new Error("삭제 실패");
              const commentBox = document.getElementById('comment-'+commentId);
              if (commentBox) commentBox.remove();
            })
            .catch(err => {
              alert("댓글 삭제에 실패했습니다.");
              console.error(err);
            });
  }

  function reportPost(boardId) {
    const accountName = "<%= accountName %>";
    if (!accountName || accountName === "null") {
      alert("로그인 후 신고하실 수 있습니다.");
      return;
    }

    if (!confirm("해당 게시글을 신고하시겠습니까?")) return;

    const reportType = document.getElementById('reportType').value;
    const reportReason = document.getElementById('reportReason').value;
    const evidenceText = document.getElementById('evidenceText').value;

    // FormData 객체 생성
    const formData = new FormData();
    formData.append('reportType', reportType);
    formData.append('reportReason', reportReason);
    formData.append('evidenceText', evidenceText);

    fetch(`/api/report/board/${boardId}`, {
      method: 'POST',
      body: formData,
      credentials: 'include'
    })
            .then(response => {
              if (!response.ok) throw new Error("신고 실패");
              return response.text();
            })
            .then(message => {
              showToastMessage(message || "신고가강ㅎㅎ 접수되었습니다.");
            })
            .catch(err => {
              showToastMessage("이미 신고한 게시글이거나 오류가 발생했습니다.");
              console.error(err);
            });
  }

  // 전역 접근을 위해 바인딩
  window.startEdit = startEdit;
  window.submitEdit = submitEdit;
  window.deleteComment = deleteComment;

</script>
</html>
