<%@page import="notice.model.vo.Notice"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
    <%
 		ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
    	String pageNavi= (String)request.getAttribute("pageNavi");
    	int start = (Integer)request.getAttribute("start");
    	String type = (String)request.getAttribute("type");
    	String keyword = (String)request.getAttribute("keyword");
    	int i = 0;  
		
    	
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항</title>
	<link rel="stylesheet" href="/css/notice.css">
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
                                <li><a href="/question">1:1문의<span>&gt;</span></a></li>
                                <li><a href="/faq">FAQ<span>&gt;</span></a></li>
                            </ul>      
                    </div>    
              
        <div class="main-content">
            <div>
                <h2>공지사항
           
                	<c:if test="${not empty sessionScope.m && sessionScope.m.memberLevel eq 1}">
			
					 <button type="button" class="notice-write" style="border-radius:20px;"><a href="/noticeWriteFrm">글작성</a></button>
          
                    </c:if>
                   
                </h2>
                <div class="search-btn">
              
					<form action="/searchNotice" method="post">
					<%if(type != null) {%>
						<select name="type"> 
						<%if(type.equals("title")) {%>
							<option value="title" selected>제목</option>
							<option value="content">내용</option>
						<%}else { %>
							<option value="title">제목</option>
							<option value="content" selected>내용</option>
						<%} %>
						</select>
                    	<input type="text" name="keyword" placeholder="검색어를 입력해주세요">
                    	<button type="submit" id="sc-btn">검색</button>
					<%}else { %>
					     <select name="type">
                        	<option value="title" selected>제목</option>
                        	<option value="content" >내용</option>
                    	</select>
                    	<input type="text" name="keyword" placeholder="검색어를 입력해주세요">
                    	<button type="submit" id="sc-btn">검색</button>
					<%} %>
				
					</form>
				
              
                </div>
                <hr>
                <div>
                    <table  class="notice-box">
                    	 <tr>
                            <th>No.</th>
                            <th>제목</th>
                            <th>첨부파일</th>
                            <th>작성일</th>
                        </tr>
                        <%for(Notice n : list) {%>
						<tr class = "table-light">
							<td><%=start + (i++) %></td>
							<td>
							<a href='/noticeContent?noticeNo=<%=n.getNoticeNo() %>'><%=n.getNoticeTitle() %></a>
							 </td>
							 <td>
							 <%if(n.getFilepath() == null){ %>
							 -
							 <%}else {%>
							 o
							 <%} %>
							</td>
							<td><%=n.getRegDate() %></td>
						</tr>
						<%} %>
                    </table>
                </div>
            </div>
            

			<div id = "pageNavi"><%=pageNavi %></div>
        </div>
        
        </div>  
        <script>
        </script>
	<%@include file ="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>