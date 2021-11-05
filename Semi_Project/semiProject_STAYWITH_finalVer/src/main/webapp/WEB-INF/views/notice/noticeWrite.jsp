<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="/css/noticeWrite.css">
</head>
<body>
	<%@include file ="/WEB-INF/views/common/header.jsp" %>
	      <div class="main" style="display: block;">
	      <form action="/noticeWrite" method="post" enctype="multipart/form-data">
                <h2>공지사항 작성</h2>
            <hr>
            <div class="nw-box">
                <table>
                    <tr>
                        <td colspan="2"><span>제목</span>  <input type="text" name="noticeTitle" style="border:1px solid black;"></td>
                    </tr>
                    
                    <tr>
                        <td><span>작성자</span>
                         <input type="text" value="${sessionScope.m.memberId }" name="noticeWriter" readonly></td>
                        <td><span>첨부파일</span> <input type="file" name="upfile"></td>
                    </tr>
                  
                    <tr>
                        <td colspan="2" style="padding-bottom:20px;"><textarea cols="130" rows="40" name="noticeContent"></textarea> </td>
                    </tr>
                </table>
            
           
            </div>
            <div class="nw-btn">
                <button type="submit">확인</button>
            
                <button type="button"><a href="/notice?reqPage=1">취소</button>
            </div>
            </form>
        </div>
     
	<%@include file ="/WEB-INF/views/common/footer.jsp" %>

</body>
</html>