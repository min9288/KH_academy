<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<c:if test="${not empty sessionScope.m }">
<script>
 	var ws;
 	var memberId = '${sessionScope.m.memberId}';
 	$(function(){
 		ws = new WebSocket("ws://khdsa1.iptime.org:18080/alarm.do");
 		//ws = new WebSocket("ws://localhost:80/alarm.do");
 		ws.onopen = dmStart;
 		ws.onmessage = dmMsg;
 		ws.onclose = dmEnd;
 	});
 	function dmStart() {
		var data = {type:"conn",memberId:memberId};
		ws.send(JSON.stringify(data));
		//매개변수로 준 아이디한테 그때 db에서 읽지않은 쪽지를 카운팅해서 화면에 띄워주는거
		dmCount(memberId);
	}
 	function dmMsg(param) {
		$("#dmCount").html(param.data);
	}
 	function dmEnd() {
		console.log("쪽지 소켓 종료");
	}
 	function dmCount(receiver){
 		var data = {type:"alarm",memberId:receiver};
 		ws.send(JSON.stringify(data));
 	}
</script>
<div style="display: flex;align-items: center; width: 200px;padding-left: 40px;">
	<a href="/dmList.do" style="text-decoration: none">
		<span class="text-muted">읽지않은 쪽지:</span><span id="dmCount" class="badge rounded-pill bg-danger" style="margin-right: 20px; margin-left: 5px;"></span>	
	</a>
</div>
</c:if>
