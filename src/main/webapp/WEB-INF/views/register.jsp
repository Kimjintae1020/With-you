<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <title>회원가입</title>
    <style>
        body {
            background-color: #EFF6FF;
            margin: 0;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: auto;
        }

        h3 {
            display: flex;
            justify-content: center;
            align-items: center;
            font-weight: bold;
        }

        h5 {
            display: flex;
            justify-content: center;
            align-items: center;
            color: #4B5563;
        }

        #With-You {
            color: #3B82F6;
            margin-left: 15px;
        }

        .headline {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: center;
            background-color: white;
            padding: 30px 32px;
            border-radius: 16px;
            width: 448px;
            box-sizing: border-box;
        }

        .input-group {
            width: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-bottom: 15px;
        }

        .input-group input,
        .input-group select {
            width: 100%;
            border-radius: 8px;
            padding: 10px;
            height: 50px;
            border: 1px solid #d1d5db;
            box-sizing: border-box;
        }

        .input-group .birthday-inputs {
            display: flex;
            gap: 10px;
        }

        .input-group .birthday-inputs input {
            width: 30%;
        }

        .button-group {
            width: 100%;
            display: flex;
            justify-content: flex-end;
            margin-top: 10px;
        }

        label {
            align-self: flex-start;
            font-weight: 500;
            font-size: 11.9px;
            color: #374151;
            margin-bottom: 5px;
        }

        button {
            background-color: #3B82F6;
            color: #ffffff;
            border-radius: 9999px;
            width: 127px;
            height: 48px;
            border: none;
            margin-top: 20px;
            cursor: pointer;
        }

        button:hover {
            background-color: #2563EB;
        }

        .login-link {
            margin-top: 15px;
            font-size: 13px;
            color: #6B7280;
            text-align: center;
        }

        .login-link a {
            color: #3B82F6;
            text-decoration: none;
            margin-left: 5px;
            font-weight: 500;
        }

        .login-link a:hover {
            text-decoration: underline;
        }

        .address-inputs,
        .email-verify {
            display: flex;
            gap: 10px;
            width: 100%;
            align-items: center;
        }

        .address-inputs input,
        .email-verify input {
            flex: 1;
            padding: 10px;
            max-height: 50px;
            border-radius: 8px;
            border: 1px solid #d1d5db;
            height: 50px;
            box-sizing: border-box;
        }

        .address-inputs button,
        .verify-button {
            background-color: #3B82F6;
            color: white;
            border-radius: 8px;
            padding: 10px 12px;
            cursor: pointer;
            width: 125px;
            height: 50px;
            box-sizing: border-box;
            margin-top: 0px;
        }

        .address-inputs button:hover,
        .verify-button:hover {
            background-color: #2563EB;
        }

        .email-verify input {
            margin-right: 5px;
        }

        .address-inputs input {
            margin-right: 5px;
        }

        .input-group .email-verify,
        .input-group .address-inputs {
            gap: 0px;
        }
        .error-message {
            color: red;
            font-size: 14px;
            margin-top: 5px;
            display: none;
        }
    </style>
</head>

<body>
<div class="all">
    <div class="headline">
        <img src="/images/main/Frame.png" />
<%--        <img src="/images/login/Frame.png" alt="이미지 에러">--%>
        <h3 id="With-You">With You</h3>
    </div>
    <h3>회원가입</h3>
    <h5>계정 정보를 입력해주세요</h5>

    <form id="signup-form" action="${pageContext.request.contextPath}/api/register" method="post">
        <div class="input-group">
            <label for="name">아이디</label>
            <input type="text" id="name" name="accountname" placeholder="사용하실 아이디를 입력해주세요" required />
        </div>

        <div class="input-group">
            <label for="password">비밀번호</label>
            <input type="password" id="password" name="password" placeholder="8자 이상 입력해주세요" required />
        </div>

        <div class="input-group">
            <label for="confirm-password">비밀번호 확인</label>
            <input type="password" id="confirm-password" name="confirm-password" placeholder="비밀번호를 다시 입력해주세요" required />
            <div class="error-message" id="password-error">비밀번호가 일치하지 않습니다.</div>
        </div>

        <div class="input-group">
            <label>생일</label>
            <div class="birthday-inputs">
                <input type="text" id="year" name="year" placeholder="년" required />
                <input type="text" id="month" name="month" placeholder="월" required />
                <input type="text" id="day" name="day" placeholder="일" required />
            </div>
        </div>

        <input type="hidden" name="birthYear" id="birth" />

        <div class="input-group">
            <label for="email">이메일</label>
            <div class="email-verify">
                <input type="email" id="email" name="email" placeholder="이메일을 입력해주세요" required />
                <button type="button" class="verify-button">인증번호 받기</button>
            </div>
            <!-- <input type="text" name="verificationCode" placeholder="인증번호 입력" required /> -->
        </div>

        <div class="input-group">
            <label for="address">주소</label>
            <select id="address" name="address" onchange="setAddressCode(this)">
                <option value="">시/도 선택</option>
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

        <input type="hidden" name="region" id="addressCode" />

        <div class="input-group">
            <label for="nickname">닉네임</label>
            <input type="text" id="nickname" name="nickname" placeholder="닉네임을 입력하세요" />
        </div>

        <div class="button-group">
            <button type="submit">회원가입</button>
        </div>

        <select name="role" id="role">
            <option value="ROLE_USER">일반 사용자</option>
            <option value="ROLE_ADMIN">관리자</option>
        </select>
    </form>

    <p class="login-link">
        이미 계정이 있으신가요?
        <a href="/api/login">로그인하기</a>
    </p>
</div>

<script>
    const form = document.getElementById('signup-form');
    const passwordInput = document.getElementById('password');
    const confirmInput = document.getElementById('confirm-password');
    const errorMsg = document.getElementById('password-error');
    const form1 = document.querySelector("form");

    function setAddressCode(select) {
        const selectedValue = select.value;
        document.getElementById('addressCode').value = selectedValue;
    }

    form1.addEventListener("submit", function (e) {
        const year = document.querySelector('input[name="year"]').value.padStart(4, '0');
        const month = document.querySelector('input[name="month"]').value.padStart(2, '0');
        const day = document.querySelector('input[name="day"]').value.padStart(2, '0');
        const birthStr = year+month+day
        const birthInt = parseInt(birthStr, 10);

        document.querySelector('input[name="birthYear"]').value = birthInt;

        const address = document.getElementById("address").value.trim();
        const detail = document.getElementById("addressDetail").value.trim();
        document.getElementById("fullAddress").value = `${address} ${detail}`;
    });

    form.addEventListener('submit', function (e) {
        if (passwordInput.value !== confirmInput.value) {
            e.preventDefault(); // 폼 제출 막기
            errorMsg.style.display = 'block'; // 오류 메시지 보이기
        } else {
            errorMsg.style.display = 'none'; // 오류 메시지 숨기기
        }
    });

    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function (data) {
                var fullAddr = data.address;
                if (data.addressType === 'R') {
                    if (data.bname !== '') fullAddr += ' ' + data.bname;
                    if (data.buildingName !== '') fullAddr += (fullAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                document.getElementById("address").value = fullAddr;
            }
        }).open();
    }
</script>
</body>

</html>