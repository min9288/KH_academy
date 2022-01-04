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


.container {
	min-width: 1200px;
	margin-bottom: 100px;
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
	background-color: rgb(250, 250, 250);
	box-shadow:  0px 0 15px 0px rgb(0 0 0 / 15%);
}

.g-feedback h3 {
	font-weight: bold;
	margin-top: 100px;
	margin-bottom: 40px;
}

.g-feedback span {
	padding: 20px;
}

.talk-one p * {
	background-color: transparent !important;
}

.talk-one {
	width: 50%;
	margin-bottom: 50px;
	align-self: flex-start;
	padding: 20px;
	overflow: auto;
}

.talk-one tr:last-child td:last-child {
	padding: 20px;
	background-color: white;
	box-shadow: 0px 0 15px 0px rgb(0 0 0 / 15%);
}

.talk-me tr:last-child td:last-child {
	background-color: rgb(183, 223, 205);
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

.star-rating {
	display: flex;
	flex-direction: row-reverse;
	font-size: 1.5em;
	justify-content: space-around;
	padding: 0 .2em;
	text-align: center;
	width: 6em;
	margin-bottom: 10px;
}

.star-rating input {
	display: none;
}

.star-rating label {
	color: #ccc;
	cursor: pointer;
}

.star-rating :checked ~ label {
	color: #f90;
}

.star-rating label:hover, .star-rating label:hover ~ label {
	color: #fc0;
}

.summerContentTop {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-top: 20px;
}

.note-modal-footer {
	height: 60px !important;
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
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container">
		
		<h3>
			<c:choose>
				<c:when test="${sessionScope.m.memberId ne gfOne.memberId}">
					<span style="color: rgb(78, 205, 196);">신청받은 내역</span>
				</c:when>
				<c:otherwise>
					<span style="color: rgb(78, 205, 196);">신청한 내역</span>
				</c:otherwise>
			</c:choose>

		</h3>


		<div class="g-feedback" style="margin-bottom: 30px;">

			<h3>Q. &nbsp;${gfOne.feedbackTitle }</h3>
			<span>${gfOne.feedbackContentBr }</span><br>
		<c:if test="${sessionScope.m.memberId eq gfOne.memberId}">
		<div style="margin-top:50px;">
		<span style="font-size: 20px;font-weight: 900;
	box-shadow: 0px 0 15px 0px rgb(0 0 0 / 15%);
">결제한 비용  <span style="color:red;">${gfOne.gosuCost }</span>원 </span>
		</div>
		</c:if>
		</div>

		<c:choose>
			<c:when test="${gfOne.feedbackNum eq 1}">
				<div class="talk-sub" style="margin-bottom: 100px;">
					<div style="text-align: center;box-shadow:  0px 0 15px 0px rgb(0 0 0 / 15%);">
						<img src="/resources/img/member/user.png"
							style="border-radius: 50%; width: 70px; margin-bottom: 30px;">
						<h2 style="font-weight: 900; color: #cacaca;">대화를 시작해보세요!</h2>
					</div>

				</div>
			</c:when>
			<c:otherwise>
				<div>
					<div style="text-align: right;">
						<button type="button" id="widthBtn" class="btn btn-primary upbtn"
							style="width: 100px; font-weight: 900;box-shadow:  0px 0 15px 0px rgb(0 0 0 / 15%);">전체보기</button>
					</div>
				</div>
				<div style="margin-top: 50px;margin-bottom: 10px;">
						<span style="color: gray;
	">* 창을 클릭하면 해당 창의 크기를 키울 수 있어요.</span></div>
				<div class="talk-wrap" >
				
					<c:forEach items="${gtList }" var="gtl" varStatus="i">
						<c:choose>
							<c:when test="${gtl.writer eq sessionScope.m.memberId }">
								<div class="talk-one talk-me">
									<table>
										<tr>

											<c:if test="${not empty gtl.filename }">
												<th colspan="2" style="text-align: left;">첨부파일
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a
													href="/fileDownload.do?fileName=${gtl.filename }&filePath=${gtl.filepath }"
													id="download">${gtl.filename }</a>

												</th>

											</c:if>
											<td style="text-align: right; color: gray;">${gtl.talkDate }</td>
										</tr>

										<tr>
											<td colspan="3">${gtl.talkContentBr }</td>
										</tr>
									</table>
								</div>
							</c:when>
							<c:otherwise>
								<div class="talk-one">
									<table>
										<tr>
											<th colspan="2"
												style="text-align: left; width: 150px; font-size: 30px;"><c:if
													test="${empty gtl.gosuImg }">
													<img src="/resources/img/gosu/g_img_basic.png"
														style="margin-bottom: 5px;">
												</c:if> <c:if test="${not empty gtl.gosuImg }">
													<img src="/resources/upload/member/${gtl.gosuImg }"
														style="margin-bottom: 5px;">
												</c:if> <c:choose>
													<c:when test="${sessionScope.m.memberId ne gfOne.memberId}">
														<span style="color: rgb(78, 205, 196);">질문자</span>
														${gtl.writer }
													</c:when>
													<c:otherwise>
														<span style="color: rgb(78, 205, 196);">고수</span>
														<a id="underhover" style="color: black;"
															href="/gosuContent.do?gNo=${gfOne.ggosuNo}">${gtl.writer }</a>
													</c:otherwise>
												</c:choose></th>
											<td style="text-align: right; color: gray;">${gtl.talkDate }</td>
										</tr>
										<tr style="text-align: right;">
											<c:if test="${not empty gtl.filename }">
												<th colspan="3">첨부파일 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a
													href="/fileDownload.do?fileName=${gtl.filename }&filePath=${gtl.filepath }"
													id="download">${gtl.filename }</a></th>

											</c:if>
										</tr>
										<tr>
											<td colspan="3">${gtl.talkContentBr }</td>
										</tr>
									</table>
								</div>
							</c:otherwise>
						</c:choose>

					</c:forEach>

				</div>
			</c:otherwise>
		</c:choose>
		<hr>
		<c:choose>
			<c:when test="${gfOne.feedbackNum eq 3}">
				<c:choose>
					<c:when test="${sessionScope.m.memberId ne gfOne.memberId}">
						<c:choose>
							<c:when test="${not empty greview}">
								<div
									style="display: flex; justify-content: center; margin-top: 100px; margin-bottom: 200px;">
									<div>
										<span
											style="font-size: 30px; font-weight: 900; color: rgb(78, 205, 196);">작성된
											리뷰</span> <br> <br>
										<table>
											<tr>
												<td
													style="font-weight: 900; font-size: 20px; padding-bottom: 5px;" class="text-info">${greview.writer }</td>
												<td style="width: 800px;"><span
													style="float: left; font-weight: 900; font-size: 25px; margin-left: 30px;">${greview.reviewNum}
														점</span>
													<div class="star-rating">
														<c:if test="${greview.reviewNum eq 1 }">
															<span style="color: #ffd400;">&#9733;&#9734;&#9734;&#9734;&#9734;</span>
														</c:if>
														<c:if test="${greview.reviewNum eq 2 }">
															<span style="color: #ffd400;">&#9733;&#9733;&#9734;&#9734;&#9734;</span>
														</c:if>
														<c:if test="${greview.reviewNum eq 3 }">
															<span style="color: #ffd400;">&#9733;&#9733;&#9733;&#9734;&#9734;</span>
														</c:if>
														<c:if test="${greview.reviewNum eq 4 }">
															<span style="color: #ffd400;">&#9733;&#9733;&#9733;&#9733;&#9734;</span>
														</c:if>
														<c:if test="${greview.reviewNum eq 5 }">
															<span style="color: #ffd400;">&#9733;&#9733;&#9733;&#9733;&#9733;</span>
														</c:if>
													</div></td>
												<td>${greview.reviewDate }</td>

											</tr>
											<tr>
												<td colspan="3"
													style="width: 800px; text-align: center; border-radius:20px;  padding: 50px; box-shadow: rgba(0, 0, 0, 0.4) 2PX 2PX 2PX 2pX;">${greview.reviewContentBr }</td>

											</tr>
										</table>
										
									</div>
							</c:when>
							<c:otherwise>
								<div
									style="display: flex; justify-content: center; margin-top: 200px; margin-bottom: 200px;">
									<span style="font-size: 30px; font-weight: 900; color: gray;">아직
										작성된 리뷰가 없습니다!</span>
								</div>
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${not empty greview}">
								<div
									style="display: flex; justify-content: center; margin-top: 100px; margin-bottom: 200px;">
									<div>
										<span
											style="font-size: 30px; font-weight: 900; color: rgb(78, 205, 196);">작성한
											리뷰</span> <br> <br>
										<table>
											<tr>
												<td style="width: 800px;"><span
													style="float: left; font-weight: 900; font-size: 25px; margin-left: 30px;">${greview.reviewNum}
														점</span>
													<div class="star-rating">

														<c:if test="${greview.reviewNum eq 1 }">
															<span style="color: #ffd400;">&#9733;&#9734;&#9734;&#9734;&#9734;</span>
														</c:if>
														<c:if test="${greview.reviewNum eq 2 }">
															<span style="color: #ffd400;">&#9733;&#9733;&#9734;&#9734;&#9734;</span>
														</c:if>
														<c:if test="${greview.reviewNum eq 3 }">
															<span style="color: #ffd400;">&#9733;&#9733;&#9733;&#9734;&#9734;</span>
														</c:if>
														<c:if test="${greview.reviewNum eq 4 }">
															<span style="color: #ffd400;">&#9733;&#9733;&#9733;&#9733;&#9734;</span>
														</c:if>
														<c:if test="${greview.reviewNum eq 5 }">
															<span style="color: #ffd400;">&#9733;&#9733;&#9733;&#9733;&#9733;</span>
														</c:if>
													</div></td>
												<td>${greview.reviewDate }</td>

											</tr>
											<tr style=" ">
												<td colspan="2"
													style="width: 800px;padding: 50px;border-radius:20px; box-shadow: rgba(0, 0, 0, 0.4) 2PX 2PX 2PX 2pX;">${greview.reviewContentBr }</td>

											</tr>
										</table>
									
									</div>
							</c:when>
							<c:otherwise>
								<div
									style="display: flex; justify-content: center; margin-top: 100px; margin-bottom: 200px;">
									<div>
										<h2 style="font-weight: 900; width: 100%; text-align: center;">고수님께서
											완료한 피드백입니다!</h2>
										<br> <br> <span
											style="font-size: 30px; font-weight: 900; color: rgb(78, 205, 196);">리뷰</span>
										<br> <br>
										<table>
											<tr>
												<td colspan="2">
													<div class="star-rating">
														<input type="radio" id="5-stars" name="rating" value="5" />
														<label for="5-stars" class="star">&#9733;</label> <input
															type="radio" id="4-stars" name="rating" value="4" /> <label
															for="4-stars" class="star">&#9733;</label> <input
															type="radio" id="3-stars" name="rating" value="3" /> <label
															for="3-stars" class="star">&#9733;</label> <input
															type="radio" id="2-stars" name="rating" value="2" /> <label
															for="2-stars" class="star">&#9733;</label> <input
															type="radio" id="1-star" name="rating" value="1" /> <label
															for="1-star" class="star">&#9733;</label>
													</div>
												</td>
											</tr>
											<tr>
												<td><textarea cols="70" id="reviewContent"  class="form-control"></textarea></td>
												<td><button type="button" id="reviewSendAjax"
														class="btn btn-primary upbtn"
														style="font-weight: 900; padding: 10px; margin-left: 10px;">리뷰
														작성</button></td>
												<input type="hidden" value=${gfOne.ggosuNo } id="gfGgosuNo">
												<input type="hidden" value="${sessionScope.m.memberId }"
													id="writer">
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
				<div class="talk-sub">

					<div style="margin-bottom: 200px; box-shadow:  0px 0 15px 0px rgb(0 0 0 / 15%);" >
						<table>
							<tr>
								<th colspan="2">첨부파일 &nbsp;&nbsp;&nbsp;&nbsp; <input  class="form-control" style="width: 300px;display: inline-block;"
									type="file" id="talkFile"></th>

							</tr>
							<tr>
								<td colspan="2"><textarea cols="100" rows="10"
										id="talkContent"></textarea></td>
							</tr>
							<tr style="text-align: right;">
								<c:choose>
									<c:when test="${sessionScope.m.memberId ne gfOne.memberId}">
										<c:if test="${fn:length(gtList) >= 10}">
											<td style="text-align: center;">
												<button type="button" id="talkStopAjax" class="btn btn-info upbtn"
													style="width: 200px;">피드백 마치기</button>
											</td>
										</c:if>
										<td style="text-align: center;">
											<button type="button" id="talkBtnAjax"
												class="btn btn-primary upbtn" style="width: 200px;box-shadow:  0px 0 15px 0px rgb(0 0 0 / 15%);">전송</button>
										</td>
									</c:when>
									<c:otherwise>
										<td colspan="2">
											<button type="button" id="talkBtnAjax"
												class="btn btn-primary upbtn">전송</button>
										</td>
									</c:otherwise>
								</c:choose>

							</tr>
							<input type="hidden" value="${sessionScope.m.memberId }"
								id="writer">
							<input type="hidden" value="${gfOne.feedbackNo}" id="feedbackNo">
						</table>
					</div>
				</div>
			</c:otherwise>
		</c:choose>


	</div>

	<script src="/resources/summernote/summernote-lite.js"></script>
	<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
		$("#widthBtn").click(function() {
			$(".talk-one").toggleClass("widthwidth");
		});
		$(".talk-one").click(function() {
			var idx = $(".talk-one").index(this);
			$(".talk-one").eq(idx).toggleClass("widthwidth");
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

		function uploadImage(file, editor) {
			data = new FormData();
			data.append("file", file);
			$.ajax({
				url : "/gosuSummerImage.do",
				type : "post", //file전송을 위해 ajax를 할떄는 type을 post로 해줘야한다
				data : data,
				enctype : 'multipart/form-data',
				processData : false,
				contentType : false,
				success : function(data) {
					$(editor).summernote("insertImage", data);
				}
			});
		}

		$("#talkBtnAjax").click(function() {
			var talkContent = $("#talkContent").val();
			var writer = $("#writer").val();
			var feedbackNo = $("#feedbackNo").val();

			var form = new FormData();
			var files = $("#talkFile")[0].files[0];
		
			form.append("talkFile", files);
			form.append("talkContent", talkContent);
			form.append("writer", writer);
			form.append("feedbackNo", feedbackNo);
			if (talkContent == "") {
				swal({
					title : '실패',
					text : "내용을 입력해주세요!",
					icon : 'error'
				});
				return false;
			}
			$.ajax({

				url : "/talkBtnAjax.do",
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
			var feedbackNo = $("#feedbackNo").val();

			$.ajax({

				url : "/talkStopAjax.do",
				data : {
					"feedbackNo" : feedbackNo
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
		$("#reviewSendAjax").click(function() {
			var reviewNum = $("input[name=rating]:checked").val();
			var writer = $("#writer").val();
			var reviewContent = $("#reviewContent").val();
			var ggosuNo = $("#gfGgosuNo").val();
		
			if (reviewNum == null || reviewContent == "") {
				swal({
					title : '실패',
					text : "작성하신 리뷰를 다시 확인해주세요!",
					icon : 'error'
				});
				return false;
			}
			$.ajax({

				url : "/reviewSendAjax.do",
				data : {
					"reviewNum" : reviewNum,
					"writer" : writer,
					"reviewContent" : reviewContent,
					"ggosuNo" : ggosuNo
				},
				success : function(data) {
					if (data > 0) {
						swal({
							title : '성공',
							text : "리뷰 작성이 완료되었습니다!",
							icon : 'success'
						});
						location.reload();
					} else {
						console.log("에러");
					}
				}
			});
		})
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>