<%@page import="notice.model.vo.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	Notice n = (Notice)request.getAttribute("n");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="/css/noticeWrite.css">
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	  <div class="main" style="display: block;">
	      <form action="/noticeUpdate" method="post" enctype="multipart/form-data" >
	      <input type="hidden" name="noticeNo" value="<%=n.getNoticeNo() %>">
                <h2>공지사항 수정</h2>
            <hr>
            <div class="nw-box">
                <table>
                    <tr>
                     	<td colspan="2"><span>제목</span><input type="text" value="<%=n.getNoticeTitle() %>" name="noticeTitle" > </td>
                    </tr>   
                    <tr>
                        <td><span>작성자</span>
                     
				    	<input type="text" name="noticeWriter" value="${sessionScope.m.getMemberKname() }" readonly>
				    
                        </td>
                        <td>
                        <span>첨부파일 </span>	
                        <input type="hidden" name="status" value="1">
					    	<%if(n.getFilename() != null)  {%>
					    		<!-- <input type="file">에는 value를 설정할 수 없음 -->
					    		<img src="/img/file.png" width="16px" class="delFile">
					    		<span class="delFile" style="font-weight:normal;font-size:15px;"><%=n.getFilename() %></span>
					    		<button type="button" id="delBtn" class="delFile">
					    		삭제
					    		</button>
					    		<input type="file" name ="upfile" style="display:none;">
					    		<input type="hidden" name ="oldfilename" value="<%=n.getFilename()%>">
					    		<input type="hidden" name ="oldfilepath" value="<%=n.getFilepath()%>">
					    	<%}else { %>
				  				<input type="file" name="upfile">
					    	<%} %></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="padding-bottom:20px;"><textarea cols="150" rows="40" name="noticeContent"><%=n.getNoticeContent() %></textarea> </td>
                    </tr>
                </table>
            
           
            </div>
            <div class="nw-btn">
                <button type="submit">확인</button>
            
                <button type="button"><a href="/notice?reqPage=1">취소</button>
            </div>
            </form>
        </div>
		<script>
		$("#delBtn").click(function(){
			$(".delFile").hide();
			$(this).next().show();
			$("[name=status]").val(2);			
		});
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>