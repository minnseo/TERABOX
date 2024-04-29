<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Owl Carousel CSS -->
<!-- Owl Carousel CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
<!-- Owl Carousel JS -->
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
<script type="text/javascript">
//배너
$(document).ready(function () {
    $(".owl-carousel").owlCarousel({
        loop: true,            // 무한 루프
        margin: 0,             // 이미지 간 간격
        nav: true,             // 이전/다음 버튼 표시
        dots: true,            // 페이지 버튼 표시
        autoplay: true,        // 자동 슬라이드
        autoplayTimeout: 7000, // 자동 슬라이드 간격 (밀리초)
        responsive: {
            0: {
                items: 1       // 화면 너비 0px 이상에서 1개 항목 표시
            }
        }
    });
});
</script>
<!-- 내용 시작 -->
<!-- 배너 -->
<div>
	<div class="owl-carousel">
	    <div class="item">
	    	<img src="${pageContext.request.contextPath}/images/banner.jpeg" alt="범죄도시4">
		</div>
	    <div class="item">
	    	<img src="${pageContext.request.contextPath}/images/banner2.jpeg" alt="쿵푸팬더4">
		</div>
	    <div class="item">
	    	<img src="${pageContext.request.contextPath}/images/banner3.jpeg" alt="스턴트맨">
		</div>
	</div>
</div>
<div class="page-main">
</div>
<!-- 내용 끝 -->