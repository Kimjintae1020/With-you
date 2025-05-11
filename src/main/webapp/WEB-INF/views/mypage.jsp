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
        <!-- -------------------------------- -->
        <div class="box_1">
            <img src="/images/mypage/Frame.png" alt="이미지가 없습니다">
            <h2>With You</h2>

        </div>

        <div class="box_2">
            <a href="#홈">홈</a>
            <a href="#소개">소개</a>
            <a href="#커뮤니티">커뮤니티</a>
            <a href="#지도">지도</a>
            <a href="#랭킹">랭킹</a>
            <a href="#문의하기">문의하기</a>

        </div>
        <div class="box_3">
            <button>시작하기<img id="btn_img" src="/images/mypage/arrow.png" alt="" width="16"></button>
        </div>
    </div>
    <!-- -------------------------------- -->

    <div class="container_2">
        <h1>내 정보</h1>
        <hr class="hr_info">
    </div>

    <!-- -------------------------------- -->
    <div class="wrap">
        <h1>프로필 정보</h1>
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
                        <td>example</td>
                    </tr>
                    <tr>
                        <td align="right">비밀번호 : &nbsp;</td>
                        <td>example</td>
                    </tr>
                    <tr>
                        <td align="right">닉네임 : &nbsp;</td>
                        <td>example</td>
                    </tr>
                    <tr>
                        <td align="right">이메일 : &nbsp;</td>
                        <td>example</td>
                    </tr>
                    <tr>
                        <td align="right">탄생년도 : &nbsp;</td>
                        <td>example</td>
                    </tr>
                    <tr>
                        <td align="right">등급 : &nbsp;</td>
                        <td>example</td>
                    </tr>
                    <tr>
                        <td align="right">거주지 : &nbsp;</td>
                        <td>example</td>
                    </tr>
                    <tr>
                        <td align="right">사용자 평점 : &nbsp;</td>
                        <td>90점 / 100점 만점</td>
                    </tr>
                    <tr>
                        <td align="right">받은 평가 수 : &nbsp;</td>
                        <td>24개</td>
                    </tr>
                    <tr>
                        <td align="right">가입일 : &nbsp;</td>
                        <td>0000-00-00 or 0000년 00월 00일</td>
                    </tr>
                </table>
            </div>
            <!-- -------------------------------- -->
        </div>
        <!-- -------------------------------- -->

        <button>개인정보 수정하기</button>
    </div>


    <!-- -------------------------------- -->

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
                <td>example</td>
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

    <a id="edit" href="#">개인정보 수정하기</a>

</div>
</body>
</html>
