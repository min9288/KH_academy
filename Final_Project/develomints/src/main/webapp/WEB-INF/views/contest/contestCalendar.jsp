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
	#contestBox{
		margin-top:80px;
		margin-left: 55px;
		overflow: hidden;
	}
	.dateBox{
		display: flex;
	}
	#contestBox>div{
		float: left;
		margin-bottom: 30px;
	}
	.contestTitle{
		font-size: 20px;
		font-weight: bold;
		margin-top: 8px;
	}
	.contestContent{
		margin: 0;
	}
	.contestImgBox{
		width: 280px;
		height: 400px;
		box-shadow: 0px 1px 5px -2px rgb(0 0 0 / 20%), 0px 0px 4px 0px rgb(0 0 0 / 14%), 0px 1px 10px 0px rgb(0 0 0 / 12%);
		overflow: hidden;
		margin-right: 30px;   
		border-radius: 5px;
	}
	.contestImgBox img{
	   height:100%;
	   width: 100%;
	   object-fit:cover;   
	   transform:scale(1.0);        
	   transition: transform .5s; 
	}
	.contestImgBox img:hover{ 
	   transform:scale(1.1);
	   transition: transform .5s;
	}

</style>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<script src='/resources/fullcalendar-5.10.1/lib/main.js'></script>
	<div class="container" style="margin-bottom:100px;" >
		<div class="titleBox">
			<a href="/contestMain.do"><i class="bi bi-chevron-left"></i></a><span>공모전 캘린더</span>
		</div>
		<div class="dateBox">
			<input type="date" class="form-control" name="contestDeadline" value="${today }" style="width: 300px;">
			<button id="searchDate" class="form-control" style="width: 100px; margin-left: 10px;">검색</button>
		</div>
		<div id="contestBox">
			
		</div>
	</div>
	
<script>
	$("#searchDate").click(function(){
		var contestDeadline = $("input[name=contestDeadline]").val();
		$.ajax({
			url : "/searchContest.do",
			type : 'post',
			data : {contestDeadline:contestDeadline},
			success : function(data){
				$("#contestBox").empty();
				
				for(var i = 0; i<data.length; i++){	
					var div = $("<div>");
					var imgbox = $("<div class='contestImgBox'>");
					var atag = $("<a href='/contestView.do?contestNo="+data[i].contestNo+"'>");
					atag.append("<img src='/resources/img/contest/"+data[i].contestImg+"'>");
					imgbox.append(atag);
					div.append(imgbox);
					if(data[i].contestTitle.length > 15){
						var string = data[i].contestTitle;
						var substring = string.substring(0,15);
						div.append("<p class='contestTitle'>"+substring+"...</p>");
					}else{
						div.append("<p class='contestTitle'>"+data[i].contestTitle+"</p>");
					}
					div.append("<p class='contestContent'>주최 : "+data[i].contestHost+"</p>");
					div.append("<p class='contestContent'>기간 : "+data[i].contestDate+" ~ "+data[i].contestDeadline+"</p>")
					$("#contestBox").append(div);
				}
			}
		});
	})
	$("#searchDate").trigger('click');
</script>
	
	
	
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>