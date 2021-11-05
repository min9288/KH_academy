<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>스테이위드</title>
	<!-- Calendar API 추가 -->
	<link href='/resources/calendar/packages/core/main.css' rel='stylesheet'>
	<link href='/resources/calendar/packages/daygrid/main.css' rel='stylesheet'>
	<!-- Calendar API js 추가 -->	
	<script src='/resources/calendar/packages/core/main.js'></script>
	<script src='/resources/calendar/packages/interaction/main.js'></script>
	<script src='/resources/calendar/packages/daygrid/main.js'></script>
	<style>
	#checkin {animation: motion 0.3s linear 0s infinite alternate; margin-top: 0;}
    #checkout {animation: motion 0.3s linear 0s infinite alternate; margin-top: 0;}
        
	@keyframes motion {
		0% {margin-top: 0px;}
		100% {margin-top: 5px;}
	}
	</style>
</head>
<body>
	<%@include file ="/WEB-INF/views/common/header.jsp" %>
	   <div class="main-content" style="margin-top:10px;">
            <div class="slideshow-container1" >

                <div class="slides fade" >
                  <img src="/img/main-top-slide1.jpg" style="width: 100%;" >
                </div>
                <div class="slides fade">
                  <img src="/img/main-top-slide2.jpg" style="width: 100%;" >
                </div>
                <div class="slides fade">
                  <img src="/img/main-top-slide3.jpg"  style="width: 100%;">
                </div>
                </div>
                <br>
                <div style="text-align:center">
                  <span class="dot"></span> 
                  <span class="dot"></span> 
                  <span class="dot"></span> 
                </div>
               
            <div class="main-roomres">
            <div class="cal-modal1">
            	<div id="cal-wrap1">
            		<div id="calendar1"></div>
            	</div>
            </div>
             <div class="cal-modal2">
            	<div id="cal-wrap2">
            		<div id="calendar2"></div>
            	</div>
            </div>
             <form action="/mainRoomRes" method="post">
                <div class="htCheck">
                	<dl>
                        <dt><img src="/img/main-searchhotel1.png" id="checkin" style="cursor:pointer;"></dt>
                        <dd><a href="#"><input type="text" name="checkin" class="nows1" readonly></a></dd>
                    </dl>
                    <dl>
                        <dt style="margin-bottom:3px;"><img src="/img/main-ico-night.png" ></dt>
                        <dd><a href="#"><input type="text" name="" class="night" readonly></a></dd>
                    </dl>
                    <dl>
                        <dt><img src="/img/main-searchhotel2.png"id="checkout" style="cursor:pointer;"></dt> 
                        <dd><a href="#" ><input type="text" name="checkout" class="nows2" readonly></a></dd>
                    </dl>
                    <dl>
                        <dt><img src="/img/main-searchhotel3.png"></dt>
                        <dd><a href="#">1</a></dd>
                    </dl>
                    <dl class="htCheck-btn1">
                        <dt><img src="/img/main-searchhotel4.png"></dt>
                        <dd><a href="#">
                        <button type="button" style="cursor:pointer;">-</button><span class="amount">1</span><button type="button" style="cursor:pointer;">+</button>
                        <input type="hidden" name="adult" class="adult"></a></dd>
                    </dl>
                    <dl class="htCheck-btn2">
                        <dt><img src="/img/main-searchhotel5.png"></dt>
                        <dd><a href="#">
                        <button type="button" style="cursor:pointer;">-</button><span class="amount">0</span><button type="button" style="cursor:pointer;">+</button>
                        <input type="hidden" name="kid" class="kid"></a></dd>
                    </dl>
                    <div class="htCheck-submit">
                      	<button type="submit"><img src="/img/main-btn-search.gif"></button>             
                    </div>
                </div>
            </div>
            </form>
            <div class="dining">
                <p>새로워진 온라인 예약으로 빠르고 간편하게 예약 및 조회해보세요.</p>
                <p><a href="/diningResvFrm">다이닝 예약 바로가기 &nbsp;&nbsp; &gt;</a></p>
            </div>
            <div class="main-room-pakage">
                <h2 class="h2-2">객실 패키지</h2>
                <div class="slideshow-container2">
                    <div class="slides2 fade">
                      <img src="/img/main_sub_img1.jpg" >
                      <img src="/img/main_sub_img2.jpg" >
                      <img src="/img/main_sub_img3.jpg" >
                    </div>
                    <div class="slides2 fade">
                      <img src="/img/main_sub_img1_1.jpg">
                      <img src="/img/main_sub_img2_1.jpg">
                      <img src="/img/main_sub_img3_1.jpg">
                    </div>
                    <a class="prev" onclick="plusSlides(-1);">&#10094;</a>
                    <a class="next" onclick="plusSlides(1);">&#10095;</a>
                    </div>
                    <br>
                    <div style="text-align:center">
                      <span class="dot2" onclick="currentSlide(1);"></span> 
                      <span class="dot2" onclick="currentSlide(2);"></span> 
                    </div>
            </div>
            <div class="main-event">
                <h2 class="h2-2">이벤트</h2>
                <div class="main-event-img">
                    <img src="/img/main_sub_img4.jpg">
                    <img src="/img/main_sub_img5.jpg">
                    <img src="/img/main_sub_img6.jpg">
                </div>
            </div>
            <div style="display:flex; justify-content: center;">
            <div class="main-membership">
                <div class="membership-left">
                    <p style="font-family: 'ct'; font-size: 35px; margin-top: 0;">Stay With Membership</p>
                    <p style=" color: rgb(159, 148, 123); font-size: 18px; font-weight: bold;">다양한 경험과 특별한 혜택을 제공하는 Stay With 멤버십!</p>
                    <p>멤버십 혜택을 통해 객실 및 레스토랑 등을 합리적으로 이용하실 수 있습니다.</p>
                    <hr>
                    <ul>
                        <li>무료 바우처 제공 : 스테이위드호텔 무료 숙박권 1매/ 스테이위드호텔 레스토랑 이용권 1매 </li>
                        <li>할인 혜택 : 레스토랑 3인 ~ 7인 이용 시 1인 무료(식료), 8인~19인 이용 시 2인 무료(식료)<br>객실 홈페이지 요금의 10% 할인 / 객실 패키지 5~10% 할인</li>
                    </ul>
                    <hr>
                    <p>* 연회비 : 600,000(세금 포함) &nbsp;&nbsp; &nbsp;&nbsp; * 이용기간 : 가입 후 1년 &nbsp;&nbsp; &nbsp;&nbsp; * 가입문의 : 0000-0000</p>
                    <button type="button" class="ms-btn" onclick="membership();">자세히 보기</button>
                </div>
                <div class="membership-right">
                    <img src="/img/main_membership_card.jpg">
                </div>
            </div>
    	 	</div>
            <div class="main-gallery">
                <h2 class="h2-2" style="text-align: center;">갤러리</h2>
                <div>
                    <iframe src="https://www.youtube.com/embed/U8FnMJXVN2c?rel=0&showinfo=0" width="500"height="280" frameborder="0"></iframe>
                    <iframe src="https://www.youtube.com/embed/IVNbjTIc9WA?rel=0&showinfo=0" width="500"height="280" frameborder="0"></iframe>
                </div>


            </div>
        </div>
 	

        <script>
        $(".htCheck-btn1 button").click(function(){
  			var currAmount = Number($(".amount").eq(0).html());
  			if($(this).html() == "+"){
  				$(".amount").eq(0).html(++currAmount);
  				if($(".amount").eq(0).html()>6){
						$(".amount").eq(0).html(6);
					}
  			}else{
  				if(currAmount  != 1){
  					$(".amount").eq(0).html(--currAmount);
  					
  				}		
  			}
  			$(".adult").val(currAmount);
  		});
      	$(".htCheck-btn2 button").click(function(){
  			var currAmount = Number($(".amount").eq(1).html());
  			if($(this).html() == "+"){
  				$(".amount").eq(1).html(++currAmount);
  				if($(".amount").eq(1).html()>6){
						$(".amount").eq(1).html(6);
					}
  			}else{
  				if(currAmount  != 0){
  					$(".amount").eq(1).html(--currAmount);
  					
  				}		
  			}
  			$(".kid").val(currAmount);
  		});
        $(function() {
        	var adult = $(".amount").eq(0).html();
        	var kid = $(".amount").eq(1).html();
        	  $(".adult").val(adult);
        	  $(".kid").val(kid);
        	
        	
        	  $("#checkin").click(function(){
                  $(".cal-modal1").css("display","flex");
               
                var calendarEl = document.getElementById('calendar1');
              	var d = new Date();    
              	var year = d.getFullYear();
              	var month = (d.getMonth() + 1);
              	if(month < 10){
              		month = "0"+month;
              	}
              	var day = d.getDate();
              	if(day < 10){
              	    day = "0"+day;
              	}  
              	//yyyy-mm-dd
              	calendar = new FullCalendar.Calendar(calendarEl, {
              		plugins: [ 'interaction', 'dayGrid' ],
              		defaultDate: year+"-"+month+"-"+day,
              		editable: true,
              		eventLimit: true,
              		dateClick : function(data){
              			console.log(data);
       				 console.log(!$(data.dayEl).hasClass('fc-past'));
              			 if (!$(data.dayEl).hasClass('fc-past')){
              				 $(".nows1").val(data.dateStr);
              				 if( $(".nows1").val() > $(".nows2").val() &&  !($(".nows2").val() === "") ){
              						$(".nows2").val("");	
              					 	$(".cal-modal1").css("display","none");
          							$("#calendar1").empty();
          							 return; 
              				 }else{
              						$(".cal-modal1").css("display","none");
              						$("#calendar1").empty();
              						 return;
              				 } 
              			  }else{
              			    	alert("오늘 날짜 이후부터 선택해주세요!");
              			    	$(".nows1").val(); 
              			    	
              			  }
              			 
              			 return;
              		}
              	});
              	
                  calendar.render();                  
        	  });
        	 
              $("#checkout").click(function(){
              	$(".cal-modal2").css("display","flex");
              
              	var calendarE2 = document.getElementById('calendar2');
        		var d = new Date();    
        		var year = d.getFullYear();
        		var month = (d.getMonth() + 1);
        		if(month < 10){
        			month = "0"+month;
        		}
        		var day = d.getDate();
        		if(day < 10){
        		    day = "0"+day;
        		}  

        		//yyyy-mm-dd
        		calendar = new FullCalendar.Calendar(calendarE2, {
        			plugins: [ 'interaction', 'dayGrid' ],
        			defaultDate: year+"-"+month+"-"+day,
        			editable: true,
        			eventLimit: true,
        			dateClick : function(data){
        				console.log(data);
        				 if (!$(data.dayEl).hasClass('fc-past')){

        					 $(".nows2").val(data.dateStr);
        					 
        					 if($(".nows2").val()<$(".nows1").val()){
        						 alert("체크아웃 날짜를 다시 선택해주세요!");
        						 
        					 }else{
        						 $(".cal-modal2").css("display","none");
        						 $("#calendar2").empty();
        						 return;
        					 }
        					
        			     }else{
        				    	alert("오늘 날짜 이후부터 선택해주세요!");
        				    	$(".nows2").val(); 	
        				 }
        				 return;	 
        			}
        		});
        		
        	    calendar.render();
        	    
              });
             
        });
        </script>
        <script>
        $(function() {
            var slideIndex = 0;
            showSlides();

           
            function showSlides() {
                var i;
                var slides = document.getElementsByClassName("slides");
                var dots = document.getElementsByClassName("dot");
                for (i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";  
                }
                slideIndex++;
                if (slideIndex > slides.length) {slideIndex = 1}    
                for (i = 0; i < dots.length; i++) {
                    dots[i].className = dots[i].className.replace(" active", "");
                }
                slides[slideIndex-1].style.display ="block";  
                dots[slideIndex-1].className += " active";
                setTimeout(showSlides, 2000); 
            }
        });
       		 var slideIndex2 = 1;
       		 showSlides2(slideIndex2);

            function plusSlides(n) {
            showSlides2(slideIndex2 += n);
            }
            
            function currentSlide(n) {
            showSlides2(slideIndex2 = n);
            }

            function showSlides2(n) {
            var i;
            var slides = document.getElementsByClassName("slides2");
            var dots = document.getElementsByClassName("dot2");
            if (n > slides.length) {slideIndex2 = 1}    
            if (n < 1) {slideIndex2 = slides.length}
            for (i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";  
            }
            for (i = 0; i < dots.length; i++) {
                dots[i].className = dots[i].className.replace(" active", "");
            }
            slides[slideIndex2 -1].style.display="block";
            dots[slideIndex2 -1].className += " active";  
            }
    
            function membership(){
            	location.href="/membership";
            }
        </script>
        
	<%@include file ="/WEB-INF/views/common/footer.jsp" %>
</body>
	<link rel="stylesheet" href="/css/main.css">
</html>