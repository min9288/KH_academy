<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
	<script>
	swal({
        title: '${title}',
        text: '${msg}',
        icon: '${icon}'
      }).then(function(){
    	 window.location = "${loc}"; 
      });
	</script>
</body>
</html>