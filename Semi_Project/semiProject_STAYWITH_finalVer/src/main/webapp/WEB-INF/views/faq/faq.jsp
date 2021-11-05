<%@page import="java.util.ArrayList"%>
<%@page import="faq.model.vo.Faq"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
 		ArrayList<Faq> list = (ArrayList<Faq>)request.getAttribute("list");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FAQ</title>
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
                                <li><a href="/notice?reqPage=1">공지사항<span>></span></a></li>
                                <li><a href="/question">1:1문의<span>></span></a></li>
                                <li><a href="/faq"id="faq-sel">FAQ<span>&gt;</span></a></li>
                            </ul>      
                    </div>    
            <div class="main-content">
                    <h2>FAQ</h2>
                
                    <hr>
                    <div class="tb" >
                    <table border="1" style="width: 70%;">
                        <tr>
                            <td class="tb-tab">멤버십 계정</td>
                            <td class="tb-tab">등급</td>
                            <td class="tb-tab">카드</td>
                        </tr>
                        <tr>
                            <td class="tb-tab">포인트 적립</td>
                            <td class="tb-tab">포인트 사용</td>
                            <td class="tb-tab">바우처</td>
                        </tr>
                    </table>
                </div>
      
                 <div class="tb2" >
                        <table border="1">    
                        <%for(Faq f : list){%>
	                	 <%if(f.getFaqSort() ==0 ) {%>                
	                		
	                            <tr class="tb2-tr">
	                                <th class="tb2-th"><img src="img/faq_q-img.JPG" id="faq_q-img" >
	                                <input type="text" value="<%=f.getFaqTitle() %>"readonly style="font-weight:bold; font-size:15px;">
	                                
	                               
	                                <c:if test="${not empty sessionScope.m && sessionScope.m.memberLevel eq 1}">
	                           
	                                <button type="button" class="faq-del-btn"><img src="img/shrm_layerClose.png" id="fdb"> </button>
	                               
	                                </c:if>
	                              
	                                </th>
									</tr>
	                            <tr class="tb2-tr2">
	                                <td class="tb2-td"><input type="hidden" value="<%=f.getFaqContent() %>"><%=f.getFaqContentBr() %></td>
	                            </tr>
	                           <%} %>
	                          <%} %>
                        </table>
                    </div>
                       <div class="tb2" >
                        <table border="1">    
                        <%for(Faq f : list){%>
               			  <%if( f.getFaqSort() ==1 ) {%>                
                		
                            <tr class="tb2-tr">
                                <th class="tb2-th"><img src="img/faq_q-img.JPG" id="faq_q-img" >
                                <input type="text" value="<%=f.getFaqTitle() %>"readonly style="font-weight:bold; font-size:15px;">
                                
                            
                                <c:if test="${not empty sessionScope.m && sessionScope.m.memberLevel eq 1}">
                           
                                <button type="button" class="faq-del-btn"><img src="img/shrm_layerClose.png" id="fdb"> </button>
                            
                                </c:if>
                           
                                </th>
								</tr>
                            <tr class="tb2-tr2">
                                <td class="tb2-td"><input type="hidden" value="<%=f.getFaqContent() %>" ><%=f.getFaqContentBr() %></td>
                            </tr>
                           <%} %>
                          <%} %>
                        </table>
                    </div>
                       <div class="tb2" >
                        <table border="1">    
                        <%for(Faq f : list){%>
          				       <%if( f.getFaqSort() ==2 ) {%>                
                		
                            <tr class="tb2-tr">
                                <th class="tb2-th"><img src="img/faq_q-img.JPG" id="faq_q-img" >
                                <input type="text" value="<%=f.getFaqTitle() %>"readonly style="font-weight:bold; font-size:15px;">
                               
                                <c:if test="${not empty sessionScope.m && sessionScope.m.memberLevel eq 1}">
                           
                                <button type="button" class="faq-del-btn"><img src="img/shrm_layerClose.png" id="fdb"> </button>
                              
                                </c:if>
                         
                                </th>
								</tr>
                            <tr class="tb2-tr2">
                                <td class="tb2-td"><input type="hidden" value="<%=f.getFaqContent() %>" ><%=f.getFaqContentBr() %></td>
                            </tr>
                           <%} %>
                          <%} %>
                        </table>
                    </div>
                        <div class="tb2" >
                        <table border="1">                 
                		<%for(Faq f : list){%>
               			  <%if( f.getFaqSort() ==3 ) {%>   
                            <tr class="tb2-tr">
                                <th class="tb2-th"><img src="img/faq_q-img.JPG" id="faq_q-img" >
                                <input type="text" value="<%=f.getFaqTitle() %>"readonly style="font-weight:bold; font-size:15px;">
                               
                                <c:if test="${not empty sessionScope.m && sessionScope.m.memberLevel eq 1}">
                                
                                <button type="button" class="faq-del-btn"><img src="img/shrm_layerClose.png" id="fdb"> </button>
                              
                                </c:if>
                            
                                </th>
								</tr>
                            <tr class="tb2-tr2">
                                <td class="tb2-td"><input type=""hidden" value="<%=f.getFaqContent() %>" ><%=f.getFaqContentBr() %></td>
                            </tr>
                           <%} %>
                          <%} %>
                        </table>
                    </div>
                       <div class="tb2" >
                        <table border="1">              
                		<%for(Faq f : list){%>
               			  <%if(f.getFaqSort() ==4 ) {%>      
                            <tr class="tb2-tr">
                                <th class="tb2-th"><img src="img/faq_q-img.JPG" id="faq_q-img" >
                                <input type="text" value="<%=f.getFaqTitle() %>"readonly style="font-weight:bold; font-size:15px;">
                            
                                <c:if test="${not empty sessionScope.m && sessionScope.m.memberLevel eq 1}">
                          
                                <button type="button" class="faq-del-btn"><img src="img/shrm_layerClose.png" id="fdb"> </button>
                        
                                </c:if>
                           
                                </th>
								</tr>
                            <tr class="tb2-tr2">
                                <td class="tb2-td"><input type="hidden" value="<%=f.getFaqContent() %>"><%=f.getFaqContentBr() %></td>
                            </tr>
                           <%} %>
                          <%} %>
                        </table>
                    </div>
                       <div class="tb2" >
                        <table border="1">                 
                		<%for(Faq f : list){%>
                		
                 			<%if(f.getFaqSort() ==5 ) {%>   
                            <tr class="tb2-tr">
                                <th class="tb2-th"><img src="img/faq_q-img.JPG" id="faq_q-img" >
                                <input type="text" value="<%=f.getFaqTitle() %>"readonly style="font-weight:bold; font-size:15px;">
                                
                                <c:if test="${not empty sessionScope.m && sessionScope.m.memberLevel eq 1}">
                             
                                <button type="button" class="faq-del-btn"><img src="img/shrm_layerClose.png" id="fdb"> </button>
                          
                                </c:if>
                        
                                </th>
								</tr>
                            <tr class="tb2-tr2">
                                <td class="tb2-td"><input type="hidden" value="<%=f.getFaqContent() %>"><%=f.getFaqContentBr() %></td>
                            </tr>
                           <%} %>
                          <%} %>
                        </table>
                    </div>
  
          
					
					
                  
               
                	<c:if test="${not empty sessionScope.m && sessionScope.m.memberLevel eq 1}">
		
                        <form action="/faqInsert" method="get" enctype="multipart/form-data" >
                       <div style="display: flex; justify-content: center;">
                       
                        <div class="faq-write">
                            <ul>
                            	<li style="margin-bottom:30px; ">
                            		<select style="width:200px; padding:8px;" name="faqSort">
                            			<option value="0">멤버십 계정</option>
                            			<option value="1">등급</option>
                            			<option value="2">카드</option>
                            			<option value="3">포인트 적립</option>
                            			<option value="4">포인트 사용</option>
                            			<option value="5">바우처</option>
                            		</select>
                                </li>
                                
                                <li>
                                    <span>제목</span> <input type="text" name="faqTitle" >
                                </li>
                                <li>
                                    <textarea name="faqContent"  cols="100" rows="5" ></textarea>
                                </li>
                                <li>
                                    <button type="submit" class="faq-write-btn" style="border-radius:10px;">등록</button>
                        
                                </li>

                            </ul>
                        </div>
                         </div>
                         </form>
                   
                
                    </c:if>
                 
            </div>
        </div>
        <script>
            $(function(){
                $(".tb-tab").click(function(){
                     var contents = $(".tb2");
                     var tabs=  $(".tb-tab");
                     contents.css("display", "none");
                     tabs.css("background-color","#fff").css("font-weight","100").css("color","black");
                     $(this).css("background-color", "#b9a989").css("font-weight","bold").css("color","#f6eabf");
                     var idx = tabs.index(this);
                     if(idx == 0){
                         contents.eq(0).css("display", "block");
                     }else if(idx==1){
                         contents.eq(1).css("display", "block");
                       
                     }else if(idx==2){
                         contents.eq(2).css("display", "block");
                       
                     }else if(idx==3){
                         contents.eq(3).css("display", "block");
                       
                     }else if(idx==4){
                         contents.eq(4).css("display", "block");
                       
                     }else if(idx==5){
                         contents.eq(5).css("display", "block");
                       
                     }
                 });
             $(".tb-tab").eq(0).click();
          
            });
            $(".tb2-tr").click(function(){
                     var contents = $(".tb2-tr2");
                     var tabs=  $(".tb2-tr");
                     var idx = tabs.index(this);
                   
                     if($('.tb2-tr2').eq(idx).is(":visible")){
                        contents.eq(idx).hide();
                       
                    }else{
                        contents.eq(idx).show();
                    }
            });
            $(".faq-del-btn").click(function(){
                var btnIdx = $(".faq-del-btn").index(this);
                
                var qna = $(".tb2-tr").eq(btnIdx).children().children("input").val();
                var content = $(".tb2-tr2").eq(btnIdx).children().children("input").val();
                
                console.log(btnIdx);
                console.log(qna);
                console.log(content);
				$.ajax({
				    url:'/deleteFaq', 
				    type:'post', 
				    data:{'qna':qna,'content':content}, 
				    success: function(data) {
				    	if(data>0){
					    	alert("삭제 성공");
				    		location.href="/faq";
				    	}else{
				    		alert("삭제 실패");
				    		location.href="/faq";
				    	}
				    }
				});
        });
        </script>
	<%@include file ="/WEB-INF/views/common/footer.jsp" %>
</body>
	<link rel="stylesheet" href="/css/faq.css">
</html>