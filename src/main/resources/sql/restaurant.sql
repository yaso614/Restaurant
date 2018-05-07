-- Restaurant Project

-- 사용자 정보 테이블
create table restuser (
	userid		varchar2(20) primary key,	--사용자 ID
	password	varchar2(20) not null,		--비밀번호
	name		varchar2(30) not null,		--사용자 이름
	email		varchar2(30) not null,		--사용자 이메일
	sex			varchar2(20) not null,		--사용자 성별
	birthday	varchar2(30) not null,		--사용자 생일 - 생일이면 음식값 10% 할인
	loyalty		number default 0, 			 --사용자 단골수준
	address		varchar2(60),				--사용자 주소
	phone		varchar2(30) not null
);



-- 음식물 정보 테이블
create table food (
	foodnum			number	primary key,			--음식물번호
	fname			varchar2(50) unique not null,	--음식물이름
	price			number not null,				--음식물가격
	cost			number not null,				--음식물원가
	cookingdate     varchar2(100) default sysdate,  --음식물등록일자
	foodtype        varchar2(30) not null,          --음식국적
	foodsales		number default 0,				--음식물판매량
	originalfile	varchar2(200),					--첨부파일명 (원래 이름)
	savedfile		varchar2(100)					--첨부파일명 (실제 저장된 이름)
);

-- 음식물 일련번호에 사용할 시퀀스 
create sequence food_seq start with 1 increment by 1;

-- 예약리스트
create table reservation (
	rvnum			number	primary key,		--reservation number 예약번호
	subid			varchar2(20) not null,		--subscriber id 예약자 아이디
	subname			varchar2(30) not null,		--subscriber name 예약자 이름
	subloyalty 		number,						--subcriber loyalty 예약횟수(충성도)		
	aptime			date  default sysdate,		--appointment time 예약한 시점의 시간
	selectfood		varchar2(500) not null,		--selected food 손님에게 선택된 음식
	quantity        number not null,            --quantity 주문수량 
	totalprice		number not null 			--손님이 선택한 음식들 가격의 총합
);

-- 예약리스트에 사용할 시퀀스
create sequence rvnum_seq start with 1 increment by 1;


-- 요구 내용
create table detail (
	detailnum		number	primary key,		--리플번호 DB처리
	rvnum			number not null,			--본문 글번호 ★화면에서 넘겨줘야한/ hidden으로 넘겨라
	id				varchar2(20) not null,		--작성자 ID
	detail			varchar2(200) not null,		--리플내용
	inputdate		date 	default sysdate,	--작성날짜 DB처리
	constraint detail_fk foreign key(rvnum) 
		references reservation(rvnum) on delete cascade
);

-- 요구에 사용할 시퀀스
create sequence detail_seq start with 1 increment by 1;




-- 설명이 생략된 sql 쿼리
create table restuser (
	userid		varchar2(20) primary key,	
	password	varchar2(20) not null,		
	name		varchar2(30) not null,		
	email		varchar2(30) not null,		
	sex			varchar2(20) not null,
	birthday	varchar2(30) not null,		
	loyalty		number default 0, 			 
	address		varchar2(60),				
	phone		varchar2(30) not null
);


create table food (
	foodnum			number	primary key,			
	fname			varchar2(50) unique not null,	
	price			number not null,				
	cost			number not null,
	cookingdate     varchar2(100) default sysdate,
	foodtype        varchar2(30) not null,
	foodsales		number default 0,				
	originalfile	varchar2(200),					
	savedfile		varchar2(100)					
);

create sequence food_seq start with 1 increment by 1;

create table reservation (
	rvnum			number	primary key,		
	subid			varchar2(20) not null,		
	subname			varchar2(30) not null,		
	subloyalty 		number not null,						
	aptime			date  default sysdate,		
	selectfood		varchar2(500) not null,
	quantity        number not null,
	totalprice		number not null
);

create sequence rvnum_seq start with 1 increment by 1;






create table detail (
	detailnum		number	primary key,	
	rvnum			number not null,			
	id				varchar2(20) not null,		
	detail			varchar2(200) not null,		
	inputdate		date 	default sysdate,	
	constraint detail_fk foreign key(rvnum) 
		references reservation(rvnum) on delete cascade
);


create sequence detail_seq start with 1 increment by 1;




