  var idChk = false;
  var pwChk = false;
  var pwreChk = false;
  var nameChk = false;
  var phoneChk = false;
  var emailChk = false;
  var emailCodeChk = false;
  var captcha = 1;
 
  //$(".required:checked").length;
  
  //아이디 중복체크
  $("#memberIdChk").on("click", function(){
    var memberId = $("#memberId").val();
    var idChkReg = /^[a-z][a-z0-9]{3,11}$/;
    if(memberId == "" || !(idChkReg.test(memberId))){
      $(".expResult").eq(0).html("아이디를 올바르게 입력해주세요.");
      $("#memberId").removeClass("is-valid");
      $(".expResult").eq(0).removeClass("text-success");
      $(".expResult").eq(0).addClass("text-danger");
      $("#memberId").addClass("is-invalid");
      idChk = false;
      return;
    }
    $.ajax({
      url : "/memberIdCheck.do",
      data : {memberId : memberId},
      type : "post",
      success : function(data){
        if(data == 0){
          $(".expResult").eq(0).html("이미 존재하는 아이디 입니다.");
          $("#memberId").removeClass("is-valid");
          $(".expResult").eq(0).removeClass("text-success");
          $(".expResult").eq(0).addClass("text-danger");
          $("#memberId").addClass("is-invalid");
          idChk=false;
        }else{
          $(".expResult").eq(0).html("사용 가능한 아이디 입니다.");
          $("#memberId").removeClass("is-invalid");
          $(".expResult").eq(0).removeClass("text-danger");
          $(".expResult").eq(0).addClass("text-success");
          $("#memberId").addClass("is-valid");
          idChk=true;
        }
      }
    });
  });

  $(function(){
      $("#checkAll").click(function(){
          //전체 체크박스 클릭
          if($("#checkAll").prop("checked")){
            $(".agreement").prop("checked",true);
          }else{
            $(".agreement").prop("checked",false);
          }
      });
      //전체 체크박스 선택중 체크박스 하나를 풀엇을경우 "전체" 체크해제
      $(".agreement").click(function(){
        if($(".agreement:checked").length == 3){
          $("#checkAll").prop("checked",true);
        }else{
          $("#checkAll").prop("checked",false);
        }
      });
      //정규표현식을 이용해서 형식에 맞게 check해줌

      //비밀번호
      $("#memberPw").on("keyup change paste", function(){
            var pwReg = /^[a-zA-Z0-9]{8,}$/;
            var pwVal = $("#memberPw").val();
            var reVal = $("#memberPwRe").val();
			
            if(pwReg.test(pwVal)){
              $(".expResult").eq(1).html("");
              $(".expResult").eq(1).removeClass("text-danger");
              $("#memberPw").removeClass("is-invalid");
              $(".expResult").eq(1).addClass("text-success");
              $("#memberPw").addClass("is-valid");
              pwChk = true;
              if(pwVal != reVal){
	              $(".expResult").eq(2).html("비밀번호가 일치하지 않습니다.");
	              $(".expResult").eq(2).removeClass("text-success");
	              $("#memberPwRe").removeClass("is-valid");
	              $(".expResult").eq(2).addClass("text-danger");
	              $("#memberPwRe").addClass("is-invalid");
	              pwreChk = false;	                           	
              }else{
               $(".expResult").eq(2).html("비밀번호가 일치합니다.");
               $(".expResult").eq(2).removeClass("text-danger");
               $("#memberPwRe").removeClass("is-invalid");
               $(".expResult").eq(2).addClass("text-success");
               $("#memberPwRe").addClass("is-valid");
               pwreChk = true;             
              }
            }else{
              $(".expResult").eq(1).html("비밀번호는 8자이상 입력해주세요");
              $(".expResult").eq(1).removeClass("text-success");
              $("#memberPw").removeClass("is-valid");
              $(".expResult").eq(1).addClass("text-danger");
              $("#memberPw").addClass("is-invalid");
              pwChk = false;
            }
          });  
      // 비밀번호 확인
      $("#memberPwRe").on("change", function(){
          var reVal = $("#memberPwRe").val();
          var pwVal = $("#memberPw").val();

          if(reVal == pwVal){
              $(".expResult").eq(2).html("비밀번호가 일치합니다.");
              $(".expResult").eq(2).removeClass("text-danger");
              $("#memberPwRe").removeClass("is-invalid");
              $(".expResult").eq(2).addClass("text-success");
              $("#memberPwRe").addClass("is-valid");
              pwreChk = true;
          }else{
              $(".expResult").eq(2).html("비밀번호가 일치하지 않습니다.");
              $(".expResult").eq(2).removeClass("text-success");
              $("#memberPwRe").removeClass("is-valid");
              $(".expResult").eq(2).addClass("text-danger");
              $("#memberPwRe").addClass("is-invalid");
              pwreChk = false;
          }
      });
      //이름
      $("#memberName").on("keyup change paste", function(){
            var nameReg = /^[가-힣]{2,6}$/;
            var nameVal = $("#memberName").val();

            if(nameReg.test(nameVal)){
              $(".expResult").eq(3).html("");
              $(".expResult").eq(3).removeClass("text-danger");
              $("#memberName").removeClass("is-invalid");
              $(".expResult").eq(3).addClass("text-success");
              $("#memberName").addClass("is-valid");
              nameChk = true;
            }else{
              $(".expResult").eq(3).html("이름은 한글 2~6글자로 입력해주세요");
              $(".expResult").eq(3).removeClass("text-success");
              $("#memberName").removeClass("is-valid");
              $(".expResult").eq(3).addClass("text-danger");
              $("#memberName").addClass("is-invalid");
              nameChk = false;
            }
          });
      //전화번호 중복체크
      $("#phone").on("keyup change paste", function(){
        var phoneReg = /^010-([0-9]{4})-([0-9]{4})$/;
        var phoneVal = $("#phone").val();

        if(phoneReg.test(phoneVal)){
          $.ajax({
              url : "/phoneCheck.do",
              data : {phone : phoneVal},
              type : "post",
              success : function(data){
                if(data == 0){
                  $(".expResult").eq(4).html("이미 사용중인 전화번호 입니다.");
                  $(".expResult").eq(4).removeClass("text-success");
                  $("#phone").removeClass("is-valid");
                  $(".expResult").eq(4).addClass("text-danger");
                  $("#phone").addClass("is-invalid");
                  phoneChk = false;
                  return;
                }else{
                  $(".expResult").eq(4).html("");
                  $(".expResult").eq(4).removeClass("text-danger");
                  $("#phone").removeClass("is-invalid");
                  $(".expResult").eq(4).addClass("text-success");
                  $("#phone").addClass("is-valid");
                  phoneChk = true;
                  return;
                }
              }
            });
        }else{
          $(".expResult").eq(4).html("양식에 맞게 입력해주세요(ex.010-1234-1234)");
          $(".expResult").eq(4).removeClass("text-success");
          $("#phone").removeClass("is-valid");
          $(".expResult").eq(4).addClass("text-danger");
          $("#phone").addClass("is-invalid");
          phoneChk = false;
        }
      });
      var mailCode;
      //이메일 중복체크, 인증메일 발송
      $("#emailChk").on("click",function(){
    	 var emailReg = /^([\w\.\_\-])*[a-zA-Z0-9]+([\w\.\_\-])*([a-zA-Z0-9])+([\w\.\_\-])+@([a-zA-Z0-9]+\.)+[a-zA-Z0-9]{2,8}$/;
    	 var emailVal = $("#email").val();
    	 
    	 if(emailReg.test(emailVal)){
             $.ajax({
                 url : "/emailCheck.do",
                 data : {email : emailVal},
                 type : "post",
                 success : function(data){
                   if(data == 0){
                     $(".expResult").eq(5).html("이미 사용중인 이메일 입니다.");
                     $(".expResult").eq(5).removeClass("text-success");
                     $("#email").removeClass("is-valid");
                     $(".expResult").eq(5).addClass("text-danger");
                     $("#email").addClass("is-invalid");
                     emailChk = false;
                     return;
                   }else{
                     $(".expResult").eq(5).html("");
                     $(".expResult").eq(5).removeClass("text-danger");
                     $("#email").removeClass("is-invalid");
                     $(".expResult").eq(5).addClass("text-success");
                     $("#email").addClass("is-valid");
                     emailChk = true;
                     sendMail();
                   }
                 }
               });
          
    	 }else{
             $(".expResult").eq(5).html("양식에 맞게 입력해주세요(ex.abcd@naver.com)");
             $(".expResult").eq(5).removeClass("text-success");
             $("#email").removeClass("is-valid");
             $(".expResult").eq(5).addClass("text-danger");
             $("#email").addClass("is-invalid");
             emailChk = false;	 
    	 }
      });
  });
  	
	  function sendMail(){
		  var email = $("#email").val();
		  
		  $.ajax({
			 url : "/sendMail.do",
			 type : "post",
			 data : {email:email},
			 success : function(data){
				 mailCode = data;
				 $(".auth").slideDown();
				 authTime();
			 }
		  });
	  }
 
	//이메일 인증시 시간 설정
	  var intervalId;
	  function authTime(){
	  	$("#timeZone").html("<span id='min'>5</span> : <span id='sec'>00</span>");
	  	intervalId = window.setInterval(function(){
	  		timeCount();
	  	}, 1000); //밀리세컨드 단위 
	  }
	//이메일 인증 시간 카운트
	  function timeCount(){
	  	var min = Number($("#min").html());
	  	var sec = $("#sec").html();
	  	if(sec == "00"){
	  		if(min==0){
	  			mailCode = null;
	  			clearInterval(intervalId);
	  			$("#authMsg").html("인증시간 만료");
	  			$("#authMsg").css("color", "red");
	  		}else{
	  			$("#min").html(--min);			
	  			$("#sec").html(59);			
	  		}
	  	}else{
	  		var newSec = Number(sec);
	  		newSec--;
	  		if(newSec<10){ //한자리수일때
	  			$("#sec").html("0"+newSec);
	  		}else{
	  			$("#sec").html(newSec);
	  		}
	  	}
	  }
	  //이메일 인증 시간
	  $(".authBtn").click(function(){
	  	if(mailCode == null){
	  		$("#authMsg").html("인증시간 만료");
	  		$("#authMsg").css("color", "red");
	  		emailCodeChk = false;
	  	}else{
	  		if($("#authCode").val() == mailCode){
	  			emailCodeChk = true;
	  			$("#authMsg").html("인증성공");
	  			$("#authMsg").css("color", "blue");
	  			clearInterval(intervalId);
	  			$("#timeZone").empty();
	  		}else{
	  			$("#authMsg").html("인증코드 확인");
	  			$("#authMsg").css("color", "red");
	  			emailCodeChk = false;
	  		}
	  	}
	  });