<%@page import="tourguide.model.vo.Tourguide"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
    <%
 		ArrayList<Tourguide> list = (ArrayList<Tourguide>)request.getAttribute("list");
	
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>투어가이드</title>

	<link rel="stylesheet" href="/css/tourguide.css">
</head>
<body>
	<%@include file ="/WEB-INF/views/common/header.jsp" %>
		     <div class="main-content">
            <h2>투어 가이드</h2>
            <div class="tg-sel-btn">
                 <ul class="tabs">
                     <li class="tabs_li" ><a href="#">STAY</a></li>
                     <li class="tabs_li" ><a href="#">WITH</a></li>
                 </ul>
            </div>
            <div class="tg-wrap">
                 <div class="tabs_div stay_div">
                     <ul>
                     
                        <%for(Tourguide t : list){%>
	                	 <%if(t.getTgSort() ==0 ) {%>     
                         <li>
                         	 <ul class="admin-s">
                                <li>
                                <c:if test="${not empty sessionScope.m && sessionScope.m.memberLevel eq 1}">
                                <input type="hidden" value="<%=t.getTgSort() %>" >
                                <input type="hidden" value="<%=t.getTgContent() %>" >
                                <input type="hidden" value="<%=t.getTgLocation() %>" >
                                <input type="hidden" value="<%=t.getTgPhone() %>">
                                <input type="hidden" value="<%=t.getFilepath() %>" >
                                <input type="hidden" value="<%=t.getTgTitle() %>" >
                                <input type="hidden" value="<%=t.getTgNo()%>">
                                <a href="#" class="updateTg"><span>수정</span></a>
                                <a href="#" class="deleteTg"><span>삭제</span></a>
                                </c:if>
                                </li>  
                             </ul> 
                         	 <img src="/upload/photo/<%=t.getFilepath() %>">
                             <dl>
                                 <dt><b><%=t.getTgTitle() %></b></dt>
                                 <dd><%=t.getTgContentBr() %></dd>
                             </dl>
                             <ul>
                                 <li><img src="/img/tg-ico-map.jpg"><%=t.getTgLocation() %></li>
                                <li>
                                 <%if(t.getTgPhone()!= null)  {%>
                                 <img src="/img/tg-ico-tel.jpg">
                                 <%=t.getTgPhone() %>
                                 <%} %>
                                 </li>
                             </ul>
                         </li>
                         	<%} %>
                         <%} %>
                     
                     </ul>
 
                 </div>
                 <div class="tabs_div with_div">
                     <ul>
                      <%for(Tourguide t : list){%>
	                	 <%if(t.getTgSort() ==1 ) {%>  
                          <li>
                             <ul class="admin-s">
                                <li>
                                 <c:if test="${not empty sessionScope.m && sessionScope.m.memberLevel eq 1}">
                                 <input type="hidden" value="<%=t.getTgSort() %>" >
                                <input type="hidden" value="<%=t.getTgContent() %>" >
                                <input type="hidden" value="<%=t.getTgLocation() %>" >
                                <input type="hidden" value="<%=t.getTgPhone() %>" >
                                <input type="hidden" value="<%=t.getFilepath() %>" >
                                <input type="hidden" value="<%=t.getTgTitle() %>">
                                <input type="hidden" value="<%=t.getTgNo()%>" >
                                <a href="#" class="updateTg"><span>수정</span></a>
                                <a href="#"  class="deleteTg"><span>삭제</span></a>
                                </c:if>
                              
                                </li>  
                             </ul> 
                          	 <img src="/upload/photo/<%=t.getFilepath() %>" >
                             <dl>
                                 <dt><b><%=t.getTgTitle() %></b></dt>
                                 <dd><%=t.getTgContentBr() %></dd>
                             </dl>
                             <ul>
                                 <li><img src="/img/tg-ico-map.jpg"><%=t.getTgLocation() %></li>
                                 <li>
                                 <%if(t.getTgPhone()!= null)  {%>
                                 <img src="/img/tg-ico-tel.jpg">
                                 <%=t.getTgPhone() %>
                                 <%} %>
                                 </li>
                             </ul>
                         </li>                         
                         <%} %>
                        <%} %>
                        
                     </ul>
                 </div>
            </div>
            <c:if test="${not empty sessionScope.m && sessionScope.m.memberLevel eq 1}">
		
			<form action="/tgWrite" method="post" enctype="multipart/form-data">	
            <div style="display: flex; justify-content: center;">
                <div class="tg-write">
                    <ul>
                    	<li>
                    		<select style="width:200px; padding:8px;" name="tgSort">
                            	<option value="0">STAY</option>
                            	<option value="1">WITH</option>
                            </select>
                    	</li>
                        <li>
                            <span>제목</span><input type="text" name="tgTitle">
                        </li>
                        <li>
                            <input type="file" name="tgfile">    
                        </li>
                        <li>
                            <textarea name="tgContent"  cols="100" rows="5" placeholder="내용입력"></textarea>
            
                        </li>
                        <li>
                            <span>주소</span><input type="text" name="tgLocation">
                        </li>
                        <li>
                            <span>전화번호</span> <input type="text" name="tgPhone">
                        </li>
                        <li>
                            <button type="submit" class="tg-write-btn" style="border-radius:10px;">등록</button>
                			
                        </li>

                    </ul>
                </div>
            </div>
            </form>
           
            </c:if>
              <form action="/updateTg" method="post" enctype="multipart/form-data">
	            <div class="tg-update-wrap" style="display: none;">
	                <div id="update-modal">
	            
	                <input type="hidden" name="status" value="1">
	                
				    	
	                    <h3>투어가이드 수정하기<button type="button" id="tg-close"><img src="/img/shrm_layerClose.png"></button> </h3>
	                    <div class="update-wrap">
	                       		<div style="display:block; overflow:hidden; height:44px;">
	                       		<img src="/img/file.png" width="16px" class="delFile" style="float:left; margin-left:30px; margin-top:10px;">
					    		
					    		<input type="text" class="delfile-name delFile" style="float:left; width:150px; overflow:hidden; text-overflow: ellipsis; border:none;" >
					    	
					    		<button type="button" id="delBtn" class="delFile" style="margin:0; padding:0;margin-top:12px; width:50px; background-color:white;border:none;">
					    		X
					    		</button>
					    		<input type="file" name ="tgfile" style="display:none;" >
					    		<input type="hidden" name ="oldfilepath"  class="frm-tgfile">
					    		</div>
					    		<input type="hidden"name="tgNo" class="frm-tgNo">
	                           <span>제목</span><input type="text"name="tgTitle"  class="frm-tgTitle">
	                           <span>내용</span><textarea cols="80"rows="10" name="tgContent" class="frm-tgContent"></textarea>
	                           <span>주소</span><input type="text" name="tgLocation" class="frm-addr">
	                           <span>번호</span><input type="text"name="tgPhone" class="frm-phone">
	                            <select name="tgSort" class="frm-sort">
	                                <option value="0">STAY</option>
	                                <option value="1">WITH</option>
	                            </select>
	                            <button type="submit">확인</button>
	                    </div>
	                </div>
	            </div>
	        </form>
	            <script>
	            $(function(){
	                $(".updateTg").click(function(){
	                    var idx = $(".updateTg").index(this);
	    				var up = $(".updateTg").eq(idx);
	    	        	var tgNo = up.prev().val();
	    	        	console.log(tgNo);
	    	        	var title = up.prev().prev().val();
	    	        	var file = up.prev().prev().prev().val();
	    	        	var phone = up.prev().prev().prev().prev().val();
	    	        	var addr= up.prev().prev().prev().prev().prev().val();
	    	        	var content= up.prev().prev().prev().prev().prev().prev().val();
	    	        	var sort= up.prev().prev().prev().prev().prev().prev().prev().val();
	    	        	$(".oldfilepath").val(file);
		   	        	$(".frm-tgNo").val(tgNo);
	    	        	$(".delfile-name").val(file);
	    	        	$(".frm-tgfile").val(file);
	    	        	$(".frm-tgTitle").val(title);
	    	        	$(".frm-tgContent").val(content);
	    	        	$(".frm-addr").val(addr);
	    	        	if(phone == "null"){
		    	        	$(".frm-phone").val();
	    	        	}else{
		    	        	$(".frm-phone").val(phone);
	    	        	}
	    	        	if(sort == 0){
	    	        		$(".frm-sort").val("0").prop("selected", true);   	
	    	        	}else if(sort == 1){
	    	        		$(".frm-sort").val("1").prop("selected", true);
		                    
	    	        	}
	    	        	
	    	        	$(".tg-update-wrap").css("display","flex");
	    	        	$("#delBtn").click(function(){
	    	    			$(".delFile").hide();
	    	    			$(this).next().show();
	    	    			$("[name=status]").val(2);	
	    	    		});
	                });
	                $("#tg-close").click(function(){
	                	$(".tg-update-wrap").css("display","none");

	        			$(".delFile").show();
	        			$("#delBtn").next().hide();
    	    			$("[name=status]").val(1);
	                    
	                });
	            });
	      </script>
	      <script>
	
	</script>
         </div>
    <script>
        $(function(){
             $(".tabs_li").click(function(){
                 var contents = $(".tabs_div");
                 var tabs=  $(".tabs_li");
                 contents.css("display", "none");
                 tabs.css("background-color","#fff").css("border","1px solid black").css("font-size","18px").css("font-weight","normal");
                 $(this).css("background-color", "rgb(224, 210, 199)").css("border","1px solid rgb(224, 210, 199)").css("font-weight","bold");
                 var idx = tabs.index(this);
                 if(idx == 0){
                     contents.eq(0).css("display", "block");
                 }else{
                     contents.eq(1).css("display", "block");
                   
                 }
             });
        	$(".tabs_li").eq(0).click();
	
	        $(".deleteTg").click(function(){
	        	var idx = $(".deleteTg").index(this);
	        	var del = $(".deleteTg").eq(idx);
	        	var tgNo = del.prev().prev().val();
	        	$.ajax({
				    url:'/deleteTg', 
				    type:'post', 
				    data:{'tgNo':tgNo}, 
				    success: function(data) {
				    	if(data>0){
					    	alert("삭제 성공");
					    	//JOptionPane
				    		location.href="/tourguide";
				    	}else{
				    		alert("삭제 실패");
				    		location.href="/tourguide";
				    	}
				    }
				});
	        });
        });
    </script>
	<%@include file ="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>