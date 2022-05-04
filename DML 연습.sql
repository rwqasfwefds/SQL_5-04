-- 접속 한 유저의 테이블 목록을 보는 SQL 명령어
SELECT * FROM USER_TABLES;
-- 5월 3일 실습했던 테이블 삭제
DROP TABLE EMP_COPY;
DROP TABLE DEPT_COPY;

-- 연습문제 1) EMPLOYEE 테이블의 구조만 복사하여 EMP_INSERT란 이름의 빈 테이블을 만드셈
CREATE TABLE EMP_INSERT
AS
SELECT *
FROM EMPLOYEE
WHERE 1 = 2;

DESC EMP_INSERT;

-- 컬럼 목록을 보는 딕셔너리
-- INSERT 문 같은경우엔 원래 INSERT INTO 테이블명(컬럼1, 컬럼2.....)
-- 하잖아 근데 많으면 하나하나 다 적기 빡세다 이거지
-- 그래서 그냥 테이블 조회해서 카피 OR 자료형을 보면 됨
SELECT * 
FROM USER_TAB_COLUMNS
ORDER BY TABLE_NAME;

-- 2) 본인을 EMP_INSERT테이블에 추가하되 SYSDATE를
-- 이용해서 입사일을 오늘로 입력하시오.
INSERT INTO EMP_INSERT
VALUES(1, '주건재', 'STUDENT', NULL, SYSDATE, 2000, 100, 10);

SELECT * FROM EMP_INSERT;

-- 3) EMP_INSERT 테이블에 옆 사람을 추가하되, TO_DATE 함수를
-- 이용해서 입사일을 어제로 입력하셈.
-- 어제 날짜 : SYSDATE - 1
INSERT INTO EMP_INSERT
VALUES(2, '김창권', 'STUDENT', NULL, TO_DATE(SYSDATE - 1), 2000, 110, 20);

SELECT * FROM EMP_INSERT;

-- 4) EMPLOYEE 테이블의 구조와 내용을 복사하여 EMP_COPY란 이름의 테이블을 만드시오
CREATE TABLE EMP_COPY
AS
SELECT *
FROM EMPLOYEE;

SELECT * FROM EMP_COPY;

-- 5) 사원번호가 7788인 사원의 부서번호를 10번으로 수정하셈
UPDATE EMP_COPY
SET DNO = 10
WHERE ENO = 7788;

SELECT * FROM EMP_COPY;
-- 6) 사원번호가 7788의 담당 업무 및 급여를 사원번호 7499의
-- 담당 업무 및 급여와 일치하도록 수정하셈
UPDATE EMP_COPY
SET JOB = (SELECT JOB FROM EMP_COPY WHERE ENO = 7499),
    SALARY = (SELECT SALARY FROM EMP_COPY WHERE ENO = 7499)
WHERE ENO = 7788;

-- 이렇게도 가능
UPDATE EMP_COPY
SET (JOB, SALARY) = (SELECT JOB, SALARY FROM EMP_COPY WHERE ENO = 7499)
WHERE ENO = 7788;

SELECT * FROM EMP_COPY;

-- 7) DEPARTMENT 테이블의 구조와 내용을 복사하여 DEPT_COPY란 이름의 테이블을 만드셈
CREATE TABLE DEPT_COPY
AS
SELECT *
FROM DEPARTMENT;

SELECT * FROM DEPT_COPY;

-- 8) DEPT_COPY 테이블에서 부서명이 RESEARCH인 부서를 제거하셈
DELETE DEPT_COPY
WHERE DNAME = 'RESEARCH';

SELECT * FROM DEPT_COPY;

-- 9) DEPT_COPY테이블에서 부서번호가 10이거나 40인 부서를 제거하셈
DELETE DEPT_COPY
WHERE DNO IN (10, 40);

SELECT * FROM DEPT_COPY;

COMMIT;

-- 도전과제 10) DEPT_COPY 테이블에서 부서명(DNAME)이 'SALES'이면 
-- 지역명(LOC)에 'SEOUL'이라고 수정하고, 아니면 'BUSAN' 수정
UPDATE DEPT_COPY
SET LOC = (SELECT CASE WHEN DNAME = 'SALES' THEN 'SEOUL'
                       ELSE 'BUSAN'
                       END
            FROM DEPT_COPY);
                       
SELECT * FROM DEPT_COPY;

COMMIT;