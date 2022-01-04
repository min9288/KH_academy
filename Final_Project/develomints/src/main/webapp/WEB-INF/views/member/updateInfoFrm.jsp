<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UpdateInfo</title>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
	.update-wrap{
		width: 700px;
		margin: 0 auto;
        padding : 20px;
        margin-bottom: 100px;
        margin-top: 50px;
	}
	.update-top {
		display: flex;
		align-items: center;
		justify-content: center;
	}
	.update-top img:hover{
		cursor: pointer;
	}
	.update-top img{
	    width: 100%;
	    height: 100%;
	    object-fit: cover;	
	}
	.update-middle>form>div{
		width: 400px;
		margin: 0 auto;
	}
	.pageBtn{
		display: flex;
		justify-content: space-around;
	}
	.proDel{
		margin-left: 40px;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
		<div class="container">
		  <h4 style="text-align: center; font-family: NotoBold">계정설정</h4>
			<div class="update-wrap">
			  <div class="update-top">
				<c:choose>
					<c:when test="${sessionScope.m.filepath eq null }">
						<label for="formFile" class="form-label" style="border-radius: 40%; overflow: hidden;" data-bs-toggle="tooltip" data-bs-placement="top" title="프로필사진 추가"><img src="/resources/img/member/profile.png" id="pic" style="width: 80px; height:80px;"></label>
						<button type="button" class="btn btn-danger proDel" style="display:none;">프로필 삭제</button>
					</c:when>
					<c:otherwise>
						<label for="formFile" class="form-label" style="border-radius: 40%; overflow: hidden;" data-bs-toggle="tooltip" data-bs-placement="top" title="프로필 변경"><img src="/resources/upload/member/${sessionScope.m.filepath }" id="pic" style="width: 100px; height:100px;"></label>
						<button type="button" class="btn btn-danger proDel">프로필 삭제</button>
					</c:otherwise>
				</c:choose>
				<input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
			    <input class="form-control" type="file" id="formFile" name="files" style="display: none;" accept=".gif, .jpg, .jpeg, .png">		  
			  </div><!--update-top 끝나는 지점  -->
			  <div class="update-middle">
			    <form action="/updateMyInfo.do" method="post">
			     	<c:if test="${sessionScope.m.kakao ne 1 }">
						<div class="form-group">
						  <fieldset>
						    <label class="form-label mt-4" for="memberId">아이디</label>
						    <input class="form-control" name="memberId" id="memberId" type="text" value="${sessionScope.m.memberId }" readonly="">
						  </fieldset>
						</div>			     	
			     	</c:if>
			     	<c:if test="${sessionScope.m.kakao eq 1 }">
			     		<input class="form-control" name="memberId" id="memberId" type="hidden" value="${sessionScope.m.memberId }" readonly="">
			     	</c:if>
					<div class="form-group">
					  <label class="col-form-label mt-4" for="email">이메일</label>
					  <input type="text" class="form-control" name="email" id="email" value="${sessionScope.m.email }" readonly="">
					</div>
					<div class="form-group">
					  <label class="col-form-label mt-4" for="memberName">이름</label>
					  <input type="text" class="form-control" name="memberName" id="memberName" value="${sessionScope.m.memberName }"><br>
					  <span class="expResult"></span>
					</div>
					<div class="form-group">
					  <label class="col-form-label mt-4" for="phone">전화번호</label>
					  <input type="text" class="form-control" name="phone" id="phone" value="${sessionScope.m.phone }"><br>
					  <span class="expResult"></span>
					</div>
					<div class="form-group pageBtn"  style="margin-top: 30px;">
						<c:if test="${sessionScope.m.kakao ne 1 }">
							<a href="/changePwFrm.do">비밀번호 변경하기</a>						
						</c:if>
						<button type="submit" class="btn btn-primary" id="joinBtn">정보변경</button>
						<c:if test="${sessionScope.m.memberType ne 2 }">
							<button type="button" class="btn btn-danger resgin">회원탈퇴</button>		  											
						</c:if>	
					</div>
		        </form>
			  </div><!--update-middle 끝나는 지점  -->
			</div><!--update-wrap 끝나는 지점  -->
		</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script>
		//사진 업로드시 확장자 제한 
		$("#formFile").change(function(){
			var fileVal = $(this).val();
			var pathPoint = fileVal.lastIndexOf('.');
			var filePoint = fileVal.substring(pathPoint+1, this.length);
			var fileType = filePoint.toLowerCase();
			var fileSize = 10 * 1024 * 1024; //10메가
			if(fileType == 'jpg' || fileType == 'png' || fileType == 'jpeg' || fileType == 'gif'){
			var uploadFileSize = this.files[0].size;
				if(uploadFileSize > fileSize){
					swal({
				        title: '사진 용량이 큽니다',
				        text: '프로필은 사진 20mb미만 파일만 업로드 가능합니다.',
				        icon: 'warning'
				      })
					$("#formFile").val("");
					return;
				}
			}else if(fileVal == ""){
				$("#formFile").val("");
				return;
			}else{
				swal({
			        title: '확장자를 확인해주세요!',
			        text: '첨부파일은 이미지 파일만 가능합니다.',
			        icon: 'warning'
			      })
				$("#formFile").val("");
				return;
			}
			
			
			var inputfile = $("#formFile")[0].files;
			var memberId = $("#memberId").val();
			
			var formData = new FormData();
			formData.append("files",inputfile[0]);
			formData.append("memberId",memberId);
			//형식이 올바를 경우 여기서 프로필 바로 업로드 시작
			$.ajax({
				type : "POST",
				url : "/uploadProfile.do",
				processData : false,
				contentType: false,
				data : formData,
				success: function(data){
					if(data == 1){
						//성공메세지
						swal({
					        title: '프로필 변경성공!',
					        text: '',
					        icon: 'success'
					      })
					      
					}else{
						//실패메세지
						swal({
					        title: '프로필 변경 실패',
					        text: '다시 시도해 주세요',
					        icon: 'warning'
					      })
					}
					
				}
					
			});
			loadImg(this);
		});
		
		function loadImg(obj){
			var files = obj.files;	//input type="file"에서 선택한 파일을 배열로 가져옴
			if(files.length != 0){	//첨부파일 있는 경우
				var reader = new FileReader(); //파일에 대한 정보를 읽어오는 객체
				reader.readAsDataURL(files[0]);	//파일경로를 읽어옴
				//경로를 다 읽어오면 실행할 함수 설정
				reader.onload = function(e){ //e 에 읽어온 파일 정보가 들어있음
					$("#pic").attr("src", e.target.result); //읽어온 경로를 img태그의 src속성에 설정
					$(".proDel").css('display','block');
				}
			} 
		}
		$(".proDel").click(function(){

			var memberId = $("#memberId").val();

			$.ajax({
				type:"POST",
				url:"/delProfile.do",
				data:{memberId : memberId},
				success:function(data){
					if(data == 1){
						swal({
					        title: '프로필 삭제완료',
					        text: '',
					        icon: 'success'
					      }).then(function(){
					    	  window.location = "/updateInfoFrm.do";
	                      });
					}
				}
			});
			
		});
	</script>
	<script>
		var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
		var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
		  return new bootstrap.Tooltip(tooltipTriggerEl)
		})
		var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
		var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
			return new bootstrap.Popover(popoverTriggerEl)
		})	
	</script>
	<script type="text/javascript" src="/resources/js/member/updateMyInfo.js"></script>
</body>
</html>