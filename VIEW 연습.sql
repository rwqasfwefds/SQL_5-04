-- �������� : ��(VIEW) ����
-- 1) 20�� �μ��� �Ҽӵ� ����� �����ȣ�� �̸��� �μ���ȣ�� ����ϴ� ��(VIEW)�� �����
CREATE OR REPLACE VIEW VW_EMP
AS
SELECT ENO AS �����ȣ, 
       ENAME AS �̸�,
       DNO AS �μ���ȣ
FROM EMPLOYEE
WHERE DNO = 20;

SELECT * FROM VW_EMP;

-- 2) �̹� �����Ǿ� �ִ� ��� �信 ���� �޿� ���� ����ϵ��� �����ϼ�
CREATE OR REPLACE VIEW VW_EMP
AS
SELECT ENO AS �����ȣ, 
       ENAME AS �̸�,
       DNO AS �μ���ȣ,
       SALARY AS �޿�
FROM EMPLOYEE
WHERE DNO = 20;

SELECT * FROM VW_EMP;

