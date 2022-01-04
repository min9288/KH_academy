<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Develomint</title>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
<link rel="stylesheet" href="/resources/css/notice/noticeList.css">
<link rel="stylesheet" href="/resources/css/notice/qnalist.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="container" style="margin-bottom: 50px;max-width: 1591px;min-width: 1591px;">
		<div class="area">
			<div class="nav-sub" style="margin-top: 30px;"><a href="/" class="text-hover">홈</a><span> > </span><a href="/noticehome.do" class="text-hover">고객센터</a><span> > </span><span>1:1 Q&A</span></div>
			<div class="title"><h2 style="color: #78c2ad;font-weight: bold;">CS Center</h2></div>
			<div class="center_tap">
				<ul style="margin-bottom: 0;">
					<li><span class="">Tel. 2163-8560</span><br><span class="last-span">평일 9:00~18:00(점심 12:00~13:00)</span></li>
					<li><a href="/n_counsel.do" class="text-hover">1:1 Q&A<br><span class="last-span">질문 전 FAQ(자주 묻는 질문)을 먼저 확인해 주세요.</span></a></li>
					<li><a href="/faq.do?category=7" class="text-hover">자주묻는질문<br><span class="last-span">자주묻는질문</span></a></li>
				</ul>
			</div>
			<div class="question1">
			  <!--  확인 Modal-->
				<div class="modal" id="testModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog" role="document" style="top: 30%">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title">알림</h5>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true"></span>
				        </button>
				      </div>
				      <div class="modal-body">
				        <p>현재 로그인이 되어있지 않습니다.</p>
				        <p>로그인 후 1:1 Q&A 진행하시겠습니까?</p>
				        <p class="text-danger">*'아니요'선택 시 비회원 전용 Q&A로 진행되며 비밀번호를 기억하셔야 합니다.</p>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-primary btn_yes">예</button>
				        <button type="button" class="btn btn-secondary btn_no" data-bs-dismiss="modal">아니오</button>
				      </div>
				    </div>
				  </div>
				</div>
			</div>
			<!-- 모달 끝  -->
			<form  method="post" enctype="multipart/form-data" id="f1" name="f1">
				<div class="contents">
					<!-- 제목 -->
					<c:choose>
						<c:when test="${empty sessionScope.m }">
							<h3>비회원 1:1 Q&A</h3>
						</c:when>
						<c:otherwise>
							<h3>1:1 Q&A</h3>
						</c:otherwise>
					</c:choose>
					<!-- 주의사항 -->
					<ul style="padding: 0">
						<li class="text-danger"><i class="bi bi-arrow-right-short"></i>Q&A 내 상담내역은은 <a href="/noticehome.do" style="display: inline-block;font-weight: bold;" class="text-danger">공지사항</a> > 
						<c:choose>
							<c:when test="${empty sessionScope.m }">
							<a href="/nonMember_CounselList.do" style="display: inline-block;font-weight: bold;" class="text-danger">상담내역</a>
							</c:when>
							<c:otherwise>
								<a href="/myCounsel.do" style="display: inline-block;font-weight: bold;" class="text-danger">상담내역</a>
							</c:otherwise>
						</c:choose>에서 확인하실 수 있습니다.</li>
						<li class="text-danger"><i class="bi bi-arrow-right-short"></i>프로젝트 정보 및 공모전 관련 문의는 해당 문의에 남기셔야 빠른 답변이 가능합니다.</li>
						<li><i class="bi bi-arrow-right-short"></i>사기접수시 비회원으로 문의하시면 정보보호로 인해 일부만 확인가능하십니다.</li>
						<li><i class="bi bi-arrow-right-short"></i>취소/신청/게시물보기는 마이페이지에서 확인 하실 수 있습니다.</li>
						<li><i class="bi bi-arrow-right-short"></i>로그인 후 이용하실경우 첨부파일을 넣을 수가 있습니다.</li>
					</ul>
					<!-- 폼돌아가는구간 -->
					<div class="section_form">
						<div class="harf_area" style="padding-right: 20px !important;">
							<header class="n-section-title">
								<i class="bi bi-info-circle" style="font-size: 2em;padding-right: 10px;"></i><span style="font-size: 20px;">문의 작성</span>
							</header>
							<div class="form-group">
						     	<label for="category" class="form-label mt-4">문의유형</label>
							    	<select class="form-select" id="category" name="category" required>
								      	<option value="">문의유형 선택</option>
										<option value="7">로그인관련</option>
										<option value="8">고수관련</option>
										<option value="9">환불관련</option>
										<option value="10">공모전관련</option>
										<option value="11">구인잡관련</option>
										<option value="12">커뮤니티관련</option>
										<option value="13">이용안내</option>
										<option value="14">팀프로젝트 관련</option>
										<option value="40">기타 문의</option>
										<option value="22">신고</option>
										<option value="21">기능/작동 오류</option>
										<option value="20">이벤트</option>
						     		</select>
						  	</div>
							<c:choose>
								<c:when test="${empty sessionScope.m }">
									<label for="email" class="form-label mt-4" scope="row" >작성자</label>
									<!-- <input type="email" class="n-input" name="email" placeholder="예)examEmail@gmail.com" required>
									<P>이메일을 기억하셔야 비회원 전용으로 찾기 시 용이합니다. </P> -->
									<div class="form-group">
										<input type="email" class="form-control" id="email" name="email" aria-describedby="emailHelp" placeholder="Enter email">
										<small id="emailHelp" class="form-text text-danger">이메일을 기억하셔야 비회원 전용으로 찾기 시 용이합니다. </small>
									</div>
								</c:when>
								<c:otherwise>
									<label for="memberId" class="form-label mt-4" scope="row" >작성자</label>
									<div class="form-group">
										<input type="text" class="n-input form-control" id="memberId" name="memberId" value="${sessionScope.m.memberId }" readonly>
										<small id="emailHelp" class="form-text text-muted">답변확인은 <a href="/mypage.do" style="display: inline-block;">마이페이지</a> > <a href="/myCounsel.do" style="display: inline-block;">내 Q & A</a>로 확인하실수 있습니다.</small>
									</div>
								</c:otherwise>
							</c:choose>
							<div class="form-group">
							  <label class="col-form-label mt-4" for="qnaTitle" scope="row">제목</label>
							  <input type="text" class="form-control" value="" placeholder="제목을 입력해주세요." id="qnaTitle" name="qnaTitle" required>
							</div>
							<div class="form-group">
						      <label for="qnaContent" class="form-label mt-4" scope="row">문의내용</label>
						      <textarea class="form-control" id="qnaContent" name="qnaContent" cols="100" rows="20" placeholder="내용을 입력해주세요." required style="resize: none;"></textarea>
						    </div>
						    <c:choose>
						    	<c:when test="${not empty sessionScope.m }">
								    <div class="form-group" >
								    	<label scope="row" style="display: block;">사진</label><small class="text-danger">파일을 여러개 올리실 경우 한번에 선택해 주세요!</small>
								    	<div class="div-flex">
									    	<ul class="file_show div-flex" id="file_show" style="list-style-type: none;padding: 0;display: inline-block;">
																									</ul>
											<button type="button" class="btn-file" onclick="$('#Filedata').click();">파일 선택</button>
											<span id="file_message" style="color: red;font-weight: bold;"></span>
								    	</div>
								    </div>
								    <!-- <div class="form-group">
								      <label for="formFile" class="form-label mt-4"> 첨부파일</label>
								      <input class="form-control" type="file" name="files" multiple>
								    </div> -->
						    	</c:when>
						    </c:choose>
							<c:choose>
								<c:when test="${empty sessionScope.m }">
									<div class="form-group">
								      <label for="qna_pw" class="form-label mt-4">비밀번호</label>
								      <input type="password" class="form-control" id="qnaPw" name="qnaPw" placeholder="패스워드를 입력" style="width: 20%">
								      <small id="emailHelp" class="form-text text-danger">답변확인을 위해 꼭 비밀번호를 기억하세요! </small>
								    </div>
								</c:when>
							</c:choose>
						</div>
						<!-- faq 오른쪽 -->
						<div id="faq_list" class="harf_area" style="padding-left: 20px !important;" ></div>
					</div>
					<!-- 폼돌아가는구간 끝  -->
					<!-- 버튼 -->
					<div class="n-btn-group" style="margin: 10px;">
						<a href="javascript:void(0)" onClick="cancel(); return false;" class="btn btn-outline-secondary" style="margin: 0 10px;">취소</a>
						<c:choose>
							<c:when test="${empty sessionScope.m }">
								<a href="javascript:void(0)" onClick="qna_add1(); return false;" class="btn btn-primary">작성하기</a>
							</c:when>
							<c:otherwise>
								<a href="javascript:void(0)" onClick="qna_add2(); return false;" class="btn btn-primary">작성하기</a>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<input type="file" name="Filedata" id="Filedata" class="input_file" onchange="loadImg(this);" style="display: none !important;" multiple accept=".gif, .jpg, .jpeg, .png">
			</form>
			<%-- <form action="upload_form.do" id="upload_form" name="upload_form" method="post" enctype="multipart/form-data">
				<!-- <input type="file" id="Filedata" class="input_file" onchange="uploadImage();" style="display: none !important;" /> -->
				<input type="hidden" name="memberId" value="${sessionScope.m.memberNo }">
			</form> --%>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script type="text/javascript">
		var memberNo = $("input[name=memberId]").val(); 
		var category = '';
		var old_faq_idx = "";
		
		 $(function(){
			if(${empty sessionScope.m}){
				$('#testModal').modal("show");
				$(".btn_yes").click(function(){
					location.href ="/loginFrm.do";
				});
			};
			
			// 초기출력
			viewFAQList(category);
			$('#f1 [name=category]').on('change', function() {

				if ($(this).val() == '22') {
					$('textarea[name=qnaContent]').text('정확한 답변을 드리기 위해, 아래 상세 내용들이 필요합니다. 1. 오류 발생 일시:2. 접속한 환경(모바일, PC 등):3. PC 환경이었다면 브라우저 종류(익스플로러, 크롬 등):4. 모바일 환경이었다면 OS 버전(안드로이드 11, iOS 14 등):5. 상세한 오류 발생 내용:');
					
				} else {
					$('textarea[name=qnaContent]').text('');
				}

		        viewFAQList($(this).val());
			});
			
			// 등록 이미지 삭제
			$('body').on('click', '.del-image', function() {
				$(this).parents('li').remove();
				$(".btn-file").removeClass("disabled");
				$(".btn-file").attr("onclick","$('#Filedata').click();");
			});
		}); 
		
		function viewFAQList(idx) {
			$('#f1 [name=category]').val(idx);
			idx = idx == '' ? 7 : idx;
			if(old_faq_idx !== idx) {
				request_service(idx);
			}
			old_faq_idx = idx;

		}
		
		 function request_service(idx) {
			var target_url = "/faqlist.do?category="+idx;

			$.ajax({
				type: "GET",
				url: target_url,
				success: function(msg) {
					$("#faq_list").html(msg);
				}
			});
		} 
		
		function cancel() {
			if(confirm('취소하시겠습니까?')){
				history.back();
			}
		}
		/* 비회원일경우  */
		function qna_add1() {
			var f1 = $('#f1');

			if($('#f1 [name=category]').val() == '') {
				alert('문의유형을 선택해 주십시오.');
				$('#f1 [name=category]').focus();
				return false;
			}
			if($.trim($('#f1 [name=email]').val()) == '') {
				alert('이메일주소를 입력하세요.');
				return false;
			} else {
				var filter  = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
				if(!filter.test($('#f1 [name=email]').val())) {
					alert('올바른 이메일 형식으로 입력해 주십시오.');
					return false;
				}
			}
			if($.trim($('#f1 [name=qnaTitle]').val()) == '') {
				alert('제목을 입력해 주십시오.');
				$('#f1 [name=qnaTitle]').focus();
				return false;
			}
			if(!$.trim($('#f1 [name=qnaContent]').val())) {
				alert('문의내용을 입력해 주십시오.');
				$('#f1 [name=qnaContent]').focus();
				return false;
			}
			//var pwReg = /^[a-zA-Z0-9]+{4,}$/;
			var pwReg = /^[a-z][a-zA-Z0-9]{3,}$/;
			if($.trim($('#f1 [name=qnaPw]').val()) == ''){
				alert('비밀번호를 입력해주십시오.');
				return false;
			}
			if(!pwReg.test($('#f1 [name=qnaPw]').val())){
					alert('총 4글자 이상, 첫글자는 소문자로 입력해주십시오.');
					$('#f1 [name=qna_pw]').focus();
					return false;
			}
			
			/* if(confirm("작성하시겠습니까?")){
				$("form").attr("action", "/counsel_save1.do");
				f1.submit();
			} */
			swal({
	 			  title: "문의 작성",
	 			  text: "Q&A문의를 작성하시겠습니까?",
	 			  icon: "warning",
	 			  buttons: true,
	 			  dangerMode: true,
	 			})
	 			.then((willDelete) => {
	 			  if (willDelete) {
	 				 $("form").attr("action", "/counsel_save1.do");
	 				f1.submit();
	 			  }
	 			});
		}
		
		/* 회원일경우 */
		function qna_add2() {
			var f1 = $('#f1');

			if($('#f1 [name=category]').val() == '') {
				alert('문의유형을 선택해 주십시오.');
				$('#f1 [name=category]').focus();
				return false;
			}
			if($.trim($('#f1 [name=memberId]').val()) == '') {
				alert('작성자를 입력해 주십시오.');
				$('#f1 [name=memberId]').focus();
				return false;
			}
			if($.trim($('#f1 [name=qnaTitle]').val()) == '') {
				alert('제목을 입력해 주십시오.');
				$('#f1 [name=qnaTitle]').focus();
				return false;
			}
			if(!$.trim($('#f1 [name=qnaContent]').val())) {
				alert('문의내용을 입력해 주십시오.');
				$('#f1 [name=qnaContent]').focus();
				return false;
			}

			/* 
			 // 파일 업로드 컨텐츠 넣기
			var file_contents = "";
			$.each($('#file_show li'), function(index, item) {
				var img_src = $(this).children('img').attr('src');
				file_contents += '<br/><img src="'+ img_src +'"/>';
			});

			var contents = qa_msg + file_contents;
			$('#f1 [name=qnaContent]').val(contents);  */
			
			/* if(confirm("작성하시겠습니까?")){
				$("form").attr("action", "/counsel_save2.do");
				f1.submit();
			} */
			swal({
	 			  title: "문의 작성",
	 			  text: "Q&A문의를 작성하시겠습니까?",
	 			  icon: "warning",
	 			  buttons: true,
	 			  dangerMode: true,
	 			})
	 			.then((willDelete) => {
	 			  if (willDelete) {
	 				 $("form").attr("action", "/counsel_save2.do");
	 				f1.submit();
	 			  }
	 			});
			
		}
		
		function uploadImage() {
			$("#file_message").text('').hide();
			var ff = $('#upload_form').get(0);
			var formData = new FormData(ff);

			$.ajax({
				cache : false,
				url : "/fileupload.do",
				enctype : 'multipart/form-data',
				processData: false,
				contentType: false,
				type : 'POST',
				data : formData,
				success : function(file_url) {
					var image_tag = "<li><img  src=\"" + file_url +  "\" /><a class=\"del-image\" href=\"javascript:void(0);\"><i class=\"bi bi-x-circle-fill\"></i></a></li>";
					$("#file_show").append(image_tag);
				}
			});

			ff.reset();
		} 
		
		function loadImg(obj){
			var files=obj.files;
			if(files.length!=0){
				var reader=new FileReader();
				reader.readAsDataURL(files[0]);
				reader.onload=function(e){
					/* $("#img-view").attr("src",e.target.result); */
					var image_tag = "<li><img style=\"width: 65px;height: 65px;\" src=\"" + e.target.result + "\" /><a class=\"del-image\" href=\"javascript:void(0);\"><i class=\"bi bi-x-circle-fill\"></i></a></li>";
					files.value += (files.value != "") ? "," + e.target.result : e.target.result;
					$("#file_show").append(image_tag);
					$(".btn-file").addClass("disabled");
					$(".btn-file").removeAttr("onclick");
				}
			}else{
				$("#img-view").attr("src","");
			}
		}
		/* function SetImage(result, message, file_url) {
			var ff = document.upload_form;

			if(result) {
				var image_tag = "<li><img src=\"" + file_url + "\" /><a class=\"del-image\" href=\"javascript:void(0);\"><i class=\"bi bi-x-circle-fill ic-white\"></i></a></li>";
				$("#file_show").append(image_tag);
			} else {
				$("#file_message").text(message).show();
			}
		} */
		
		$("#Filedata").change(function(){
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
				        text: '로고는 사진 20mb미만 파일만 업로드 가능합니다.',
				        icon: 'warning'
				      })
					$("#filepath").val("");
					return;
				}
			}else if(fileVal == ""){
				$("#filepath").val("");
				return;
			}else{
				swal({
			        title: '확장자를 확인해주세요!',
			        text: '첨부파일은 이미지 파일만 가능합니다.',
			        icon: 'warning'
			      })
				$("#filepath").val("");
				return;
			}
		});
		
	</script>
</body>
</html>