<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 헤더 시작 -->
<header>
	<div class="page-main">
		<!-- 상단 -->
		<div id="top_left">
			<ul>
				<li><a href="<c:url value="/cs/csMain.do" />">고객센터</a></li>
				<li><a href="${pageContext.request.contextPath}/reservation/quick_res.do">빠른예매</a></li>
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
					<a href="${pageContext.request.contextPath}/reservation/quick_res.do" class="btn4">예매</a>
					<ul>
						<li>
							<a href="${pageContext.request.contextPath}/reservation/quick_res.do">빠른예매</a>
						</li>
						<li>
							<a href="${pageContext.request.contextPath}/reservation/schedule.do">상영시간표</a>
						</li>
					</ul>
				</li>
				
				<li id="logo">
					<a href="${pageContext.request.contextPath}/main/main.do">
						<img src="${pageContext.request.contextPath}/images/logo_p.png" width="160">
					</a>
				</li>
				
				<li class="has-sub">
					<a href="<c:url value="/event/eventList.do" />" class="btn4">이벤트</a>
					<ul>
						<li><a href="<c:url value="/event/eventList.do" />">진행중이벤트</a></li>
						<li><a href="<c:url value="/event/eventEndList.do" />">지난이벤트</a></li>
					</ul>
				</li>
				
				<li><a href="${pageContext.request.contextPath}/snack/list.do" class="btn4">스토어</a></li>
					
				<li><a href="${pageContext.request.contextPath}/membership/membership_list.do" class="btn4">멤버십</a></li>
			</ul>
		</div>
	</div>
</header>
<!-- 헤더 끝 -->