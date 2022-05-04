-- 연습문제 : 뷰(VIEW) 연습
-- 1) 20번 부서에 소속된 사원의 사원번호와 이름과 부서번호를 출력하는 뷰(VIEW)를 만드셈
CREATE OR REPLACE VIEW VW_EMP
AS
SELECT ENO AS 사원번호, 
       ENAME AS 이름,
       DNO AS 부서번호
FROM EMPLOYEE
WHERE DNO = 20;

SELECT * FROM VW_EMP;

-- 2) 이미 생성되어 있는 상기 뷰에 대해 급여 역시 출력하도록 수정하셈
CREATE OR REPLACE VIEW VW_EMP
AS
SELECT ENO AS 사원번호, 
       ENAME AS 이름,
       DNO AS 부서번호,
       SALARY AS 급여
FROM EMPLOYEE
WHERE DNO = 20;

SELECT * FROM VW_EMP;

