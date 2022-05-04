-- 연습문제 : 시퀀스 & 인덱스 연습
-- 1) 사원 테이블의 사원번호가 자동으로 생성도되록 시퀀스를 생성하셈.
-- 시퀀스 이름 : SQ_EMP, 시작번호 : 1, 증가 : 1, 최대값 : 100000
CREATE SEQUENCE SQ_EMP
INCREMENT BY 1 START WITH 1
MAXVALUE 10000;

-- 2) 사원번호를 시퀀스로부터 발급받으시오.
-- 임시 사원 테이블 만드셈 : EMP01
--                       컬럼명 : EMPNO NUMBER(4) PRIMARY KEY,
--                               ENAME VARCHAR2(10),
--                               HIRE DATE
-- INSERT문을 이용해서 EMPNO에 시퀀스 값을 추가하셈
-- (단, 이름이나 날짜는 임의로 하셈)
CREATE TABLE EMP01(
    EMPNO NUMBER(4) CONSTRAINT PK_EMPNO PRIMARY KEY,
    ENAME VARCHAR2(10),
    HIRE DATE
);

SELECT * FROM EMP01;

INSERT INTO EMP01
VALUES(SQ_EMP.NEXTVAL, '주건재', SYSDATE);

SELECT * FROM EMP01;

-- 3) EMP01 테이블에 이름 컬럼에 INDEX를 생성하셈(인덱스명 : IDX_EMP01_ENAME)
CREATE INDEX IDX_EMP01_ENAME
ON EMP01(ENAME);

SELECT * FROM USER_IND_COLUMNS
WHERE TABLE_NAME = 'EMP01';