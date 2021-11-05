<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		<div class="main-left-box" id="subnavi">
	        <h2>관리자 페이지</h2>
	        <ul>
	            <li>
	                <span>메인 페이지</span>
	                <ul class="subnavi">
	                    <li><a href="/adminMain">관리자 개요<span>&gt;</span></a></li>	                    
	                </ul>
	            </li>
	            <li>
	                <span>시설 예약 내역</span>
	                <ul class="subnavi">
	                    <li><a href="/adminRoomResList?reqPage=1">객실 예약 내역<span>&gt;</span></a></li>
	                    <li><a href="/adminDiningList?reqPage=1">다이닝 예약 내역<span>&gt;</span></a></li>
	                    <li><a href="/adminLfList?reqPage=1">라이프스타일 예약 내역<span>&gt;</span></a></li>
	                </ul>
	            </li>
	            <li>
	                <span>고객문의 및 회원</span>
	                <ul class="subnavi">
	                    <li><a href="/adminQuestionList?reqPage=1">고객 문의 내역<span>&gt;</span></a></li>
	                    <li><a href="/adminMemberList?reqPage=1&dataType=List&data=''">회원 정보<span>&gt;</span></a></li>	                   
	                </ul>
	            </li>
	            <li>
	                <span>시설 관리</span>
	                <ul class="subnavi">
	                    <li><a href="/roomManage">객실 관리<span>&gt;</span></a></li>
	                    <li><a href="/diningList">다이닝 관리<span>&gt;</span></a></li>	
	                    <li><a href="/lifestyleList?reqPage=1">라이프스타일 관리<span>&gt;</span></a></li>	                    
	                </ul>
	            </li>
	        </ul>
	    </div>