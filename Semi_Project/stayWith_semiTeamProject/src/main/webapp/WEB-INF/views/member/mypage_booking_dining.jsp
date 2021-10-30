<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BookingInfo</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
    <link rel = "stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/default.css">
    <link rel="stylesheet" href="css/booking.css">
    <link rel="stylesheet" href="css/header&footer.css">
    <script type="text/javascript" src="/js/bootstrap.bundle.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

</head>
<body>
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
                            <li><a href="/mypageWithdrawalFrm">탈퇴 요청<span >&gt;</span></a></li>
                        </ul>
                    </li>
                    <li>
                        <span>예약 정보</span>
                        <ul class="subnavi">
                            <li><a href="/mypageBookingRoomFrm?memberId=${m.memberId }&reqPage=1">객실<span>&gt;</span></a></li>
                            <li style="background-color: #d6c6a5;"><a href="/mypageBookingDiningFrm?memberId=${m.memberId }&reqPage=1">다이닝<span style="display: inline-block;">&gt;</span></a></li>
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
                        <h1 class="m_t">예약확인 - 다이닝</h1>
                    </div>
                    <div class="boardBox">
                        <table class="table table-hover">
                            <thead >
                                <tr  id="boardTop" style="text-align: center;">
                                    <th scope="col">예약번호</th>
                                    <th scope="col">레스토랑</th>
                                    <th scope="col">예약인원</th>
                                    <th scope="col">예약일</th>
                                    <th scope="col">예약시간</th>
                                    <th scope="col">상태</th>
                                    <th scope="col">후기 작성</th>
                                    <th scope="col">예약 수정</th>
                                    <th scope="col">예약 취소</th>
                                </tr>
                            </thead>
                            <tbody style="text-align: center;">
                            <c:if test="${empty bvd }">
                                <tr>
                                    <th scope="row" colspan="9" style="text-align: center;">자료가 없습니다.</th>
                                </tr>
                            </c:if>
                            <c:if test="${not empty bvd}">
                            	<c:forEach items="${dList }" var="bvd" varStatus="i">
	                            	<tr>
	                                    <th scope="row">${bvd.resNo }</th>
	                                    <td>${bvd.diningName }</td>
	                                    <td><a>${bvd.guestsACnt + bvd.guestsKCnt}</a><span>인</span></td>
	                                    <td>${bvd.resDate }</td>
	                                    <td>${bvd.resTime }</td>
	                                    <td>${bvd.resStatusStr }</td>
	                                    <td>
	                                    	<c:choose>
	                                    		<c:when test="${bvd.resStatus == 2 && empty bvd.reviewCheck}">
	                                    			<a id="btnP"><button type="button" class="btn btn-secondary" name="writeReview">후기작성</button></a>
	                                    			<input type="text" style="display:none" name="resNo1" value="${bvd.resNo }">
			                                    	<input type="text" style="display:none" name="diningNo1" value="${bvd.diningNo }">
			                                    	<input type="text" style="display:none" name="diningName1" value="${bvd.diningName }">
			                                    	<input type="text" style="display:none" name="resDate1" value="${bvd.resDate }">
	                                    		</c:when>
	                                    		<c:otherwise>
	                                    			<a id="btnP"><button type="button" class="btn btn-secondary disabled" name="writeReview">후기작성</button></a>
	                                    		</c:otherwise>
	                                    	</c:choose>
	                                    	
	                                    </td>
	                                    <td>
	                                    	<c:choose>
	                                    		<c:when test="${bvd.resStatus == 1 }">
	                                    			<a href="#" id="btnP"><button type="button" class="btn btn-secondary">예약수정</button></a>
	                                    		</c:when>
	                                    		<c:otherwise>
	                                    			<a href="#" id="btnP"><button type="button" class="btn btn-secondary disabled">예약수정</button></a>
	                                    		</c:otherwise>
	                                    	</c:choose>
	                                    </td>
	                                    <td>
	                                    	<c:choose>
	                                    		<c:when test="${bvd.resStatus == 1 }">
	                                    			<a href="#" id="btnP"><button type="button" class="btn btn-secondary">취소신청</button></a>
	                                    		</c:when>
	                                    		<c:otherwise>
	                                    			<a href="#" id="btnP"><button type="button" class="btn btn-secondary disabled">취소신청</button></a>
	                                    		</c:otherwise>
	                                    	</c:choose>
	                                    </td>
	                                </tr>
                            	</c:forEach>
                            </c:if>
                            </tbody>
                        </table>
                        <div id = "pageNavi">${pageNavi }</div>
                    </div>
                </div>
            </div>
            <div class="m_modal-wrap">
                <div class="m_modal">
                    <div class="m_modal-top">
                        <a>후기 작성</a>
                    </div>
                    <div class="m_modal-content">
                        <form action="/insertDiningReview" method="post">
                            <div class="starBox">
                                <a class="titleT">
                                    별점 등록
                                </a>
                                <div class="starRev">
                                    <span class="starR on">★</span>
                                    <span class="starR">★</span>
                                    <span class="starR">★</span>
                                    <span class="starR">★</span>
                                    <span class="starR">★</span>
                                </div>
                                <input type="text" style="display:none" name="countStar">
                                <input type="text" style="display:none" name="diningNo">
                                <input type="text" style="display:none" name="diningName">
                                <input type="text" style="display:none" name="resNo">
                                <input type="text" style="display:none" name="resDate">
                                <input type="text" style="display:none" name="memberId" value="${m.memberId }">
                            </div>
                            <div class="reviewBox">
                                <a class="titleT">
                                    후기 작성
                                </a>
                                <div>
                                    <sup id="byteChecker">(<span id="nowByte">0</span>/150bytes)</sup>
                                </div>
                                <div class="writeReview">
                                    <textarea rows="10" 
                                    class="form-control" 
                                    id="textArea_byteLimit" 
                                    name="textArea_byteLimit" 
                                    onkeyup="fn_checkByte(this)"></textarea>
                                </div>
                            </div>
                            <div class="adjustBtn">
                                <button type="button" id="closeModal" class="btn btn-secondary" style="float: left;">이전</button>
                                <button type="submit" class="btn btn-dark" style="float: right;" id="lastBtn">등록</button>
                            </div> 
                        </form>
                    </div>
                </div>
            </div>
        </div>
<script>
        $(function(){
            $(".s-main-menu li").mouseenter(function(){
                $(".main-content").css("margin-top","50px");
            });
            $(".s-main-menu li").mouseleave(function(){
                $(".main-content").css("margin-top","10px");
            });


            $("button[name=writeReview]").click(function(){
                $(".m_modal-wrap").css("display","flex");
                $("#pageNavi").css("display", "none");
                
                var diningNo = $(this).parent().nextAll("input[name=diningNo1]").val();
                $("input[name=diningNo]").val(diningNo);
                var diningName = $(this).parent().nextAll("input[name=diningName1]").val();
                $("input[name=diningName]").val(diningName);
                var resNo = $(this).parent().nextAll("input[name=resNo1]").val();
                $("input[name=resNo]").val(resNo);
                var resDate = $(this).parent().nextAll("input[name=resDate1]").val();
                $("input[name=resDate]").val(resDate);
                
            });
            $("#closeModal").click(function(){
                $(".m_modal-wrap").css("display","none");
            });

            $('.starRev span').mouseenter(function(){
                $(this).parent().children('span').removeClass('on');
                $(this).addClass('on').prevAll('span').addClass('on');
                return false;
            });
            
            var numStar;
            $("#lastBtn").mouseenter(function(){
            	numStar = $(".starR.on").length;            
            	console.log(numStar);
                $("input[name=countStar]").val(numStar);
                
            });

        });
        function fn_checkByte(obj){
            const maxByte = 150; //최대 100바이트
            const text_val = obj.value; //입력한 문자
            const text_len = text_val.length; //입력한 문자수
            
            let totalByte=0;
            for(let i=0; i<text_len; i++){
                const each_char = text_val.charAt(i);
                const uni_char = escape(each_char) //유니코드 형식으로 변환
                if(uni_char.length>4){
                    // 한글 : 2Byte
                    totalByte += 2;
                }else{
                    // 영문,숫자,특수문자 : 1Byte
                    totalByte += 1;
                }
            }
    
            if(totalByte>maxByte){
            alert('최대 150Byte까지만 입력가능합니다.');
            document.getElementById("nowByte").innerText = totalByte;
            document.getElementById("nowByte").style.color = "red";
            }else{
                document.getElementById("nowByte").innerText = totalByte;
                document.getElementById("nowByte").style.color = "green";
            }
        }

    </script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>