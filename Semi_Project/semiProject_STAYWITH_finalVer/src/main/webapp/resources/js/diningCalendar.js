document.addEventListener('DOMContentLoaded', function() {
	var calendarEl = document.getElementById('calendar');
	var d = new Date();    
	var year = d.getFullYear();
	var month = (d.getMonth() + 1);
	if(month < 10){
		month = "0"+month;
	}
	var day = d.getDate();
	if(day < 10){
	    day = "0"+day;
	}  
	//yyyy-mm-dd
	calendar = new FullCalendar.Calendar(calendarEl, {
		plugins: [ 'interaction', 'dayGrid' ],
		defaultDate: year+"-"+month+"-"+day,
		editable: true,
		eventLimit: true,
		fixedWeekCount: false,
		header: {
			left: 'today',
			center: 'prev,title,next',
			right: ''
		},
		titleFormat: function(date){
			return date.date.year+"년 "+(date.date.month+1)+"월";
		},
		columnHeaderText: function(date){
			var weekList = ['일','월','화','수','목','금','토'];
			return weekList[date.getDay()];
		},
		dateClick : function(data){
			if(!$(data.dayEl).hasClass("fc-other-month")){
				if(!$(data.dayEl).hasClass("fc-future")){
					alert("온라인 예약은 방문 예정일 1일 전까지 가능합니다.");
				}else{
					$(".fc-day").removeClass("selDate");
					$(data.dayEl).addClass("selDate");
					$("[name=rDate]").val(data.dateStr);
					selDate();
				}
			}
		},
		eventClick:function(data){

		},
		dayRender:function(data){
			console.log(data);
			var d = data.date;    
			var year = d.getFullYear();
			var month = (d.getMonth() + 1);
			if(month < 10){
				month = "0"+month;
			}
			var day = d.getDate();
			if(day < 10){
			    day = "0"+day;
			}  
			var dateStr = year+"-"+month+"-"+day;
			if($("[name=rDate]").val() == dateStr){
				$(data.el).addClass("selDate");
			}
			$(".fc-day-top.fc-other-month").empty();
		}           
	});
    calendar.render();
});
$(function(){
	getResv();
});
function getResv(){
	var diningNo = $("#diningNo").val();
	$.ajax({
		url:"/getResv",
		type: "post",
		data: {diningNo:diningNo},
		success:function(data){
			calendar.removeAllEvents();
			for(var i=0;i<data.length;i++){
				if(data[i].lunch>=5 && data[i].dinner>=5){
					calendar.addEvent({title:"예약 불가", color:"transparent",start:data[i].rDate});
				}
			}
		}
	});
}
function selDate(){
	var diningNo = $("#diningNo").val();
	var dateStr = $("[name=rDate]").val();
	$.ajax({
		url:"/selDate",
		type: "post",
		data: {diningNo:diningNo, dateStr:dateStr},
		success:function(data){
			$("#selDate").empty();
			$("#selDate").append("방문 예정일 : "+dateStr);
			$("#selDate").show();
			$("[name=timeType]").prop("disabled",false);
			$("[name=timeType]").prop("checked",false);
			timeReset();
			seatTypeReset();
			guestCntReset();
			if(data != null){
				if(data.lunch >= 5){
					$("#timeType1").prop("disabled",true);
				}
				if(data.dinner >= 5){
					$("#timeType2").prop("disabled",true);
				}
			}
			if($("#oldDate").val() == $("[name=rDate]").val()){
				if($("#oldTimeType").val() == 1){
					$("#timeType1").prop("checked",true);
					$("#timeType1").prop("disabled",false);
					$("#timeType1").click();
				}else{
					$("#timeType2").prop("checked",true);
					$("#timeType2").prop("disabled",false);
					$("#timeType2").click();
				}
			}
		}
	});
}
$(".btnD").click(function(){
	location.href="/diningView?diningNo="+$("#diningNo").val();
});
$("[name=seatType]").change(function(){
	if($(this).val()==1){
		$(".seat-info").show();
		$(".room-info").hide();
	}else if($(this).val()==2){
		$(".seat-info").hide();
		$(".room-info").show();
	}
	guestCntReset();
});
$("[name=seatType]").click(function(){
	if($("#resTime").val() == ""){
		alert("방문 시간을 선택해주세요.");
		seatTypeReset();
	}
});
$(".guest-num>button").click(function(){
	if($("[name=seatType]:checked").val() == undefined){
		alert("좌석 유형을 선택해주세요.");
	}else{
		var cnt;
		var adtCnt = Number($("[name=adtCnt]").val());
		var kidCnt = Number($("[name=kidCnt]").val());
		if($(this).html() == "－"){
			cnt = Number($(this).next().val());
			if(cnt != 0){
				$(this).next().val(--cnt);	
			}
		}else{
			if($("[name=seatType]:checked").val()==1 && adtCnt+kidCnt == 4){
				alert("테이블은 최대 4명까지 이용 가능합니다.");
			}else if($("[name=seatType]:checked").val()==2 && adtCnt+kidCnt == 12){
				alert("룸은 최소 4명부터 최대 12명까지 이용 가능합니다.");
			}else{
				cnt = Number($(this).prev().val());
				$(this).prev().val(++cnt);
			}
		}
	}
});
$("[name=timeType]").click(function(){
	timeReset();
	seatTypeReset();
	guestCntReset();
	if($("[name=rDate]").val() == ""){
		alert("날짜를 선택해주세요.");
		$(this).prop("checked",false);
	}else{
		var diningNo = $("#diningNo").val();
		var timeType = $("[name=timeType]:checked").val();
		$.ajax({
			url:"/getTime",
			type:"post",
			data:{diningNo:diningNo, timeType:timeType},
			success: function(data){
				showTime(data);
				$("#resTime>option").not(".no").each(function(index, item){
		 			$(item).html($(item).val());
		 		});
			}
		});
	}
});
function showTime(data){
	var option = "<option value="+data.open+"></option>";
	$("#resTime").append(option);
	var open = (data.open).split(":");
	var d = new Date();
	d.setHours(Number(open[0]));
	d.setMinutes(Number(open[1]));
	var close = (data.close).split(":");
	var resSet = (Number(close[0]) - 1)+":"+close[1];
	while(true){
		d.setMinutes(d.getMinutes() + 30);
		if(d.getMinutes() == 0){
			if(d.getHours()+":"+d.getMinutes()+"0" == resSet){
				option = "<option value="+resSet+"></option>";
				$("#resTime").append(option);
				break;
			}
			option = "<option value="+d.getHours()+":"+d.getMinutes()+"0"+"></option>";							
		}else{
			if(d.getHours()+":"+d.getMinutes() == resSet){
				option = "<option value="+resSet+"></option>";
				$("#resTime").append(option);
				break;
			}
			option = "<option value="+d.getHours()+":"+d.getMinutes()+"></option>";														
		}
		$("#resTime").append(option);
	}
}
function check(){
	if($("[name=rDate]").val() == "" || $("#resTime").val() == "" || $("[name=seatType]:checked").val() == undefined || Number($("[name=adtCnt]").val()) == 0){
		alert("필수 입력 정보를 확인해주세요.");
	}else{
		var adtCnt = Number($("[name=adtCnt]").val());
		var kidCnt = Number($("[name=kidCnt]").val());
		if($("[name=seatType]:checked").val()==2 && adtCnt+kidCnt < 2){
			alert("룸은 최소 2명부터 이용 가능합니다.")
		}else{
			$(".modal").show();
			$(".modal-body").empty();
			$(".modal-body").append("<p>다이닝 : "+$("#diningNo>option:selected").html()+"</p>");
			$(".modal-body").append("<p>방문 예정일 : "+$("[name=rDate]").val()+"</p>");
			$(".modal-body").append("<p>방문 예정 시간 : "+$("#resTime").val()+"</p>");
			if($("[name=seatType]:checked").val() == 1){
				$(".modal-body").append("<p>좌석 유형 : 테이블</p>");			
			}else{
				$(".modal-body").append("<p>좌석 유형 : 룸</p>");
			}
			$(".modal-body").append("<p>총 인원(어린이 포함) : "+(Number($("[name=adtCnt]").val())+Number($("[name=kidCnt]").val()))+"인</p>");
			$(".modal-body").append("<p>정보 확인 후 예약해주시기 바랍니다.</p>");
		}
	}
	return false;
};
$(".modal-none").click(function(){
	$(".modal").hide();
});
$(".btn-close").click(function(){
	$(".modal").hide();
});
$(".modal-submit").click(function(){
	$("form").submit();
});
function timeReset(){
	$("#resTime>option").not(".no").hide();
	$("#resTime").children(".no").prop("selected",true);
}
function guestCntReset(){
	$("[name=adtCnt]").val(0);
	$("[name=kidCnt]").val(0);
}
function seatTypeReset(){
	$("[name=seatType]").prop("checked",false);
	$(".room-info").hide();
	$(".seat-info").hide();
}