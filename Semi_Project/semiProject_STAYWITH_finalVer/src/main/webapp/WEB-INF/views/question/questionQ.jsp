<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/default.css">
<link rel="stylesheet" href="/css/question-q.css">
<link rel="stylesheet" href="/css/bootstrap.css">
<script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
<script>
   $(function() {
      $(".opinion").hide();

      /* 필수 체크 문항 */
      $("#radio1").click(function() {

         $(".question").hide();
         $(".opinion").show();
      });

      $("#radio2").click(function() {

         $(".opinion").hide();
         $(".question").show();

      });
   });
   function checkAgree() {
      if ($("[name=qTitle]").val() == "") {
         alert("제목을 입력하세요.")
         return false;
      }
      if ($("[name=qContent]").val() == "") {
         alert("내용을 입력하세요.")
         return false;
      }
      if ($("[name=qName]").val() == "") {
         alert("이름을 입력하세요.");
         return false;
      }

      if ($("[name=email]").val() == "") {
         alert("이메일을 입력하세요.");
         return false;
      }

      if ($("[name=phone]").val() == "") {
         alert("핸드폰 번호를 입력하세요.");
         return false;
      }

      if (Number($("[name=qAuto]").val()) != Number($("#auth").html())) {
         alert("인증번호를 확인하세요.");
         return false;
      }
      if ($("#chk").is(":checked")) {
      } else {
         alert("필수적 개인정보 수집 및 동의에 동의하십시오.");
         return false;
      }
   }
</script>
</head>
<body onload="randomNum.printRandom('auth', 5)">
   <jsp:include page="/WEB-INF/views/common/header.jsp" />
   <div class="main">
      <div class="main-left-box">
         <h2>고객센터</h2>
         <ul>
            <li><span>고객센터</span></li>
         </ul>
         <ul class="subnavi">
            <li><a href="/notice?reqPage=1" >공지사항<span>&gt;</span></a></li>
            <li><a href="/question" id="lf-click">1:1문의<span>&gt;</span></a></li>
            <li><a href="/faq">FAQ<span>&gt;</span></a></li>
         </ul>
      </div>
      <!-- 메인 콘텐츠 -->
      <form action="/insertQuestion" method="post" enctype="multipart/form-data" >
         <input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
         <div class="main-content">
            <h2 id="q-h2">문의하기</h2>
            <table border="1">
               <tr>
                  <th>
                     <p>구분*</p>
                  </th>
                  <td><input type="text" name="qCategory" readonly
                     value="Stay With 호텔"></td>
               </tr>
               <tr>
                  <th>
                     <p>의견/문의*</p>
                  </th>
                  <td><input id="radio1" name="qType" type="radio" value="의견">의견
                     <input id="radio2" checked name="qType" type="radio" value="문의">문의
                  </td>
               </tr>
               <tr class="question">
                  <th>
                     <p>관련문의</p>
                  </th>
                  <td><select name="qAbout">
                        <option>객실 문의</option>
                        <option>다이닝 문의</option>
                        <option>피트니스 문의</option>
                        <option>멤버쉽 문의</option>
                        <option>홈페이지 오류 문의</option>
                  </select></td>
               </tr>
               <tr class="question">
                  <th>
                     <p>예약번호</p>
                  </th>
                  <td><input name="resNo" type="text"
                     placeholder="예약번호를 입력하세요."></td>
               </tr>
               <tr >
                  <th>
                     <p>제목*</p>
                  </th>
                  <td><input name="qTitle" type="text" placeholder="제목을 입력하세요.">
                  </td>
               </tr>
               <tr class="opinion">
                  <th>
                     <p>이용하신 날짜</p>
                  </th>
                  <td><input type="date" name="usedDate"></td>
               </tr>
               <tr>
                  <th>
                     <p>내용*</p>
                  </th>
                  <td><textarea name="qContent"
                        style="width: 90%; height: 300px;"></textarea></td>
               </tr>

               <tr class="opinion">
                  <th>
                     <p>파일첨부</p>
                  </th>
                  <td><input name="upfile" type="file"></td>
               </tr>
               <tr>
                  <th>
                     <p>성명*</p>
                  </th>
                  <td><input name="qName" type="text" placeholder="성명을 입력하세요.">
                  </td>
               </tr>
               <tr>
                  <th>
                     <p>이메일*</p>
                  </th>
                  <td><input name="email" type="text" placeholder="이메일을 입력하세요.">
                  </td>
               </tr>
               <tr>
                  <th>
                     <p>휴대전화*</p>
                  </th>
                  <td><input name="phone" type="text"
                     placeholder="010-0000-0000"></td>
               </tr>
               <tr>
                  <th>
                     <p>자택전화</p>
                  </th>
                  <td><input name="home" type="text"></td>
               </tr>
               <tr>
                  <th>
                     <p>자동입력방지*</p>
                  </th>
                  <td><span>인증번호 : </span><span id="auth">00000</span> <input
                     type="text" id="qAuto" name="qAuto" placeholder="인증번호를 입력하세요.">
                     <input type="button" value="새로고침" onclick="refresh();" /></td>
               </tr>
            </table>
            <div class="agree-box">
               <br>
               <p>
                  <b>필수적 개인정보 수집 및 동의</b>
               </p>
               <span> StayWith호텔 고객의 문의 및 의견과 관련하여 귀사가 아래와 같이 본인의 개인정보를 수집
                  및 이용하는데 동의합니다.<br> <b>1. 필수적인 개인정보의 수집 ㆍ이용에 관한 사항<br>
                     ① 수집ㆍ이용 항목 | 성명(국문·영문), 이메일, 휴대전화<br> ② 수집ㆍ이용 목적 | 문의에 대한 안내
                     및 서비스 제공<br> ③ 보유ㆍ이용 기간 | 수집ㆍ이용 동의일로부터 5년간<br></b> ※위 사항에
                  대한 동의를 거부할 수 있으나, 이에 대한 동의가 없을 경우 문의에 대한 안내 및 서비스 제공과 관련된 제반 절차
                  진행이 불가능 할 수 있음을 알려드립니다.
               </span> <label for="chk"> <input type="checkbox" id="chk">동의함
               </label>
            </div>
            <div class="agree-box">
               <br>
               <p>
                  <b>선택적 개인정보 수집 및 동의</b>
               </p>
               <span> Stay With 고객의 문의 및 의견과 관련하여 귀사가 아래와 같이 본인의 개인정보를 수집 및
                  이용하는데 동의합니다. <b>선택적인 개인정보의 수집 ㆍ이용에 관한 사항<br> ① 수집ㆍ이용 항목 |
                     자택전화<Br> ② 수집ㆍ이용 목적 | 문의에 대한 안내 및 서비스 제공<br> ③ 보유ㆍ이용 기간
                     | 수집ㆍ이용 동의일로부터 5년간<br></b> ※위 사항에 대한 동의를 거부할 수 있으나, 이에 대한 동의가 없을
                  경우 문의에 대한 안내 및 서비스 제공과 관련된 일반전화 안내 진행이 불가능 할 수 있음을 알려드립니다.
               </span> <label for="ck"><input id="ck" type="checkbox">동의함</label>
               <br> <br> <br>
            </div>
            <button type="submit" class="btn btn-light" id="insertBtn"
               onclick="return checkAgree();">등록하기</button>
         </div>
      </form>
   </div>
   <jsp:include page="/WEB-INF/views/common/footer.jsp" />
   <script>
      var randomNum = {};
      randomNum.random = function(n1, n2) {
         return parseInt(Math.random() * (n2 - n1 + 1)) + n1;
      };
      randomNum.authNo = function(n) {
         var value = "";
         for (var i = 0; i < n; i++) {
            value += randomNum.random(0, 9);
         }
         return value;
      };
      randomNum.printRandom = function(data, num) {
         document.getElementById(data).innerHTML = randomNum.authNo(num);
      };
      function refresh() {
         location.reload();
      }
   </script>
</body>
</html>