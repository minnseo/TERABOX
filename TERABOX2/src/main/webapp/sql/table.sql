--회원 정보 테이블
create table MEMBER(
	mem_num number,
	id varchar2(12) unique NOT null,
	auth number(1) default 2 NOT null,
	nick_name varchar2(30),
	constraint MEMBER_PK primary key (mem_num)
);


--회원 상세 정보 테이블
create table MEMBER_DETAIL(
	mem_num number,
	name varchar2(10) NOT null,
	passwd varchar2(25) NOT null,
	phone varchar2(15) NOT null,
	email varchar2(50) NOT null,
	zipcode varchar2(90) NOT null,
	address1 varchar2(90) NOT null,
	address2 varchar2(90) NOT null,
	reg_date date default SYSDATE NOT null,
	au_id varchar2(36) unique,
	membership_id number NOT null,
	photo blob,
	photo_name varchar2(100),
	constraint MEMBER_DETAIL_PK primary key (mem_num),
	constraint MEMBER_DETAIL_FK foreign key (mem_num) references MEMBER(mem_num),
	constraint MEMBER_DETAIL_FK2 foreign key (membership_id) references MEMBERSHIP(membership_id)
);

create sequence member_seq;


-- 멤버십 정보 테이블
create table MEMBERSHIP(
	membership_id number NOT null,
	membership_grade varchar2(45) NOT null,
	membership_benefits varchar2(300) NOT null,
 	price number NOT null,
 	photo blob NOT null,
 	photo_name VARCHAR(90) NOT null,
 	membership_detail varchar2(300) NOT null,
 	constraint MEMBERSHIP_PK primary key (membership_id)
);

create sequence membership_seq;


-- 멤버십 주문 정보 테이블
create table MEMBERSHIP_ORDER(
 	order_num number NOT null,
 	mem_num number	NOT null,
 	membership_id number NOT null,
 	price number NOT null,
 	pay_type varchar2(45) NOT null,
 	pay_date date NOT null,
 	next_pay_date date NOT null,
 	billing_key varchar2(300) NOT null,
 	result_status varchar2(45) NOT null,
 	result_message	varchar2(300) NOT null,
 	membership_grade varhar2(45) NOT null,
	constraint MEMBERSHIP_ORDER_PK primary key (order_num),
 	constraint MEMBERSHIP_ORDER_FK1 foreign key (mem_num) references MEMBER(mem_num),
 	constraint MEMBERSHIP_ORDER_FK2 foreign key (membership_id) references MEMBERSHIP(membership_id)
);

create sequence membership_order_seq;


-- 영화관 정보 테이블
create table THEATER(
 	theater_num number,
 	th_name varchar2(30) NOT null,
 	th_address varchar2(200) NOT null,
 	th_phone varchar2(14) NOT null,
 	th_photo blob NOT null,
 	th_photoname varchar2(150) NOT null,
 	constraint THEATER_PK primary key (theater_num)
);

create sequence theater_seq;


-- 상영관 정보 테이블
create table HALL(
	hall_num number,
 	hall_name varchar2(90) NOT null,
	hall_status number(1) default 2 NOT null,
 	seats number NOT null,
 	theater_num number NOT null,
 	constraint HALL_PK primary key (hall_num),
 	constraint HALL_FK foreign key (theater_num) references THEATER(theater_num)
);

create sequence hall_seq;


-- 영화 정보 테이블
create table MOVIE (
	movie_num number,
	m_rank number NOT null,
	m_title	varchar2(90) NOT null,
	m_titleEng varchar2(30),
	m_director varchar2(30),
	m_actor	varchar2(150),
	m_nation varchar2(30),
	m_company varchar2(30),
	m_plot clob,
	m_runtime number,
	m_rating varchar2(24),
	m_genre	varchar2(30),
	m_opendate date,
	m_poster blob,
	poster_name varchar2(60),
	m_poster2 clob,
	m_stllimg blob,
	stllimg_name varchar2(60),
	m_stllimg2 clob,
	m_opendate2 varchar2(10),
	m_date date default SYSDATE NOT null,
	m_vod clob,
	m_status number NOT null, -- 1: 상영 / 2: 상영 예정 / 3: 상영 중지
	m_stllimg3 blob,
	m_stllimg4 blob,
	m_stllimg5 blob,
	m_stllimg6 blob,
	stllimg_name3 varchar2(60),
	stllimg_name4 varchar2(60),
	stllimg_name5 varchar2(60),
	stllimg_name6 varchar2(60),
	constraint MOVIE_PK primary key (movie_num)
);

create sequence movie_seq;


-- 상영 시간표 정보 테이블
create table SCHEDULE(
	schedule_num number,
	sch_date date NOT null,
	sch_start varchar2(30) NOT null,
	sch_end varchar2(30) NOT null,
	remain number NOT null,
	hall_num number NOT null,
	movie_num number NOT null,
	constraint SCHEDULE_PK primary key (schedule_num),
	constraint SCHEDULE_FK1 foreign key (hall num) references HALL(hall_num),
	constraint SCHEDULE_FK2 foreign key (movie_num) references MOVIE(movie_num)
);

create sequence schedule_seq;


-- 좌석 정보 테이블
create table SEAT(
	seat_num number,
	seat_name varchar2(30) NOT null,
	seat_status number(1) NOT null,
	hall_num number NOT null
	constraint SEAT_PK primary key (seat_num),
	constraint SEAT_FK1 foreign key (hall_num) references HALL(hall_num)
);

create sequence seat_seq;


-- 예매 정보 테이블
create table RESERVATION(
	res_num varchar2(20),
	res_date date default SYSDATE NOT null,
	del_date date,
	res_people number(3) NOT null,
	res_payment varchar2(50) NOT null,
	res_total number(10) NOT null,
	res_status number(1) NOT null,
	res_seats varchar2(200) NOT null,
	schedule_num number NOT null,
	mem_num number NOT null,
	constraint RESERVATION_PK primary key (res_num),
	constraint RESERVATION_FK1 foreign key (schedule_num) references SCHEDULE(schedule_num),
	constraint RESERVATION_FK2 foreign key (seat_num) references SEAT(seat_num),
	constraint RESERVATION_FK3 foreign key (mem_num) references MEMBER(mem_num)
);

create sequence reservation_seq;


-- 리뷰 정보 테이블
create table REVIEW (
	review_num number,
	movie_num number NOT null,
	mem_num	number NOT null,
	review_content varchar2(660) NOT null,
	review_date date default SYSDATE NOT null,
	review_mdate date,
	constraint REVIEW_PK primary key (review_num),
	constraint REVIEW_FK1 foreign key (movie_num) references MOVIE(movie_num),
	constraint REVIEW_FK2 foreign key (mem_num) references MEMBER(mem_num)
);

create sequence review_seq;


-- 리뷰 평점 정보 테이블
create table REVIEW_RATING (
	rating_num number,
	review_num number NOT null,
	movie_num number NOT null,
	mem_num	number NOT null,
	rating_score number(1) default 5 NOT null,
	constraint REVIEW_RATING_PK primary key (rating_num),
	constraint REVIEW_RATING_FK1 foreign key (review_num) references REVIEW(review_num),
	constraint REVIEW_RATING_FK2 foreign key (movie_num) references MOVIE(movie_num),
	constraint REVIEW_RATING_FK3 foreign key (mem_num) references MEMBER(mem_num)
);

create sequence review_rating_seq;


-- 리뷰 좋아요 정보 테이블
create table REVIEW_FAV (
	review_favnum number,
	review_num number NOT null,
	movie_num number NOT null,
	mem_num	number NOT null,
	constraint REVIEW_FAV_PK primary key (review_favnum),
	constraint REVIEW_FAV_FK1 foreign key (review_num) references REVIEW(review_num),
	constraint REVIEW_FAV_FK2 foreign key (movie_num) references MOVIE(movie_num),
	constraint REVIEW_FAV_FK3 foreign key (mem_num) references MEMBER(mem_num)
);

create sequence review_fav_seq;


-- 리뷰 신고 정보 테이블
create table REVIEW_REPORT (
	repo_num number,
	review_num number NOT null,
	movie_num number NOT null,
	mem_num	number NOT null,
	repo_date date default SYSDATE NOT null,
	constraint REVIEW_REPORT_PK primary key (repo_num),
	constraint REVIEW_REPORT_FK1 foreign key (review_num) references REVIEW(review_num),
	constraint REVIEW_REPORT_FK2 foreign key (movie_num) references MOVIE(movie_num),
	constraint REVIEW_REPORT_FK3 foreign key (mem_num) references MEMBER(mem_num) 
);

create sequence review_report_seq;


-- 무비포스트 정보 테이블
create table MOVIEPOST (
	post_num number,
	movie_num number NOT null,
	mem_num	number NOT null,
	post_content clob NOT null,
	post_date date default SYSDATE NOT null,
	post_mdate date,
	post_photo blob	NOT null,
	post_title varchar2(90)	NOT null,
	constraint MOVIEPOST_PK primary key (post_num),
	constraint MOVIEPOST_FK1 foreign key (movie_num) references MOVIE(movie_num),
	constraint MOVIEPOST_FK2 foreign key (mem_num) references MEMBER(mem_num)
);

create sequence moviepost_seq;


-- 무비포스트 댓글 정보 테이블
create table POST_REPLY (
	re_num number,
	post_num number	NOT null,
	mem_num	number NOT null,
	re_content varchar2(300) NOT null,
	re_date	date default SYSDATE NOT null,
	re_mdate date NULL,
	constraint POST_REPLY_PK primary key (re_num),
	constraint POST_REPLY_FK1 foreign key (post_num) references MOVIEPOST(post_num),
	constraint POST_REPLY_FK2 foreign key (mem_num) references MEMBER(mem_num)
);

create sequence post_reply_seq;


-- 무비포스트 좋아요 정보 테이블
create table POST_FAV (
	post_favnum number,
	post_num number	NOT null,
	mem_num	number NOT null,
	constraint POST_FAV_PK primary key (post_favnum),
	constraint POST_FAV_FK1 foreign key (post_num) references MOVIEPOST(post_num),
	constraint POST_FAV_FK2 foreign key (mem_num) references MEMBER(mem_num)
);

create sequence post_fav_seq;


-- 무비포스트 신고 정보 테이블
create table POST_REPORT (
	repo_post_num number,
	post_num number	NOT null,
	mem_num	number NOT null,
	repo_post_date date default SYSDATE NOT null,
	constraint POST_REPORT_PK primary key (repo_post_num),
	constraint POST_REPORT_FK1 foreign key (post_num) references MOVIEPOST(post_num),
	constraint POST_REPORT_FK2 foreign key (mem_num) references MEMBER(mem_num)
);

create sequence post_report_seq;


-- 스낵 상품 정보 테이블
create table SNACK(
	snack_num number,
	sn_name varchar2(60) NOT null,
	sn_detail varchar2(100) NOT null,
	sn_price number(6) NOT null,
	sn_dc_price number(6),
	sn_photo blob NOT null,
	sn_photo_name varchar2(100) NOT null,
	sn_info varchar2(300) NOT null,
	sn_category number(1) NOT null,
	sn_date date default SYSDATE NOT null,
	sn_mdate date,
	sn_status number(1) NOT null,
	sn_notice clob, 
	constraint SNACK_PK primary key (snack_num)
);

create sequence snack_seq;


-- 장바구니 정보 테이블
create table CART (
	cart_num number,
	mem_num	number NOT null,
	snack_num number NOT null,
	order_quantity number(2) NOT null,
	cart_date date default SYSDATE NOT null,
	constraint CART_PK primary key (cart_num),
	constraint CART_FK1 foreign key (mem_num) references MEMBER(mem_num),
	constraint CART_FK2 foreign key (snack_num) references SNACK(snack_num)
);

create sequence cart_seq;


-- 주문 정보 테이블
create table ORDER (
	order_num varchar2(20),
	mem_num	number NOT null,
	sn_name varchar2(60) NOT null,
	order_total number(9) NOT null,
	payment	number(1) NOT null,
	order_type number(1) NOT null,
	order_status number(1) DEFAULT 1 NOT null,
	order_date date default SYSDATE NOT null,
	valid_date date default add_months(SYSDATE-1,12) NOT null,
	order_mdate date,
	billing_key varchar2(300),
	to_id varchar2(12),
	to_phone varchar2(15),
	message	varchar2(300),
	constraint ORDERS_PK primary key (order_num),
	constraint ORDERS_FK foreign key (mem_num) references MEMBER(mem_num)
);

create sequence order_seq;


-- 주문상세 정보 테이블
create table ORDER_DETAIL (
	order_detail_num number,
	order_num varchar2(20) NOT null,
	snack_num number NOT null,
	sn_name	varchar2(60) NOT null,
	sn_detail varchar2(100)	NOT null,
	sn_price number(6) NOT null,
	sn_dc_price number(6),
	sn_total number(8) NOT null,
	order_quantity varchar2(2) NOT null,
	constraint ORDERS_DETAIL_PK primary key (order_detail_num),
	constraint ORDERS_DETAIL_FK foreign key (order_num) references ORDER(order_num)
);

create sequence detail_seq;


-- 포인트 정보 테이블
create table POINT (
	point_num number,
	res_num number,
	order_num varchar2(20),
	mem_num	number NOT null,
	point_date date default SYSDATE NOT null,
	add_point number default 0 NOT null,
	use_point number default 0 NOT null,
	constraint POINT_PK primary key (point_num),
	constraint POINT_FK1 foreign key (res_num) references RESERVATION(res_num),
	constraint POINT_FK2 foreign key (order_num) references ORDER(order_num),
	constraint POINT_FK3 foreign key (mem_num) references MEMBER(mem_num)
);

create sequence point_seq;


-- 이벤트 정보 테이블
create table EVENT ( 
	event_num number,
	mem_num number NOT null,
	category_num number NOT null,
	category_detail_num number NULL,
	event_form_type number NULL,
	thumb1 blob NOT null,
	thumb1_name varchar2(150) NOT null, 
	thumb2 blob NOT null,
	thumb2_name varchar2(150) NOT null,
	title varchar2(150) NOT null,
	content clob NOT NULL,
	event_start date default SYSDATE NOT null,
	event_end date default SYSDATE NOT null,
	event_date date default SYSDATE NOT null,
	event_mdate date default SYSDATE,
	state number NOT null,
	count number default 0 NULL, --조회수
	constraint EVENT_PK primary key (event_num), 
	constraint EVENT_FK1 foreign key (mem_num) references MEMBER(mem_num),
	constraint EVENT_FK2 foreign key (category_num) references EVENT_CATEGORY(category_num),
	constraint EVENT_FK3 foreign key (category_detail_num) references EVENT_CATEGORY_DETAIL(category_detail_num)
);

create sequence event_seq;


-- 이벤트 카테고리 정보 테이블
create table EVENT_CATEGORY (
	category_num number,
	category_name varchar2(150) NOT null,
	constraint EVENT_CATEGORY_PK primary key (category_num)
);

create sequence event_category_seq;


-- 이벤트 카테고리 상세 정보 테이블
create table EVENT_CATEGORY_DETAIL (
	category_detail_num number,
	category_detail_name varchar2(150) NOT null,
	constraint EVENT_CATEGORY_DETAIL_PK primary key (category_detail_num)
);

create sequence event_category_detail_seq;


-- 이벤트 결과 정보 테이블
create table EVENT_RESULT (
	result_num number,
	mem_num number NOT null,
	event_num number NOT null,
	title varchar2(150) NOT null,
	content varchar2(4000) NOT null,
	result_date date default SYSDATE NOT null,
	result_mdate date default SYSDATE,
	constraint EVENT_RESULT_PK primary key (result_num),
	constraint EVENT_RESULT_FK1 foreign key (mem_num) references MEMBER(mem_num),
 	constraint EVENT_RESULT_FK2 foreign key (event_num) references EVENT(event_num)
);

create sequence event_result_seq;


-- 이벤트 댓글 정보 테이블
create table EVENT_REPLY (
	 reply_num number,
	 mem_num number	NOT null,
	 theater_num number NOT null,
	 event_num number NOT null,
    	 content varchar2(600) NOT null,
	 ip varchar2(15) NOT null,
	 reply_date date default SYSDATE NOT null,
	 reply_mdate date default SYSDATE
	 constraint EVENT_REPLY_PK primary key (reply_num),
	 constraint EVENT_REPLY_FK1 foreign key (mem_num) references MEMBER(mem_num),
	 constraint EVENT_REPLY_FK2 foreign key (theater_num) references THEATER(theater_num),
	 constraint EVENT_REPLY_FK3 foreign key (event_num) references EVENT(event_num)
	
);

create sequence event_reply_seq;


-- 고객센터
-- 자주 묻는 질문(Q&A) 정보 테이블
create table QNA (
	 qna_num number,
	 mem_num number NOT NULL,
	 category_qna_num number(1) NOT null,
	 qna_title varchar2(150) NOT null,
	 qna_content clob NOT null,
	 qna_date date default SYSDATE NOT null,
	 qna_mdate date NULL,
	 constraint QNA_PK primary key (qna_num),
	 constraint QNA_FK1 foreign key (mem_num) references MEMBER(mem_num),
	 constraint QNA_FK2 foreign key (category_qna_num) references QNA_CATEGORY(category_qna_num)	
);

create sequence qna_seq;


-- Q&A 카테고리 정보 테이블
create table QNA_CATEGORY (
    	category_qna_num number,
    	category_qna_name varchar2(150) not null,
    	constraint QNA_CATEGORY_PK primary key (qna_category_num)
);

create sequence qna_category_seq;


-- 공지사항 정보 테이블
create table NOTICE (
	 noti_num number,
	 mem_num number NOT NULL,
	 theater_num number NOT null,
	 noti_title varchar2(150) NOT null,
	 noti_content clob NOT null,
	 noti_date date default SYSDATE NOT null,
	 noti_mdate date NULL,
	 constraint NOTICE_PK primary key (noti_num),
	 constraint NOTICE_FK1 foreign key (mem_num) references MEMBER(mem_num),
	 constraint NOTICE_FK2 foreign key (theater_num) references THEATER(theater_num)
);

create sequence notice_seq;


-- 1:1 문의 정보 테이블
create table INQUIRY (
	 inquiry_num number,
	 mem_num number NOT null,
	 theater_num number NOT null, -- 0:고객센터 / 1:본사 / 2~:영화관
	 category_inq_num number NOT null,
	 inq_email varchar2(50) NOT NULL,
	 inq_title varchar2(150) NOT null,
	 inq_content varchar2(4000)	NOT null,
	 inq_date date default SYSDATE NOT null,
	 inq_mdate date NULL,
	 inq_state number(1) NOT null,
	 constraint INQUIRY_PK primary key (inquiry_num),
	 constraint INQUIRY_FK1 foreign key (mem_num) references MEMBER(mem_num),
	 constraint INQUIRY_FK2 foreign key (theater_num) references THEATER(theater_num),
	 constraint INQUIRY_FK3 foreign key (category_inq_num) references INQUIRY_CATEGORY(category_inq_num)
);

create sequence inquiry_seq;


-- 1:1 문의 파일 정보 테이블
create table CS_FILE(
	file_num number,
	inquiry_num number NOT null,
	origin_name varchar2(150) NOT null,
	save_name varchar2(150) NOT null,
	file_size number NOT null,
	delete_yn number(1) NOT null,
	created_date date NOT null,
	deleted_date date,
	constraint CS_FILE_PK primary key (file_num),
	constraint CS_FILE_FK foreign key (inquiry_num) references INQUIRY(inquiry_num)
);

create sequence cs_file_seq;


-- 1:1 문의 카테고리 정보 테이블
create table INQUIRY_CATEGORY (
    	category_inq_num number,
    	category_inq_name varchar2(150),
    	constraint INQUIRY_CATEGORY_PK primary key (category_inq_num)
);


-- 1:1 문의 답변 정보 테이블
create table CS_ANSWER (
	 answer_num number,
	 mem_num number NOT NULL,
	 inquiry_num number NOT null,
	 answer_title varchar2(150) NOT null,
	 answer_content varchar2(4000) NOT null,
	 answer_date date default SYSDATE NOT null,
	 answer_mdate date NULL,
	 constraint CS_ANSWER_PK primary key (answer_num),
	 constraint CS_ANSWER_FK1 foreign key (mem_num) references MEMBER(mem_num),
	 constraint CS_ANSWER_FK2 foreign key (inquiry_num) references INQUIRY(inquiry_num),
);

create sequence cs_answer_seq;