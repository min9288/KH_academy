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
    <style>
        .header{ 
            width: 1200px;
            height:180px;
            background-color: aqua;
            margin: 0 auto;
    
        }
        .margin{ 
            width: 1200px;
            height:55px;
            background-color:gainsboro;
            margin: 0 auto;
    
        }
        .body3{
            width: 1200px;
            height: 1500px;  
            margin: 0 auto;
        }
        .footer{ 
            width: 1200px;
            height:330px;
            background-color:burlywood;
            margin: 0 auto;
    
        }
    .main-content{
      
        width: 874px;
        height:1000px;
        float: left;
    }
    h3{
        text-align: center;
    }
.one{
    background-color: blue;
    width: 900px;
    height: 300px;
    margin: 0 auto;
}
.two{
    
    width: 800px;
    height: 200px;
    margin: 0 auto;
}
#one-1-1{
float:left;
width: 300px;
height: 300px;
background-color: blue;
}

#one-1-2{
float:left;
width: 300px;
height: 300px;
background-color: chartreuse;
}
#one-2{
    float:left;
    width: 300px;
    height: 300px;
    background-color: chocolate;
}

#rooms{
    width: 350px;
    height: 300px;
}



.clicks{
    background-color: blue;
    width: 150px;
    height: 150px;
  
}
.r-choose{
    width:800px;
    height:100px;
    margin: 0 auto;
}

</style>
    <script type="text/javascript">
    $(function(){
        $("#reserveR").click(function(){
        	$(".two").slideToggle(300);
            $(".two").css("display","flex");
        	
        });
      
    });
    </script>
    </script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
<%@include file="/WEB-INF/views/common/header.jsp"%>
<div class="margin"></div>
<div class="body3">
    <h3>호텔,날짜,인원 선택</h3><br>
    <hr>
    <span class="it_info">
        <b>호텔</b>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
        <b>체크인</b>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
        <b>숙박</b>&emsp;&emsp;&emsp;
        <b>체크아웃</b>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
        <b>객실</b>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
        <b>성인</b>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
        <b>소인</b>&emsp;&emsp;&emsp;&emsp;
        <b>소인</b>&emsp;&emsp;&emsp;&emsp;
  
        <input type="button" value="search">
     </span><br>
     <span>스테이위드호텔</span>&emsp;
     <span><input type='date' value="" id="checkIn"></span>&emsp;&emsp;
      <span>1박</span>&emsp;
    <span><input type='date' value="" id="checkOut"></span>&emsp;&emsp;
    <span><select>
        <option value="">객실</option>
        <option value="s_dirux">[스텐다드]디럭스</option>
        <option value="b_dirux">[스텐다드]비즈니스 디럭스</option>
        <option value="g_dirux">[스텐다드]그랜드 코너 디럭스</option>
        <option value="standard">[이그제큐티브] 이그제디럭스</option>
        <option value="qtibe">[이그제큐티브]큐티브 디럭스</option>
        <option value="sweet">[스위트]수페리어 스위트</option>
        <option value="sweet">[스위트]코리안 스위트</option>
        <option value="sweet">[스위트]코너 스위트</option>
        <option value="sweet">[스위트]스테이 스위트</option>
        <option value="sweet">[스위트]위드 스위트</option>
        <option value="sweet">[스위트]프레지덴셜 스위트</option>
    </select></span>&emsp;
    <span><input type='text'  id="adult" value="성인인원수를 입력"></span>&emsp;
    <span><input type='text'  id="kid" value="소인인원수 입력"></span>&emsp;
    <hr>
   
    <div class="one">
     <div id="one-1-1">
        <img id="rooms"src="img/3.jpg">
     </div>
     <div id="one-1-2">
     
         <h5>디럭스</h5>
         <p>객실크기 :36m2</p>
         <p>침대타입: 더블(킹사이즈),트윈</p> 

     </div>
     <div id="one-2"> 
        <span>330,000원</span>&emsp;
    <input type="button" value="예약하기" id="reserveR"></div>
    </div>


    <div class="two"  style="display:none;">
      <table  border="1" class="r-choose">
          <tr>
            
              <td><label><input type="checkbox" name="bed" value="DOUBLE"> DOUBLE</label> </td>
             <td>330,000원 </td>
              <td> <input type="button" value="NEXT"> </td>
          </tr>
   
          <tr>
            <td>  <label><input type="checkbox" name="bed" value="TWIN"> TWIN</label></td>
            <td>330,000원 </td>
            <td> <input type="button" value="NEXT"><a href="/reserveConfirm?resNum=${res.resNum}">예약내역</a> </td>
        </tr>
        

      </table>
    </div>
    </div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>

</div>
</body>
</html>