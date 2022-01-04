<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Develomints</title>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
	.form-wrap{
		width: 400px;
		margin: 100px auto;
	}
	.checkBtn{
		margin-top: 50px;
	}
	#checkBtn{
		width: 100%;
	}
	.topper>*{
		margin-right: 20px;
		margin-bottom: 20px;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
		<div class="container">
			<div class="form-wrap">
					<div class="topper">
						<span style="font-family: NotoBold;font-size: 26px;">기업고객인증</span><img src="/resources/img/member/management.png" style="width: 60px; height: 60px;">
					</div>
				    <div class="form-group">
				    <input type="hidden" name="memberId" id="memberId" value="${sessionScope.m.memberId }">
				      <label for="comNo" class="form-label mt-4">사업자 등록번호</label>
				      <input type="text" class="form-control" id="comNo" name="comNo" placeholder="-을 제외한 번호만 입력해주세요">
				      <span class="expResult"></span>
				    </div>
					<div class="form-group">
					  <label class="col-form-label mt-4" for="managerName">대표자 명</label>
					  <input type="text" class="form-control" placeholder="성함을 입력해주세요" name="managerName" id="managerName">
					</div>
					<div class="form-group">
					  <label class="col-form-label mt-4" for="openDate">개업일자</label>
					  <input type="text" class="form-control" placeholder="연,월,일 -을 제외하고 입력해주세요 ex)20211208" id="openDate">
					</div>
				    <div class="checkBtn">
				      <button type="button" class="btn btn-primary" id="checkBtn">정보변경</button>
				    </div>
				    <br>		
					<p class="text-danger">* 기업고객 사칭시 관련법에 의거 처벌받으실 수 있습니다.</p>
			</div>
		</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script>
		$("#checkBtn").click(function(){
			var memberVal = $("#memberId").val();
			var comNo = $("#comNo").val();
			var manager = $("#managerName").val();
			var openDate = $("#openDate").val();
			if(comNo==""||manager==""||openDate==""){
                swal({
                    title: "정보를 전부 입력해 주셔야 합니다.",
                    text: "다시 확인해주세요!",
                    icon: "error", //"info,success,warning,error" 중 택1
                    button: "돌아가기",
                    })	
				return false;
			}
			
			var settings = {
					  "url": "http://api.odcloud.kr/api/nts-businessman/v1/validate?serviceKey=ZXsaFkh%2BoCJI6xNJEELqtL1VnywPMUtEVrCrI%2F4YixdB1OOsvy9FQjaODPXsDPdVGSeGS2Zd0JdRb9IMrXR4UQ%3D%3D",
					  "method": "POST",
					  "timeout": 0,
					  "headers": {
					    "Content-Type": "application/json"
					  },
					  "data": JSON.stringify({
					    "businesses": [
					      {
					        "b_no": comNo,
					        "start_dt": openDate,
					        "p_nm": manager
					      }
					    ]
					  }),
					};
					
					$.ajax(settings).done(function (response) {
					  var valid = response.data[0].valid;
					  console.log(comNo);
					  if(valid == "01"){
						  $.ajax({
							 url : "/addCompany.do",
							 data : {memberId : memberVal , businessNo : comNo },
							 type : "post",
							 success : function(data){
								 if(data == 1){
					                    swal({
					                        title: '기업인증완료!',
					                        text: '다시 로그인해 주세요!',
					                        icon: 'success'
					                      }).then(function(){
					                    	 window.location = "/logout.do"; 
					                      });
								 }else if(data == 0){
					                    swal({
					                        title: '귀사는 저희 페이지에 연동되어있지 않습니다.',
					                        text: '제휴 문의 : develeomints@gmail.com',
					                        icon: 'error'
					                      });							 
								 }else if(data == 2){
					                    swal({
					                        title: '기업인증은 한명만 가능합니다.',
					                        text: '귀사명의로 인증받은 계정이 존재합니다.',
					                        icon: 'error'
					                      });										 
								 }
							 }
						  });
					  }else{
                          swal({
                              title: "입력하신 정보가 조회되지 않습니다.",
                              text: "입력	하신 정보를 다시 확인해주세요",
                              icon: "error", //"info,success,warning,error" 중 택1
                              button: "돌아가기",
                              })						  
					  }
					});			
		});
	</script>
</body>
</html>