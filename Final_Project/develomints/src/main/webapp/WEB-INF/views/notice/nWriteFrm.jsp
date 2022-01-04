<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <c:set var="today" value="<%=new java.util.Date()%>"/>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Develomint</title>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
<link rel="stylesheet" href="/resources/css/notice/noticeList.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<script src="/resources/summernote/summernote-lite.js"></script>
	<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="/resources/summernote/summernote-lite.css">
	<link rel="stylesheet" href="/resources/css/projectTeam/bootstrap-datepicker.css">
	<link rel="stylesheet" href="/resources/css/projectTeam/writePage.css">

	<div class="container" style="margin-bottom: 50px;">
		<div class="area">
			<div class="nav-sub" style="margin-top: 30px;"><a href="/" class="text-hover">홈</a><span> > </span><a href="/noticehome.do" class="text-hover">고객센터</a><span> > </span><span>공지사항</span></div>
			<div class="title"><h2 style="color: #78c2ad;font-weight: bold;">CS Center</h2></div>
			<div class="center_tap">
				<ul>
					<li><span class="">Tel. 2163-8560</span><br><span class="last-span">평일 9:20~18:30(점심 12:20~13:30)</span></li>
					<li><a href="/n_counsel.do" class="text-hover">1:1 Q&A<br><span class="last-span">질문 전 FAQ(자주 묻는 질문)을 먼저 확인해 주세요.</span></a></li>
					<li><a href="/faq.do?category=7" class="text-hover">자주묻는질문<br><span class="last-span">자주묻는질문</span></a></li>
				</ul>
			</div>
			<c:if test="${sessionScope.m.memberType eq 9 }">
			<div class="contents" style="padding: 20px;">
				<div class="title" style="border-bottom: none;padding: 0;"><h2 style="display: inline-block;">Notice Write</h2> 작성날짜 <fmt:formatDate value="${today}" pattern="yyyy-MM-dd" /></div>
				<div class="notice-contents" style="padding: 0;border-bottom: none;">
					<form action="/insertNotice.do" method="post" enctype="multipart/form-data">
						<fieldset>
						<label class="col-form-label mt-4" for="noticeTitle"><i class="bi bi-toggles" style="font-size: 1.2em;"></i> 상단게시물 고정유무<span style="color: #f3969a;font-size: ">*</span></label>
					    <div class="form-check form-switch">
				        	<input class="form-check-input" type="checkbox" id="pin" name="pin" value="1">
				        	<label class="form-check-label" for="pin">상단게시물 고정</label>
				      	</div>
						<div class="form-group">
						  <label class="col-form-label mt-4" for="noticeWriter"><i class="bi bi-hand-index" style="font-size: 1.2em;"></i> 작성자<span style="color: #f3969a;">*</span></label>
						  <input type="text" class="form-control" id="noticeWriter" name="noticeWriter" value="${sessionScope.m.memberId }" readonly>
						</div>
						<div class="form-group">
						  <label class="col-form-label mt-4" for="noticeTitle"><i class="bi bi-pencil" style="font-size: 1.2em;"></i> 공지 제목<span style="color: #f3969a;">*</span></label>
						  <input type="text" class="form-control" placeholder="제목을 입력하세요" id="noticeTitle" name="noticeTitle" required>
						</div>
						<div class="form-group">
					      <label for="formFile" class="form-label mt-4"><i class="bi bi-files" style="font-size: 1.2em;"></i> 첨부파일<span style="font-size: small;color: #999;"> *파일첨부는 한 개만 가능합니다</span></label>
					      <input class="form-control" type="file" name="files" multiple>
					    </div>
						<div class="form-group">
							<label class="col-form-label mt-4" for="noticeContent"><i class="bi bi-pencil-square" style="font-size: 1.2em;"></i> 공지 내용<span style="color: #f3969a;">*</span><span style="color: #f3969a;font-weight: bold;padding-left: 20px;">남은 글자 수<span id="maxContentPost">3000</span></span></label>
                            <textarea class="form-control" id="noticeContent" rows="20" name="noticeContent" required ></textarea>
                            <p style="color: #f3969a;">*는 필수 입력사항입니다.</p>
                        </div>
                        <div class="form-group" style="padding: 10px 0 0 0;float: right;">
                        	<button type="submit" class="btn btn-primary" id="nWriteBtn">Submit</button>
                        </div>
                         </fieldset>
					</form>
				</div>
			</div>
			</c:if>
		</div>
	</div>
	<script>
		$(function(){
			$("#pin").click(function(){
			if($("#pin").is(':checked')== true){
				$("#pin").attr('value',2);
				console.log($("#pin").val());
			}else if($("#pin").is(':checked')== false){
				$("#pin").attr('value',1);
				console.log($("#pin").val());
			}
		});
		
		console.log($("#pin").val());
		$("#noticeContent").summernote({
			height : 500,
			minHeight: 500,             // 최소 높이
		  	maxHeight: 500,
		  	focus: true,
			lang : "ko-KR",
			placeholder: '최대 3000자까지 쓸 수 있습니다',
			toolbar: [
			    // [groupName, [list of button]]
			    ['fontname', ['fontname']],
			    ['fontsize', ['fontsize']],
			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			    ['color', ['forecolor','color']],
			    ['table', ['table']],
			    ['para', ['ul', 'ol', 'paragraph']],
			    ['height', ['height']],
			    ['insert',['picture','link','video']],
			    ['view', ['fullscreen', 'help']]
			  ],
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
			callbacks :{
				onImageUpload : function(files){
					uploadImage(files[0],this);	
				},
				onKeydown: function (e) { 
                    var t = e.currentTarget.innerText; 
                    if (t.trim().length >= 3000) {
                        //delete keys, arrow keys, copy, cut, select all
                        if (e.keyCode != 8 && !(e.keyCode >=37 && e.keyCode <=40) && e.keyCode != 46 && !(e.keyCode == 88 && e.ctrlKey) && !(e.keyCode == 67 && e.ctrlKey) && !(e.keyCode == 65 && e.ctrlKey))
                        e.preventDefault(); 
                    } 
                },
                onKeyup: function (e) {
                    var t = e.currentTarget.innerText;
                    $('#maxContentPost').text(3000 - t.trim().length);
                    console.log($('#maxContentPost').text());
                },
                onPaste: function (e) {
                    var t = e.currentTarget.innerText;
                    var bufferText = ((e.originalEvent || e).clipboardData || window.clipboardData).getData('Text');
                    e.preventDefault();
                    var maxPaste = bufferText.length;
                    if(t.length + bufferText.length > 3000){
                        maxPaste = 3000 - t.length;
                    }
                    if(maxPaste > 0){
                        document.execCommand('insertText', false, bufferText.substring(0, maxPaste));
                    }
                    $('#maxContentPost').text(3000 - t.length);
                    console.log($('#maxContentPost').text());
                }
				
			}
		});
		
		/* function keyDownSize(obj){
			if(obj.val().length > 500) {
	            obj.val(obj.val().substring(0, 500));
	            //$('#test_cnt').html("(100 / 100)");
	        }
		} */
					
		/* $("#noticeContent").on('keyup',function(){
			if($(this).val().length > 500){
				$(this).val($(this).val().substring(0,500);
			}
		}); */
		
		$("#nWriteBtn").click(function(){
			 if($("#noticeTitle").val()==""||$("#noticeContent").val()==""){
				 swal({
					   title: "등록실패",
					   text: "입력값을  다시 확인해주세요.",
					   icon: "warning", //"info,success,warning,error" 중 택1
					   button: "돌아가기",
					})
				 return false;
			 }
		  });
	});
	function uploadImage(file,editor){
		data = new FormData();
		data.append("file",file);
		$.ajax({
			url : "/uploadImage.do",
			type :"post",		//file전송을 위해 ajax를 할떄는 type을 post로 해줘야한다
			data : data,
			enctype : 'multipart/form-data',
			processData : false,
			contentType : false,
			success : function(data){
				console.log(data);
				
				$(editor).summernote("insertImage",data);
			}
		});
	}
	
</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>