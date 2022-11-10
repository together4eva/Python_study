-- select * from member_tb;

select member_name from member_tb;

select * from member_tb where member_name='한국이';

-- ctrl+ enter 한줄 실행
-- ctrl +sift+enter 블록실행

-- sql에서는 대소문자를 구분하지 않는다

use sakila;
show tables;

select * from actor;

select * from payment;

select avg(amount) from payment;

select customer_id from payment where amount >=10;

create database shopdb1;
use shopdb1;
create table membertb1
(memberid char(5) primary key,
membername char(5),
memberaddress char(15));

create table producttbl
(productname char(5) primary key,
cost int,
makedate date,
company char(5),
amount int);

insert into membertb1 values('dang','당당이','경기도 부천시');
insert into membertb1 values('han','하악이','경기도 남구');
insert into membertb1 values('qwer','큐큐이','서울시 은평구');
insert into membertb1 values('asdf','아스다프이','제주도 제주시');

select * from membertb1;
use shopdb1;
insert into producttbl values('세탁기',20,'2020-09-10','cityLG',3);
insert into producttbl values('TV',30,'2022-08-21','삼성',5);
insert into producttbl values('냉장고',40,'2010-09-24','LG',1);
insert into producttbl values('에어컨',50,'2000-11-21','대우',13);

-- 제조 일자가 2019년 이전에 제조된 제품을 출력..
select * from producttbl where makedate < '2019-01-01';
-- 재고가 10 미만으로 남은 제품의  제품명을 출력하시오..
select productname from producttbl where amount < 10;
-- 아이디가 han인 사람의 이름과 주소를 출력하시오..
select membername, memberaddress from membertbl where memberid ='han';
-- 대우에서 생산된 제품은 무엇인가..
select * from producttbl where company='대우';

create database sqldb;
use sqldb;

create table usertbl(
userid char(8) not null primary key,
name varchar(10) not null,
birthyear int not null,
addr char(5) not null,
mobile1 char(3),
mobile2 char(3),
height smallint,
mdate date);

/*
 insert into 테이브령 values(값1,........값8);
 */
 
 insert into usertbl values('jyp','조용필',1950,'경기','001','456',166,'2020-09-25');
 insert into usertbl values('qwer','하앙이',1990,'서울',null,'456',266,'2020-09-25');
 insert into usertbl values('asdx','쿠쿠쿠',1970,'경기','061','45',566,'20203-09-25');
 insert into usertbl values('zxcv','이름임',1960,'전남',null,'456',466,'2020-09-25');
 insert into usertbl values('pop','카쿠야',1900,'경기','071','456',136,'2020-09-25');
 insert into usertbl values('hjhg','이르지',2100,'경기','091','45',266,'2020-09-25');
 insert into usertbl values('LSG', '이승기', 1987, '서울', '011', '333', 182, '2008-8-8');
insert into usertbl values('KBS', '김범수', 1979, '경남', '018', '457', 173, '2012-4-4');
insert into usertbl values('KKH', '김경호', 1971, '전남', '001', '457', 177, '2007-7-7');
 create table buytlb(
 num int auto_increment not null primary key,
 userid char(8) not null,
 prodname char(8) not null,
 groupname char(4),
 price int not null,
 amount smallint not null);
 
 show tables;
 
 
 
 