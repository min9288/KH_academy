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
	<link rel="stylesheet" href="/css/noticeContent.css">
</head>
<body>
	<%@include file ="/WEB-INF/views/common/header.jsp" %>
	         <div class="main">
            
                    <div class="main-left-box">
                        <h2>고객센터</h2>
                        <ul>
                            <li><span>고객센터</span></li>
                        </ul>
                            <ul class="subnavi">
                                <li><a href="/notice?reqPage=1" id="notice-sel">공지사항<span>&gt;</span></a></li>
                                <li><a href="#">1:1문의<span>&gt;</span></a></li>
                                <li><a href="/faq">FAQ<span>&gt;</span></a></li>
                            </ul>      
                    </div>    
              
            <div class="main-content" >   
                <h2>공지사항</h2>
                <hr>
                <div class="n-head">
                    <div class="n-title"><span >제목</span><input type="text" value="<%=n.getNoticeTitle() %>" readonly> </div>
                    <div class="n-day"><span><input type="text"  value="<%=n.getRegDate() %>" style="text-align: right;" readonly></span></div>
                </div>
                 
                 	<%if(n.getFilename() != null) {%>
                 	<div class="n-title">
                 		<span >첨부파일</span>
						<img src="/img/file.png" width="16px">
						<a href="/fileDown?noticeNo=<%=n.getNoticeNo()%>"><%=n.getFilename() %></a>
						
	                 </div>
	                 <%} %>
                <div class="n-content">
                    <%=n.getNoticeContentBr() %> 
                </div>
                <div class="n-btn">
              
                	<c:if test="${not empty sessionScope.m && sessionScope.m.memberLevel eq 1}">
					  	
                		<button><a href="/noticeUpdateFrm?noticeNo=<%=n.getNoticeNo() %>" >수정</a></button>
                		
						<button><a href="/noticeDelete?noticeNo=<%=n.getNoticeNo() %>">삭제</a></button>
                    	
                    	</c:if>
					 <c:if test="${(not empty sessionScope.m || empty sessionScope.m) && sessionScope.m.memberLevel ne 1}">
					  	<button><a href="/notice?reqPage=1">확인</button>
					 </c:if>
				
                    	
                </div>
            </div>

        </div>  
	<%@include file ="/WEB-INF/views/common/footer.jsp" %>
	
</body>
</html>