<%@page import="kr.or.gosu.vo.GosuProject"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/resources/summernote/summernote-lite.css">

<%
	ArrayList<GosuProject> gProjectList = new ArrayList<GosuProject>();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Develomint</title>
</head>
<style>
.container * {
	text-decoration: none;
}

.container {
	margin-top: 50px;
	margin-bottom: 50px;
	min-width: 1200px;
}

.container textarea {
	width: 1000px;
	height: 500px;
}

.container .g-plus {
	display: flex;
	justify-content: right;
	color: rgb(78, 205, 196);
	text-align: right;
	font-weight: bold;
}

.gosu-content-wrap>div>h4, .container>h4 {
	font-weight: bold;
	color: black;
	margin-top: 200px;
	margin-bottom: 50px;
}

.gosu-content-wrap {
	width: 1200px;
	padding: 50px;
	box-shadow: 0px 0 15px 0px rgb(0 0 0 / 15%);
}

.gosu {
	display: flex;
	justify-content: center;
}

.gosu img {
	border-radius: 50%;
}

.gosu td {
	width: 500px;
	font-weight: bold;
	font-size: 35px;
}

.gosu td>span {
	color: rgb(78, 205, 196);
}

.gosu-photos ul li {
	float: left;
	list-style-type: none;
	margin: 10px;
}

.gosu-photos {
	overflow: hidden;
}

.gosu-photos ul li img {
	width: 120px;
}

.container>div>div>div {
	margin-top: 100px;
	margin-bottom: 200px;
}

.container>div>div>div>div a {
	padding: 10px;
	width: 150px;
	margin-top: 30px;
}

.review-one li {
	float: left;
	list-style-type: none;
	padding-right: 30px;
}

.review-one {
	overflow: hidden;
	margin: 10px;
	font-size: 12px;
}

.review-avg table td {
	padding: 10px;
}

.g-photo-one button {
	border: none;
	background-color: transparent;
}

.g-photo-one * {
	width: 200px;
}

.g-photo-one img {
	height: 200px;
}

.g-photo-one .g-b {
	height: 30px;
	overflow: hidden;
	display: block;
	text-overflow: ellipsis;
	text-align: center;
}

.g-photo-one .g-p {
	text-align: center;
	display: block;
	height: 50px;
	overflow: hidden;
	text-overflow: ellipsis;
}

.g-photo-wrap {
	display: flex;
	justify-content: space-around;
	flex-wrap: wrap;
}

.gosu input {
	width: 700px;
	margin-top: 30px;
	margin-bottom: 30px;
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

.hrm-wrap {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	align-items: center;
	justify-content: center;
	z-index: 10000;
}

.hrm-btn-wrap {
	width: 100%;
	display: flex;
	justify-content: center;
}

#hrm-modal h3 {
	background-color: #78c2ad;
	padding: 30px;
	font-weight: 900;
	text-align: center;
}

#hrm-modal {
	background-color: white;
}

.hrm-btn-wrap a {
	margin: 30px;
	margin-top: 50px;
	padding: 10px;
	width: 100px;
}

.hrm-content b {
	font-size: 20px;
	margin-right: 50px;
	margin-bottom: 100px;
	margin-left: 50px;
}

.hrm-content textarea {
	width: 800px;
	padding: 10px;
}

.hrm-content input {
	padding: 10px;
	margin-bottom: 50px;
	width: 800px;
}

#gimage_container {
	text-align: center;
}

#gimage_container img {
	width: 300px;
}

.note-editable{
	width: 918px;
}
.summerContentTop {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-top: 20px;
}

.note-modal-footer{
	height: 60px !important;
}
#gProject:hover {
	cursor: pointer;
	border: 1px solid rgb(46, 108, 164);
	color: rgb(46, 108, 164);
}

.jb-a:hover .jb-c {
	display: block;
}
#gProject {
	border: 1px solid gray;
	width: 200px;
	height: 200px;
	text-align: center;
	position: relative;
}

#gProject>img {
	width: 30px;
	margin-top: 75px;
}

.jb-c {
	position: absolute;
	top: 0px;
	left: 84px;
	display: none;
}

.upbtn>button {
	box-shadow: 0px 0 15px 0px rgb(0 0 0 / 15%);
}

.upbtn:hover {
-webkit-transform: scale(1.03);
    transform: scale(1.03);
}
</style>
<body>

	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container">
		
		<h4>
			&gt; &nbsp;<span style="color: rgb(78, 205, 196);">고수</span>를 소개합니다!
		</h4>
		<div style="color: red; margin-bottom: 100px;">
			고수 소개 글은 하나만 작성이 가능하며, 수정 삭제가 불가능합니다!<br> 신중하게 작성해 주시길 바랍니다.
		</div>

		<form action="/gosuWrite.do" method="post" id="g-btn-submit"
			enctype="multipart/form-data">
			<div style="text-align: right; margin-top: 50px;">
				<input type="hidden" name="gsouNo"
					value="${sessionScope.m.memberNo }">
			</div>
			<div style="display: flex; justify-content: center;margin-bottom: 200px;">
				<div class="gosu-content-wrap">
					<div class="gosu">
						<table>
							<tr>
								<c:if test="${empty sessionScope.m.filepath }">
									<th rowspan="8" style="padding: 40px; padding-right: 70px;"><img
										src="/resources/img/gosu/g_img_basic.png"
										style="width: 250px;"></th>
								</c:if>
								<c:if test="${not empty sessionScope.m.filepath }">
									<th rowspan="6" style="padding: 40px; padding-right: 100px;"><img
										src="/resources/upload/member/${sessionScope.m.filepath }"
										style="width: 250px;height: 250px;"></th>
								</c:if>
							</tr>
							<tr>
								<td><span style="color: rgb(78, 205, 196);">제목 <span
										style="color: red;">* </span></span></td>
							</tr>
							<tr>
								<td style="font-size: 20px;"><input type="text" placeholder="제목 입력"  class="form-control" 
									name="gosuTitle"></td>
							</tr>
							<tr>
								<td style="font-size: small;padding-bottom: 20px;color:gray;">* 고수님을 어필할 수 있는 제목으로 작성해주세요!</td>
							</tr>
							<tr>
								<td><hr></td>
							</tr>
							<tr>
								<td>한 줄 소개 <span style="color: red;">* </span></td>
							</tr>
							<tr>
								<td style="font-size: 20px;"><input type="text" placeholder="한 줄 소개 입력"  class="form-control" 
									name="gosuSelf"></td>
							</tr>
							<tr>
								<td style="font-size: small;padding-bottom: 20px;color:gray;">* 고수님을 한 줄로 소개한다면?</td>
							</tr>
						</table>
					</div>
					<div>
						<h4>
							상세설명 <span style="color: red;">* </span>
						</h4>


						<div>
							<p> 
								<textarea name="gosuExplain" id="gosuExplain"  class="form-control" 
								></textarea>
							</p>

						</div>
						<div>
							<span style="font-size: small;padding-bottom: 20px;color:gray;">* 상세설명에는 고수님의 능력이나 활동 경력등을 자세하게 작성하시는 게 좋아요!</span>
						</div>

					</div>

					<div class="gosu-photos">
						<h4>
							사진 <span style="color: red;">* </span> <span
								style="color: gray; font-size: small;">한 가지 이상의 사진을 추가해
								주세요.</span>
						</h4>

						<div style="overflow: hidden;">
							<input type="file" name="photoFilepath" style="width: 300px;"  class="form-control"  multiple>
						</div>

					</div>


					<div class="gosu-act">
						<h4>
							활동 및 자격 <span style="color: red;">* </span>
						</h4>
						<div>
							<p>
								<textarea name="gosuAct"  class="form-control"  id="gosuAct"></textarea>
							</p>
						</div>
						<div>
							<span style="font-size: small;padding-bottom: 20px;color:gray;">* 활동 및 자격에는 여태 진행했는 프로젝트나 취득한 자격증 등을 자세하게 적어주세요. 또 아래 프로젝트를 통해 증명해 주세요!</span>
						</div>
						
					</div>
					<div class="gosu-project">
						<h4>
							프로젝트 <span style="color: red;">* </span><span
								style="color: gray; font-size: small;">한 가지 이상의 프로젝트를 추가해
								주세요.</span>
						</h4>

						<div class="g-photo-wrap">

							<div id="gProject" class="jb-a">
								<img class="jb-b" src="/resources/img/gosu/projectPlus.png">
								<img class="jb-c" src="/resources/img/gosu/projectPlusBlue.png">
								<br>추가하기
							</div>
						</div>

					</div>
					<div class="gosu-feedback">

						<h4>
							피드백 비용 <span style="color: red; margin-right: 100px;">* </span> <input   class="form-control"  
								type="text" name="gosuCost" style="width: 400px; font-size: 20px;display: inline-block;" placeholder="비용 입력"
								onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');">
								<span>&nbsp; &nbsp;원</span>
						</h4>
						<div>
							<span style="font-size: small;padding-bottom: 20px;color:gray;">* 너무 높은 가격은 피해주세요! 주로 1000월~50000원 사이가 적당합니다!</span>
						</div>

					</div>
					<div style="display: flex; justify-content: center;">
						<button type="submit" class="btn btn-primary upbtn"
							style="width: 200px; margin-top: 140px; padding: 10px;">작성하기</button>
					</div>
				</div>
				<div class="hrm-wrap" style="display: none;">
					<div id="hrm-modal">
						<h3 style="color: white;">프로젝트 추가하기</h3>
						<div class="hrm-content" style="margin-top: 50px;">
							<b style="color:#78c2ad; margin-right: 20px;" >메인사진</b> <input type="file" class="gprojectFilepath form-control"
								id="gprojectFilepath"  accept="image/*"style="margin-bottom: 25px;width:300px;margin-right:380px; display: inline-block;" ><br>
							<div id="gimage_container" style='margin-bottom:25px;'></div>

							<b>제목</b><input type="text" class="gprojectTitle form-control"  style="display: inline-block; width:600px; "
								id="gprojectTitle" placeholder="프로젝트 제목 입력"><br> <b
								style="float: left;">내용</b>
							<textarea cols="80" class="gprojectContent form-control"    id="gprojectContent" style="width:600px; "
								placeholder="프로젝트 내용 입력"></textarea>
							<br>
						</div>
						<div class="hrm-btn-wrap">
							<a id="hrm-close" class="btn btn-outline-success upbtn">취소</a> <a
								id="gProjectArr" class="btn btn-primary upbtn"
								onclick="gProjectArr();">확인</a>
						</div>
					</div>
				</div>

			</div>

		</form>
	</div>

	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<script src="/resources/summernote/summernote-lite.js"></script>
	<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
	<script>
		$("#gosuExplain").summernote(
				{
					height : 500,
					minHeight : 500,
					maxHeight : 500,
					lang : "ko-KR",
					toolbar : [
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
		$("#gosuAct").summernote(
				{
					height : 500,
					minHeight : 500,
					maxHeight : 500,
					lang : "ko-KR",
					toolbar : [
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
				type : "post",
				data : data,
				enctype : 'multipart/form-data',
				processData : false,
				contentType : false,
				success : function(data) {
					$(editor).summernote("insertImage", data);
				}
			});
		}
		$('#g-btn-submit').submit(
				function() {
					var photoFilepath = $("input[name=photoFilepath]").val();
					var gprojectFilepath = $("input[name=gprojectFilepath]")
							.val();
					var gprojectTitle = $("input[name=gprojectTitle]").val();
					var gprojectContent = $("input[name=gprojectContent]")
							.val();
					var gosuCost = $("input[name=gosuCost]").val();
					var gosuAct = $("input[name=gosuAct]").val();
					var gosuExplain = $("input[name=gosuExplain]").val();
					var gosuTitle = $("input[name=gosuTitle]").val();
					var gosuSelf = $("input[name=gosuSelf]").val();

					if (photoFilepath == "" || gprojectFilepath == ""
							|| gprojectTitle == "" || gprojectContent == ""
							|| gosuCost == "" || gosuAct.lenght == 0
							|| gosuTitle == "" || gosuExplain.lenght == 0
							|| gosuSelf == "") {

						swal({
							title : '실패',
							text : "입력하신 내용을 다시 확인해주세요!",
							icon : 'error'
						});

						return false;
					}
				});
		$("#gProject").click(function() {
			var gprojectTitle = $("#gprojectTitle");
			var gprojectContent = $("#gprojectContent");
			var gprojectFilepath = $("#gprojectFilepath");
			gprojectTitle.val("");
			gprojectContent.val("");
			gprojectFilepath.val("");
			$("#gimage_container").empty();
			$('body').css("overflow", "hidden");
			$('.hrm-wrap').css("overflow", "scroll");
			$(".hrm-wrap").css("display", "flex");

		});
		$(function() {

			var gprojectFilepath = $("#gprojectFilepath");
			var upload = document.querySelector('#gprojectFilepath');
			var preview = document.querySelector('#gimage_container');

			upload
					.addEventListener(
							'change',
							function(e) {
								$("#gimage_container").empty();
								var get_file = e.target.files;
								var image = document.createElement('img');
								var reader = new FileReader();
								reader.onload = (function(aImg) {
									return function(e) {
										aImg.src = e.target.result;
										var html = "";
										var div = $(".g-photo-wrap");
										html += "<div class='g-photo-one'><dl>";
										html += "<dt id='gimg' ><img></dt>";
										html += "<dd><b class='g-b' style='font-size: 19px;'></b></dd>";
										html += "<dd><p class='g-p'></p></dd>";
										html += "</dl></div>";
										div.prepend(html);
										$(".g-photo-one").first().find(
												"#gimg>img").attr("src",
												e.target.result);

									}
								})(image)

								if (get_file) {
									reader.readAsDataURL(get_file[0]);
								}

								preview.appendChild(image);

							});

		});
		$("#hrm-close").click(function() {

			var gprojectFilepath = $("#gprojectFilepath");
			if (gprojectFilepath.val() != "") {

				$(".g-photo-one").first().remove();
			}
			$('body').css("overflow", "scroll");
			$(".hrm-wrap").css("display", "none");

		});

		
		
	
		
		function gProjectArr() {
			var gprojectTitle = $("#gprojectTitle").val();
		
			var gprojectContent = $("#gprojectContent").val();
		

			var gprojectFilepath = $("#gprojectFilepath");
			if (gprojectTitle == "" || gprojectContent == ""
					|| gprojectFilepath.val() == "") {
				swal({
					title : '실패',
					text : "입력하신 내용을 다시 확인해주세요!",
					icon : 'error'
				});
				return false;

			}
			;

			var form = new FormData();
			var files = $("#gprojectFilepath")[0].files[0];
			
			form.append("gprojectFilepath", files);
			form.append("gprojectContent", gprojectContent);
			form.append("gprojectTitle", gprojectTitle);
			$
					.ajax({
						url : "/gProjectAjax.do",
						type : "post",
						data : form,
						processData : false,
						contentType : false,
						success : function(data) {
							$(".g-photo-one").first().append("<div style='text-align:center;'><button  class='delPJ upbtn' type='button'style='width:80px; border-radius:20px; background-color:#66a593; color:white;' >삭제</button></div>");
							$(".g-photo-one")
									.first()
									.append(
											"<input type='hidden' name='gprojectFilepath' value='"+data.gprojectFilepath+"'>");
							$(".g-photo-one")
									.first()
									.append(
											"<input type='hidden' name='gprojectTitle' value='"+data.gprojectTitle+"'>");
							$(".g-photo-one")
									.first()
									.append(
											"<input type='hidden' name='gprojectContent' value='"+data.gprojectContent+"'>");
							
							$(".delPJ").click(function() {
								$(this).parent().parent().remove();
						

							});

						}
					});

			var gb = $(".g-photo-one").first().find(".g-b");
	
			gb.append(gprojectTitle);

			var gp = $(".g-photo-one").first().find(".g-p");

			gp.append(gprojectContent);

			$('body').css("overflow", "scroll");
			$(".hrm-wrap").css("display", "none");

		}
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>