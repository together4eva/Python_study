
-- Quiz 1

create database sql_quiz;
use sql_quiz;

create table purchase_tran (
id int,
purchase_amt int,
purchase_cnt int,
last_amt int,
last_cnt int);

insert into purchase_tran values 
(145, 2000000, 12, 1231000, 21),
(455, 1273100, 1, 2237230, 22),
(463, 111463, 3, 214047, 1),
(324, 154769, 3, 7474663, 13),
(568, 25786652, 47, 1000047, 3),
(662, 106868, 1, 277763, 1),
(871, 9694470, 123, 798874, 2),
(460, 65650000, 1200, 6557741, 320),
(277, 5766300, 470, 57663000, 444),
(309, 5579800, 415, 2333000, 135);

select * from purchase_tran;

-- 1. 올해 구매금액이 1백만원 이상인 고객의 고객번호와 올해 구매금액을 추출하시오.
select id, purchase_amt from purchase_tran where purchase_amt > 1000000;
-- 2. 작년 구매금액이 1백만원 이상 5천만원 이하인 고객의 고객 번호와 작년 구매금액을 출력하시오.
select id, last_amt from purchase_tran where 1000000 <= last_amt <= 50000000;
-- 3. 올해 구입건수가 작년 구입건수 보다 많은 고객들의 고객번호, 올해구입건수, 작년구입건수를 출력하고 올래구입건수를 기준으로 오름차순 정렬하시오.
select id, purchase_cnt, last_cnt from purchase_tran where purchase_cnt > last_cnt order by pruchase_cnt;
-- 4. 올해 건당 구입금액을 구하고 이름을 평균구매금액으로 출력하시오.
select sum(purchase_amt)/sum(purchase_cnt) '평균구매금액' from purchase_tran;
-- 5. 올해와 작년의 구매건수 당 평균 구매금액을 구하시오
select sum(purchase_amt)/sum(purchase_cnt), sum(last_amt)/sum(last_cnt)  from purchase_tran;

-- sql 함수..

-- cast : 데이터의 타입을 변환
select cast('2020-10-19 12:35:29:123' as date) as 'Date';
select cast('2020-10-19 12:35:29:123' as Time) as 'Date';
select cast('2020-10-19 12:35:29:123' as datetime) as 'Date';

-- concat : 문자열 이어준다.
select concat('100', '200');

use sqldb;
select * from buytbl;
select num, concat(cast(price as char(10)), 'x', cast(amount as char(10)),'=') as '가격x구매액', 
price*amount as '총구매금액' from buytbl;

-- concat_ws : 문자열을 구분자를 붙여서 이어주는 함수
select concat_ws('/', '2020', '01', '01') as '날짜';

-- ifnull(요소1, 요소2) : 요소1이 null이면 요소2를 출력하고, 요소1이 null이 아니면 요소1을 출력...alter
select ifnull(null, 'sql');
select ifnull('python', 'sql');

-- insert('문자열1', index, length, '문자열2') : 문자열1의 인덱스 위치에서 length 길이자리에 문자열2를 삽입..
select insert('abcdefghi', 3, 4, '@@@@');
select insert('abcdefghi', 3, 2, '@@@@');

-- left('문자열', num) : 문자열 왼쪽 num만큼 문자열을 리턴
-- right('문자열', num) : 문자열 오른쪽 num만큼 문자열을 리턴
select left('abcdefghi', 3);
select right('abcdefghi', 5);

-- repeat('문자열', num) : 문자열을 num만큼 반복
select repeat('abc', 10);

-- lower() : 소문자 전환
-- upper() : 대문자 전환alter
select lower('abcdEFG');
select upper('abcdEFG');

-- ltrim, rtrim : 왼쪽, 오른쪽 공백 제거
select ltrim('    abc');
select rtrim('abc    ');

-- replace('문자열', '문자열1', '문자열2') : 문자열에서 문자열1을 문자열2로 바꾼다..
select replace('hello python', 'python', 'mysql');

-- space(num) : num만큼의 space를 만든다.
select concat('hello', space(10), 'python');

-- length() : byte크기를 반환
select length('abd');
select length('가나다');


### mysql datatype

-- 1. 문자형
-- char(num) : 고정길이 문자열 타입, num수 만큼 글자를 저장가능 (1~255)
-- varchar(num) : 가변길이 문자열 타입, num수 만큼 글자를 저장 가능(1~65535), 실제 글자수에 맞춰 메모리 할당.
-- TEXT : 최대 65535 텍스트를 저장 가능
-- longtext : 최대 42994967295(4M)의  텍스트를 저장 가능.

-- 2. 숫자형
-- int :  -2147483648 ~ 2147483647
-- float : -3.10282+38 ~ 1.1754-38

-- 3. 날짜형
-- date : 년월일
-- time : 시분초
-- datetime : 년월일 시분초
-- year[(2|4)] : 2인 경우(70~69), 4인 경우(1970 ~ 2069) 4자리 연도를 기록


### join : 테이블 간 데이터를 병합...(공통 칼럼을 기준으로)

-- inner join : 두 테이블에 동시에 존재하는 데이터들로만 합쳐서 테이블을 만든다.
-- left join : 왼쪽 테이블에 있는 데이터는 모두 포함시키고, 오른쪽 테이블에서 왼쪽 테이블에 동시에 존재하는 데이터만 추가해서 통합
-- right join : 오른쪽 테이블에 있는 데이터는 모두 포함시키고, 왼쪽 테이블에서 오른쪽 테이블에 동시에 존재하는 데이터만 추가해서 통합
-- outer join : 양쪽 테이블에 속한 모든 데이터를 포함해서 통합하는 방식

use sqldb;

select * from usertbl;
select * from buytbl;

select * from buytbl inner join usertbl 
	on buytbl.userid = usertbl.userid;  # usertbl과 buytbl에 동시에 존재하는 아이디들로만 병합..
    
select * from buytbl as b inner join usertbl as u
	on b.userid = u.userid;
    
select * from buytbl b inner join usertbl u
	on b.userid = u.userid;
    
-- inner join에서만 where구문으로 join을 만들 수 있다..

select * from buytbl, usertbl 
	where buytbl.userid = usertbl.userid;

select * from buytbl as b, usertbl as u
	where b.userid = u.userid;
    
select * from buytbl b, usertbl u
	where b.userid = u.userid;
    
-- '조용필'가 구매한 제품의 이름과 조용필의 주소를 출력..
select prodname, addr from buytbl b inner join usertbl u
	on b.userid = u.userid
    where name='조용필';
    
-- '모니터'를 구매한 사람의 이름..
select distinct name from buytbl b inner join usertbl u
	on b.userid = u.userid
    where prodname = '모니터';
    
-- '전화번호'가 없는 고객의 이름과 주소, 구매한 제품을 출력...
select name, addr, prodname from buytbl b inner join usertbl u
	on b.userid = u.userid
    where u.mobile1 is null;
    
-- 총구매금액이 가장 큰 고객의 이름과 주소, 총구매금액..
select name, addr, sum(price*amount) '총구매금액' from buytbl b inner join usertbl u
	on b.userid = u.userid
    group by name
    order by 총구매금액 desc
    limit 1;

-- left join
select * from buytbl b left join usertbl u
	on b.userid = u.userid;
    
-- right join 
select * from buytbl b right join usertbl u
	on b.userid = u.userid;
    
    
-- table 3개를 join..
create table stdtbl (
	stdname varchar(10) not null primary key,
    addr char(4) not null);
    
create table clubtbl (
	clubname varchar(10) not null primary key,
    roomno char(4) not null);
    
create table stdclubtbl (
	num int auto_increment not null primary key,
    stdname varchar(10) not null,
    clubname varchar(10) not null);

insert into stdtbl values ('김범수', '경남'), ('성시경', '서울'), ('조용필', '경기'),
('은지원', '경북'), ('바비킴', '서울');
insert into clubtbl values ('수영', '101호'), ('바둑', '102호'), ('축구', '103호'),
('봉사', '104호');
insert into stdclubtbl values(null, '김범수', '바둑'), (null, '김범수', '축구'), (null, '조용필', '축구'),
(null, '은지원', '축구'), (null, '은지원', '봉사'), (null, '바비킴', '봉사');


select * from stdtbl;
select * from clubtbl;
select * from stdclubtbl;

-- 세 개의 테이블 inner join : 세 테이블에 공통으로 존재하는 데이터로 병합
select * from stdtbl inner join stdclubtbl on stdtbl.stdname=stdclubtbl.stdname
			         inner join clubtbl on stdclubtbl.clubname = clubtbl.clubname;
                     
select * from stdtbl st inner join stdclubtbl  sc on st.stdname=sc.stdname
			         inner join clubtbl c on sc.clubname = c.clubname;
                     
select * from stdtbl st, stdclubtbl sc, clubtbl c
	where st.stdname = sc.stdname and sc.clubname = c.clubname;
    
-- 축구부에 가입한 학생의 이름을 출력하시오..  - 테이블 간에 중복 테이블명이 있는 경우 어느 테이블인지 명시를 해주어야 함.
select st.stdname, addr, c.clubname from stdtbl st, stdclubtbl sc, clubtbl c
	where st.stdname = sc.stdname and sc.clubname = c.clubname and c.clubname='축구';

