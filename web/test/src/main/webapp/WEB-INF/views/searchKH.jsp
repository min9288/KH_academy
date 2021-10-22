<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
</head>
<body>
	<h1>학원 정보 조회하기</h1>
	<hr>
	<input type="text" id="searchInfo">
	<span><button id="sAj">조회하기</button></span>
	<ul>
		<li></li>
	</ul>
	
	<script>
		$("#sAj").click(function(){
			var result = $(this).next().children();
			$.ajax({
				url : "/searchInfo",
				type : "get",
				success : function(data){
					result.empty();
					if(data != null){
						for(var i=0; i < data.length; i++){
							var html = data[i].khName+"<br>"+data[i].addr+"<br>"+data[i].fax;
							result.append(html);
						}
					}else {
						result.append("정보가 없습니다.");
					}
				}
			});
		});
	</script>
</body>
</html>