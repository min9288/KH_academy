$(function(){
	updateLoadDate();
	updateLoadTime();
	if($("[name=seatType]:checked").val() == 1){
		$(".seat-info").show();
	}else{
		$(".room-info").show();
	}
});
function updateLoadDate(){
	var diningNo = $("#diningNo").val();
	var dateStr = $("[name=rDate]").val();
	$.ajax({
		url:"/selDate",
		type: "post",
		data: {diningNo:diningNo, dateStr:dateStr},
		success:function(data){
			$("#selDate").append("방문 예정일 : "+dateStr);
			$("#selDate").show();
			if(data != null){
				if(data.lunch >= 5){
					$("#timeType1").prop("disabled",true);
				}
				if(data.dinner >= 5){
					$("#timeType2").prop("disabled",true);
				}
			}
			if($("#oldTimeType").val() == 1){
				$("#timeType1").prop("disabled",false);
			}else{
				$("#timeType2").prop("disabled",false);
			}
		}
	});
}
function updateLoadTime(){
	var diningNo = $("#diningNo").val();
	var timeType = $("[name=timeType]:checked").val();
	$.ajax({
		url:"/getTime",
		type:"post",
		data:{diningNo:diningNo, timeType:timeType},
		success: function(data){
			showTime(data);
			var oldTime = $(".oldTime").val();
			$("#resTime>option").not(".no").each(function(index, item){
	 			$(item).html($(item).val());
	 			if($(item).val() == oldTime){
	 				$(item).prop("selected",true);
	 			}
	 		});
		}
	});
}