<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<meta charset="UTF-8">
<title>Apply Update Form</title>
</head>

<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script src="/resources/js/projectTeam/plugin/bootstrap-datepicker.js"></script>
	<script src="/resources/js/projectTeam/plugin/bootstrap-datepicker.ko.min.js"></script>
	<script src="/resources/summernote/summernote-lite.js"></script>
	<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="/resources/summernote/summernote-lite.css">
	<link rel="stylesheet" href="/resources/css/projectTeam/bootstrap-datepicker.css">
	<link rel="stylesheet" href="/resources/css/projectTeam/writePage.css">

<script>
	$(function(){
		
		$("input[type='checkbox']").on("click", function(){
			var count = $(".btn-check:checked").length;
			if(count>3){
				$(this).prop("checked", false);
				swal("선택 값 초과", "최대 3개 까지 선택이 가능합니다.", "warning");
			}
		});
		
	
		$(".return_img").click(function(){
			history.back();
		});
		
	});
	
	function checkValue(){
        if(($(".btn-check:checked").length == 0) || ($("#inputLarge").val() == "") || ($("input[name=applyContent]").val() == "")) {
        	swal("체크하지 않거나 입력되지 않은 값이 있습니다.", "비어있는 입력값이 있는지 다시 한번 확인해주세요!", "warning");
        	return false;
        } 
    }
	
</script>
	
	<div class="container" id="projectContainer">
		<div class="main">
            <div class="returnPage">
                <img class="return_img" src="/resources/img/recruitTeamProject/writePage/left.png">
            </div>
            <div class="main_content">
	            <form action="/updateApplyForm.do?sessionMemberNo=${sessionScope.m.memberNo}&projectNo=${pe.projectNo}&entryNo=${pe.entryNo}" method="post" enctype="multipart/form-data" onsubmit="return checkValue();">
		            <div class="writeBox">
	                    <div class="form-group">
	                        <input class="form-control form-control-lg" type="text" id="inputLarge" name="ambition" maxlength="30" value="${pe.ambition}">
	                    </div>
	                    <div class="writeLine">
	                        <div class="titleFlexBox">
	                            <img class="iconImg" src="/resources/img/recruitTeamProject/writePage/code.png">
	                            <p class="titleText">사용 언어(최대 3개 까지 선택 가능)</p>
	                        </div>
	                        <div class="checkboxFlexList">
	                            <div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
	                            	<c:forEach items="${dlList }" var="dll" begin="0" end="7" step="1">
	                            		<input type="checkbox" class="btn-check" id="${dll.langName }" autocomplete="off" name="chk" value="${dll.langName }">
	                                	<label class="btn btn-primary" for="${dll.langName }" >${dll.langName }</label>
	                            	</c:forEach>
	                            </div>
	                            <div class="btn-group" role="group" aria-label="Basic checkbox toggle button group" id="bottomCheckBox">
	                                <c:forEach items="${dlList }" var="dll" begin="8" end="15" step="1">
	                            		<input type="checkbox" class="btn-check" id="${dll.langName }" autocomplete="off" name="chk" value="${dll.langName }">
	                                	<label class="btn btn-primary" for="${dll.langName }" >${dll.langName }</label>
	                            	</c:forEach>
	                            </div>
	                            <div class="btn-group" role="group" aria-label="Basic checkbox toggle button group" id="bottomCheckBox">
	                                <c:forEach items="${dlList }" var="dll" begin="16" end="23" step="1">
	                            		<input type="checkbox" class="btn-check" id="${dll.langName }" autocomplete="off" name="chk" value="${dll.langName }">
	                                	<label class="btn btn-primary" for="${dll.langName }" >${dll.langName }</label>
	                            	</c:forEach>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="line"></div>
	                    <div class="writeLine">
	                        <div class="titleFlexBox">
	                            <img class="iconImg" src="/resources/img/recruitTeamProject/writePage/content-creator.png">
	                            <p class="titleText">지원사유</p>
	                        </div>
	                        <div class="form-group">
	                            <textarea class="form-control" id="summernote" rows="3" name="applyContent" >${pe.applyContent }</textarea>
	                        </div>
	                    </div>
	                    <div class="finalLine"></div>
	                    <div class="submitBtnBox">
	                    	<input type="hidden" name="memberNo" value="${pe.memberNo}">
	                    	<input type="hidden" name="projectNo" value="${projectNo }">
	                        <button type="submit" class="btn btn-primary btn-lg" onclick="return checkValue();">수정</button>
	                    </div>
	                </div>
		        </form>
            </div>
        </div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script>
	$(function(){
		 
		$("#summernote").summernote({
			height : 700,
			lang : "ko-KR",
			focus: false,
			placeholder: '프로젝트 공고내용을 자세히 작성해주세요..!',
			toolbar:[ 
						['fontname', ['fontname']],
						['fontsize', ['fontsize']], 
						['style', ['bold', 'italic', 'underline','strikethrough', 'clear']], 
						['color', ['forecolor','color']], 
						['table', ['table']], 
						['para', ['ul', 'ol', 'paragraph']], 
						['height', ['height']], 
						['insert',['picture','link']], 
						['view', ['fullscreen', 'codeview', 'help']] 
					], 
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'], 
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
			callbacks:{
				onImageUpload : function(files){
 					uploadImage(files[0], this);
 				}
			}
		});
	});
	
	function uploadImage(file, editor){
		data = new FormData();
		data.append("file",file);
		var fileData = $("input[name=files]").val();
		$.ajax({
			url : "/rUploadImage.do",
			type :"post",		//file전송을 위해 ajax를 할떄는 type을 post로 해줘야한다
			data : data,
			enctype : 'multipart/form-data',
			processData : false,
			contentType : false,
			success : function(data){
				$(editor).summernote("insertImage",data);
				
			}
		});
	}
	
	$(function() {	
		$('#datePicker').datepicker({
		    format: "yyyy-mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
		    startDate: '+1d',	//달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
		    endDate: '+14d',	//달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
		    autoclose : true,	//사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
		    calendarWeeks : false, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
		    clearBtn : false, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
		    /* datesDisabled : ['2019-06-24','2019-06-26'],//선택 불가능한 일 설정 하는 배열 위에 있는 format 과 형식이 같아야함. */
		    /* daysOfWeekDisabled : [0,6],	//선택 불가능한 요일 설정 0 : 일요일 ~ 6 : 토요일
		    daysOfWeekHighlighted : [3], //강조 되어야 하는 요일 설정 */
		    disableTouchKeyboard : false,	//모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
		    immediateUpdates: false,	//사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false 
		    multidate : false, //여러 날짜 선택할 수 있게 하는 옵션 기본값 :false 
		    multidateSeparator :",", //여러 날짜를 선택했을 때 사이에 나타나는 글짜 2019-05-01,2019-06-01
		    templates : {
		        leftArrow: '&laquo;',
		        rightArrow: '&raquo;'
		    }, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징 
		    showWeekDays : true ,// 위에 요일 보여주는 옵션 기본값 : true
		    title: "마감일 선택",	//캘린더 상단에 보여주는 타이틀
		    todayHighlight : true ,	//오늘 날짜에 하이라이팅 기능 기본값 :false 
		    toggleActive : true,	//이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
		    weekStart : 0 ,//달력 시작 요일 선택하는 것 기본값은 0인 일요일 
		    language : "ko"	//달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
		    
		});//datepicker end
	});//ready end
	</script>
	
</body>
</html>