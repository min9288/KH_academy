<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My inquiry</title>
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
                            <li style="background-color: #d6c6a5;"><a href="/myInquiryFrm?email=${m.email }&memberId=${m.memberId }&reqPage=1">문의 내역<span style="display: inline-block;">&gt;</span></a></li>
                            <li><a href="/mypageWithdrawalFrm">탈퇴 요청<span >&gt;</span></a></li>
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
                            <li><a href="/mypageMyReviewRoomFrm?memberId=${m.memberId }&reqPage=1">객실<span>&gt;</span></a></li>
                            <li><a href="/mypageMyReviewDiningFrm?memberId=${m.memberId }&reqPage=1">다이닝<span>&gt;</span></a></li>
                            <li><a href="/mypageMyReviewFitnessFrm?memberId=${m.memberId }&reqPage=1">피트니스<span>&gt;</span></a></li>
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
                                    <td class="ro1">${iv.qCategory}</td>
                                    <th class="clou">의견 / 문의</th>
                                    <td class="ro1">${iv.qType}</td>
                                </tr>
                                <tr>
                                    <th class="clou">관련문의</th>
                                    <td class="ro1">${iv.qAbout}</td>
                                    <th class="clou">예약번호</th>
                                    <td class="ro1">${iv.resNo}</td>
                                </tr>
                                <tr>
                                    <th class="clou">성명</th>
                                    <td class="ro1">${iv.qName}</td>
                                    <th class="clou">이메일</th>
                                    <td class="ro1">${iv.email}</td>
                                </tr>
                                <tr>
                                    <th class="clou">휴대전화</th>
                                    <td class="ro1">${iv.phone}</td>
                                    <th class="clou">자택전화</th>
                                    <td class="ro1">${iv.home}</td>
                                </tr>
                                <tr>
                                    <th class="clou">제목</th>
                                    <td colspan="3" id="bTitle">${iv.qTitle}</td>
                                </tr>
                                <tr>
                                    <th class="clou" colspan="4">문의내용</th>
                                </tr>
                                <tr>
                                    <td colspan="4" id="bContent">${iv.qContent}</td>
                                </tr>
                            </thead>    
                        </table>
                        <div class="btnArea">
                            <a href="/myInquiryFrm?email=${m.email }&reqPage=1" id="btnP"><button type="button" class="btn btn-secondary">이전화면으로 돌아가기</button></a>
                        </div>
                        <c:if test="${iv.aCount ne 0}">
	                        <table class="table table-hover" id="aStyle" style="margin-top: 20px;">
	                            <thead>
	                                <tr>
	                                    <th style="display: none;"></th>
	                                    <th class="aClou">
	                                        <h3>관리자</h3>
	                                        <h4>${ia.aDate}</h4>
	                                    </th>
	                                    <td class="aRo">${ia.aContent}</td>
	                                </tr>
	                            </thead>    
	                        </table>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>