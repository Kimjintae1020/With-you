<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>문의하기 페이지</title>
    <link rel="stylesheet" href="/css/faq.css">
</head>
<body>
    <div class="main_wrap">
        <!-- -------------------------------- -->
        <div class="container_1">
            <a href="${pageContext.request.contextPath}/api/main" id="logo">
                <img src="/images/login/Frame.png" alt="경로 에러">
                <h2>With You</h2>
            </a>

            <div class="box_2">
                <a href="${pageContext.request.contextPath}/api/main">홈</a>
                <a href="#소개">소개</a>
                <a href="${pageContext.request.contextPath}/api/boards">커뮤니티</a>
                <a href="${pageContext.request.contextPath}/api/map">지도</a>
                <a href="${pageContext.request.contextPath}/api/rank">랭킹</a>
                <a href="${pageContext.request.contextPath}/api/faq">문의하기</a>
                <a href="${pageContext.request.contextPath}/api/club/list/account">동호회</a>


            </div>
            <div class="box_3">
                <button onclick="location.href='${pageContext.request.contextPath}/api/boards'">시작하기</button>
            </div>
        </div> <!-- container_1 -->
        <!-- -------------------------------- -->
        <div class="content_wrap" >
            <div id="container_2">
                <h1>Q&A</h1>
            </div>

            <div id="container_3">

                <div class="box_div">
                    <h2>이 서비스는 무엇을<br>제공하나요?</h2>
                    <img src="/images/faq/leftIcon.png" alt="">
                    <p>저희 서비스는 하이퍼 로컬 서비스로<br>지역 커뮤니티 제공과 각 동네마다<br>온오프라인 모임을 생성 및 참여 할 수<br>있도록 도와드리고 있습니다.</p>
                </div>
                <div class="box_div">
                    <h2>누가 이 서비스를<br>이용할 수 있나요?</h2>
                    <img src="/images/faq/centerIcon.png" alt="">
                    <p>현재 천안시의 서북구와 동남구만<br>서비스 되고 있기 때문에<br>해당 지역에 거주중인 분들만<br>이용 가능합니다.</p>
                </div>
                <div class="box_div">
                    <h2>이 서비스를 이용하면<br>어떤 점이 좋은가요?</h2>
                    <img src="/images/faq/rightIcon.png" alt="">
                    <p>커뮤니티에서 유용한 정보를 얻을 수<br>있고 모임을 만들어 새로운 사람들과<br>친해질 수 있습니다.</p>
                </div>
            </div>

            <div id="container_4">
                <h2>자주 묻는 질문</h2>
                <div class="qeustion">
                    <div class="box_wrap" onclick="hiddeDiv('q_1')">
                        <div class="left">
                            <p>회원 가입을 꼭 해야 하나요?</p>
                        </div>
                        <div class="right">
                            <img src="/images/faq/downArrow.png" alt="">
                        </div>
                    </div>
                    <hr>
                    <div class="q_style" id="q_1">
                        <p>네 회원가입을 하셔야 저희 서비스에 접근이 가능합니다.<br>건강한 교류와 사용자분들을 위해 부적절한 유저들을 감시하고 접근을<br>막고 있습니다. 신고기능을 사용하려면 반드시 회원가입이 필요합니다.</p>
                    </div>
                </div>
                <!-- --------------------- -->
                <div class="qeustion">
                    <div class="box_wrap" onclick="hiddeDiv('q_2')">
                        <div class="left">
                            <p>게시판에 접근이 안돼요</p>
                        </div>
                        <div class="right">
                            <img src="/images/faq/downArrow.png" alt="">
                        </div>
                    </div>
                    <hr>
                    <div class="q_style" id="q_2">
                        <p>현재 저희 서비스는 회원가입을 한 사용자만이 서비스를 이용할 수 있습니다.<br>저희 서비스는 올바른 인터넷 문화와 신뢰도를 높이기<br>위해 힘쓰고 있습니다. 따라서 가입을 하지 않은 유저는 사용할 수 없습니다.</p>
                    </div>
                </div>
                <!-- --------------------- -->
                <div class="qeustion">
                    <div class="box_wrap" onclick="hiddeDiv('q_3')">
                        <div class="left">
                            <p>모임 또는 게시판에서 부적절한 사용자가<br>있어요 어떻게 대처해야 하나요?</p>
                        </div>
                        <div class="right">
                            <img src="/images/faq/downArrow.png" alt="">
                        </div>
                    </div>
                    <hr>
                    <div class="q_style" id="q_3">
                        <p>사용자의 모임이나 게시글에서 신고를 할 수 있습니다.<br>신고하려는 사유를 적어서 신청해주시면<br>최대한 빠르게 조치하도록 하겠습니다.</p>
                    </div>
                    <!-- --------------------- -->
                </div>

            </div>
        </div>



    </div> <!-- main_wrap -->
<script>
    const q1 = document.getElementById('q_1');
    const q2 = document.getElementById('q_2');
    const q3 = document.getElementById('q_3');

    q1.style.display = 'none';
    q2.style.display = 'none';
    q3.style.display = 'none';

    function hiddeDiv(id) {
        const hide = document.getElementById(id);
        if (hide.style.display == 'none') {
            hide.style.display = 'block';
        }
        else {
            hide.style.display = 'none';
        }
    }

</script>
</body>
</html>