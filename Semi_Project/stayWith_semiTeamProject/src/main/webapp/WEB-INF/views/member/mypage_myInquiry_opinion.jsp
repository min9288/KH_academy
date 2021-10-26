<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My opinion</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
    <link rel = "stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/default.css">
    <link rel="stylesheet" href="css/myInquiry.css">
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
                            <li style="background-color: #d6c6a5;"><a href="/myInquiryFrm">문의 내역<span style="display: inline-block;">&gt;</span></a></li>
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
                <div class="inquiryBox">
                    <div class="headT">
                        <h1 class="m_t">문의 내역</h1>
                    </div>
                    <div class="boardBox">
                        <table class="table table-hover" id="tableStyle">
                            <thead>
                                <tr>
                                    <th class="clou">구분</th>
                                    <td class="ro1"></td>
                                    <th class="clou">의견 / 문의</th>
                                    <td class="ro1"></td>
                                </tr>
                                <tr>
                                    <th class="clou">이용하신 날짜</th>
                                    <td class="ro1"></td>
                                    <th class="clou">성명</th>
                                    <td class="ro1"></td>
                                </tr>
                                <tr>
                                    <th class="clou">휴대전화</th>
                                    <td class="ro1"></td>
                                    <th class="clou">자택전화</th>
                                    <td class="ro1"></td>
                                </tr>
                                <tr>
                                    <th class="clou">이메일</th>
                                    <td colspan="3" id="bTitle"></td>
                                </tr>
                                <tr>
                                    <th class="clou">제목</th>
                                    <td colspan="3" id="bTitle"></td>
                                </tr>
                                <tr>
                                    <th class="clou" colspan="4">의견내용</th>
                                </tr>
                                <tr>
                                    <td colspan="4" id="bContent"></td>
                                </tr>
                            </thead>    
                        </table>
                        <div class="btnArea">
                            <a href="#" id="btnP"><button type="button" class="btn btn-secondary">이전화면으로 돌아가기</button></a>
                        </div>
                        <table class="table table-hover" id="aStyle" style="margin-top: 20px;">
                            <thead>
                                <tr>
                                    <th style="display: none;"></th>
                                    <th class="aClou">
                                        <h3>관리자</h3>
                                        <h4>작성일</h4>
                                    </th>
                                    <td class="aRo"></td>
                                </tr>
                            </thead>    
                        </table>
                    </div>
                </div>
            </div>
        </div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>