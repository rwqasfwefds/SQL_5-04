-- �������� : ��������
-- 1) EMPLOYEE ���̺��� ������ �����Ͽ� EMP_SAMPLE�� �̸��� ���̺��� �����
-- ��� ���̺��� �����ȣ �÷�(ENO)�� ���̺� ������ PTIMARY KEY ���������� �����ϵ�,
-- ���� ���� �̸��� PK_MY_EMP�� �ϼ�
CREATE TABLE EMP_SAMPLE
AS
SELECT *
FROM EMPLOYEE
WHERE 1 = 2;
-- �⺻Ű(PRIMARY KEY)
ALTER TABLE EMP_SAMPLE
ADD CONSTRAINT PK_MY_EMP PRIMARY KEY(ENO);

-- �������� �ɷȴ��� Ȯ��
SELECT * FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EMP_SAMPLE';

-- 2) DEPARTMENT ���̺��� ������ �����Ͽ� DEPT_SAMPLE�� �̸��� ���̺��� �����
-- �μ���ȣ �÷�(DNO)�� PRIMARY KEY ���������� �����ϵ�,
-- ���� ���� �̸��� PK_MY_DEPT�� �ϼ�
CREATE TABLE DEPT_SAMPLE
AS
SELECT *
FROM DEPARTMENT
WHERE 1 = 2;

ALTER TABLE DEPT_SAMPLE
ADD CONSTRAINT PK_MY_DEPT PRIMARY KEY(DNO);

-- �������� �ɷȴ��� Ȯ��
SELECT * FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'DEPT_SAMPLE';

-- 3) ��� ���̺��� �μ���ȣ �÷��� �������� �ʴ� �μ��� ����� �������� �ʵ���
-- �ܷ� Ű(FOREIGN KEY : FK)���������� �����ϵ�, FK_MY_DEPT_EMP�� �ϼ�
-- ���� ���̺� : DEPARTMENT
-- ����Ű, �ܷ�Ű(FOREIGN KEY : FK)
ALTER TABLE EMP_SAMPLE
ADD CONSTRAINT FK_MY_DEPT_EMP
FOREIGN KEY(DNO) REFERENCES DEPARTMENT(DNO);

-- �������� �ɷȴ��� Ȯ��
SELECT * FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EMP_SAMPLE';
