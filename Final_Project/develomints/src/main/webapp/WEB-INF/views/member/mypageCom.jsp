<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Develomints</title>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
	.page-wrap{
		width: 700px;
		margin: 0 auto;
        padding : 20px;
        margin-bottom: 100px;
	}
	.page-top{
        display: flex;
        justify-content: space-around;
        margin-bottom: 20px;
        padding-bottom: 20px;
        border-bottom: 1px solid #a6adad;
	}
	.profiles{
		display : flex;
		align-items: center;
		border-radius: 60%; 
		overflow: hidden;
	}
	.profiles img{
	    object-fit: cover;			
	}
	.profiile-h{
		margin-left: 20px;
	}
	.profile-h>div{
		margin-bottom: 10px;
	}
	.profile-h>div:last-child *{
		margin-right: 10px;
	}
	.page-top{
		margin-top: 20px;
	}
	.page-middle{
		border-bottom: 1px solid #a6adad;
	}
	.page-middle img{
		width: 40px;
		height: 40px;
	}
	.page-middle div{
        display: flex;
        justify-content: space-between;
        padding: 0 40px 0 40px;
        margin-top: 50px;
        margin-bottom: 50px;
	}
	.page-bottom{
		margin-top: 30px;
		margin-left: 30px;
	}
	.page-bottom>a{
		margin-right: 20px;
	}
	.arrow{
		transition: all ease 0.4s;
	}
	.arrow:hover{
		transform: rotate(90deg);
	}
	.pageLists{
		width:400px; 
		line-height: 2; 
		text-decoration: none; 
		color: black;
	}
	.pageLists:hover{
		color:#78c2ad;
	}							
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="container">
		<h4 style="font-weight: bold; margin-left: 300px;">마이페이지</h4>
		 <div class="page-wrap">
			 <div class="page-top">
				<div class="profiles">
					<c:choose>
						<c:when test="${sessionScope.m.filepath eq null }">
							<img src="/resources/img/member/user.png" style="width: 60px; height:60px;">				
						</c:when>
						<c:otherwise>
							<img src="/resources/upload/member/${sessionScope.m.filepath }" style="width: 80px; height:80px; ">
						</c:otherwise>
					</c:choose>
				</div>
				<div class="profile-h">
					<div>
						<span>[${sessionScope.m.memberName}]님</span>
						<span>등급 : 기업고객<img src="/resources/img/member/management.png" style="width: 35px; height:35px; margin-left: 20px;"></span>
					</div>
					<div>
						<span>이메일:${sessionScope.m.email }</span>
					</div>
				</div>
				<div class="profiles">
					<a href="/updateInfoFrm.do" data-bs-toggle="tooltip" data-bs-placement="top" title="정보수정하기"><img src="/resources/img/member/right-arrow.png" style="width: 30px; height:30px;" class="arrow"></a>
				</div>
			</div>
			<div class="page-middle">
				<h4 style="font-family: NotoBold; margin-bottom: 20px;">커뮤니티</h4>
				<div>
					<img src="/resources/img/member/notes.png">
					<c:choose>
						<c:when test="${announceNo eq 0 }">
							<a class="pageLists" href="javascript:noList();">구인신청 내역 확인</a>
							<a href="javascript:noList()"><img src="/resources/img/member/right-arrow.png" style="width: 20px; height:20px;" class="arrow"></a>						
						</c:when>
						<c:otherwise>
							<a class="pageLists" href="/applicationStatus.do?announceNo=${announceNo }&reqPage=1">구인신청 내역 확인</a>
							<a href="/applicationStatus.do?announceNo=${announceNo }&reqPage=1"><img src="/resources/img/member/right-arrow.png" style="width: 20px; height:20px;" class="arrow"></a>						
						</c:otherwise>
					</c:choose>
				</div>
				<div>
					<img src="/resources/img/member/multiple-users-silhouette.png">
					<a class="pageLists" href="/announceManage.do?memberNo=${sessionScope.m.memberNo }">구인공고보기</a>
					<a href="/announceManage.do?memberNo=${sessionScope.m.memberNo } "><img src="/resources/img/member/right-arrow.png" style="width: 20px; height:20px;" class="arrow"></a>
				</div>
				<div>
					<img src="/resources/img/member/condo.png">
					<a class="pageLists" href="/updateCompanyFrm.do?comNo=${sessionScope.m.comNo }">기업 정보 수정</a>
					<a href="/updateCompanyFrm.do?comNo=${sessionScope.m.comNo } "><img src="/resources/img/member/right-arrow.png" style="width: 20px; height:20px;" class="arrow"></a>
				</div>
			</div>
			<div class="page-bottom">
				<a href="/companyMember.do" class="btn btn-info btn-sm">기업변경 하기</a>
				<a href="/rollbackCompany.do?memberId=${sessionScope.m.memberId }" class="btn btn-outline-danger btn-sm">회사인증 취소</a>
			</div>
		</div>
	 </div>	 
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script>
		var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
		var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
		  return new bootstrap.Tooltip(tooltipTriggerEl)
		})
		var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
		var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
  		return new bootstrap.Popover(popoverTriggerEl)
		})
		function noList(){
			swal({
		        title: '구인공고글이 없습니다',
		        icon: 'warning'
		      });
		}
	</script>
</body>
</html>