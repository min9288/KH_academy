<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>

<html>
<head>
<link rel="stylesheet" href="/css/room.css">
      <!-- jQuery라이브러리 추가(2개) -->
   <script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
   <!-- 부트스트랩용 jQuery -->
   <script type="text/javascript" src="/js/bootstrap.bundle.min.js"></script>
   <script>
   $(function(){
	    
	    $.ajax({
	       url : "/allRoom",
	       type : "get",
	       success : function(data) {
	          var subnavi = $("ul.subnavi");
	          var roomNo = $(".dmain-content>h2:first").html();
	          for(var i=0;i<data.length;i++){
	             if(data[i].RoomType=='스탠다드'){
	            	 if(data[i].RoomNo == roomNo){
	            		 subnavi.eq(0).append('<li><a href="/detailRoom?roomNo='+data[i].RoomNo+'" class="active">'+data[i].RoomName+'<span>&gt;</span></a></li>'); 
	            	 }else{
		                subnavi.eq(0).append('<li><a href="/detailRoom?roomNo='+data[i].RoomNo+'">'+data[i].RoomName+'<span>&gt;</span></a></li>');	            		 
	            	 }
	             }
	             else if(data[i].RoomType=='이그제큐티브'){
	            	 if(data[i].RoomNo == roomNo){
	            		 subnavi.eq(1).append('<li><a href="/detailRoom?roomNo='+data[i].RoomNo+'" class="active">'+data[i].RoomName+'<span>&gt;</span></a></li>'); 
	            	 }else{
	            		 subnavi.eq(1).append('<li><a href="/detailRoom?roomNo='+data[i].RoomNo+'">'+data[i].RoomName+'<span>&gt;</span></a></li>');	            		 
	            	 }
	                
	             }
	             else if(data[i].RoomType=='스위트'){
	            	 if(data[i].RoomNo == roomNo){
	            		 subnavi.eq(2).append('<li><a href="/detailRoom?roomNo='+data[i].RoomNo+'" class="active">'+data[i].RoomName+'<span>&gt;</span></a></li>'); 
	            	 }else{
	            		 subnavi.eq(2).append('<li><a href="/detailRoom?roomNo='+data[i].RoomNo+'">'+data[i].RoomName+'<span>&gt;</span></a></li>');	            		 
	            	 }
	                
	             }
	          }
	          $(".active").css("background-color","#d6c6a5");
	  			$(".active>span").show();
	          
	       }
	 
	    });
	       
	  });
   </script>
<style>
#amanity-modal{
    padding-bottom: 20px;
    background-color:#FFFFFF;
    position:absolute;
    min-width: 655px;
    border: 1px solid black;
}
.amanity-wrap{
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0,0,0,0.5);
    display: flex;
    align-items: center;
    justify-content: center;
    z-index:10000;
}
.hrm-btn-wrap{
    width: 100%;
    display: flex;
    justify-content: center;
}
#amanity-close{
    background-color: transparent;
    border: none;
}

#amanity-modal h3{
    padding-left: 30px;
    margin: 0;
    padding-bottom: 20px;
    padding-top: 20px;
 background-color: #f7f7f7;
}
#amanity-modal h3>button{
   text-align: right;
 background-color: #f7f7f7;
}

.rAmanity{
width:100px;
height:150px;
}
.amanty{
  background-color:darkseagreen;
  height:30px;

}
  .reviewCli{
       width:800px;
       height: 100px;
       background-color: rgb(224, 224, 224);
   }
#rci{
    border:none;
   margin-top: 32px;
   margin-left: 320px;
   width:150px;
   color:navy;
   font-weight:800;
   background-color:gold;

}
.reshow{
    width:800px;
       height: 300px;
       background-color: rgb(224, 224, 224);
}
#user{
    width:700px;
       height: 100px;
       background-color: white;
       margin: 0 auto;
       margin-top: 20px;
}
#u-l{
    width:100px;
    height: 100px;

    float: left;
}
#u-r{
    width:600px;
    height: 100px;
    background-color:pink ;
    float: left;
}
#userImg{
 width:80px;
 height:50px;
 }
 
 .review{
   width:100%;
   box-sizing: border-box;
}
.reviewInfo p{
   display : inline-block;
   vertical-align: middle;
   padding: 5px;
}
.reviewInfo{
   margin-top : 20px;
   padding : 20px;
   border : 1px solid #eee56a;
   border-radius : 30px;
   margin-bottom: 40px;
}
#reviewBtn,#closeBtn{
   margin-top: 20px;
}
.writeDate{
   width: 30%;
}
.reWriter{
   margin-top: 5px;
   width: 18%;
   border-right: 1px solid #d6c6a5;
}
.usedDate{
   width: 25%;
}
.writeContent{
   width: 50%;
      border-right: 1px solid #d6c6a5;
}
.usedFitness{
   width: 48%;
      border-right: 1px solid #d6c6a5;
}
.star{
   width: 25%;
      border-right: 1px solid #d6c6a5;
}
.reTitle{
   margin : 0 auto;
   margin-top : 5px;
   border-bottom: 2px solid #d6c6a5;
}
#page{
   width : 800px;
   margin : 20px;
   padding : 10px;
   padding-right : 20px;
   overflow: auto;
    height: 250px;

}
#noReview{
   margin : 30px;
   text-align: center;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

   <%@include file="/WEB-INF/views/common/header.jsp"%>
<div class="main">
    <div class="main-left-box">
           <h2>객실</h2>
           <ul>
               <li>
                   <span>스탠다드</span>
                   <ul class="subnavi">
                   
                      
                   </ul>
               </li>
               <li>
                   <span>이그제 큐티브</span>
                   <ul class="subnavi">
                    
                   </ul>
               </li>
               <li>
                   <span>스위트</span>
                   <ul class="subnavi">
       
                   </ul>
               </li>
           </ul>
       </div>
    <!-- 메인 콘텐츠 -->
    
    <div class="dmain-content">
      <h2> ${r.roomNo}</h2>
       <h2 id="nami">${r.roomName}/객실</h2>
       <input type="hidden" id="rooN" value="${r.roomName}"> 
      <img id="roomImg" src="/upload/room/${r.roomImg}"><br>&emsp;
            <div class="amanity-wrap"  style="display: none;">
                <div id="amanity-modal">
                    <h3>객실어메니티 <button type="button" id="amanity-close"><img src="/img/shrm_layerClose.png"></button> </h3>
                    <div class="rAmanity">
                        <img src="/img/객실어메니티.PNG">
                    </div>
                </div>
            </div>
     <div id="one">
         <div id="one1"> 
         <p>${r.roomDetail}</p>
         <span class="it_info"><b>문의전화&emsp;02-8444-9999</b></span><br><br>
         <p id="wifi">모든객실과 레스토랑에서 유.무선인터넷(wifi)연결 가능합니다.</p>
         <span class="it_info"><b id="it">위치</b>&emsp;${r.roomLoc}</span>&emsp;
      <span class="it_info"><b id="it">전망</b>&emsp;${r.roomView}</span>&emsp;
      <span class="it_info"><b id="it">침대</b>&emsp;${r.bed}</span><br><br>
      <span class="it_info"><b id="it">크기</b>&emsp;${r.roomSize}</span>&emsp;&emsp;
        <span class="it_info"><b id="it">룸구성</b>&emsp;${r.roomForm}</span>&emsp;
        <span class="it_info"><b id="it">가격</b>&emsp;${r.roomPrice}원</span>
         </div>
         <input type="button" class="amanty" value="객실어메니티보기">
         
         <div id="one2">
        <button type="text" id="b-re"><a href="/question">문의하기</a></button>
        <button type="text" id="b-re" onclick="reserve(${r.roomNo});">예약하기</button>
    </div>
     </div>
     <div id="two"><img id="roomImg" src="/upload/room/${r.roomInfo}"></div>

    <!-- 리뷰보기  -->
      
            <button class="btn btn-outline-secondary" id="reviewBtn">리뷰보기</button>
            
            <div class="review">
               <a class="btn btn-outline-secondary" id="closeBtn">리뷰닫기</a> <br>
               <div id="page"></div>
               <p id="noReview" style="display:none;">등록 된 리뷰가 없습니다.</p>
               

            </div>

    </div>  
 
</div>
      <script>
            $(function(){
                $(".amanty").click(function(){
                    $(".amanity-wrap").css("display","flex");
                });
                $("#amanity-close").click(function(){
                    $(".amanity-wrap").css("display","none");
                });
            });
 
            </script>
               <script>
      $(function() {
         $(".review").hide();
         $("#closeBtn").hide();
         
         $("#reviewBtn").click(function() {
            $(".review").show();
            $("#closeBtn").show();
            $("#reviewBtn").hide();
         });
         $("#closeBtn").click(function() {
            $(".review").hide();
            $("#closeBtn").hide();
            $("#reviewBtn").show();
         });
      
      });
      function reserve(roomNo){
          location.href="/reserveRFrm?roomNo="+roomNo;
       }
      </script>
      <script>
      $(function() {
         $("#reviewBtn").click(function() {
            
            var result = $("#rooN").val();
            $("#noReview").hide();
            $.ajax({
               url : "/reviewShow",
               data : {"roomName" : result},
               type : "post",
               success : function(data) {
                  var div = $("#page");
                  div.empty();
                  if(data.length == 0){
                     $("#noReview").show();
                  }else{
                     for(var i = 0; i<data.length;i++){
		                  var html="";
                        html+="<div class='reviewInfo'>";
                        html+="<div class='reTitle'>";
                        html+="<p class='usedFitness'>객실이름 : "+data[i].RoomName+"</p>";
                        html+="<p class='star'> 별점 : "+data[i].Star;
                        for(var j=0;j<data[i].Star;j++){
                        	html+="★";
                        }
                        html+="</p></div><div class='reContent'>";
                        html+="<p class='reWriter'>작성자 : "+data[i].ReviewWriter+"</p>";
                        html+="<p class='writeContent'>작성 내용 : "+data[i].ReviewContent+"</p>";
                        html+="<p class='writeDate'>작성한 날짜 : "+data[i].reviewDate+"</p>";
                        html+="</div></div>";
                        div.append(html);
                     }
                  }
                  
               
               }
            });
            
         });
      });
   </script>
   <%@include file="/WEB-INF/views/common/footer.jsp"%>

</body>
</html>