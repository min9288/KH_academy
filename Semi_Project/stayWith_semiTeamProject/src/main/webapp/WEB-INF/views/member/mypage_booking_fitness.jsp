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

            $("button[name=writeReview]").click(function(){
                $(".m_modal-wrap").css("display","flex");
                /* $("#pageNavi").css("display", "none"); */
                $("textarea[name=textArea_byteLimit]").val("");
                $(".nowByte").html("0");
                
                var lfNo = $(this).parent().nextAll("input[name=lfNo1]").val();
                $("input[name=lfNo]").val(lfNo);
                var lfName = $(this).parent().nextAll("input[name=lfName1]").val();
                $("input[name=lfName]").val(lfName);
                var resNo = $(this).parent().nextAll("input[name=resNo1]").val();
                $("input[name=resNo]").val(resNo);
                var resDate = $(this).parent().nextAll("input[name=resDate1]").val();
                $("input[name=resDate]").val(resDate);
                var lfImg = $(this).parent().nextAll("input[name=lfImg1]").val();
                $("input[name=lfImg]").val(lfImg);
                
            });
            $("#closeModal").click(function(){
                $(".m_modal-wrap").css("display","none");
                /* $("#pageNavi").css("display", "block"); */
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
		
        var resultArr = [false];
        function fn_checkByte(obj){
            const maxByte = 150; 
            const text_val = obj.value; //????????? ??????
            const text_len = text_val.length; //????????? ?????????
            
            let totalByte=0;
            for(let i=0; i<text_len; i++){
                const each_char = text_val.charAt(i);
                const uni_char = escape(each_char) //???????????? ???????????? ??????
                if(uni_char.length>4){
                    // ?????? : 2Byte
                    totalByte += 2;
                }else{
                    // ??????,??????,???????????? : 1Byte
                    totalByte += 1;
                }
            }
    
            if(totalByte>maxByte){
	            alert('?????? 150Byte????????? ?????????????????????.');
	            document.getElementById("nowByte").innerText = totalByte;
	            document.getElementById("nowByte").style.color = "red";
	            resultArr[0] = false;
            }else if(totalByte<=maxByte){
                document.getElementById("nowByte").innerText = totalByte;
                document.getElementById("nowByte").style.color = "green";
                resultArr[0] = true;
            }else {
            	resultArr[0] = true;
            }
        }
        
        function checkValue(){

        	if($("#textArea_byteLimit").val() == ""){
                alert("????????? ???????????? ??????????????????, ?????? ??????????????????.");
                return false;
             }else if(!(resultArr[0])){
                 alert("???????????? ??????????????????!");
                 return false;
             }else {
            	 return true;
             }
        }

    </script>
    
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
        <div class="main">
            <div class="main-left-box">
                <h2>???????????????</h2>
                <ul>
                    <li>
                        <span>??? ??????</span>
                        <ul class="subnavi">
                            <li><a href="/myInfoFrm">??? ?????? ?????? ??? ??????<span>&gt;</span></a></li>
                            <li><a href="/myInquiryFrm?email=${m.email }&memberId=${m.memberId }&reqPage=1">?????? ??????<span>&gt;</span></a></li>
                            <li><a href="/mypageWithdrawalFrm">?????? ??????<span>&gt;</span></a></li>
                        </ul>
                    </li>
                    <li>
                        <span>?????? ??????</span>
                        <ul class="subnavi">
                            <li><a href="/mypageBookingRoomFrm?memberId=${m.memberId }&reqPage=1">??????<span>&gt;</span></a></li>
                            <li><a href="/mypageBookingDiningFrm?memberId=${m.memberId }&reqPage=1">?????????<span>&gt;</span></a></li>
                            <li style="background-color: #d6c6a5;"><a href="/mypageBookingFitnessFrm?memberId=${m.memberId }&reqPage=1">????????????<span style="display: inline-block;">&gt;</span></a></li>
                        </ul>
                    </li>
                    <li>
                        <span>???????????? ??????</span>
                        <ul class="subnavi">
                            <li><a href="/mypageMyReviewRoomFrm?memberId=${m.memberId }&reqPage=1">??????<span>&gt;</span></a></li>
                            <li><a href="/mypageMyReviewDiningFrm?memberId=${m.memberId }&reqPage=1">?????????<span>&gt;</span></a></li>
                            <li><a href="/mypageMyReviewFitnessFrm?memberId=${m.memberId }&reqPage=1">????????????<span>&gt;</span></a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <div class="main-content">
                <div class="inquiryBox">
                    <div class="headT">
                        <h1 class="m_t">???????????? - ????????????</h1>
                    </div>
                    <div class="boardBox">
                        <table class="table table-hover">
                            <thead >
                                <tr  id="boardTop" style="text-align: center;">
                                    <th scope="col">????????????</th>
                                    <th scope="col">???????????? ??????</th>
                                    <th scope="col">?????? ??????</th>
                                    <th scope="col">?????????</th>
                                    <th scope="col">????????????</th>
                                    <th scope="col">??????</th>
                                    <th scope="col">?????? ??????</th>
                                    <th scope="col">?????? ??????</th>
                                    <th scope="col">?????? ??????</th>
                                </tr>
                            </thead>
                            <tbody style="text-align: center;">
                            <c:if test="${empty bvl }">
                            	<tr>
                                    <th scope="row" colspan="9" style="text-align: center;">????????? ????????????.</th>
                                </tr>
                            </c:if>
                            <c:if test="${not empty bvl}">
                            	<c:forEach items="${lfList }" var="bvl" varStatus="i">
                            		<tr>
                                    <th scope="row">${bvl.resNo }</th>
                                    <td>${bvl.lfName }</td>
                                    <td><a>${bvl.resPeople }</a><span>???</span></td>
                                    <td>${bvl.resDate }</td>
                                    <td>${bvl.resTime }</td>
                                    <td>${bvl.statusStr }</td>
                                    <td>
                                    	<c:choose>
                                    		<c:when test="${bvl.status == 2 && empty bvd.reviewCheck}">
                                    			<a id="btnP"><button type="button" class="btn btn-secondary" name="writeReview">????????????</button></a>
                                    			<input type="text" style="display:none" name="resNo1" value="${bvl.resNo }">
			                                    <input type="text" style="display:none" name="lfNo1" value="${bvl.lfNo }">
			                                    <input type="text" style="display:none" name="lfName1" value="${bvl.lfName }">
			                                    <input type="text" style="display:none" name="resDate1" value="${bvl.resDate }">
			                                    <input type="text" style="display:none" name="lfImg1" value="${bvl.lfImg }">
                                    		</c:when>
                                    		<c:otherwise>
                                    			<a id="btnP"><button type="button" class="btn btn-secondary disabled" name="writeReview" id="btnP">????????????</button></a>
                                    		</c:otherwise>
                                    	</c:choose>
                                    </td>
                                    <td>
	                                    <c:choose>
	                                    	<c:when test="${bvl.status == 1 }">
	                                    		<a href="#" id="btnP"><button type="button" class="btn btn-secondary">????????????</button></a>
	                                    	</c:when>
	                                    	<c:otherwise>
	                                    		<a id="btnP"><button type="button" class="btn btn-secondary disabled" id="btnP">????????????</button></a>
	                                    	</c:otherwise>
	                                    </c:choose>
                                    </td>
                                    <td>
	                                    <c:choose>
	                                    	<c:when test="${bvl.status == 1 }">
	                                    		<a href="#" id="btnP"><button type="button" class="btn btn-secondary">????????????</button></a>
	                                    	</c:when>
	                                    	<c:otherwise>
	                                    		<a id="btnP"><button type="button" class="btn btn-secondary disabled" id="btnP">????????????</button></a>
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
                        <a>?????? ??????</a>
                    </div>
                    <div class="m_modal-content">
                        <form action="/insertLifeReview" method="post" onsubmit="return checkValue();">
                            <div class="starBox">
                                <a class="titleT">
                                    ?????? ??????
                                </a>
                                <div class="starRev">
                                    <span class="starR on">???</span>
                                    <span class="starR">???</span>
                                    <span class="starR">???</span>
                                    <span class="starR">???</span>
                                    <span class="starR">???</span>
                                </div>
                                <input type="text" style="display:none" name="countStar">
                                <input type="text" style="display:none" name="lfNo">
                                <input type="text" style="display:none" name="lfName">
                                <input type="text" style="display:none" name="resNo">
                                <input type="text" style="display:none" name="resDate">
                                <input type="text" style="display:none" name="lfImg">
                                <input type="text" style="display:none" name="memberId" value="${m.memberId }">
                            </div>
                            <div class="reviewBox">
                                <a class="titleT">
                                    ?????? ??????
                                </a>
                                <div>
                                    <sup id="byteChecker">(<span id="nowByte" class="nowByte">0</span>/150bytes)</sup>
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
                                <button type="button" id="closeModal" class="btn btn-secondary" style="float: left;">??????</button>
                                <button type="submit" class="btn btn-dark" style="float: right;" id="lastBtn">??????</button>
                            </div> 
                        </form>
                    </div>
                </div>
            </div>
        </div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>