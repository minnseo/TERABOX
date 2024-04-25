<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
<!-- 상단 고정 메뉴 (스크롤 이벤트) -->
<!-- 서브 메뉴 show / hide -->
$(document).ready(function() {
	// 마우스를 메뉴 항목 위로 올리거나 포커스가 들어올 때  
	$('.has-sub').on('mouseover focusin', function() {
		$(this).children('ul').stop().fadeIn(300); // 하위 메뉴를 나타나게 함 (300ms)
		$('.bg_gnb').stop().fadeIn(200); // 배경 요소를 함께 나타나게 함
	});
	// 마우스가 메뉴 항목을 벗어나거나 포커스가 떠났을 때
	$('.has-sub').on('mouseleave focusout', function() {
		$(this).children('ul').stop().fadeOut(300); // 하위 메뉴를 숨김
		$('.bg_gnb').stop().fadeOut(200); // 배경 요소를 함께 숨김
	});
});
</script>
<!-- 헤더 시작 -->
<header style="border-bottom: 1px solid #351f67;">
	<div class="page-main">
		<!-- 상단 -->
		<div id="top_left">
			<ul>
				<li><a href="<c:url value="/cs/csMain.do"/>">고객센터</a></li>
				<li><a href="${pageContext.request.contextPath}/reservation/quickRes.do">빠른예매</a></li>
			</ul>
		</div>
		
		<div id="top_right">
			<ul>
				<c:if test="${empty user}">
				<li><a href="${pageContext.request.contextPath}/member/login.do">로그인</a></li>
				<li><a href="${pageContext.request.contextPath}/member/registerUser.do">회원가입</a></li>
				</c:if>
			</ul>

			<ul>
				<c:if test="${!empty user}">
					<li><a href="${pageContext.request.contextPath}/member/logout.do">로그아웃</a></li>
					
					<c:if test="${user.auth == 2}">
					<li>
						<a href="${pageContext.request.contextPath}/member/myPage.do">MY페이지</a>
					</li>
					</c:if>
					
					<c:if test="${user.auth == 9}">
					<li style="width: 70px;">
						<a href="${pageContext.request.contextPath}/board/memberList.do">관리자메인</a>
					</li>
					</c:if>
				</c:if>
			</ul>
		</div>
				
		<div id="main_nav">
			<ul class="gnb">
				<li class="has-sub">
					<a href="${pageContext.request.contextPath}/movie/movieList.do" class="btn4">영화</a>
					<ul>
						<li>
							<a href="${pageContext.request.contextPath}/movie/movieList.do">현재상영작</a>
						</li>
						<li>
							<a href="${pageContext.request.contextPath}/movie/premovieList.do">상영예정작</a>
						</li>
					</ul>
				</li>
				
				<li>
					<a href="${pageContext.request.contextPath}/theater/theaterDetail.do" class="btn4">극장</a>
				</li>
				
				<li class="has-sub">
					<a href="${pageContext.request.contextPath}/reservation/quickRes.do" class="btn4">예매</a>
					<ul>
						<li>
							<a href="${pageContext.request.contextPath}/reservation/quickRes.do">빠른예매</a>
						</li>
						<li>
							<a href="${pageContext.request.contextPath}/reservation/schedule.do">상영시간표</a>
						</li>
					</ul>
				</li>
				
				<li id="logo">
					<a href="${pageContext.request.contextPath}/main/main.do">
						<img src="${pageContext.request.contextPath}/images/logo.png" width="160">
					</a>
				</li>
				
				<li class="has-sub">
					<a href="<c:url value="/event/eventList.do"/>" class="btn4">이벤트</a>
					<ul>
						<li><a href="<c:url value="/event/eventList.do"/>">진행중 이벤트</a></li>
						<li><a href="<c:url value="/event/eventEndList.do"/>">지난 이벤트</a></li>
					</ul>
				</li>
				
				<li><a href="${pageContext.request.contextPath}/snack/snackList.do" class="btn4">스토어</a></li>
					
				<li><a href="${pageContext.request.contextPath}/membership/membershipList.do" class="btn4">멤버십</a></li>
			</ul>
		</div>
	</div>
</header>
<!-- 서브 메뉴 배경 -->
<div class="bg_gnb"></div>  
<!-- 헤더 끝 -->