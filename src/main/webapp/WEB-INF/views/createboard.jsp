<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <title>게시글 작성</title>
    <meta charset="UTF-8">
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
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
            color: #111827;
            margin-bottom: 24px;
            text-align: left;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #374151;
        }

        input[type="text"],
        select,
        textarea {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 6px;
            resize: vertical;
            box-sizing: border-box;
        }

        textarea {
            height: 200px;
        }

        .button-group {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 30px;
            width: 100%;
        }

        .button {
            padding: 10px 20px;
            font-size: 14px;
            background-color: #3b82f6;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            text-decoration: none;
            text-align: center;
        }

        .button:hover {
            background-color: #2563eb;
        }

        .form-row {
            display: flex;
            gap: 16px;
            align-items: center;
        }

        .form-row input[type="text"] {
            flex: 1;
        }

        .post-type-tabs {
            display: flex;
            gap: 12px;
            position: relative;
        }

        .list-button {
            float: left;
            padding: 10px 20px;
            font-size: 14px;
            background-color: #ffffff;
            color: #111827;
            border: 1px solid #d1d5db;
            border-radius: 6px;
            cursor: pointer;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.08);
            text-decoration: none;
        }

        .list-button:hover {
            background-color: #f3f4f6;
        }

        .post-type-tab {
            font-weight: 500;
            cursor: pointer;
            padding: 8px 12px;
            border-bottom: 2px solid transparent;
            color: #6b7280;
            transition: all 0.3s ease;
        }

        .post-type-tab.active {
            border-color: #3b82f6;
            color: #3b82f6;
        }

        .submit-button {
            float: right;
            padding: 10px 20px;
            font-size: 14px;
            background-color: #3b82f6;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.08);
        }

        .submit-button:hover {
            background-color: #2563eb;
        }

        F textarea,
        input[type="text"] {
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.08);
        }

        .button-wrapper {
            margin-top: 30px;
            width: 100%;
            position: relative;
        }

        #logo {
            display: flex;
            align-items: center;
            justify-content: center;
            text-decoration-line: none;

            margin-left: 100px;
        }

        #logo h2 {
            margin-left: 10px;
            color: #3B82F6;
        }
    </style>
</head>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        const tabs = document.querySelectorAll(".post-type-tab");
        const typeInput = document.getElementById("type");

        tabs.forEach((tab) => {
            tab.addEventListener("click", () => {
                tabs.forEach((t) => t.classList.remove("active"));
                tab.classList.add("active");
                typeInput.value = tab.dataset.value;
            });
        });
    });
</script>

<body>

<div class="top-navbar">
    <div class="headline">
        <a href="${pageContext.request.contextPath}/api/main" id="logo">
            <img src="/images/login/Frame.png" alt="경로 에러">
            <h2>With You</h2>
        </a>
    </div>
    <div class="menu">
        <a href="${pageContext.request.contextPath}/api/main" class="menu-button">홈</a>
        <a href="${pageContext.request.contextPath}/api/introduction">소개</a>
        <a href="${pageContext.request.contextPath}/api/boards" class="menu-button">커뮤니티</a>
        <a href="${pageContext.request.contextPath}/api/map" class="menu-button">지도</a>
        <a href="${pageContext.request.contextPath}/api/rank" class="menu-button">랭킹</a>
        <a href="${pageContext.request.contextPath}/api/faq" class="menu-button">문의하기</a>
        <a href="${pageContext.request.contextPath}/api/club/list/account" class="menu-button">동호회</a>
        <a href="${pageContext.request.contextPath}/api/login" class="menu-button">로그인</a>
        <a href="${pageContext.request.contextPath}/api/register" class="menu-button">회원가입</a>
        <a href="${pageContext.request.contextPath}/api/mypage" class="menu-button">마이페이지</a>


    </div>
    <a href="${pageContext.request.contextPath}/api/boards" class="start-button">시작하기 ⟶</a>
</div>

<div class="navbar">
    <a href="/boards?type=전체" class="nav-button">전체</a>
    <a href="/boards?type=인기" class="nav-button">인기</a>
    <a href="/boards?type=자유" class="nav-button">자유</a>
    <a href="/boards?type=유머" class="nav-button">유머</a>
    <a href="/boards?type=질문" class="nav-button">질문</a>
    <a href="/boards?type=소통" class="nav-button">소통</a>
</div>

<div class="container">
    <h1>게시글 작성</h1>
    <form id="createBoardForm">
    <div class="form-group form-row">
            <input type="text" id="title" name="title" placeholder="제목을 입력하세요" required />

            <div>
                <select name="region" id="region" required>
                    <option value="" disabled selected>-- 활동 지역 선택 --</option>
                    <option value="SEOUL">서울특별시</option>
                    <option value="BUSAN">부산광역시</option>
                    <option value="DAEGU">대구광역시</option>
                    <option value="INCHEON">인천광역시</option>
                    <option value="GWANGJU">광주광역시</option>
                    <option value="DAEJEON">대전광역시</option>
                    <option value="ULSAN">울산광역시</option>
                    <option value="SEJONG">세종특별자치시</option>
                    <option value="GYEONGGI">경기도</option>
                    <option value="GANGWON">강원도</option>
                    <option value="CHUNGBUK">충청북도</option>
                    <option value="CHUNGNAM">충청남도</option>
                    <option value="JEONBUK">전라북도</option>
                    <option value="JEONNAM">전라남도</option>
                    <option value="GYEONGBUK">경상북도</option>
                    <option value="GYEONGNAM">경상남도</option>
                    <option value="JEJU">제주특별자치도</option>
                </select>
            </div>

            <div class="post-type-tabs">
                <div class="post-type-tab active" data-value="자유">자유</div>
                <div class="post-type-tab" data-value="유머">유머</div>
                <div class="post-type-tab" data-value="질문">질문</div>
                <div class="post-type-tab" data-value="소통">소통</div>
            </div>
            <input type="hidden" id="type" name="type" value="자유" />
        </div>

        <div class="form-group">
            <textarea id="content" name="content" placeholder="이곳을 클릭해 게시글 작성..." required></textarea>
        </div>

        <div class="button-wrapper">
            <a href="/api/boards" class="list-button">목록</a>
            <button type="submit" class="submit-button">게시글 작성</button>
        </div>
    </form>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        const form = document.getElementById("createBoardForm");

        form.addEventListener("submit", function (e) {
            e.preventDefault(); // 기본 제출 막기

            const formData = new FormData(form);

            fetch("/api/create/board", {
                method: "POST",
                body: formData
            })
                .then(response => response.text().then(text => {
                    return { status: response.status, message: text };
                }))
                .then(result => {
                    showToast(result.message);

                    if (result.status === 200) {
                        setTimeout(() => {
                            window.location.href = "/api/boards"; //
                        }, 1500);
                    }
                })
                .catch(err => {
                    showToast("❗ 게시글 작성 중 오류가 발생했습니다.");
                    console.error(err);
                });
        });

        function showToast(message) {
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
            toast.style.zIndex = "10000";
            document.body.appendChild(toast);

            setTimeout(() => {
                toast.remove();
            }, 1500);
            return toast;
        }
    });
</script>


</body>

</html>
