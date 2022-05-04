-- 2022-05-04 SEQUENCE 생성
-- 개발할때 키값(ID) : 자동 증가하는 값을 사용
--SEQUENCE : DB에서 자동 증가하는 값을 만들어 줄 수 있음(채번)
-- 예) 시작 값이 10이고 1씩 증가하는 시퀀스 생성하기(이름 : SQ_EMP)
-- 문법) CREATE SEQUENCE 시퀀스이름
--      START WITH N : 시퀀스 번호의 시작을 지정
--      INCREMENT BY N : N씩 증가
--      MIN VALUE N : N 시퀀스 최소값
--      MAX VALUE N : N 시퀀스 최대값
CREATE SEQUENCE SQ_EMP
INCREMENT BY 1 START WITH 10;
-- 시퀀스 목록보기
SELECT * FROM USER_SEQUENCES;

-- 시퀀스 테스트(증가하는지 보기)
-- 시퀀스 증가시키기(SELECT 시퀀스이름.NEXTVAL)
SELECT SQ_EMP.NEXTVAL FROM DUAL;
-- 현재 시퀀스 값
SELECT SQ_EMP.CURRVAL FROM DUAL;

-- 개발 예)
-- 부서번호를 위한 시퀀스 생성
CREATE SEQUENCE SQ_DEPT
INCREMENT BY 1 START WITH 1;

-- 테스트용 빈 부서테이블 생성
CREATE TABLE DEPT_COPY2
AS
SELECT *
FROM DEPARTMENT
WHERE 1 = 0;

-- 데이터 추가하기
-- ID번호 같은데 시퀀스를 넣어서 함
-- 이 밑에거 실행하면 왜 그런지 앎, 여러번 실행해보셈
INSERT INTO DEPT_COPY2
VALUES(SQ_DEPT.NEXTVAL, 'ACCOUNTING', 'NEW YORK');

SELECT * FROM DEPT_COPY2;

-- 시퀀스 목록보기
SELECT * FROM USER_SEQUENCES;

-- 시퀀스 제거하기
DROP SEQUENCE SQ_EMP;