<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="/css/room.css">
 	<!-- jQuery라이브러리 추가(2개) -->
	<script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
	<!-- 부트스트랩용 jQuery -->
	<script type="text/javascript" src="/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>
   .wrap{
      margin: 0 auto;
      width: 1100px;
    }
    .tabs{
      list-style-type: none;
      padding: 0;
      margin: 0 auto;
      overflow: hidden;      
    }
    .tab{
      width: 275px;
      height: 60px;
      float: left;
      text-align: center;
      line-height: 70px;
      border: 1px solid #d8d8d8;
      font-size: 16px;
      box-sizing: border-box;
    }
    .content{
      width:1100px;
      padding: 30px;
      border: 1px solid #d8d8d8;
      border-top: none;
      
    }
    
    .agreeContent{
      width : 98%;
      margin: 0 auto;
      border : 1px solid #1f1111;
      margin-top: 5px;     
    }
    .title{
      font-size: 25px;
    }
    .agreeContent li{
      color:#707070;
    }
    .agreebox{
      margin-bottom: 15px;
    }
    .nextBtn{
      width:180px;
      height: 50px;
      background-color: rgb(185, 169, 137);
      border: none;
      outline: none;
      cursor: pointer;
      color:#fff;
      font-size: 20px;      
    }
    .btnBox{
      text-align: center;
      padding-top: 20px;      
    }
    label{
      font-size: 20px;
    }
    .fcBlue{
      color:#1f4787;
    }


    #loginFrm {
      width: 50%;
      margin: 0 auto;
      margin-top: 100px;
      display: none;
    }


    .btnBox>input {
      margin-bottom: 15px;
    }
  </style>
  <script>

    //로드 완료 후 첫번째 탭을 선택
    window.onload=function(){
      selectTab(0);
    }    
    //다음버튼 1(약관동의 체크)
    function next1(){
      var agree1 = document.getElementById('privacyAgreement');
      var agree2 = document.getElementById('optionalAgreement');
      
      if(agree1.checked &&agree2.checked){        
        selectTab(1);        
      }else{
        alert("이용약관 동의를 체크해주세요");
      }
    }
    //다음버튼 2
    function next2(){               
        selectTab(2);
      }

    //다음버튼 3(회원가입 전 마지막 체크)
    function next3(){
      if(confirm("결제하시겠습니까?")){        
        selectTab(3);
      }
    }
    function next4(){        
          selectTab(3);
        
      }
    //상단 탭 전체 초기화
    function initTab(){
      var tabs = document.getElementsByClassName('tab');
      var content = document.getElementsByClassName("contentDetail");
      for(var i=0;i<tabs.length;i++){        
        tabs[i].style.border="1px solid #d8d8d8";
        tabs[i].style.lineHeight="70px";
        tabs[i].style.color="#282828";
        tabs[i].style.fontWeight="400";
        content[i].style.display="none";
      }
    }
    //진행중인 스텝의 탭 활성화 디자인
    function selectTab(idx){
      var tabs = document.getElementsByClassName('tab');
      var content = document.getElementsByClassName("contentDetail");
      initTab();
      tabs[idx].style.borderBottom="none";
      tabs[idx].style.color="#1f4787";
      tabs[idx].style.borderTop="10px solid rgb(185, 169, 137)";
      tabs[idx].style.lineHeight="50px";      
      tabs[idx].style.fontWeight="900";
      content[idx].style.display = "block";
    }
    //전체체크
    function allCheck(obj){
      var chks = document.getElementsByClassName("agreeCheck");
      var status = obj.checked;
      for(var i=0;i<chks.length;i++){
        chks[i].checked = status;
      }
    }

  </script> 
         <script>
            $(function(){
                $(".goPay").click(function(){
                    $("#payM").css("display","flex");
                    $(".body1").css("display","none");
                });
           
          
            //결제버튼 클릭시
          $("#payments").click(function(){
         	   var price = $("#troomPrice").html();
         	   var d =new Date(); //고유식별값을 가져오기 위한날짜 설정
         	   var date =d.getFullYear()+""+(d.getMonth()+1)+""+d.getDate()+""+d.getHours()+""+d.getMinutes()+""+d.getSeconds();
         	   console.log(date);
         	   console.log(price);
         	   IMP.init("imp97581762")
         	   IMP.request_pay({
         		   merchant_uid :"상품명_"+date, //거래아이디
         		   name :"결제테스트",
         		   amount:price,
         		   buyer_email:"kkhw9750@naver.com",
         		   buyer_name:"김효원",
         		   buyer_phone:"010-5046-9750",
         		   buyer_addr:"경기도 김포시 운양동",
         		   buyer_postcode:"10072"
         		   
         	   },function(rsp){
         		   if(rsp.success){
         			  $.ajax({
  						url : "/insertReserve",
  						type : "get",
  						data :
  						   {roomNo:$("[name=roomNo]").html(),
  							memberId:$("[name=memberId]").val(),
  							
  							memberKname:$("[name=memberKname]").val(),
  							RoomType:$("#roomType").val(),
  							RoomName:$("[name=roomName]").html(),
  							checkIn:$("#checkInP").html(),
  							checkOut:$("#checkOutP").html(),
  							RoomPrice:$("#troomPrice").html(),
  							
  							adult:$("[name=adult]").val(),
  							kid:$("[name=kid]").val()},
  							
  							
  						success : function (result) {
  							alert("결제가 완료되었습니다.");
  							next4();
  						
  						}
  					});
  					
  				}else{
  					alert("결제실패");
  					
         		   }
         	   });
         	   
            });
            });
         </script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<%@include file="/WEB-INF/views/common/header.jsp"%>
		<div class="margin"></div>
		<div class="body1">
			<h2 id="rTitle"><b>객실 정보 확인</b></h2>
			<br>
			<hr>
	
			<div class="ALLs">
		
				<div id="left">
					<p id="rInfo">예약정보</p>
					<div class="useRoom">
					<p id="ths">객실번호</p>
						<p name="roomNo">${rr.roomNo}</p>
						<p id="ths">체크인</p>
						<p id="checkIn" name="checkIn"><span id="checkInP">${rr.checkIn}</span>일</p>
						<p id="ths">체크아웃</p>
						<p id="checkOut" name="checkOut"><span id="checkOutP">${rr.checkOut}</span>일</p>
						<p id="ths">객실이름</p>
						<p id="roomName" name="roomName">${rr.roomName}</p>
						<p id="ths">투숙인원</p>
						<P id="adult"> 성인 ${rr.adult}명,소인 ${rr.kid}명</P>
						<input type="hidden" id="roomType" value="${rr.roomType}">
						<input type="hidden" name="adult" value="${rr.adult}">
						<input type="hidden" name="kid" value="${rr.kid}">
						<input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
						<input type="hidden" name="memberKname" value="${sessionScope.m.memberKname }">
					</div>
             
				</div>
				<div class="middlea"></div>
				<div id="right">
					<h4><b>요금상세</b></h4>
					<div id="col"></div>
					<p id="rr">객실 ${rr.roomNo} (성인${rr.adult}명/소인 ${rr.kid}명)</p>
					<p id="pay">${rr.roomPriceCal}원</p>
						<div id="col2"></div>
					<p id="rp">객실요금 ${rr.roomPrice}원</p>
					
					<p id="rt">부가가치세 및 봉사료 ${rr.roomPrice*10/100 }원 </p>
					<div id="payNotice">부가가치세 및 봉사료 10%가 포함된 금액입니다.</div>
				</div>
					<div id="but">
						<button id="prev" value="이전" >
						<a href="/reserveRFrm?roomNo=${rr.roomNo}">[이전]</a>
						</button>&emsp;&emsp;
						<span id="priceTotal" name="priceTotal"><b id="it">요금합계</b>&emsp; <span id="troomPrice">${rr.roomPriceCal}</span>원</span>&emsp;
						
						<button  id="next" value="다음"  class="goPay">
						[다음]
						</button>					
					</div>
			</div>
			</div>
			
	<div class="bodys"  id="payM" style="display: none;">

  
  <hr>
  <br><br>
  <div class="wrap">
    <ul class="tabs">
        <li class="tab">개인정보 수집</li>
        <li class="tab">취소 및 환불</li>
      <li class="tab">유의사항</li>
      <li class="tab">결제완료</li>
    </ul>
    <div class="content">
      <div class="contentDetail">
        <h3 class="title">필수적인 개인정보 수집.이용에 동의하십니까?</h3>
        <input type="checkbox" id="allAgreement" onclick="allCheck(this);">
        <label for="allAgreement">이용약관 전체체크</label>
        <br><br>
        <div class='agreebox'>
          <input type="checkbox" id="privacyAgreement" class="agreeCheck">
          <label for="privacyAgreement">개인정보의 수집 및 이용에 관한사항 <span class="fcBlue">(필수)</span></label>
          <div class="agreeContent">
            <ul>
               <p>스테이호텔 객실예약과 관련하여 귀사가 아래와 같이 본인의 개인정보를 수집 및 이용하는데 동의합니다.</p>
                <li> ① 수집 이용 항목 | 성명(국문·영문), 지역(여권기준), 이메일, 연락처(휴대전화·자택전화), 예약정보, 결제정보(카드종류, 카드번호, 유효기간)</li>
                <li> ② 수집 이용 목적 | 호텔 예약 및 고객 응대</li>
                <li>③ 보유 이용 기간 | 예약일 후 1년</li>
                <p>※위 사항에 대한 동의를 거부할 수 있으나, 이에 대한 동의가 없을 경우 예약 서비스 제공과 관련된 제반 절차 진행이 불가능 할 수 있음을 알려드립니다.</p>
            </ul>
          </div>
        </div>
        <br>
        <div class='agreebox'>
          <input type="checkbox" id="optionalAgreement"  class="agreeCheck">
          <label for="optionalAgreement">개인정보 제3자 제공에 대한 동의<span class="fcBlue">(필수)</span></label>
          <div class="agreeContent">
            <ul>
                <li> ① 제공받는 자 | (주)스테이호텔</li>
                    <li> ② 제공 목적 | 호텔 예약 및 고객 응대</li>
                     <li> ③ 제공하는 항목 | 성명(국문·영문), 지역(여권기준), 이메일, 연락처(휴대전화·자택전화), 예약정보, 결제정보(카드종류, 카드번호, 유효기간)</li>
                      <li> ④ 제공 기간 | 예약일 후 1년간</li>
                     <p>※위 사항에 대한 동의를 거부할 수 있으나, 이에 대한 동의가 없을 경우 신라 리워즈 회원가입 및 서비스 제공이 불가능함을 알려드립니다.</p> 
            </ul>
          </div>
        </div>
        <div class="btnBox">
          <button onclick="next1();" class="nextBtn">다음</button>
        </div>
      </div>
      <div class="contentDetail">
        <h3 class="title">취소 및 환불</h3>
        <div class='agreebox'>
            <input type="checkbox" id="privacyAgreement" class="agreeCheck">
            <label for="privacyAgreement">[취소/변경 및 노쇼(No-Show)안내] 확인<span class="fcBlue">(필수)</span></label>
            <div class="agreeContent">
              <ul>
                <li>숙박예정일 1일전 18시전까지는 위약금없이 취소 및 변경이 가능합니다.</li>
                <p> <숙박예정일 1일전 18시이후 취소/변경 및 노쇼 발생시></p>
                <li> 1.성수기(5월~10월,12월 24일~31일) :최초 1일 숙박요금의 80%가 위약금으로 부과됩니다.</li>
                <li>2.비수기(성수기외 기간) : 최초 1일 숙박요금의 10%가 위약금으로 부과됩니다.</li>
              </ul>
            </div>
          </div>
        <div class="btnBox">
          <button onclick="next2();" class="nextBtn">다음</button>
        </div>
      </div>
      <div class="contentDetail">
        <h3 class="title">유의사항</h3>
        <input type="checkbox" id="allAgreement" onclick="allCheck(this);">
        <label for="allAgreement">전체확인</label>
        <br><br>
        <div class='agreebox'>
          <input type="checkbox" id="privacyAgreement" class="agreeCheck">
          <label for="privacyAgreement">호텔이용안내</label>
          <div class="agreeContent">
            <ul>
               <li>요금에는 부가가치세 및 봉사료 10%가 부과됩니다.</li>
                <li>체크인 시간은 오후 2시이후,체크아웃은 오전11시까지 입니다.</li>
                <li>체크인시 등록카드 작성 및 투숙객 본인확인을 위해 본인사진이 포함된 신분증을 제시해주시기 바랍니다.</li>
                <li>기준인원을 초과하여 투숙시 추가인원에 대한 요금이 부과됩니다.
                    추가인원에 대한 요금은 성인 5만원,소인3만원(만18세까지)이며 객실타입에 따라 상이할 수 있습니다.
                </li>
                <li>자세한 객실관련안내는 객실예약과(02-9874-9999)에 문의바랍니다.
                </li>
            </ul>
          </div>
        </div>
        <br>
        <div class='agreebox'>
          <input type="checkbox" id="optionalAgreement"  class="agreeCheck">
          <label for="optionalAgreement">부대시설 이용안내</label>
          <div class="agreeContent">
            <ul>
                <li> 라이프스타일은 야외수영장,스파,피트니스는 사전예약이 가능합니다. </li>
                    <li> 실내수영장은 성인고객 전용 시설로,만13세미만고객은 성인보호자 동반 이용가능합니다</li>
                     <li>2021년 야외수영장 운영기간은 3/13일~11/14일 입니다</li>
                     <li>수영장내에서는 안전상의 이유로 다이빙은 금지되어 있습니다.</li>
                      <li> 호텔 부대시설은 감염병 예방법,재난 안전법등 관련 법령및 방역당국 등의 규제,조치사항 등에 따라 사전 고지 없이 이용제한 및 변경될수 있습니다.</li>
              
            </ul>
          </div>
        </div>
          
        <div class="btnBox">

        	     
        <button class="nextBtn1" id="payments" value="결제하기" >결제하기
        
        <%-- <a href="/insertReserve?roomNo=${rr.roomNo}&checkIn=${rr.checkIn}&checkOut=${rr.checkOut}&adult=${rr.adult}&kid=${rr.kid}">결제하기</a>--%>
        </button>
        </div>
   
      </div>
      <div class="contentDetail">
        <h3 class="title">결제가 완료되었습니다.</h3>            
        <button class="nextBtn" id="chkResv">예약내역확인하기</button>
      </div>
    </div>
  </div> 
		</div>

		<%@include file="/WEB-INF/views/common/footer.jsp"%>
		</div>
</body>
<script>
	$("#chkResv").click(function(){
		location.href="/mypageBookingRoomFrm?memberId="+$("[name=memberId]").val()+"&reqPage=1";
	});
</script>
</html>