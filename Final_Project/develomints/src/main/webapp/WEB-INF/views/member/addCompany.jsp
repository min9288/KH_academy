<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AddCompany</title>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
	.update-wrap{
		width: 700px;
		margin: 0 auto;
        padding : 20px;
        margin-bottom: 100px;
        margin-top: 50px;
	    border: 2px solid rgb(78, 205, 196);
	    border-radius: 10px;
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
    .addressWrap{
      display: flex;
      justify-content: space-between;
    }
    .addressWrap>input{
      width: 70%;
      display: inline-block;
    }
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
		<div class="container">
		  <h4 style="text-align: center; font-family: NotoBold">회사등록</h4>
			<div class="update-wrap">
			  <div class="update-middle">
			    <form action="/addCompanyInfo.do" method="post" enctype="multipart/form-data">
				  <div class="update-top">
					<label for="formFile" class="form-label" data-bs-toggle="tooltip" data-bs-placement="top" title="회사로고 추가"><img src="/resources/img/member/profile.png" id="pic" style="width: 80px; max-height:80px;"></label>
		    		<input class="form-control" type="file" id="formFile" name="files" style="display: none;" accept=".gif, .jpg, .jpeg, .png">
		    		<button type="button" class="btn btn-danger proDel" style="display:none;">로고 삭제</button>		  
				  </div><!--update-top 끝나는 지점  -->
					<div class="form-group">
					  <fieldset>
					    <label class="form-label mt-4" for="companyName">회사명</label>
					    <input class="form-control" name="companyName" id="companyName" type="text" placeholder="(주) 를 포함해서 입력해주세요">
					  </fieldset>
					</div>
					<div class="form-group">
					  <label class="col-form-label mt-4" for="openDate">창립일</label>
					  <input type="text" class="form-control" name="openDate" id="openDate" placeholder="-를 넣어서 입력해주세요">
					  <span class="expResult"></span>
					</div>
					<div class="form-group">
					  <label class="col-form-label mt-4" for="employee">사원수</label>
					  <input type="text" class="form-control" name="employee" id="employee" placeholder="숫자만 입력해주세요 ex)12000"><br>
					  <span class="expResult"></span>
					</div>
					<div class="form-group">
					  <label class="col-form-label mt-4" for="category">업종</label>
					  <input type="text" class="form-control" name="category" id="category" placeholder="구체적으로 적어주세요"><br>
					</div>
					<div class="form-group">
					  <label class="col-form-label mt-4" for="ceo">대표자명</label>
					  <input type="text" class="form-control" name="ceo" id="ceo" ><br>
					</div>
		            <div class="form-group">
		              <label class="col-form-label mt-4" for="address">주소</label>
		              <div class="addressWrap">
		                <input type="text" class="form-control" name="address" id="address" readonly="readonly">
		                <button type="button" class="btn btn-primary" onclick="postCodeCheck()">주소 찾기</button>
		              </div>
		            </div>
					<div class="form-group">
					  <label class="col-form-label mt-4" for="content">사업 내용</label>
					  <textarea class="form-control" name="content" id="content" placeholder="구체적으로 적어주세요" rows="4"></textarea><br>
					</div>
					<div class="form-group">
					  <label class="col-form-label mt-4" for="businessNo">사업자번호</label>
					  <input type="text" class="form-control" name="businessNo" id="businessNo" placeholder="-을 제외하고 적어주세요"><br>
					  <span class="expResult"></span>
					</div>
					<div class="form-group pageBtn"  style="margin-top: 30px;">			
						<button type="button" class="btn btn-primary" id="joinBtn">회사등록</button>
					</div>
		        </form>
			  </div><!--update-middle 끝나는 지점  -->
			</div><!--update-wrap 끝나는 지점  -->
		</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
				        text: '로고는 사진 20mb미만 파일만 업로드 가능합니다.',
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
					$("#pic").css("width","300px");
				}
			} 
		}
		//삭제 눌렀을때 동작하는 버튼
		$(".proDel").click(function(){
				$("#formFile").val("");
				$(this).css('display','none');
				$("#pic").attr("src", "/resources/img/member/profile.png ");
				$("#pic").css("width","80px");
			});
		var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
		var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
		  return new bootstrap.Tooltip(tooltipTriggerEl)
		})
		var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
		var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
			return new bootstrap.Popover(popoverTriggerEl)
		})
		function postCodeCheck(){
		    new daum.Postcode({
		        oncomplete: function(data) {
		            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
		            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
		        	 var roadAddr = data.roadAddress;
		             $("#address").val(roadAddr);  
		        }
		    }).open();			
		}			
	</script>
	<script>
		//정규표현식
		var openChk = false;
		var empChk = false;
		var bnumChk = false;
		//창립일 정규표현식 
		$("#openDate").on("change keyup paste", function(){
			var dayReg = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/;
			var openVal = $("#openDate").val();
			if(dayReg.test(openVal)){
	              $(".expResult").eq(0).html("");
	              $(".expResult").eq(0).removeClass("text-danger");
	              $("#openDate").removeClass("is-invalid");
	              $(".expResult").eq(0).addClass("text-success");
	              $("#openDate").addClass("is-valid");
	              openChk = true;
			}else{
	              $(".expResult").eq(0).html("날짜표기를 지켜주세요.");
	              $(".expResult").eq(0).removeClass("text-success");
	              $("#openDate").removeClass("is-valid");
	              $(".expResult").eq(0).addClass("text-danger");
	              $("#openDate").addClass("is-invalid");
	              openChk = false;	   				
			}
		});
		//사원수 정규표현식 10억못넘게
		$("#employee").on("change keyup paste",function(){
			var numReg = /^[0-9]{1,9}$/;
			var empVal = $("#employee").val();
			if(numReg.test(empVal)){
	              $(".expResult").eq(1).html("");
	              $(".expResult").eq(1).removeClass("text-danger");
	              $("#employee").removeClass("is-invalid");
	              $(".expResult").eq(1).addClass("text-success");
	              $("#employee").addClass("is-valid");
	              empChk = true;
			}else{
	              $(".expResult").eq(1).html("사원수가 너무 많습니다. ");
	              $(".expResult").eq(1).removeClass("text-success");
	              $("#employee").removeClass("is-valid");
	              $(".expResult").eq(1).addClass("text-danger");
	              $("#employee").addClass("is-invalid");
	              empChk = false;	   				
			}			
		});
		//사업자번호체크
		$("#businessNo").on("change keyup paste",function(){
			var bnoReg = /^[0-9]{10}$/;
			var bnoVal = $("#businessNo").val();
			if(bnoReg.test(bnoVal)){
	              $(".expResult").eq(2).html("");
	              $(".expResult").eq(2).removeClass("text-danger");
	              $("#businessNo").removeClass("is-invalid");
	              $(".expResult").eq(2).addClass("text-success");
	              $("#businessNo").addClass("is-valid");
	              bnumChk = true;
			}else{
	              $(".expResult").eq(2).html("사업자번호는 -를 제외한 10자입니다.");
	              $(".expResult").eq(2).removeClass("text-success");
	              $("#businessNo").removeClass("is-valid");
	              $(".expResult").eq(2).addClass("text-danger");
	              $("#businessNo").addClass("is-invalid");
	              bnumChk = false;	   				
			}			
		});
		//등록 버튼 눌렀을때 check
		$("#joinBtn").click(function(){
			var comVal = $("#companyName").val();
			var cateVal = $("#category").val();
			var addVal = $("#address").val();
			var conVal = $("#content").val();
			var ceoVal = $("#ceo").val();
			var fileVal = $("#formFile").val();
			
			if(comVal != '' && cateVal != '' && addVal != '' && conVal !='' && ceoVal != '' && fileVal != ''){
				if(openChk==true&&empChk==true&&bnumChk==true){
					$("form").submit();
				}else{
					 swal({
						   title: "등록실패",
						   text: "입력값을 전부 입력해주세요.(회사로고 포함)",
						   icon: "warning", //"info,success,warning,error" 중 택1
						   button: "돌아가기",
						})
					 return false;				
				}				
			}else{
				 swal({
					   title: "등록실패",
					   text: "값을 전부입력해주세요!",
					   icon: "error", //"info,success,warning,error" 중 택1
					   button: "돌아가기",
					})
				return false;
			}

		});
	</script>
</body>
</html>