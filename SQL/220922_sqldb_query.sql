
drop database if exists sqldb;

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