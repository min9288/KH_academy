<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Withdrawal</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
    <link rel = "stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/default.css">
    <link rel="stylesheet" href="css/withdrawal.css">
    <link rel="stylesheet" href="css/header&footer.css">
    <script type="text/javascript" src="/js/bootstrap.bundle.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

</head>
<body>
    <script>
        $(function(){
            $(".s-main-menu li").mouseenter(function(){
                $(".main-content").css("margin-top","50px");
            });
            $(".s-main-menu li").mouseleave(function(){
                $(".main-content").css("margin-top","10px");
            });


            // $(".subnavi li").mouseenter(function(){
            //     $(this).css("backgroundColor", "#d6c6a5" );
            //     $(this).find("span").css("display", "inline-block");
            // });
            // $(".subnavi li").mouseleave(function(){
            //     $(this).css("backgroundColor", "" );
            //     $(this).find("span").css("display", "none");
            // });

        });

    </script>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
        <div class="main">
            <div class="main-left-box">
                <h2>마이페이지</h2>
                <ul>
                    <li>
                        <span>내 정보</span>
                        <ul class="subnavi">
                            <li><a href="/myInfoFrm">내 정보 조회 및 수정<span>&gt;</span></a></li>
                            <li><a href="/myInquiryFrm?email=${m.email }&memberId=${m.memberId }&reqPage=1">문의 내역<span>&gt;</span></a></li>
                            <li style="background-color: #d6c6a5;"><a href="/mypageWithdrawalFrm">탈퇴 요청<span style="display: inline-block;">&gt;</span></a></li>
                        </ul>
                    </li>
                    <li>
                        <span>예약 정보</span>
                        <ul class="subnavi">
                            <li><a href="/mypageBookingRoomFrm?memberId=${m.memberId }&reqPage=1">객실<span>&gt;</span></a></li>
                            <li><a href="/mypageBookingDiningFrm?memberId=${m.memberId }&reqPage=1">다이닝<span>&gt;</span></a></li>
                            <li><a href="/mypageBookingFitnessFrm?memberId=${m.memberId }&reqPage=1">피트니스<span>&gt;</span></a></li>
                        </ul>
                    </li>
                    <li>
                        <span>작성후기 관리</span>
                        <ul class="subnavi">
                            <li><a href="/mypageMyReviewRoomFrm?memberId=${m.memberId }">객실<span>&gt;</span></a></li>
                            <li><a href="/mypageMyReviewDiningFrm?memberId=${m.memberId }">다이닝<span>&gt;</span></a></li>
                            <li><a href="/mypageMyReviewFitnessFrm?memberId=${m.memberId }">피트니스<span>&gt;</span></a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <div class="main-content">
                <div class="m_del_Box">
                    <div class="headT">
                        <h1 class="m_t">회원 탈퇴</h1>
                    </div>
                    <div class="delBox">
                        <div class="alert alert-dismissible alert-warning" style="background-color: #B9A989;">
                            <ul style="margin: 0;">
                                <li style="list-style: none;"><a id="mId" style="font-weight: 800;">회원아이디</a>님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인합니다.</li>
                            </ul>
                        </div>
                        <form action="/myPwCheck" method="post" name="myPwCheck">
                        	<div class="form-group">
	                            <label class="form-label mt-4" style="font-size: 20px; font-weight: 800;">비밀번호 입력</label>
	                            <input type="password" class="form-control" name="memberPw" placeholder="현재 사용 중인 비밀번호를 입력해주세요">
	                            <input style="display : none" name="memberNo" value="${sessionScope.m.memberNo}">
	                        </div>
		                    </div>
		                    <div class="btnArea">
		                        <a id="btnP"><button type="submit" class="btn btn-secondary">확인</button></a>
		                    </div>
                        </form>
                </div>
            </div>
        </div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>