<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="container">
		<legend>영화 순위 가져오기</legend>
		<input type="date" id="movieDate">
		<button class="btn btn-primary" id="movieRank">영화순위 가져오기</button>
		<div id="movieResult"></div>
	</div>
	<script>
		$("#movieRank").click(function(){
			var movieDate = $("#movieDate").val();
			var targetDt = movieDate.replaceAll("-","");
			$.ajax({
				url : "/movieRank",
				data : {targetDt:targetDt},
				success : function(data){
					console.log(data);
					var table = $("<table class='table' style='width:100%;'></table>");
					var titleTr = $("<tr class='table-primary'></tr>");
					titleTr.append($("<th>순위</th>"));
					titleTr.append($("<th>영화제목</th>"));
					titleTr.append($("<th>개봉일</th>"));
					titleTr.append($("<th>누적관객수</th>"));
					titleTr.append($("<th>누적매출</th>"));
					table.append(titleTr);
					for(var i=0; i<data.length; i++){
						var tr = $("<tr class='table-light'></tr>");
						tr.append($("<td>"+data[i].rank+"</td>"));
						tr.append($("<td>"+data[i].movieNm+"</td>"));
						tr.append($("<td>"+data[i].openDt+"</td>"));
						tr.append($("<td>"+data[i].audiAcc+"</td>"));
						tr.append($("<td>"+data[i].salesAcc+"</td>"));
						table.append(tr);
					}
					$("#movieResult").html(table);
				}
			});
		});
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>