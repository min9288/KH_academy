<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Develomint</title>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
</head>
<style>
	.contain{
		width: 1000px;
		margin: 0 auto;
		margin-top: 100px;
		margin-bottom: 100px;
	}
	.memberName{
		margin: 10px;
		margin-bottom: 15px;
		font-size: 20px;
		font-weight: 900;
	}
	.info img{
		width: 16px;
		height: 16px;
	}
	.info{
		margin-left: 40px;
	}
	.infoBox>img{
		margin-left: 15px;
	}
	.infoBox>span{
		margin-left: 20px;
		color: gray;
		font-size: 13px;
	}
	.summary{
		margin: 0 auto;
		overflow: hidden;
		width: 1020px;
		padding: 30px 0px;
		background-color: rgb(250, 250, 250);
		position: relative;
	}
	.item{
		float: left;
		position: relative;
	}
	.item div{
		width: 250px;
		text-align: center;
	}
	.after:after {
		content: '';
    	display: block;
    	position: absolute;
    	left: 0;
    	width: 1px;
    	top: 10px;
    	height: 50px;
    	background-color: #888;
	}
	.header{
		color: #888;
		margin-bottom: 8px;
	}
	.photo{
		float: left;
		
	}
	.info{
		float: left;
	}
	.memberInfo{
		margin-bottom: 50px;
		overflow: hidden;
	}
	.title{
		margin-top: 100px;
	}
	.siTable{
		height: 100px;		
	}
	.si>th, .si>td{
		padding: 0px 100px;
	}
	.si{
		text-align: center;
	}
	.bar{
		border-top: 2px solid #666;
	}
	.certiTable{
		width: 1000px;
	}
	.sf{
		width: 1000px;
		border: 1px solid #888;
		border-top: none;
	}
	.sf>p{
		padding: 0px 40px;
		padding-top: 30px;
		padding-bottom: 10px;
		font-size: 15px;
	}
	.selectBtn{
		margin-top: 50px;
		text-align: center;
	}
	.backBtn{
		background-color: orange;
		color: white;
		width: 150px;
		height: 60px;
		font-size: 20px;
		font-weight: 900;
		border: none;
		border-radius: 10px;
		transition: background-color 1s;
	}
	.backBtn:hover{
		background-color: red;
	}
	.updateResume{
		background-color: rgb(78, 205, 196);
		color: white;
		width: 150px;
		height: 60px;
		font-size: 20px;
		font-weight: 900;
		border: none;
		border-radius: 10px;
		transition: background-color 1s;
	}
	.updateResume:hover{
		background-color: rgb(0, 174, 255);
	}
</style>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="contain">
		<div class="resumeTitle">
			<p style="font-size: 24px; color: black; font-weight: 900;">${r.resumeTitle }</p>
		</div>
		<hr>
		<div class="memberInfo">
			<div class="photo">
           		<div class="inbox">
           			<c:choose>
						<c:when test="${sessionScope.m.filepath eq null }">
							<img src="/resources/img/member/user.png" style="width: 120px; height:120px;">				
						</c:when>
						<c:otherwise>
							<img src="<%-- /resources/upload/member/${sessionScope.m.filepath } --%>  /resources/img/member/user.png" style="/* width: 100px; height:140px; */width: 120px; height:120px; ">
						</c:otherwise>
					</c:choose>
           		</div>
      		</div>
			<div class="info">
				<div class="memberName">
					${m.memberName }
				</div>
				<div class="email infoBox">
					<img src="/resources/img/resume/mail.PNG"><span>${m.email }</span>
				</div>
				<div class="phone infoBox">
					<img src="/resources/img/resume/phone.PNG"><span>${m.phone }</span>
				</div>
			</div>
		</div>
			<div class="summary">
	            <div class="item" style="margin-left: 0px;">
	                <div class="header">??????</div>
	                <div class="description ellipsis">
	               		${r.schoolName }                 
	                </div>
	            </div>
				
	            <div class="item after">
	                <div class="header">??????</div>
	                <div class="description">
						<c:if test="${r.career eq 1 }">
							<span>??????</span>
						</c:if>
						<c:if test="${r.career eq 2 }">
							<span>??????</span>
						</c:if>
					</div>
	            </div>

		        <div class="item after">
		            <div class="header">????????????</div>
		            <div class="description">
		            	<c:if test="${r.money eq 1 }">		<!-- 1 -> ??????????????? ?????? -->
				            <span>??????????????? ??????</span>
						</c:if>
						<c:if test="${r.money eq 2 }">		<!-- 2 -> 2000??? ~ 2400??? -->
							<span>2000??? ~ 2400???</span>
						</c:if>
						<c:if test="${r.money eq 3 }">		<!-- 3 -> 2400??? ~ 2800??? -->
						    <span>2400??? ~ 2800???</span>
						</c:if>
						<c:if test="${r.money eq 4 }">		<!-- 4 -> 2800??? ~ 3200??? -->
						    <span>2800??? ~ 3200???</span>
						</c:if>
						<c:if test="${r.money eq 5 }">		<!-- 5 -> 3200??? ~ 3600??? -->
						    <span>3200??? ~ 3600???</span>
					 </c:if>
						 <c:if test="${r.money eq 6 }">		<!-- 6 -> 3600??? ~ 4000??? -->
						    <span>3600??? ~ 4000???</span>
						</c:if>
						<c:if test="${r.money eq 7 }">		<!-- 7 -> 4000??? ?????? -->
							<span>4000??? ??????</span>
						</c:if>
		            </div>
		        </div>
		
		        <div class="item after">
		            <div class="header">??????????????? / ????????????</div>
		            <div class="description">${r.workPlace }<br>
		            	<c:if test="${r.workForm eq 1 }">		<!-- 1 -> ????????? -->
							<span>?????????</span>
						</c:if>
						<c:if test="${r.workForm eq 2 }">		<!-- 2 -> ????????? -->
						    <span>?????????</span>
						</c:if>
						<c:if test="${r.workForm eq 3 }">		<!-- 3 -> ??????????????? -->
						    <span>???????????????</span>
						</c:if>
						<c:if test="${r.workForm eq 4 }">		<!-- 4 -> ?????? -->
						    <span>??????</span>
						</c:if>
						<c:if test="${r.workForm eq 5 }">		<!-- 5 -> ???????????? -->
						    <span>????????????</span>
						</c:if>
		            </div>
		        </div>
		</div>
		
		<div class="aducation title">
			<h3>?????? <span style="font-size: 15px; margin-left: 20px;">???????????? <span style="font-size: 18px;">:</span> 
			<c:if test="${r.aducation eq 1 }">
				<span>???????????? ??????</span>		
			</c:if>
			<c:if test="${r.aducation eq 2 }">
				<span>????????? ??????</span>		
			</c:if>
			<c:if test="${r.aducation eq 3 }">
				<span>???????????? ??????</span>		
			</c:if>
			<c:if test="${r.aducation eq 4 }">
				<span>????????? ??????</span>		
			</c:if>
			</span></h3>
			<div class="bar"></div>
			<div class="schoolInfo">
				<table class="siTable" style=" width:1000px; border: 1px solid #888; border-top: none;">
	                	<tr class="si" style="text-align: center; background-color: #F7F7F7;">
	                        <th style="border-righr: 1px solid #888">????????????</th>
	                        <th style="border-righr: 1px solid #888">?????????</th>
	                        <th>??????</th>
	                    </tr>
	                    <tr class="si">
	                       	<td>${r.schoolStart } ~ ${r.schoolEnd }</td>
	                       	<td>${r.schoolName }</td>
	                      	<td>
								<c:if test="${r.major eq 1 }">
									?????????????????????
								</c:if>
								<c:if test="${r.major eq 2 }">
									??????????????????
								</c:if>
								<c:if test="${r.major eq 3 }">
									??? ????????????
								</c:if>
								<c:if test="${r.major eq 0 }">
									-
								</c:if>
							</td>
	                	</tr>
	            </table>
        	</div>
		</div>
		
		<div class="career title">
			<h3>?????? <span style="font-size: 15px; margin-left: 20px;">
				<c:if test="${r.career eq 1 }">
					??????
				</c:if>
				<c:if test="${r.career eq 2 }">
					??????
				</c:if>
			</span></h3>
			<div class="bar"></div>
		</div>
		
		<c:if test="${not empty r.myTech }">
			<div class="myTech title">
				<h3>????????????</h3>
				<div class="bar"></div>
				<table class="techTable" style="border: 1px solid #888; border-top: none;">
					<tr>
						<th style="background-color: #F7F7F7; width: 1000px; text-align: center; height: 50px;">????????????</th>
					</tr>
					<tr>
						<%-- <c:forEach items="${r.myTech }" var="rs" varStatus="i">
							
						</c:forEach> --%>
						<td style="padding: 5px 10px; height: 50px;">${r.myTech }</td>							
					</tr>
				</table>
			</div>
		</c:if>
		
		<c:if test="${not empty r.military }">
			<div class="military title">
				<h3>??????????????????</h3>
				<div class="bar"></div>
				<table class="militaryTable" style="width: 1000px;">
					<tr style="border: 1px solid #888;">
						<th style="background-color: #F7F7F7; width: 150px; height: 60px; text-align: center;">????????????</th>
							<c:if test="${r.military eq 1 }">
								<td style="padding-left: 15px;">????????????</td>
							</c:if>
							<c:if test="${r.military eq 2 }">
								<td style="padding-left: 15px;">??????</td>
							</c:if>
							<c:if test="${r.military eq 3 }">
								<td style="padding-left: 15px;">??????</td>
							</c:if>
							<c:if test="${r.military eq 4 }">
								<td style="padding-left: 15px;">??????</td>
							</c:if>
							<c:if test="${r.military eq 5 }">
								<td style="padding-left: 15px;">?????????</td>
							</c:if>
					</tr>
					<c:if test="${not empty r.veterans }">
						<c:if test="${r.veterans eq 2 }">
							<tr>
								<th>????????????</th>
								<td>?????????</td>
							</tr>						
						</c:if>
					</c:if>
				</table>
			</div>
		</c:if>
		
		<c:if test="${not empty r.certiName }">
			<div class="certi title">
				<h3>?????????</h3>
				<div class="bar"></div>
				<table class="certiTable">
					<tr style="border: 1px solid #888; border-top: none; height: 50px; background-color: #F7F7F7;">
						<th style="text-align: center; border-right: 1px solid #888">?????????</th>
						<th style="text-align: center; border-right: 1px solid #888">????????????</th>
						<th style="text-align: center; border-right: 1px solid #888">?????????</th>
						<th style="text-align: center;">??????</th>
					</tr>
					<tr style="border: 1px solid #888; border-top: none; height: 50px;">
					<td style="text-align: center; border-right: 1px solid #888">${r.certiDate }</td>
					<td style="text-align: center; border-right: 1px solid #888">${r.certiName }</td>
					<td style="text-align: center; border-right: 1px solid #888">${r.certiIssue }</td>
					<c:if test="${r.certiPass eq 1 }">
						<td style="text-align: center;">????????????</td>
					</c:if>
					<c:if test="${r.certiPass eq 2 }">
						<td style="text-align: center;">????????????</td>
					</c:if>
					<c:if test="${r.certiPass eq 3 }">
						<td style="text-align: center;">????????????</td>
					</c:if>
				</table>
			</div>
		</c:if>
		
		<c:if test="${not empty r.selfintroName }">
			<div class="selfintro title">
				<h3>???????????????</h3>
				<div class="bar"></div>
				<div class="sf">
					<p style="font-size: 16px; font-weight: 900;">[${r.selfintroName }]</p>
					<p style="padding-top: 0px;">${r.selfintroContent }</p>			
				</div>
			</div>
		</c:if>
		<div class="selectBtn">
			<input type="button" onclick="history.go(-1)" class="backBtn" value="????????????">
			<a href="updateResumeFrm.do?ceoResume=${r.ceoResume }"><button class="updateResume">????????????</button></a>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>