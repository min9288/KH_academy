<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    int totalCount = (Integer)request.getAttribute("totalCount");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#more-btn{
		margin-top : 100px;
	}
	.photoWrapper{
		padding-top : 20px;
		clear : right;
		display : flex;
		flex-wrap : wrap;
		justify-content : center;
	}
	.photo{
		border : 1px solid #ccc;
		margin-top : 30px;
		width : 18%;
		height :122px;
		overflow: hidden;
	}
	.photo>img{
		width : 100%;
		hegiht : 100px;
	}
	.photo>p{
		text-align : center;
	}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="container">
		<fieldset>
			<legend>사진게시판 - <%=totalCount %>개</legend>
			<%if(m != null) {%>
			<div>
				<a href="/photoWriteFrm" class="btn btn-info writeBtn">글쓰기</a>
			</div>
			<%} %>
			<div class="photoWrapper"></div>
			<button class = "btn btn-outline-info btn-block" currentCount="0" totalCount="<%=totalCount %>" value="1" id="more-btn">더보기</button> 
			<!-- 
				totalCount : 전체 게시물 수
				currentCount : 실제로 가져온 게시물 수
				value : 요청게시물 시작번호(reqPage)
			 -->
		</fieldset>
	</div>
	<script>
		$("#more-btn").click(function(){
			var start = $(this).val();
			$.ajax({
				url : "/photoMore",
				data : {start:start},
				type : "post",
				success : function(data){
					console.log(data);
					for(var i=0;i<data.length;i++){
						var p = data[i];
						var html = "";
						html += "<div class='photo'>";
						html += "<img src='/upload/photo/"+p.filepath+"'>";
						html += "<p class='caption'>"+p.photoComment+"</p></div>";
						$(".photoWrapper").append(html);
					}
					// 가지고온 데이터를 화면에 출력한 후 다음 요청을 위한 값 변경
					$("#more-btn").val(Number(start)+5);
					// 지금까지 읽어온 게시물의 수를 변경(읽어온 배열의 길이만큼 기존값에 더함)
					var curr = Number($("#more-btn").attr("currentCount"));
					$("#more-btn").attr("currentCount", curr+data.length);
					// 전체게시물 수
					var totalCount = $("#more-btn").attr("totalCount");
					// 변경된 지금까지 읽어온 게시물 수
					var currCount  = $("#more-btn").attr("currentCount");
					// 지금까지 읽어온 게시물과 전체게시물 수가 같으면 더보기 버튼 비활성화
					if(currCount == totalCount){
						$("#more-btn").prop("disabled", true);
					}			
				}
			});
		});
		$(function(){
			$("#more-btn").click();
		});
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>