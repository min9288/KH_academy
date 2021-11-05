
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
		dateClick : function(data){
			if($(data.dayEl).hasClass("fc-future")){
				clickEffect(data.dateStr);
			}else{
				alert("선택한 날짜는 예약이 불가능합니다.");
			}
			console.log(data);
			/*alert(data.dateStr);*/
			
		},
		eventClick:function(data){
			alert("이미 예약이 마감되었습니다.");
		},
		dayClick: function(date, allDay, jsEvent, view) {
			   var yy=date.format("YYYY");
			   var mm=date.format("MM");
			   var dd=date.format("DD");
			   var ss=date.format("dd");
			   onchangeDay(yy,mm,dd,ss);
			   
			     }
	});
    calendar.render();
});


function clickEffect(data) {
	var date = data;
		jQuery('#resDate').val(date);
}
function addEvent() {
	
}

$(function(){
	var lfNo = $("[name=lfNo]").val();
	console.log(lfNo);
	//예약 불가
	$.ajax({
		url:"/resDate",
		type : "post",
		data : {lfNo:lfNo},
		success:function(data){
			console.log(data);
			//data[i].resDate
			for(var i=0;i<data.length;i++){
				calendar.addEvent({title:" 예약마감",color:'transparent',textColor:'#FFFFFF',start:data[i].resDate,end:data[i].resDate})
			}
		}
	})
	/*calendar.addEvent({title:"첫번째이벤트",color:'#FF0000',textColor:'#FFFFFF',start:'2021-10-24',end:'2021-10-24'}); 
	calendar.addEvent({title:"첫번째이벤트",color:'#0000FF',textColor:'#FFFFFF',start:'2021-10-25',end:'2021-10-25'});*/
	
});