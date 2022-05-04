-- 2022-05-04 ��(VIEW)�ǽ�
-- ��(VIEW) : ���� ���̺�(������ �Ҵ�Ǿ �����ϰ� ���� ����)
-- �信 ����� �� : SQL��(SELECT��)
-- ���� ��� ���� : ���Ǽ�, ����
-- ��) ���̺� : ������ �Ҵ�Ǿ� ��ũ�� ����ǰ� ����
-- ��)
-- �� ���� ���� �ֱ�(sys sysytem������ ����, �� ����� ������ ������ ����)
-- ���� : GRANT ���� TO ����
-- grant create any view to scott;
-- �� ���� ���� ����
-- ���� : REVOKE ���� FROM ����
-- revoke create any view from scott;

-- �߰��� OR REPLACE ��� ���� �����ѵ�
-- �긦 �����ع����� ���� ���� ���� ����
-- �� ����� ���� �̸����� �����ϱ� ������ �ٽ� �� �� ���� �̸����� �׷��� �� ������ �־�
CREATE OR REPLACE VIEW VW_EMP_JOB
AS
SELECT ENO, ENAME, DNO, JOB
FROM EMPLOYEE
WHERE JOB LIKE '%SALES%';
-- ���� ���� SQL���� VIEW�� �������� �̷��� �����ϰ� ��
-- ������ ���� �ҷ��÷��� ������ ��
SELECT * FROM VW_EMP_JOB;

-- ��� ���̺��� �޿������� ���ԵǾ� ����(�޿����� : ���(��ܺ�))
CREATE VIEW VW_EMP_SAMPLE
AS
SELECT ENO, ENAME, JOB, MANAGER, DNO
FROM EMPLOYEE;

SELECT * FROM VW_EMP_SAMPLE;

-- �������) ������ ������ �� ����� ���� ������ ��ȸ�ϴ� ��ųʸ�
SELECT VIEW_NAME, TEXT
FROM USER_VIEWS;

-- �׷� �Լ��� �� SELECT ���� ��(VIEW)�� �����
-- ����(SELECT���� �׷��Լ��� �ִ� �÷��� ��Ī�� �־�� ������ �� ��)
CREATE OR REPLACE VIEW VW_EMP_SALARY
AS
SELECT DNO, SUM(SALARY), TRUNC(AVG(SALARY))
FROM EMPLOYEE
GROUP BY DNO;

-- ��Ī ��
CREATE OR REPLACE VIEW VW_EMP_SALARY
AS
SELECT DNO, SUM(SALARY) AS �ѱ޿�, TRUNC(AVG(SALARY)) AS ��ձ޿�
FROM EMPLOYEE
GROUP BY DNO;

SELECT * FROM VW_EMP_SALARY;

-- �� �����ϱ�(���� �ִ°� �� ����)
-- �� ��� Ȯ��
SELECT * FROM USER_VIEWS;
-- �� ����
DROP VIEW VW_EMP_SALARY;


