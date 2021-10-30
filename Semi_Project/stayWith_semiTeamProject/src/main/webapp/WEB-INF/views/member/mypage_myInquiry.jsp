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
                        <table class="table table-hover">
                            <thead>
                                <tr id="boardTop" style="text-align: center;">
                                    <th scope="col">No</th>
                                    <th scope="col">구분</th>
                                    <th scope="col">관련문의</th>
                                    <th scope="col">의견 / 문의</th>
                                    <th scope="col">제목</th>
                                    <th scope="col">작성일자</th>
                                    <th scope="col">답변여부</th>
                                </tr>
                            </thead>
                            <tbody style="text-align: center;">
                            <c:if test="${empty iv}">
                                <tr>
                                    <th scope="row" colspan="7" style="text-align: center;">자료가 없습니다.</th>
                                </tr>
                            </c:if>
                            <c:if test="${not empty iv}">
                            	<c:forEach items="${list }" var="v" varStatus="i">
                            			<tr onclick="location.href='/inquiryDetail?qType=${v.qType}&qNo=${v.qNo}'">
		                                    <th scope="row">${start + i.index }</th>
		                                    <td>${v.qCategory }</td>
		                                    <td>${v.qAbout }</td>
		                                    <td>${v.qType }</td>
		                                    <td>${v.qTitle}</td>
		                                    <td>${v.usedDate}</td>
		                                    <c:choose>
		                                    	<c:when test="${v.aCount == 0}">
			                                    		<td>답변 대기</td>
			                                    </c:when>
			                                    <c:otherwise>
			                                    		<td>답변 완료</td>
			                                    </c:otherwise>
		                                    </c:choose>
		                                    <%-- <td>
			                                    <c:choose>
			                                    	<c:when test="${v.aCount == 0}">
			                                    		답변 대기
			                                    	</c:when>
			                                    	<c:otherwise>
			                                    		답변 완료
			                                    	</c:otherwise>
			                                    </c:choose>
		                                    </td> --%>
		                                </tr>
                            	</c:forEach>
                            </c:if>
                            </tbody>
                        </table>
                        <div id = "pageNavi">${pageNavi }</div>
                    </div>
                </div>
            </div>
        </div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>