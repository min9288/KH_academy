<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<link rel="stylesheet" href="/resources/summernote/summernote-lite.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Develomint</title>
<style>
.container * {
	text-decoration: none;
}

.note-modal-footer {
	height: 60px !important;
}

.container {
	min-width: 1200px;
}

input:focus, textarea:focus {
	outline: none;
}

.container>h3 {
	display: flex;
	justify-content: center;
	margin-top: 50px;
	font-size: 45px;
	font-weight: 900;
}

.talk-wrap {
	display: flex;
	flex-direction: column;
	padding: 30px;
	margin-bottom: 50px;
}

.g-feedback h3 {
	font-weight: bold;
	margin-top: 100px;
	margin-bottom: 40px;
}

.g-feedback span {
	padding: 20px;
}

.talk-one {
	width: 50%;
	margin-bottom: 50px;
	align-self: flex-start;
	padding: 20px;
	overflow: auto;
}

.talk-one p * {
	background-color: transparent !important;
}

.talk-one tr:last-child td:last-child {
	padding: 20px;
	background-color: white;
	box-shadow: 0px 0 15px 0px rgb(0 0 0/ 15%);
}

.talk-me tr:last-child td:last-child {
	background-color: #d0f0f7;
}

.talk-one table th img {
	border-radius: 50%;
	width: 60px;
	height: 60px;
}

.talk-one table {
	width: 100%;
}

.talk-me {
	align-self: flex-end !important;
}

.talk-sub {
	display: flex;
	justify-content: center;
}

.talk-sub>div {
	padding: 40px;
	padding-left: 60px;
	padding-right: 60px;
	width: 1100px;
}

.talk-sub table th, .talk-sub table td {
	padding: 10px;
}

.gosu-mail {
	display: flex;
	justify-content: right;
}

.gosu-mail a {
	font-weight: bold;
	font-size: 20px;
}

.gosu-mail span {
	font-weight: bold;
	color: white;
	background-color: red;
	border-radius: 50%;
	text-align: center;
	width: 20px;
	margin-left: 50px;
	display: block;
	font-size: 13px;
}

.container>.g-msg {
	margin: 50px;
	display: flex;
	justify-content: center;
	color: rgb(153, 153, 153);
	text-align: center;
	font-size: 13px;
	font-weight: bold;
}

.summerContentTop {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-top: 20px;
}

#underhover:hover {
	text-decoration: underline;
}

.widthwidth {
	width: 100%;
}

.upbtn:hover {
	-webkit-transform: scale(1.03);
	transform: scale(1.03);
}

.req-wrap {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	display: flex;
	align-items: center;
	justify-content: center;
	z-index: 10000;
}

#req-modal {
	background-color: rgb(235, 242, 235);
	width: 800px;
	padding: 30px;
}

.req-btn-wrap {
	width: 100%;
	display: flex;
	justify-content: center;
}

.req-btn-wrap a {
	margin: 20px;
	padding: 10px;
	width: 100px;
}

.req-content span {
	font-size: 20px;
	font-weight: 900;
}

.req-content input {
	border: none;
	background: transparent;
	text-align: center;
	margin-top: 20px;
	margin-bottom: 20px;
}

.req-content td {
	font-size: 20px;
	font-weight: 900;
	width: 600px;
}

.req-content th {
	font-size: 20px;
	font-weight: 900;
	width: 200px;
}

.g-req-box {
	border: 3px solid rgb(70, 147, 127);
	background-color: white;
	border-radius: 30px;
}

.g-req-box li {
	padding: 10px;
	margin: 10px;
	list-style-type: none;
	text-align: center;
}

.g-req-box h6 {
	font-weight: 900;
	color: rgb(70, 147, 127);
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container">


		<div class="g-msg">
			<c:if test="${sessionScope.m.memberType eq 1 }">
		고수에게 요구사항을 정확하게 전달해 주세요!
		</c:if>
			<c:if test="${sessionScope.m.memberType eq 2 }">
		질문자의 요구사항에 맞게 개발을 진행해 주세요!
		</c:if>

		</div>

		<div class="talk-wrap">
			<c:if test="${sessionScope.m.memberType eq 1 }">
				<div style="margin-top: 50px;">
					<span
						style="font-size: 20px; font-weight: 900; padding: 20px; box-shadow: 0px 0 15px 0px rgb(0 0 0/ 15%);">결제한
						비용 <span style="color: red;">${grpsOne.cost } </span>원
					</span>
				</div>
			</c:if>
			<div style="text-align: right;">
				<button type="button" onclick="gosuRequestAjax(${grpsOne.costNo});"
					class="btn btn-secondary upbtn"
					style="width: 100px; margin-bottom: 20px;">요청서</button>
			</div>

			<c:choose>
				<c:when test="${empty grplist }">
					<div class="talk-sub">
						<div
							style="text-align: center; box-shadow: 0px 0 15px 0px rgb(0 0 0/ 15%);">
							<img src="/resources/img/member/user.png"
								style="border-radius: 50%; width: 70px; margin-bottom: 30px;">
							<h2 style="font-weight: 900; color: #cacaca;">대화를 시작해보세요!</h2>
						</div>

					</div>
				</c:when>
				<c:otherwise>
					<div>
						<div style="text-align: right;">
							<button type="button" id="widthBtn" class="btn btn-info upbtn"
								style="width: 100px; box-shadow: 0px 0 15px 0px rgb(0 0 0/ 15%);">전체보기</button>
						</div>
					</div>
					<div style="margin-top: 50px; margin-bottom: 10px;">
						<span style="color: gray;">* 창을 클릭하면 해당 창의 크기를 키울 수 있어요.</span>
					</div>
					<div class="talk-wrap"
						style="box-shadow: 0px 0 15px 0px rgb(0 0 0/ 15%);">

						<c:forEach items="${grplist }" var="gtl" varStatus="i">
							<c:choose>
								<c:when test="${gtl.memberNo eq sessionScope.m.memberNo }">
									<div class="talk-one talk-me">
										<table>
											<tr>

												<c:if test="${not empty gtl.filename }">
													<th colspan="2" style="text-align: left;">첨부파일
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a
														href="/fileDownload.do?fileName=${gtl.filename }&filePath=${gtl.filepath }">${gtl.filename }</a>
													</th>

												</c:if>
												<td style="text-align: right; color: gray;">${gtl.requestProjectDate }</td>
											</tr>

											<tr>
												<td colspan="3">${gtl.requestProjectContentBr }</td>
											</tr>
										</table>
									</div>
								</c:when>
								<c:otherwise>
									<div class="talk-one">
										<table>
											<tr>
												<th colspan="2"
													style="text-align: left; font-size: 30px; width: 150px;"><c:if
														test="${empty gtl.memberImg }">
														<img src="/resources/img/gosu/g_img_basic.png"
															style="margin-bottom: 5px;">
													</c:if> <c:if test="${not empty gtl.memberImg }">
														<img src="/resources/upload/member/${gtl.memberImg}"
															style="margin-bottom: 5px;">
													</c:if> <c:choose>
														<c:when test="${sessionScope.m.memberType ne 2}">
															<span style="color: rgb(78, 205, 196);">고수</span>
															<c:choose>
																<c:when test="${gtl.ggosuNo eq 0}">
																	<a id="underhover" class="underhover"
																		style="color: black;">${gtl.memberId }</a>
																</c:when>
																<c:otherwise>
																	<a id="underhover" style="color: black;"
																		href="/gosuContent.do?gNo=${gtl.ggosuNo}">${gtl.memberId }</a>

																</c:otherwise>
															</c:choose>

														</c:when>
														<c:otherwise>
															<span style="color: rgb(78, 205, 196);">질문자</span>
															${gtl.memberId }
														</c:otherwise>
													</c:choose></th>
												<td style="text-align: right; color: gray;">${gtl.requestProjectDate }</td>
											</tr>
											<tr>
												<c:if test="${not empty gtl.filename }">
													<th colspan="3" style="text-align: right;">첨부파일
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a
														href="/fileDownload.do?fileName=${gtl.filename }&filePath=${gtl.filepath }">${gtl.filename }</a>
													</th>
												</c:if>
											</tr>
											<tr>
												<td colspan="3">${gtl.requestProjectContentBr }</td>
											</tr>
										</table>
									</div>
								</c:otherwise>
							</c:choose>

						</c:forEach>

					</div>
				</c:otherwise>
			</c:choose>



		</div>
		<hr>


		<c:choose>
			<c:when test="${grpsOne.requestProjectSubNum eq 3}">
				<c:choose>
					<c:when test="${sessionScope.m.memberType eq 2}">


						<c:choose>
							<c:when test="${not empty grrOne}">
								<div
									style="display: flex; justify-content: center; margin-top: 100px; margin-bottom: 200px;">
									<div>
										<span
											style="font-size: 30px; font-weight: 900; color: rgb(78, 205, 196);">후기</span>
										<br> <br>
										<table>
											<tr>
												<td
													style="text-align: left; color: gray; font-size: small; padding-left: 50px;"><span
													style="font-weight: 900; font-size: 20px;"
													class="text-info">${grrOne.memberId }</span>&nbsp;&nbsp;&nbsp;
													${grrOne.requestReviewDate }</td>
											</tr>
											<tr>
												<td><p
														style="width: 800px; text-align: center; padding: 20px; border-radius: 20px; margin: 20px; box-shadow: 0px 0 15px 0px rgb(0 0 0/ 15%);">${grrOne.requestReviewContentBr }</p></td>
											</tr>

										</table>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<div
									style="display: flex; justify-content: center; margin-top: 200px; margin-bottom: 200px;">
									<span style="font-size: 30px; font-weight: 900; color: gray;">아직
										작성된 후기가 없습니다!</span>
								</div>
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${not empty grrOne}">
								<div
									style="display: flex; justify-content: center; margin-top: 100px; margin-bottom: 200px;">
									<div>
										<span
											style="font-size: 30px; font-weight: 900; color: rgb(78, 205, 196);">작성한
											후기</span> <br> <br>
										<table>
											<tr>
												<td
													style="text-align: right; color: gray; font-size: small;">${grrOne.requestReviewDate }</td>
											</tr>
											<tr>
												<td><p
														style="width: 800px; padding: 20px; border-radius: 20px; margin: 20px; box-shadow: 0px 0 15px 0px rgb(0 0 0/ 15%);">${grrOne.requestReviewContentBr }</p></td>
											</tr>

										</table>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<div
									style="display: flex; justify-content: center; margin-top: 100px; margin-bottom: 200px;">
									<div>
										<h2 style="font-weight: 900; width: 100%; text-align: center;">고수님께서
											개발을 완료하셨습니다!</h2>
										<br> <br> <span
											style="font-size: 30px; font-weight: 900; color: rgb(78, 205, 196);">후기
											작성하기</span> <br> <br>
										<table>
											<tr>
												<td>진행 과정과 받은 작품에 대해 꼼꼼하게 후기를 남겨주세요!</td>
											</tr>
											<tr>
												<td><textarea cols="70" rows="10" class="form-control"
														id="requestReviewContent" placeholder="내용을 입력해주세요."
														style="padding: 20px; box-shadow: 0px 0 15px 0px rgb(0 0 0/ 15%);"></textarea></td>
												<input type="hidden" value="${grpsOne.requestProjectSubNo}"
													id="grequestProjectSubNo">
												<input type="hidden" value="${sessionScope.m.memberId}"
													id="requestMemberId">


											</tr>
											<tr>
												<td style="text-align: right; padding-top: 20px;"><button
														id="requestReviewAjax" type="button"
														class="btn btn-primary upbtn"
														style="font-weight: 900; padding: 10px; margin-left: 10px;">후기
														작성</button></td>
											</tr>
										</table>
									</div>
								</div>

							</c:otherwise>
						</c:choose>

					</c:otherwise>
				</c:choose>
			</c:when>
			<c:otherwise>
				<span style="color: gray; font-size: small;">* 전송할 내용을 아래에
					입력해주세요<br> * 첨부파일은 한 번에 하나씩만 전송 가능합니다.
				</span>
				<br>
				<br>
				<br>
				<div class="talk-sub" style="margin-bottom: 200px;">

					<div style="box-shadow: 0px 0 15px 0px rgb(0 0 0/ 15%);">
						<table>
							<tr>
								<th colspan="2">첨부파일 &nbsp;&nbsp;&nbsp;&nbsp; <input
									class="form-control"
									style="width: 300px; display: inline-block;" type="file"
									id="talkFile"></th>

							</tr>
							<tr>
								<td colspan="2"><textarea cols="100" rows="10"
										id="talkContent"></textarea></td>
							</tr>
							<tr style="text-align: right;">
								<c:choose>
									<c:when test="${sessionScope.m.memberType eq 2}">
										<td style="text-align: center;"><c:if
												test="${fn:length(grplist) >= 10}">
												<button type="button" id="talkStopAjax"
													class="btn btn-primary upbtn" style="width: 200px;">개발
													완료</button>
											</c:if></td>
										<td style="text-align: center;">
											<button type="button" id="talkBtnAjax"
												class="btn btn-info upbtn"
												style="width: 200px; box-shadow: 0px 0 15px 0px rgb(0 0 0/ 15%);">전송</button>
										</td>
									</c:when>
									<c:otherwise>
										<td colspan="2">
											<button type="button" id="talkBtnAjax"
												class="btn btn-info upbtn">전송</button>
										</td>
									</c:otherwise>
								</c:choose>

							</tr>
							<input type="hidden" value="${sessionScope.m.memberNo}"
								id="writer">
							<input type="hidden" value="${grpsOne.requestProjectSubNo}"
								id="requestProjectSubNo">
						</table>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
		<div class="req-wrap" style="display: none; margin: 0;">
			<div id="req-modal">
				<div class="req-content">

					<div class="g-style g-req-box"></div>

				</div>
				<div class="req-btn-wrap">
					<a id="req-close" class="btn btn-outline-success upbtn">확인</a>
				</div>
			</div>
		</div>
		<input type="hidden" value="${grpsOne.requestWriterId }"
			id="grpsRequestWriterId">
	</div>

	<script src="/resources/summernote/summernote-lite.js"></script>
	<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
	function gosuRequestAjax(costNo){
		var memberId = $("#grpsRequestWriterId").val();
		$.ajax({
			url : "/gosuMemberRequestAjax2.do",
			data : {
				"costNo" : costNo,
				"memberId" : memberId
			},
			success : function(data) {
				$(".g-req-box").empty();
				var html="";
				html+="<ul style='padding: 0;'>";
				html+="<li><h6>어떤 플랫폼을 원하시나요?</h6>"+data.requestContent1Br+"<br></li><li>";
				html+="<h6>어떤 종류의 개발을 원하시나요?</h6>"+data.requestContent2Br+"<br></li><li>";
				html+="<h6>원하는 숙련도의 개발자가 있으신가요?</h6>"+data.requestContent3Br+"<br></li><li>";
				html+="<h6>기획은 어느 정도 되어있나요?</h6>"+data.requestContent4Br+"<br></li><li>";
				html+="<h6>개발 내용과 참고 사항에 대해 상세히 알려주세요.</h6>"+data.requestContent7+"<br>";
				html+="</li><li><h6>언제까지 작업이 완료되어야 하나요?</h6>"+data.requestContent5Br+"<br></li><li>";
				html+="<h6>어떻게 진행하기 원하시나요?</h6>"+data.requestContent6Br+"<br></li></ul>";
				$(".g-req-box").append(html);
				$('body').css("overflow", "hidden");
				$('.req-wrap').css("overflow", "scroll");
				$(".req-wrap").css("display", "flex");
				
			}

	});
	};

	$("#req-close").click(function() {
		$(".req-wrap").css("display", "none");
		$('body').css("overflow", "scroll");
	});
	$(".talk-one").click(function() {
		var idx = $(".talk-one").index(this);
		$(".talk-one").eq(idx).toggleClass("widthwidth");
	});
	$("#widthBtn").click(function() {
		$(".talk-one").toggleClass("widthwidth");
	});
	$("#talkContent").summernote(
			{
				height : 500,
				minHeight : 500,
				maxHeight : 500,
				lang : "ko-KR",
				toolbar : [
						// [groupName, [list of button]]
						[ 'fontname', [ 'fontname' ] ],
						[ 'fontsize', [ 'fontsize' ] ],
						[
								'style',
								[ 'bold', 'italic', 'underline',
										'strikethrough', 'clear' ] ],
						[ 'color', [ 'forecolor', 'color' ] ],
						[ 'table', [ 'table' ] ],
						[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
						[ 'height', [ 'height' ] ],
						[ 'insert', [ 'picture', 'link' ] ],
						[ 'view', [ 'fullscreen', 'help' ] ] ],
				fontNames : [ 'Arial', 'Arial Black', 'Comic Sans MS',
						'Courier New', '맑은 고딕', '궁서', '굴림체', '굴림', '돋움체',
						'바탕체' ],
				fontSizes : [ '8', '9', '10', '11', '12', '14', '16', '18',
						'20', '22', '24', '28', '30', '36', '50', '72' ],
				callbacks : {
					onImageUpload : function(files) {
						uploadImage(files[0], this);
					}
				}
			}); 
	
	function uploadImage(file,editor){
		data = new FormData();
		data.append("file",file);
		$.ajax({
			url : "/gosuSummerImage.do",
			type :"post",		//file전송을 위해 ajax를 할떄는 type을 post로 해줘야한다
			data : data,
			enctype : 'multipart/form-data',
			processData : false,
			contentType : false,
			success : function(data){					
				$(editor).summernote("insertImage",data);
			}
		});
	 };
	 $(".underhover").click(function(){
		 swal({
				title : '',
				text : "고수님께서 소개글을 작성하지 않았습니다!",
				icon : ''
			});
	 });
	
		$("#talkBtnAjax").click(function() {
			var talkContent = $("#talkContent").val();
			var writerNo = $("#writer").val();
			var requestProjectSubNo = $("#requestProjectSubNo").val();
			var form = new FormData();
			var files = $("#talkFile")[0].files[0];
			
			form.append("talkFile", files);
			form.append("talkContent", talkContent);
			form.append("writerNo", writerNo);
			form.append("requestProjectSubNo", requestProjectSubNo);
			if (talkContent == "") {
				swal({
					title : '실패',
					text : "내용을 입력해주세요!",
					icon : 'error'
				});
				return false;
			}
			$.ajax({

				url : "/talkBtnProjectAjax.do",
				type : "post",
				processData : false,
				contentType : false,
				data : form,
				success : function(data) {
					if (data > 0) {
						location.reload();
					} else {

						console.log("등록실패");
					}
				}
			});
		});
		$("#talkStopAjax").click(function() {
			var requestProjectSubNo = $("#requestProjectSubNo").val();

			$.ajax({

				url : "/talkStopAjax2.do",
				data : {
					"requestProjectSubNo" : requestProjectSubNo
				},
				success : function(data) {
					if (data > 0) {
						location.reload();
					} else {
						console.log("에러");
					}
				}
			});
		});
		$("#requestReviewAjax").click(function() {
			var requestReviewContent = $("#requestReviewContent").val();
			var requestProjectSubNo = $("#grequestProjectSubNo").val();
			var requestMemberId = $("#requestMemberId").val();
	
			if (requestReviewContent == "") {
				swal({
					title : '실패',
					text : "내용을 입력해주세요!",
					icon : 'error'
				});
				return false;
			}
			$.ajax({

				url : "/requestReviewAjax.do",
				data : {
					"requestReviewContent" : requestReviewContent,
					"requestProjectSubNo" : requestProjectSubNo,
					"requestMemberId" : requestMemberId

				},
				success : function(data) {
					if (data > 0) {
						swal({
							title : '성공',
							text : "후기 작성 완료",
							icon : 'success'
						});
						location.reload();
					} else {
						console.log("에러");
					}
				}
			});
		});
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>