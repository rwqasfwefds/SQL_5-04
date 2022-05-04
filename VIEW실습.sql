-- 2022-05-04 뷰(VIEW)실습
-- 뷰(VIEW) : 가상 테이블(공간이 할당되어서 저장하고 있지 않음)
-- 뷰에 저장된 것 : SQL문(SELECT문)
-- 뷰의 사용 목적 : 편의성, 보안
-- 비교) 테이블 : 공간이 할당되어 디스크에 저장되고 있음
-- 예)
-- 뷰 생성 권한 주기(sys sysytem계정만 가능, 한 마디로 관리자 계정만 가능)
-- 문법 : GRANT 권한 TO 계정
-- grant create any view to scott;
-- 뷰 생성 권한 뺐기
-- 문법 : REVOKE 권한 FROM 계정
-- revoke create any view from scott;

-- 추가로 OR REPLACE 얘는 생략 가능한데
-- 얘를 생략해버리면 덮어 씌울 수가 없음
-- 한 마디로 같은 이름으로 삭제하기 전까지 다신 쓸 수 없다 이마리야 그래서 걍 무조건 넣어
CREATE OR REPLACE VIEW VW_EMP_JOB
AS
SELECT ENO, ENAME, DNO, JOB
FROM EMPLOYEE
WHERE JOB LIKE '%SALES%';
-- 자주 쓰는 SQL문은 VIEW로 만들어놓고 이렇게 간편하게 씀
-- 위에거 보셈 불러올려면 저마이 김
SELECT * FROM VW_EMP_JOB;

-- 사원 테이블에는 급여정보가 포함되어 있음(급여정보 : 비밀(대외비))
CREATE VIEW VW_EMP_SAMPLE
AS
SELECT ENO, ENAME, JOB, MANAGER, DNO
FROM EMPLOYEE;

SELECT * FROM VW_EMP_SAMPLE;

-- 참고사항) 접속한 유저에 뷰 목록을 보고 싶을때 조회하는 딕셔너리
SELECT VIEW_NAME, TEXT
FROM USER_VIEWS;

-- 그룹 함수를 쓴 SELECT 문을 뷰(VIEW)로 만들기
-- 에러(SELECT문에 그룹함수가 있는 컬럼에 별칭을 주어야 에러가 안 남)
CREATE OR REPLACE VIEW VW_EMP_SALARY
AS
SELECT DNO, SUM(SALARY), TRUNC(AVG(SALARY))
FROM EMPLOYEE
GROUP BY DNO;

-- 별칭 줌
CREATE OR REPLACE VIEW VW_EMP_SALARY
AS
SELECT DNO, SUM(SALARY) AS 총급여, TRUNC(AVG(SALARY)) AS 평균급여
FROM EMPLOYEE
GROUP BY DNO;

SELECT * FROM VW_EMP_SALARY;

-- 뷰 삭제하기(현재 있는거 다 삭제)
-- 뷰 목록 확인
SELECT * FROM USER_VIEWS;
-- 뷰 삭제
DROP VIEW VW_EMP_SALARY;


