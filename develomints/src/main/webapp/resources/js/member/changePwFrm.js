		var oldChk = false;
		var pwChk = false;
		var pwReChk = false;
		
		$(function(){
			
			$("#oldPw").on("change",function(){
				var oldPw = $("#oldPw").val();
				var idVal = $("#memberId").val();
				
				$.ajax({
					url : "/checkPw.do",
					data : {memberPw : oldPw,memberId : idVal},
					type : "post",
					success: function(data){
						if(data == 1){
					          $(".expResult").eq(0).html("현재 비밀번호가 일치합니다.");
					          $("#oldPw").removeClass("is-invalid");
					          $(".expResult").eq(0).removeClass("text-danger");
					          $(".expResult").eq(0).addClass("text-success");
					          $("#oldPw").addClass("is-valid");
					          oldChk=true;					
						}else{
					          $(".expResult").eq(0).html("비밀번호가 일치하지 않습니다.");
					          $("#oldPw").removeClass("is-valid");
					          $(".expResult").eq(0).removeClass("text-success");
					          $(".expResult").eq(0).addClass("text-danger");
					          $("#oldPw").addClass("is-invalid");
					          oldChk=false;	
						}
					}
				}); // 현재 비밀번호 확인 ajax 종료
			}); // change 이벤트 종료
				
		      //비밀번호
		      $("#memberPw").on("keyup", function(){
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
		});
		  $("#joinBtn").click(function(){
				 if(pwChk==true&&pwreChk==true&&oldChk==true){
					 swal({
						   title: "비밀번호 변경완료",
						   text: "변경된 비밀번호로 다시 로그인 해주시길 바랍니다.",
						   icon: "success", //"info,success,warning,error" 중 택1
						   button: "둘러보기",
						})
					 .then((value) => {
					 	$("form").submit();			 
					 });
				 }else{
					 swal({
						   title: "가입실패",
						   text: "입력값을  다시 확인해주세요.",
						   icon: "warning", //"info,success,warning,error" 중 택1
						   button: "돌아가기",
						})
					 return false;
				 }
			  });