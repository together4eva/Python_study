
-- 한 줄 주석

/*
여러 줄 주성
여러 줄 주석
...*/

/*
관계형 데이터 베이스 - table구조

1. 데이터베이스    - 엑셀파일
2. 테이블 - 엑셀쉬트
3. 셀 (칼럼, 로) - 엑셀셀...
*/


select * from membertbl;
select memberid, memberaddress from membertbl;

-- 데이터를 출력 
-- select 칼럼명 from 테이블명;

select membername from membertbl;

-- select 칼럼명 from 테이블명 where 조건;
select * from membertbl where membername='한국찬';
select memberaddress from membertbl where membername='한국찬';

-- ctrl + enter : 한 줄 실행
-- ctrl + shift + enter : 전체 줄 실행 or 블록실행

select * from producttbl;
select * from producttbl where company = '삼성';
select * from producttbl where cost <= 10;

select * from membertbl;
select * from producttbl;

select cost from producttbl where productname ='컴퓨터';

-- sql에서는 대소문자 구분하지 않는다..

use sakila;
show tables;

use world;
show tables;
select * from city;

use sakila;
show tables;

select * from payment;

select avg(amount) from payment;

select distinct customer_id from payment where amount >= 10;

select * from membertbl;
select * from producttbl;

-- query로 데이터베이스 생성, 테이블 생성, 데이터 입력..
create database shopdb1;
use shopdb1;

create table membertbl
(memberid char(5) primary key,
membername char(5),
memberaddress char(15));

create table producttbl
(productname char(5) primary key,
cost int,
makedate date,
company char(5),
amount int);

insert into membertbl values('dang', '당당이', '경기도 부천시 중동');
insert into membertbl values('han', '한국찬', '인천시 남구 주안동');
insert into membertbl values('joe', '지운이', '서울시 은평구 중동');
insert into membertbl values('sung', '성길이', '경기도 성남시 분당구');

select * from membertbl;

insert into producttbl values('냉장고', 5, '2019-03-01', '대우', 23);
insert into producttbl values('세탁기', 20, '2018-09-01', 'LG', 3);
insert into producttbl values('컴퓨터', 10, '2017-01-01', '삼성', 11);

select * from producttbl;

-- 제조 일자가 2019년 이전에 제조된 제품을 출력..
select * from producttbl where makedate < '2019-01-01';
-- 재고가 10 미만으로 남은 제품의  제품명을 출력하시오..
select productname from producttbl where amount < 10;
-- 아이디가 han인 사람의 이름과 주소를 출력하시오..
select membername, memberaddress from membertbl where memberid ='han';
-- 삼성에서 생산된 제품은 무엇인가..
select * from producttbl where company='삼성';


use employees;
show tables;
select * from employees;

-- 남성인 사원을 출력하시오..
select * from employees where gender = 'M';

-- 1960년 이후 출생자만 출력..
select * from employees where birth_date >= '1960-01-01';
select * from employees where birth_date > '1959-12-31'; 

-- salary 테이블의 모든 데이터를 출력하시오..
select * from salaries;

-- 연봉 10만달러 이상인 사람의 사번을 출력하시오..
select emp_no from salaries where salary >= 100000;

-- 연봉 10만달러 이상인 사람의 숫자를 출력하시오..
select count(emp_no) from salaries where salary >= 100000;

select count(*) from salaries;

show tables;

select * from departments;

-- 1990년 이전에 입사한 engineer 데이터를 출력하시오..
show tables;
select * from titles;
select * from titles where from_date < '1990-01-01' and title='engineer';


create database sqldb;
use sqldb;

/*
create table 테이블명 (
	칼럼명 제약조건,
    칼럼명 제약조건,
    칼럼명 제약조건);
    */

create table usertbl (
	userid char(8) not null primary key,
    name varchar(10) not null,
    birthyear int not null,
    addr char(5) not null,
    mobile1 char(3),
    mobile2 char(8),
    height smallint,
    mdate date);
    
/*
insert into 테이블명 values (값1, 값2, ....);
*/

insert into usertbl values('jyp', '조용필', 1950, '경기', '011', '45786532', 166, '2009-4-4');
insert into usertbl values('SSK', '성시경', 1979, '서울', null, '45786532', 187, '2013-12-12');
insert into usertbl values('LJB', '임재범', 1963, '서울', '016', '45786532', 182, '2010-4-4');
insert into usertbl values('YJS', '윤종신', 1969, '경남', null, '45786532', 170, '2005-5-5');
insert into usertbl values('EJW', '은지원', 1972, '경북', '011', '45786532', 174, '2014-3-3');
insert into usertbl values('JKW', '조관우', 1965, '경기', '018', '45786532', 172, '2010-10-10');
insert into usertbl values('BBK', '바비킴', 1973, '서울', '001', '45786532', 176, '2013-7-4');

insert into usertbl values('LSG', '이승기', 1987, '서울', '011', '45786532', 182, '2008-8-8');
insert into usertbl values('KBS', '김범수', 1979, '경남', '018', '45786532', 173, '2012-4-4');
insert into usertbl values('KKH', '김경호', 1971, '전남', '001', '45786532', 177, '2007-7-7');

select * from usertbl;


create table buytbl(
	num int auto_increment not null primary key,
    userid char(8) not null,
    prodname char(6) not null,
    groupname char(4),
    price int not null,
    amount smallint not null);
    
show tables;

insert into buytbl values(null, 'KBS', '운동화', null, 30, 2);
insert into buytbl values(null, 'KBS', '노트북', '전자', 30, 1);
insert into buytbl values(null, 'JYP', '모니터', '전자', 1000, 1);
insert into buytbl values(null, 'BBK', '모니터', '전자', 200, 5);
insert into buytbl values(null, 'KBS', '청바지', '의류', 200, 3);
insert into buytbl values(null, 'BBK', '메모리', '전자', 50, 10);
insert into buytbl values(null, 'SSK', '책', '서적', 80, 5);
insert into buytbl values(null, 'EJW', '책', '서적', 15, 2);
insert into buytbl values(null, 'EJW', '청바지', '의류', 15, 1);
insert into buytbl values(null, 'BBK', '운동화', null, 50, 2);
insert into buytbl values(null, 'EJW', '책', '서적', 30, 1);
insert into buytbl values(null, 'LSG', '운동화', null, 30, 2);
    
select * from buytbl;

-- delete from buytbl;

select * from usertbl;
select * from buytbl;

-- 김경호라는 가수의 데이터를 출력
select * from usertbl where name = '김경호';
-- 출생년도가 1970년 이후이고, 키가 182 이상인 사람을 출력..
select * from usertbl where birthyear >= 1970 and height >= 182;
-- 출생년도가 1970년 이전이거나, 키가 182 이상인 사람을 출력..
select * from usertbl where birthyear < 1970 or height >= 182;
-- 키가 180이상 183이하인 사람을 출력..
select * from usertbl where height >= 180 and height <= 183;
-- 출생지가 '경남' 또는 '전남', 또는 '서울'인 사람을 출력..
select * from usertbl where addr = '경남' or addr = '전남' or addr = '서울';
-- 임재범보다 나이가 많은 사람 데이터를 출력.. (subquery)
select * from usertbl where birthyear < (select birthyear from usertbl where name='임재범');
-- 이름임과 날짜가 동일한 사람을 출력하시오.. (subquery)
select * from usertbl where mdate = (select mdate from usertbl where name='이름임') and name != '이름임';
