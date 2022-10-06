-- 데이터베이스 생성 : alstjrdb는 데이터베이스명
CREATE DATABASE alstjrdb;

-- 사용자 생성
CREATE USER alstjr@localhost IDENTIFIED BY '1111';

-- 사용자의 db에 대한 권한 부여
GRANT ALL privileges ON alstjrdb.* TO alstjr@localhost WITH GRANT OPTION;

-- 권한 갱신
FLUSH PRIVILEGES;

-- 데이터베이스 조회
SHOW DATABASES;

-- MEMBER 테이블 DDL
create table member(
    id varchar(20),
    pwd varchar(20),
    name varchar(50),
    email varchar(50),
    joinDate date
);

-- 데이터 입력
insert into member values('gildong', '1111','홍길동','gildong@naver.com', now());
insert into member values('sunshin', '1111','이순신','lee@gmail.com', now());
insert into member values('jongsuh', '1111','김종서','jong@gmail.com', now());

select * from member;