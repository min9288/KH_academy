<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='/resources/fullcalendar-5.10.1/lib/main.css' rel='stylesheet' />
</head>
<style>
.container {
   min-width: 1200px; 
}
	.titleBox{
		font-size: 30px;
		font-weight: bold;
		margin-bottom: 80px;
	}
	.fc-col-header-cell-cushion{
		text-decoration: none;
	}
	.fc-daygrid-day-number{
		text-decoration: none;
	}
</style>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<script src='/resources/fullcalendar-5.10.1/lib/main.js'></script>
	<div class="container" style="margin-bottom:100px;" >
		<div class="titleBox">
			<a href="/contestMain.do"><i class="bi bi-chevron-left"></i></a><span>공모전 캘린더</span>
		</div>
		<%--캘린더 --%>
		<div id="calendar"></div>
	</div>
	
<script>

	document.addEventListener('DOMContentLoaded', function() {
	  var calendarEl = document.getElementById('calendar');
	  var calendar = new FullCalendar.Calendar(calendarEl, {
	    initialView: 'dayGridMonth',
	    events: [
	        {
	          title  : 'event1',
	          start  : '2021-12-05',
	          editable : true,
	          eventLimit : true,
	        },
	        {
	          title  : 'event2',
	          start  : '2021-12-07',
	          end    : '2021-12-10'
	        }
	      ]
	  });
	  calendar.render();
	});


</script>
	
	
	
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>