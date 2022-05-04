-- 유저 만들기
CREATE USER GUEST IDENTIFIED BY 1111; -- 권한을 안 줘서 에러남

-- SCOTT 유저 권한 상승 : 롤(ROLE : 여러 권한들을 모두 모아놨음)
-- CONNECT(접속에 관련된 권한 모음집)
-- RESOURCE(테이블, 뷰, 프로시저 생성, 권한)
-- DBA(유저, DB관리 등등 최상위 권한)
-- 권한 상승 시키는 롤 : 
-- dba권한을 줘도 user를 만드는 권한이 없어서 따로 줘야 함
grant connect, resource, dba to scott;
grant create user to scott;

-- 권한 주고 난 후 유저 생성
-- 오라클 공간관리 영역 : TABLESPACE(요 안에다가 테이블들을 모아둠, 테이블을 저장하는 디스크 공간)
CREATE USER GUEST02 IDENTIFIED BY 1111
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP;

-- 권한 종류
-- CREATE TABLE : 테이블 생성 권한
-- CREATE VIEW : 뷰 생성 권한
-- CREATE SEQUENCE : 시퀀스 생성 권한

-- 권한부여 명령어
-- GRANT 권한[롤] TO 유저명

-- 권한 취소 명령어
-- REVOKE 권한[롤] FROM 유저명

-- 동의어 : 테이블 : SELECT * FROM SCOTT.EMPLOYEE
--                별칭으로 변경해서 이름을 정의해줄 수 있음

-- 연습문제 01) KBS라는 사용자를 생성하셈. 암호는 1234로 만드셈
-- DEFAULT TABLESPACE명은 USERS으로 사용하고,
-- TEMPORARY TABLESPACE 명은 TEMP로 사용하셈
CREATE USER KBS IDENTIFIED BY 1234
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP;

-- 연습 2) 1번에서 생성한 유저에 CONNECT, RESOURCE 권한(롤)을 부여하세요
grant connect, resource to KBS;