
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  

 
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/room.css">
	<script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
	<!-- 부트스트랩용 jQuery -->
	<script type="text/javascript" src="/js/bootstrap.bundle.min.js"></script>
      <script>
            $(function(){
                $("#a-button").click(function(){
                    $(".pmanity-wrap").css("display","flex");
                });
                $("#amanity-close").click(function(){
                    $(".pmanity-wrap").css("display","none");
                });
            });
        </script>
<style>
    /*객실전체*/
     #a-rooms{
    width: 350px;
    height: 170px;
}
#a-rimg1{
    float: left;
    
   
}
#rimg2{
    float: left;
    margin-left: 50px;
}
#allRoom1{
    
    width: 230px;
    height: 200px;
     float:left;
  
}
.clicks{

    width: 120px;
    height: 50px;
      float:left;
      margin-top:50px;
}
#a-button{
background-color:pink;
     border:none;
     cursor: pointer;
     font-size:11px;
     height: 30px;
     font-weight:600;
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
                    <li><a href="#">디럭스<span>&gt;</span></a></li>
                    <li><a href="#">비즈니스 디럭스<span>&gt;</span></a></li>
                    <li><a href="#">그랜드 코너 디럭스<span>&gt;</span></a></li>
                   
                </ul>
            </li>
            <li>
                <span>이그제큐티브</span>
                <ul class="subnavi">
                    <li><a href="#">이그제디럭스<span>&gt;</span></a></li>
                    <li><a href="#">큐티브디럭스<span>&gt;</span></a></li>
                </ul>
            </li>
            <li>
                <span>스위트</span>
                <ul class="subnavi">
                    <li><a href="#">수페리어 스위트<span>&gt;</span></a></li>
                    <li><a href="#">코리안 스위트<span>&gt;</span></a></li>
                    <li><a href="#">코너 스위트<span>&gt;</span></a></li>
                    <li><a href="#">스테이 스위트<span>&gt;</span></a></li>
                    <li><a href="#">위드 스위트<span>&gt;</span></a></li>
                    <li><a href="#">프레지덴셜 스위트<span>&gt;</span></a></li>
                </ul>
            </li>
        </ul>
    </div>
    <!-- 메인 콘텐츠 -->
    
    <div class="main-content">
    <h3>[${r.roomType}] TYPE</h3>
			<c:forEach items="${list}" var="r" varStatus="i">
				<div id="a-rimg1">
				<a href="/detailRoom?roomNo=${r.roomNo}">
	            <img id="a-rooms" src="upload/room/${r.roomImg}">
	            </a>
	            <p>[${r.roomName}]</p>
	            <div id="allRoom1">
		             <p id="rdetail">${r.roomDetail}</p>
		             <span class="it_info1"><b id="it1">침대타입 :</b>&emsp;${r.bed}</span><br>
		             <span class="it_info1"><b id="it1">객실크기 :</b>&emsp;${r.roomSize}</span><br>
		             <span class="it_info1"><b id="it1">투숙최대 :</b>&emsp;${r.maxNum}</span>&emsp;<br>
		            
	             </div>
		             <div class="clicks">
		             <button value="이미지보기" id="a-button">이미지보기</button>
		             <button value="예약하기" id="a-button">예약하기</button>
	             </div>
	             </div>
			</c:forEach>
 
        </div>
        
    </div>  
</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>

</body>
</html>