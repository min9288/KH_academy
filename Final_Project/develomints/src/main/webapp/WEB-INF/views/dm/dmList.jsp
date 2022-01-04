<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Develomints</title>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
	.dmWrap{
		width: 1000px;
		margin: 0 auto;
	}
	table td,tr{
		text-align: center;
	}
	table tr{
		vertical-align: middle;
	}
	table th{
		width: 150px;
	}
	.modal-btns{
		display: flex;
		justify-content: space-between;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="container">
		<h4 style="font-weight: bold; margin-left: 100px; margin-bottom: 50px; margin-top: 50px; margin-right:">쪽지함<i class="bi bi-chat-dots" style="margin-left:10px;"></i></h4>
		<div class="dmWrap">
			<p class="text-muted">받은 쪽지함</p>
			<table class="table table-hover receivePosts">
				<tr class="table-primary">
					<th>번호</th><th>보낸사람</th><th style="width: 500px; text-align: left;">내용</th><th>날짜</th><th>읽음여부</th><th>삭제하기</th>
				</tr>
				<c:forEach items="${list }" var="dm" varStatus="i">
					<c:if test="${dm.receiver eq sessionScope.m.memberId}">
						<tr>
							<td>${dm.dmNo }</td>
							<td>${dm.sender }</td>
							<td style="text-align: left"><a href="#" data-bs-toggle="modal" data-bs-target="#reportComment${i.index }" class="reply">${dm.dmContent }</a></td>
							<td>${dm.dmTime }</td>
							<c:choose>
								<c:when test="${dm.readStatus == 'Y' }">
									<td class="text-info">읽음</td>								
								</c:when>
								<c:otherwise>
									<td class="text-danger">읽지않음</td>
								</c:otherwise>							
							</c:choose>
							<td>
								<a href="javascript:void(0)" class="btn btn-danger delmsg" onclick="deleteMsg(this,'${dm.dmNo}')">삭제</a>
							</td>
						</tr>
					<!-- 답장하기 modal -->
					<div class="modal fade" id="reportComment${i.index }" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog  modal-dialog-centered">
					    <div class="modal-content">
					      <div class="modal-body">
						      	<p class="Modaltitle">답장하기</p>
						      	<div style="padding:5px; margin-bottom: 10px;">
							      	<p><span>발신자</span> : ${dm.sender }</p>
							      	<textarea rows="3" style="width:100%" class="form-control dmContent"></textarea>
						      	</div>
						      	<div class="modal-btns">
							      	<div>
							      		<span class="text-danger text_cnt" >(0 / 100)</span>
							      	</div>						      	
							      	<div>
							      		<button type="button" class="btn btn-secondary send" style="width: 100px;">답장</button>
							        	<button type="button" class="btn btn-primary cancel" style="width: 100px;" data-bs-dismiss="modal">취소</button>					        	
									</div>
						      	</div>
								<input type="hidden" class="receiver" value="${dm.sender }">
								<input type="hidden" id="sender" value="${sessionScope.m.memberId }">
					      </div>
						  </div>
					  </div>
					</div><!-- 답장하기 modal 종료 -->
					</c:if>
				</c:forEach>
			</table>
			<hr>
			<p class="text-muted">보낸 쪽지함</p>
			<table class="table table-hover sendPosts">
				<tr class="table-primary">
					<th>번호</th><th>받는사람</th><th style="width: 500px; text-align: left;">내용</th><th>날짜</th><th>읽음여부</th><th>삭제하기</th>
				</tr>
					<c:forEach items="${list }" var="dm">
						<c:if test="${dm.sender eq sessionScope.m.memberId}">
							<tr>
								<td>${dm.dmNo }</td>
								<td>${dm.receiver }</td>
								<td style="text-align: left">${dm.dmContent }</td>
								<td>${dm.dmTime }</td>
								<c:choose>
									<c:when test="${dm.readStatus == 'Y' }">
										<td class="text-info">읽음</td>								
									</c:when>
									<c:otherwise>
										<td class="text-danger">읽지않음</td>
									</c:otherwise>							
								</c:choose>
								<td>
									<a href="javascript:void(0)" class="btn btn-danger delmsg" onclick="deleteMsg(this,'${dm.dmNo}')">삭제</a>
								</td>
							</tr>
						</c:if>
					</c:forEach>		
			</table>		
		</div><!-- dmWrap -->
	</div>	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script>
		$(function(){
			//글자수 check
			$(".dmContent").on('keyup change paste', function() {
				var dmContent = $(".dmContent").val();
		        $('.text_cnt').html("("+$(this).val().length+" / 100)");
		        
		        if($(this).val().length > 100) {
		        	swal({
		                title: '글자수는 100자 제한입니다!',
		                icon: 'error',
		                button: '돌아가기'
		              })
			        $(this).val($(this).val().substring(0, 100));
		            $('.text_cnt').html("(100 / 100)");	
		        }
		    });
			//tr 개수 체크해서 1개면 append로 추가하기!!!!!
			var rpVal = $(".receivePosts tr").length;
			var spVal = $(".sendPosts tr").length;
			if(rpVal==1){
				$(".receivePosts tr:first").after("<tr class='table-light'><td colspan='6' style='height:100px; font-size:20px;'>보낸 쪽지가 없습니다!</td></tr>");
			}
			if(spVal==1){
				$(".sendPosts tr:first").after("<tr class='table-light'><td colspan='6' style='height:100px; font-size:20px;'>받은 쪽지가 없습니다!</td></tr>");
			}
			
			$(".cancel").click(function(){
				var index = $(".cancel").index(this);
				$('.text_cnt').eq(index).html("(0 / 100)");
				location.reload();
			});
		});
		
		$(".send").click(function () {
			//선택자를 가져오고 그중에 this가 몇번쨰인지 확인하는거!
			//$(this).index(); 아님!!!
			var index = $(".send").index(this);
			var receiver = $(".receiver").eq(index).val();
			var dmContent = $(".dmContent").eq(index).val();
			var sender = $("#sender").val();
			
			$.ajax({
				url : "/sendDm.do",
				data : {receiver:receiver,dmContent:dmContent,sender:sender},
				success : function(data) {
					if(data == 1){
						dmCount(receiver);
						swal({
							  title: "답장 완료",
							  icon: "success",
							  button: "닫기",
							}).then(function(){
								location.reload();							
							});;
					}else{
						console.log("실패");
					}
				}
			});
		});
		//상세보기 누르면 읽음으로 표시하고,count 업데이트
		$(".reply").click(function(){
			//누른버튼 기준으로 발신자 check
			var receiver = '${sessionScope.m.memberId}';
			var dmNo = $(this).parent().prev().prev().html();
			$.ajax({
				url : "/updateDm.do",
				data : {dmNo:dmNo},
				success : function(data){
					if(data == 1){
						dmCount(receiver);
					}else{
						
					}
				}
			});
		});
		//메시지 삭제하기
		function deleteMsg(obj,dmNo){
			swal({
			    title: "쪽지를 삭제하시겠습니까?",
			    icon: "warning",
			    buttons: ["돌아가기", "삭제하기"],
			    dangerMode: true
			}).then((willDelete) => {
			    if (willDelete) {
			    	location.href="/deleteMsg.do?dmNo="+dmNo;
			    }
			});
		}
	</script>
</body>
</html>