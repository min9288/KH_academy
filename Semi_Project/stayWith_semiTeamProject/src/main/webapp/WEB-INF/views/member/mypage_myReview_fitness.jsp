<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Review</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
    <link rel = "stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/default.css">
    <link rel="stylesheet" href="css/header&footer.css">
    <link rel="stylesheet" href="css/myReview.css">
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

            $('.starRev span').mouseenter(function(){
                $(this).parent().children('span').removeClass('on');
                $(this).addClass('on').prevAll('span').addClass('on');
                return false;
            });

            $("button[name=updateReview]").click(function(){
                $(".m_modal-wrap").css("display","flex");
                var lfRNo = $(this).parent().prev("#lfRNo").val();
                $("input[name=lfRNo]").val(lfRNo);
                $("#pageNavi").css("display", "none");
            });
            
            $("#closeModal").click(function(){
                $(".m_modal-wrap").css("display","none");
            });
            
            var numStar;
            $("#lastBtn").mouseenter(function(){
            	numStar = $(".starR.on").length;            
            	console.log(numStar);
            	$("input[name=countStar]").val(numStar);
            });
            
            $("button[name=deleteBtn]").click(function(){
            	if(confirm("후기를 삭제하시면 복구가 불가능합니다.")){
            		var lfRNo = $(this).parent().prev("#lfRNo").val();
                	var memberId = $("#memberId").val();
                	$.ajax({
                		url:"/deleteLifeReview",
                		type : "post",
                		data : {lfRNo : lfRNo},
                		success : function(result){
                			if(result > 0){
                				alert("삭제 성공");
                				location.href="/mypageMyReviewFitnessFrm?memberId="+memberId+"&reqPage=1";
                			}else {
                				alert("삭제 실패");
                				location.href="/mypageMyReviewFitnessFrm?memberId="+memberId+"&reqPage=1";
                			}
                		}
                	});
            	}
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
                            <li><a href="/mypageBookingDiningFrm?memberId=${m.memberId }&reqPage=1">다이닝<span>&gt;</span></a></li>
                            <li><a href="/mypageBookingFitnessFrm?memberId=${m.memberId }&reqPage=1">피트니스<span>&gt;</span></a></li>
                        </ul>
                    </li>
                    <li>
                        <span>작성후기 관리</span>
                        <ul class="subnavi">
                            <li><a href="/mypageMyReviewRoomFrm?memberId=${m.memberId }&reqPage=1">객실<span>&gt;</span></a></li>
                            <li><a href="/mypageMyReviewDiningFrm?memberId=${m.memberId }&reqPage=1">다이닝<span>&gt;</span></a></li>
                            <li style="background-color: #d6c6a5;"><a href="/mypageMyReviewFitnessFrm?memberId=${m.memberId }&reqPage=1">피트니스<span style="display: inline-block;">&gt;</span></a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <div class="main-content">
                <div class="reviewBox">
                    <div class="headT">
                        <h1 class="m_t">후기 - 피트니스</h1>
                    </div>
                    <div class="boardBox">
                    <c:forEach items="${lfList }" var="lr">
                        <div class="reviewContentBox">
                            <div class="imageBox">
                                <img src="${lr.lifeImg }">
                                <br>
                                <a class="te1">${lr.lfName }</a>
                                <input type="text" style="display:none" id="memberId" value="${m.memberId}">
                                <br>
                                <a class="te2">이용일자 : <span>${lr.resDate }</span></a> 
                            </div>
                            <div class="reviewContent">
                                <div class="starRevtemp"> 
                                    <c:choose>
                                 		<c:when test="${lr.star == 1 }">
                                 			<span class="startemp">★</span>
                                 		</c:when>
                                 		<c:when test="${lr.star == 2 }">
                                 			<span class="startemp">★★</span>
                                 		</c:when>
                                 		<c:when test="${lr.star == 3 }">
                                 			<span class="startemp">★★★</span>
                                 		</c:when>
                                 		<c:when test="${lr.star == 4 }">
                                 			<span class="startemp">★★★★</span>
                                 		</c:when>
                                 		<c:when test="${lr.star == 5 }">
                                 			<span class="startemp">★★★★★</span>
                                 		</c:when>
                                 	</c:choose>
                                </div>
                                <div class="textare" style="margin-top: 20px;">
                                    <a class="reviewText">${lr.reviewContent}</a>
                                </div>
                                <div class="writeD" style="margin-top: 20px;"><a class="abD">작성일 : </a><span>${lr.reviewDate }</span></div>
                            </div>
                        </div>
                        <div class="btnArea">
                        	<input type="text" style="display:none" id="lfRNo" value="${lr.lfRNo }">
                            <a><button type="button" class="btn btn-secondary" name="updateReview">수정</button></a>
                            <input type="text" style="display:none" id="lfRNo" value="${lr.lfRNo }">
                            <a><button type="button" class="btn btn-secondary" name="deleteBtn">삭제</button></a>
                        </div>
                    </c:forEach>
                    <div id = "pageNavi">${pageNavi }</div>
                    </div>
                </div>
            </div>
            <div class="m_modal-wrap">
                <div class="m_modal">
                    <div class="m_modal-top">
                        <a>후기 수정</a>
                    </div>
                    <div class="m_modal-content">
                        <form action="updateLifeReview" method="post">
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
                                <input type="text" style="display:none" name="lfRNo">
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

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>