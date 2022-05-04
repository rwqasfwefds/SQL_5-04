-- ���� �� ������ ���̺� ����� ���� SQL ��ɾ�
SELECT * FROM USER_TABLES;
-- 5�� 3�� �ǽ��ߴ� ���̺� ����
DROP TABLE EMP_COPY;
DROP TABLE DEPT_COPY;

-- �������� 1) EMPLOYEE ���̺��� ������ �����Ͽ� EMP_INSERT�� �̸��� �� ���̺��� �����
CREATE TABLE EMP_INSERT
AS
SELECT *
FROM EMPLOYEE
WHERE 1 = 2;

DESC EMP_INSERT;

-- �÷� ����� ���� ��ųʸ�
-- INSERT �� ������쿣 ���� INSERT INTO ���̺��(�÷�1, �÷�2.....)
-- ���ݾ� �ٵ� ������ �ϳ��ϳ� �� ���� ������ �̰���
-- �׷��� �׳� ���̺� ��ȸ�ؼ� ī�� OR �ڷ����� ���� ��
SELECT * 
FROM USER_TAB_COLUMNS
ORDER BY TABLE_NAME;

-- 2) ������ EMP_INSERT���̺� �߰��ϵ� SYSDATE��
-- �̿��ؼ� �Ի����� ���÷� �Է��Ͻÿ�.
INSERT INTO EMP_INSERT
VALUES(1, '�ְ���', 'STUDENT', NULL, SYSDATE, 2000, 100, 10);

SELECT * FROM EMP_INSERT;

-- 3) EMP_INSERT ���̺� �� ����� �߰��ϵ�, TO_DATE �Լ���
-- �̿��ؼ� �Ի����� ������ �Է��ϼ�.
-- ���� ��¥ : SYSDATE - 1
INSERT INTO EMP_INSERT
VALUES(2, '��â��', 'STUDENT', NULL, TO_DATE(SYSDATE - 1), 2000, 110, 20);

SELECT * FROM EMP_INSERT;

-- 4) EMPLOYEE ���̺��� ������ ������ �����Ͽ� EMP_COPY�� �̸��� ���̺��� ����ÿ�
CREATE TABLE EMP_COPY
AS
SELECT *
FROM EMPLOYEE;

SELECT * FROM EMP_COPY;

-- 5) �����ȣ�� 7788�� ����� �μ���ȣ�� 10������ �����ϼ�
UPDATE EMP_COPY
SET DNO = 10
WHERE ENO = 7788;

SELECT * FROM EMP_COPY;
-- 6) �����ȣ�� 7788�� ��� ���� �� �޿��� �����ȣ 7499��
-- ��� ���� �� �޿��� ��ġ�ϵ��� �����ϼ�
UPDATE EMP_COPY
SET JOB = (SELECT JOB FROM EMP_COPY WHERE ENO = 7499),
    SALARY = (SELECT SALARY FROM EMP_COPY WHERE ENO = 7499)
WHERE ENO = 7788;

-- �̷��Ե� ����
UPDATE EMP_COPY
SET (JOB, SALARY) = (SELECT JOB, SALARY FROM EMP_COPY WHERE ENO = 7499)
WHERE ENO = 7788;

SELECT * FROM EMP_COPY;

-- 7) DEPARTMENT ���̺��� ������ ������ �����Ͽ� DEPT_COPY�� �̸��� ���̺��� �����
CREATE TABLE DEPT_COPY
AS
SELECT *
FROM DEPARTMENT;

SELECT * FROM DEPT_COPY;

-- 8) DEPT_COPY ���̺��� �μ����� RESEARCH�� �μ��� �����ϼ�
DELETE DEPT_COPY
WHERE DNAME = 'RESEARCH';

SELECT * FROM DEPT_COPY;

-- 9) DEPT_COPY���̺��� �μ���ȣ�� 10�̰ų� 40�� �μ��� �����ϼ�
DELETE DEPT_COPY
WHERE DNO IN (10, 40);

SELECT * FROM DEPT_COPY;

COMMIT;

-- �������� 10) DEPT_COPY ���̺��� �μ���(DNAME)�� 'SALES'�̸� 
-- ������(LOC)�� 'SEOUL'�̶�� �����ϰ�, �ƴϸ� 'BUSAN' ����
UPDATE DEPT_COPY
SET LOC = (SELECT CASE WHEN DNAME = 'SALES' THEN 'SEOUL'
                       ELSE 'BUSAN'
                       END
            FROM DEPT_COPY);
                       
SELECT * FROM DEPT_COPY;

COMMIT;