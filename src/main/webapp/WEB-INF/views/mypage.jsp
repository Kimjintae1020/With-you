<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>
    <link rel="stylesheet" href="/css/mypage.css">
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
            <a href="#문의하기">문의하기</a>

        </div>
        <div class="box_3">
            <button onclick="location.href='${pageContext.request.contextPath}/api/boards'">시작하기<img id="btn_img" src="/images/main/arrow.png" alt="" width="16"></button>
        </div>
    </div>
    <!-- -------------------------------- -->

    <div class="wrapInside">

        <div class="container_2">
            <h1>내 정보</h1>
            <hr class="hr_info">
        </div>
        <!-- -------------------------------- -->
        <div class="wrap">
            <div id="wrap_box_1">

                <h1 id="profile">프로필 정보</h1>
                <hr class="hr_info">
                <!-- -------------------------------- -->
                <div class="container_3">
                    <div class="ctn_left">
                        <img src="/images/mypage/userImg.svg" alt="ddd">
                    </div>
                    <!-- -------------------------------- -->
                    <div class="ctn_right">
                        <table>
                            <tr>
                                <td align="right">아이디 : &nbsp;</td>
                                <td>${mypage.accountname}</td>
                            </tr>
                            <tr>
                                <td align="right">비밀번호 : &nbsp;</td>
                                <td>${mypage.password}</td>
                            </tr>
                            <tr>
                                <td align="right">닉네임 : &nbsp;</td>
                                <td>${mypage.nickname}</td>
                            </tr>
                            <tr>
                                <td align="right">이메일 : &nbsp;</td>
                                <td>${mypage.email}</td>
                            </tr>
                            <tr>
                                <td align="right">탄생년도 : &nbsp;</td>
                                <td>${mypage.birthYear}</td>
                            </tr>
                            <tr>
                                <td align="right">등급 : &nbsp;</td>
                                <td>${mypage.grade}</td>
                            </tr>
                            <tr>
                                <td align="right">거주지 : &nbsp;</td>
                                <td>${mypage.region}</td>
                            </tr>
                            <tr>
                                <td align="right">사용자 평점 : &nbsp;</td>
                                <td>${mypage.score} / 100점 만점</td>
                            </tr>
                            <tr>
                                <td align="right">받은 평가 수 : &nbsp;</td>
                                <td>${mypage.reviewCnt}</td>
                            </tr>
                            <tr>
                                <td align="right">가입일 : &nbsp;</td>
                                <td>${mypage.createdAt}</td>
                            </tr>
                        </table>
                    </div>
                    <!-- -------------------------------- -->
                </div>
                <!-- -------------------------------- -->

                <button id="config_my">개인정보 수정하기</button>

            </div>





            <div class="container_4">
                <h1>작성한 게시글</h1>
                <hr class="hr_info">
                <table>
                    <tr>
                        <td>게시판</td>
                        <td>작성자</td>
                        <td>제목</td>
                    </tr>
                    <tr>
                        <td>성정1동</td>
                        <td>account1</td>
                        <td>board 넘겨 받고 출력할 부분</td>
                    </tr>
                    <tr>
                        <td>성정1동</td>
                        <td>account1</td>
                        <td>example</td>
                    </tr>
                </table>
            </div>

            <!-- -------------------------------- -->

            <div class="container_5">
                <h1>작성한 댓글</h1>
                <hr class="hr_info">
                <table>
                    <tr>
                        <td>게시판</td>
                        <td>작성자</td>
                        <td>댓글 내용</td>
                        <td>등록일</td>
                        <td>수정일</td>
                    </tr>
                    <tr>
                        <td>성정1동</td>
                        <td>account1</td>
                        <td>example</td>
                        <td>0000-00-00</td>
                        <td>0000-00-00</td>
                    </tr>
                    <tr>
                        <td>성정1동</td>
                        <td>account1</td>
                        <td>example</td>
                        <td>0000-00-00</td>
                        <td>0000-00-00</td>
                    </tr>
                </table>
            </div>

            <!-- -------------------------------- -->

            <div class="container_6">
                <h1>참여한 소모임</h1>
                <hr class="hr_info">
                <table>
                    <tr>
                        <td>동호회 이름</td>
                        <td>지역</td>
                        <td>등록일</td>
                        <td>수정일</td>
                    </tr>
                    <tr>
                        <td>example</td>
                        <td>성정1동</td>
                        <td>0000-00-00</td>
                        <td>0000-00-00</td>
                    </tr>
                    <tr>
                        <td>example</td>
                        <td>성정1동</td>
                        <td>0000-00-00</td>
                        <td>0000-00-00</td>
                    </tr>
                </table>
            </div>

            <!-- -------------------------------- -->








        </div>


        <!-- -------------------------------- -->




    </div>
</div>

</body>
</html>