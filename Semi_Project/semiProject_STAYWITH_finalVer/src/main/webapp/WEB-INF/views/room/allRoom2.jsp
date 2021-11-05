
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/room.css">
<script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
<!-- 부트스트랩용 jQuery -->
<script type="text/javascript" src="/js/bootstrap.bundle.min.js"></script>
<script>
$(function() {
   $("#amanity-close").click(function() {
      $(".pmanity-wrap").css("display", "none");
   });
});
$(function(){
    $(".a-button").click(function(){
        //클릭한 메뉴가 몇번째 메뉴인지 구하는 메소드
        var index = $(".a-button").index(this);
        //본문 전체 초기화
        var roomImg = $(this).prev().val();
        $(".imgT").attr("src", "upload/room/"+roomImg);
        $(".pmanity-wrap").css("display", "flex");

    });
});
$(function(){
    
    $.ajax({
       url : "/allRoom",
       type : "get",
       success : function(data) {
          console.log(data);
          var subnavi = $("ul.subnavi");
          console.log(subnavi);
          for(var i=0;i<data.length;i++){
             if(data[i].RoomType=='스탠다드'){
                
                subnavi.eq(0).append('<li><a href="/detailRoom?roomNo='+data[i].RoomNo+'">'+data[i].RoomName+'<span>&gt;</span></a></li>');
             }
             else if(data[i].RoomType=='이그제큐티브'){
                subnavi.eq(1).append('<li><a href="/detailRoom?roomNo='+data[i].RoomNo+'">'+data[i].RoomName+'<span>&gt;</span></a></li>');
             }
             else if(data[i].RoomType=='스위트'){
                subnavi.eq(2).append('<li><a href="/detailRoom?roomNo='+data[i].RoomNo+'">'+data[i].RoomName+'<span>&gt;</span></a></li>');
                
             }
          }
          
       }
 
    });
       
  });
function reserve(roomNo){
   location.href="/reserveRFrm?roomNo="+roomNo;
}
</script>
<style>
/*객실전체*/
#a-rooms {
   width: 350px;
   height: 170px;
}

#a-rimg1 {
   float: left;
}

#rimg2 {
   float: left;
   margin-left: 50px;
}

#allRoom1 {
   width: 230px;
   height: 200px;
   float: left;
}

.clicks {
   width: 120px;
   height: 50px;
   float: left;
   margin-top: 50px;
}

.a-button {
   background-color: #eee5a6;
   border: none;
   cursor: pointer;
   font-size: 11px;
   height: 30px;
   font-weight: 600;
}

.b-button {
   background-color: #cdd395;
   border: none;
   cursor: pointer;
   font-size: 11px;
   height: 30px;
   font-weight: 600;
}

#r_name {
   font-weight: 800;
}

#pmanity-modal {
   padding-bottom: 20px;
   background-color: #FFFFFF;
   position: fixed;
   z-index: 10000;
   min-width: 655px;
   border: 1px solid black;
}

.hrm-btn-wrap {
   width: 100%;
   display: flex;
   justify-content: center;
}

#amanity-close {
   background-color: transparent;
   border: none;
}

#pamanity-modal h3 {
   padding-left: 30px;
   margin: 0;
   padding-bottom: 20px;
   padding-top: 20px;
   background-color: #f7f7f7;
}

#pamanity-modal h3>button {
   text-align: right;
   background-color: #f7f7f7;
}

#pageNavi {
   margin-left: 600px;
}

.pmanity-wrap {
   width: 100vw;
   height: 100vh;
   position: absolute;
   top: 0;
   left: 0;
   display: none;
   justify-content: center;
   align-items: center;
}

.imgT {
   width: 100%;
   height: 100%;
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

      <div class="main-content">
         <h3>스테이위드 호텔 객실은 모던하면서 세련된 라이프스타일 공간입니다</h3>
         <h5>시대를 아우르는 모던함을 모토로 ,시간이 흐를수록 빛나는 절제된 디자인을 선보입니다</h5>
         <br>

         <c:forEach items="${list}" var="r" varStatus="i">
            <div id="a-rimg1">
               <a href="/detailRoom?roomNo=${r.roomNo}"> <img id="a-rooms"
                  src="upload/room/${r.roomImg}">
               </a>
               <p id="r_name">[${r.roomName}]</p>

               <div id="allRoom1">
                  <p id="rdetail">${r.roomDetail}</p>
                  <span class="it_info1"><b id="it1">침대타입 :</b>&emsp;${r.bed}</span><br>
                  <span class="it_info1"><b id="it1">객실크기 :</b>&emsp;${r.roomSize}</span><br>
                  <span class="it_info1"><b id="it1">투숙최대 :</b>&emsp;${r.maxNum}명</span>&emsp;<br>

               </div>

               <div class="clicks">
                  <input type="text" class="inputdata" style="display : none;" value=${r.roomImg }>
                  <button value="이미지보기" class="a-button">이미지보기</button>
                  <button value="예약하기" class="b-button" onclick="reserve(${r.roomNo})">예약하기</button>
               </div>

            </div>
         </c:forEach>
            <div class="pmanity-wrap" style="display: none;">
                  
                  <div id="pmanity-modal">
                     
                        
                        <button type="button" id="amanity-close">
                           <img src="/img/shrm_layerClose.png">
                        </button>
                     
                     <div class="pAmanity">
                  
                        <img src="" class="imgT">
                     </div>
                  
                  </div>
               </div>

      </div>

      <div id="pageNavi">${pageNavi}</div>
   </div>
   </div>
   <%@include file="/WEB-INF/views/common/footer.jsp"%>

</body>
</html>