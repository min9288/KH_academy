<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My info</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
    <link rel = "stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/default.css">
    <link rel="stylesheet" href="css/mypage_viewInfo.css">
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
                            <li style="background-color: #d6c6a5;"><a href="/myInfoFrm">내 정보 조회 및 수정<span style="display: inline-block;">&gt;</span></a></li>
                            <li><a href="/myInquiryFrm">문의 내역<span>&gt;</span></a></li>
                            <li><a href="/mypageWithdrawalFrm">탈퇴 요청<span >&gt;</span></a></li>
                        </ul>
                    </li>
                    <li>
                        <span>예약 정보</span>
                        <ul class="subnavi">
                            <li><a href="/mypageBookingRoomFrm">객실<span>&gt;</span></a></li>
                            <li><a href="/mypageBookingDiningFrm">다이닝<span>&gt;</span></a></li>
                            <li><a href="/mypageBookingFitnessFrm">피트니스<span>&gt;</span></a></li>
                        </ul>
                    </li>
                    <li>
                        <span>작성후기 관리</span>
                        <ul class="subnavi">
                            <li><a href="/mypageMyReviewRoomFrm">객실<span>&gt;</span></a></li>
                            <li><a href="/mypageMyReviewDiningFrm">다이닝<span>&gt;</span></a></li>
                            <li><a href="/mypageMyReviewFitnessFrm">피트니스<span>&gt;</span></a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <div class="main-content">
                <div class="infoBox" id="infoBox">
                    <div class="headT">
                        <h1 class="m_t">내 정보 조회 및 수정</h1>
                    </div>
                    <div class="subBox">
                        <div class="d-flex" id="topBox">
                            <div id="leftMainText">
                                <a id="mId">회원아이디</a><a class="others">님은</a>
                                <br>
                                <a id="mlevel">등급</a><a class="others">회원입니다.</a>
                            </div>
                            <div id="pointView">
                                <div id="textar">
                                    <a id="pointText">포인트</a> <strong id="realPoint">0 P</strong>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="line"></div>
                    <div class="subBox">
                        <label class="col-form-label col-form-label-lg mt-4" for="inputLarge">아이디</label>
                        <div class="form-group">
                            <fieldset>
                                <input class="form-control" id="readOnlyInput" type="text" readonly style="width:400px;">
                            </fieldset>
                        </div>
                    </div>
                    <div class="line"></div>
                    <div class="subBox">
                        <label class="col-form-label col-form-label-lg mt-4" for="inputLarge">비밀번호</label>
                        <br><br>
                        <button type="button" class="btn btn-secondary" style="margin-left: 50px; width: 150px; height: 50px;">비밀번호 변경</button>
                    </div>
                    <div class="line"></div>
                    <div class="subBox">
                        <label class="col-form-label col-form-label-lg mt-4" for="inputLarge">이메일</label>
                        <div class="d-flex">
                            <input type="text" class="form-control" style="width: 400px;">
                            <button class="btn btn-secondary my-3 my-sm-0" type="button" style="margin-left: 10px;">중복확인</button>
                            <button class="btn btn-secondary my-3 my-sm-0" type="button" style="margin-left: 10px;">인증번호 요청</button>
                        </div>
                        <div class="d-flex" id="twoLine">
                            <input type="text" class="form-control" style="width: 400px;">
                            <button class="btn btn-secondary my-3 my-sm-0" type="button" style="margin-left: 10px;">인증번호 확인</button>
                        </div>
                    </div>
                    <div class="line"></div>
                    <div class="subBox">
                        <label class="col-form-label col-form-label-lg mt-4" for="inputLarge">영문이름</label>
                        <div class="d-flex">
                            <input type="text" class="form-control" style="width: 400px;" readonly>
                            <input type="text" class="form-control" style="width: 400px;  margin-left: 10px;" readonly>
                        </div>
                    </div>
                    <div class="line"></div>
                    <div class="subBox">
                        <label class="col-form-label col-form-label-lg mt-4" for="inputLarge">한글이름</label>
                        <div class="form-group">
                            <fieldset>
                                <input class="form-control" id="readOnlyInput" type="text" style="width:400px;" readonly >
                            </fieldset>
                        </div>
                    </div>
                    <div class="line"></div>
                    <div class="subBox">
                        <label class="col-form-label col-form-label-lg mt-4" for="inputLarge">생년월일</label>
                        <div class="form-group">
                            <fieldset>
                                <input class="form-control" id="readOnlyInput" type="text" style="width:400px;" readonly >
                            </fieldset>
                        </div>
                    </div>
                    <div class="line"></div>
                    <div class="subBox">
                        <label class="col-form-label col-form-label-lg mt-4" for="inputLarge">연락처</label>
                        <div class="d-flex" id="twoLine">
                            <input type="text" class="form-control" style="width: 400px;">
                            <button class="btn btn-secondary my-3 my-sm-0" type="button" style="margin-left: 10px;">중복 확인</button>
                        </div>
                    </div>
                    <div class="line"></div>
                    <div class="btnArea">
                        <a href="#"><button type="button" class="btn btn-secondary">수정</button></a>
                    </div>
                </div>
            </div>
        </div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>