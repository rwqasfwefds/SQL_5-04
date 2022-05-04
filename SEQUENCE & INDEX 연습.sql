-- �������� : ������ & �ε��� ����
-- 1) ��� ���̺��� �����ȣ�� �ڵ����� �������Ƿ� �������� �����ϼ�.
-- ������ �̸� : SQ_EMP, ���۹�ȣ : 1, ���� : 1, �ִ밪 : 100000
CREATE SEQUENCE SQ_EMP
INCREMENT BY 1 START WITH 1
MAXVALUE 10000;

-- 2) �����ȣ�� �������κ��� �߱޹����ÿ�.
-- �ӽ� ��� ���̺� ����� : EMP01
--                       �÷��� : EMPNO NUMBER(4) PRIMARY KEY,
--                               ENAME VARCHAR2(10),
--                               HIRE DATE
-- INSERT���� �̿��ؼ� EMPNO�� ������ ���� �߰��ϼ�
-- (��, �̸��̳� ��¥�� ���Ƿ� �ϼ�)
CREATE TABLE EMP01(
    EMPNO NUMBER(4) CONSTRAINT PK_EMPNO PRIMARY KEY,
    ENAME VARCHAR2(10),
    HIRE DATE
);

SELECT * FROM EMP01;

INSERT INTO EMP01
VALUES(SQ_EMP.NEXTVAL, '�ְ���', SYSDATE);

SELECT * FROM EMP01;

-- 3) EMP01 ���̺� �̸� �÷��� INDEX�� �����ϼ�(�ε����� : IDX_EMP01_ENAME)
CREATE INDEX IDX_EMP01_ENAME
ON EMP01(ENAME);

SELECT * FROM USER_IND_COLUMNS
WHERE TABLE_NAME = 'EMP01';