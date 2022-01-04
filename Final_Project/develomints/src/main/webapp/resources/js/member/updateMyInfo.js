	$(function(){
		$(".resgin").on("click",function(){
			var memberId = $("#memberId").val();
			swal({
			    title: "회원탈퇴를 진행하시겠습니까?",
			    text: "회원 탈퇴를 진행하실경우, 정보 복구는 어렵습니다.",
			    icon: "error",
			    buttons: ["돌아가기", "탈퇴하기"],
			    dangerMode: true
			}).then((willDelete) => {
			    if (willDelete) {
			        
			        $.ajax({
			            url: "/resignMember.do",
			            data: {
			                memberId: memberId
			            },
			            type: "post",
			            success: function (data) {
			            	if(data == 1){
			                    swal({
			                        title: '회원탈퇴완료',
			                        text: '디벨로민트를 이용해주셔서 감사합니다.',
			                        icon: 'success'
			                      }).then(function(){
			                    	 window.location = "/"; 
			                      });
			            	}else{
			            		swal("회원탈퇴에 실패했습니다.", {icon:"warning"});
			            	}
			    
			            }
			        });
			    } else {
			        swal({
			        	text: "탈퇴가 취소되었습니다.",
			        	button: "돌아가기"
			        });
			    }//else문 종료
			});//then delete 문 종료
		});//resign on click 문 종료
	});//$ 펑션 종료
	var nameChk = true;
	var phoneChk = true;
	
    $("#memberName").on("keyup change paste", function(){
        var nameReg = /^[가-힣]{2,6}$/;
        var nameVal = $("#memberName").val();

        if(nameReg.test(nameVal)){
          $(".expResult").eq(0).html("");
          $(".expResult").eq(0).removeClass("text-danger");
          $("#memberName").removeClass("is-invalid");
          $(".expResult").eq(0).addClass("text-success");
          $("#memberName").addClass("is-valid");
          nameChk = true;
        }else{
          $(".expResult").eq(0).html("이름은 한글 2~6글자로 입력해주세요");
          $(".expResult").eq(0).removeClass("text-success");
          $("#memberName").removeClass("is-valid");
          $(".expResult").eq(0).addClass("text-danger");
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
              $(".expResult").eq(1).html("이미 사용중인 전화번호 입니다.");
              $(".expResult").eq(1).removeClass("text-success");
              $("#phone").removeClass("is-valid");
              $(".expResult").eq(1).addClass("text-danger");
              $("#phone").addClass("is-invalid");
              phoneChk = false;
              return;
            }else{
              $(".expResult").eq(1).html("");
              $(".expResult").eq(1).removeClass("text-danger");
              $("#phone").removeClass("is-invalid");
              $(".expResult").eq(1).addClass("text-success");
              $("#phone").addClass("is-valid");
              phoneChk = true;
              return;
            }
          }
        });
    }else{
      $(".expResult").eq(1).html("양식에 맞게 입력해주세요(ex.010-1234-1234)");
      $(".expResult").eq(1).removeClass("text-success");
      $("#phone").removeClass("is-valid");
      $(".expResult").eq(1).addClass("text-danger");
      $("#phone").addClass("is-invalid");
      phoneChk = false;
    }
  });
  
  $("#joinBtn").click(function(){
		 if(nameChk==true&&phoneChk==true){
			 $("form").submit();	
		 }else{
			 swal({
				   title: "변경실패",
				   text: "입력값을  다시 확인해주세요.",
				   icon: "warning", //"info,success,warning,error" 중 택1
				   button: "돌아가기",
				})
			 return false;
		 }
	  });