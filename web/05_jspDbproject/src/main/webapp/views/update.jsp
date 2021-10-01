<%@page import="kr.or.iei.member.model.service.MemberService"%>
<%@page import="kr.or.iei.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	// 1. 인코딩
    	request.setCharacterEncoding("utf-8");
    	// 2. view에서 보내준 값 추출
    	Member m = new Member();
    	m.setMemberPw(request.getParameter("memberPw"));
    	m.setMemberName(request.getParameter("memberName"));
    	m.setPhone(request.getParameter("phone"));
    	m.setAddress(request.getParameter("address"));
    	m.setMemberNo(Integer.parseInt(request.getParameter("memberNo")));
    	// 3. 비즈니스로직처리
    	int result = new MemberService().update(m);
    	if(result > 0){
    		// 세션 데이터 변경 
     	   	// 1) 현재 시점으로 다시 조회해서 세션의 데이터를 변경
			// String memberId = request.getParameter("memberId");
     	   	// Member member = new MemberService().selectOneMember(memberId, m.getMemberPw());
			// 세션은 동일 키로 다시 setAttribute하는경우 덮어쓰기    		
     	   	// session.setAttribute("member", member);
			
			// 세션 데이터 변경 2) 세션 객체의 값을 직접 변경
			Member member = (Member)session.getAttribute("member");
			member.setMemberPw(m.getMemberPw());
			member.setMemberName(m.getMemberName());
			member.setPhone(m.getPhone());
			member.setAddress(m.getAddress());
    	}
    	
		
		// 4. 화면처리 
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
	<%if(result > 0) {%>
		alert("정보변경 성공!");
	<%} else {%>
		alert("정보변경 실패!");
	<%} %>
		location.href="/";
	</script>
</body>
</html>