-- ����) ROLLBACK / COMMIT
-- Ʈ�����(Transaction)����
-- ROLLBACK : DML(INSERT / UPDATE / DELETE) ���� ���
-- COMMIT : DML(INSERT / UPDATE / DELETE) ���� ���� �ݿ�
-- ��) Ʈ����� ����
--     INSETR ~
--     UPDATE ~
--     DELETE ~
--     COMMIT[ROLLBACK] : Ʈ����� ���� ( 1���� Ʈ����� )

-- ���� ����) AUTOCOMMIT : �ڵ� DB ���� �ݿ�
--          Oracle DB : AUTOCOMMIT = FALSE�� ������
--          MYSQL/MRIADB : AUTOCOMMIT = TRUE�� ������




-- 2022-05-04 ������ ���Ἲ(PK / FK) �ǽ�
-- ���� ����(Constraint)
-- ���̺��� �÷��� ��ȿ���� ���� ���� �ɷ����� ���� �ɾ��ִ� ��
-- ���Ἲ ��������
-- 1. NOT NULL ����
CREATE TABLE CUSTOMER(
    ID VARCHAR2(20) NOT NULL,
    PWD VARCHAR2(20) NOT NULL,
    NAME VARCHAR2(20) NOT NULL,
    PHONE VARCHAR2(30),
    ADDRESS VARCHAR2(100)
);
DESC CUSTOMER;
-- NOT NULL INSERT �׽�Ʈ(�翬�� ���� �� ��)
INSERT INTO CUSTOMER
VALUES(NULL, NULL, NULL, '010-1111-1111', 'BUSAN'); -- �������� ������ ������

-- 2. UNIQUE : ���̺��� �÷��� �����Ͱ� ������ ������ ���� ��� �� �� �ְ� ��(������ �ߺ� X)
CREATE TABLE CUSTOMER2(
    ID VARCHAR2(20) UNIQUE,
    PWD VARCHAR2(20) NOT NULL,
    NAME VARCHAR2(20) NOT NULL,
    PHONE VARCHAR2(30),
    ADDRESS VARCHAR2(100)
);
DESC CUSTOMER2;
-- UNIQUE�� NULL�� �ߺ� ���� �ٸ� ������ �� ��
-- NULL : UNIQUE �������ǿ� ���ݵ��� ����
INSERT INTO CUSTOMER2
VALUES('1', '1111', 'ȫ�浿', '010-1111-1111', 'BUSAN');

SELECT * FROM CUSTOMER2;
-- 1�� �ߺ��� �ż� ���� ��
INSERT INTO CUSTOMER2
VALUES('1', '1111', '�̼���', '010-1111-1111', 'BUSAN');

-- �������ǿ� �̸��� ���� �� �� ����(�� �̸� �ִ� ���� �˸� ��)
CREATE TABLE CUSTOMER3(
    ID VARCHAR2(20) CONSTRAINT UK_ID UNIQUE,
    PWD VARCHAR2(20) NOT NULL,
    NAME VARCHAR2(20) NOT NULL,
    PHONE VARCHAR2(30),
    ADDRESS VARCHAR2(100)
);
-- �������� ���� ��ųʸ�
SELECT * FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'CUSTOMER3';

-- 3) Primary Key(UNIQUE �� ���� �ۿ��ϴ� ���ε� �긦 �׳� �� UNIQUE �� �� ��)
-- UNIQUE + NOT NULL ȿ�� : ������ �� + NOT NULL ���� + INDEX �ڵ�����
CREATE TABLE CUSTOMER4(
    ID VARCHAR2(20),
    PWD VARCHAR2(20) NOT NULL,
    NAME VARCHAR2(20) NOT NULL,
    PHONE VARCHAR2(30),
    ADDRESS VARCHAR2(100),
    CONSTRAINT PK_ID PRIMARY KEY(ID)
);

INSERT INTO CUSTOMER4
VALUES('1', '1111', 'ȫ�浿', '010-1111-1111', 'BUSAN');
-- ID�ߺ��̱� ������ ����
INSERT INTO CUSTOMER4
VALUES('1', '1111', '�̼���', '010-1111-1111', 'BUSAN');
-- ID�� NULL�̱� ������ ����
INSERT INTO CUSTOMER4
VALUES(NULL, '1111', 'ȫ�浿', '010-1111-1111', 'BUSAN');

-- 4) FOREIGN KEY : �����Ǵ� ���̺� �÷� ���� �׻� �����ؾ� ��
-- �θ����̺�(ID : 1, 2, 3) - �ڽ����̺�(ID : 1, 2, 3)
-- �θ����̺� �ִ� ���� �ڽ����̺� �־�� ��(�ٸ� �����Ͱ� �� ������ ����)
-- ��) �θ����̺� : �μ� ���̺�, �ڽ� ���̺� : ���� ���̺� => FK(���� ���Ἲ)
-- �׷��ϱ� �θ� ���̺� �μ� �÷��� ������, �����, ��ΰ� ������ �ڽ� ���̺� �μ� �÷����� ������, �����, ��� �� 3���� ���� ����
-- ��, �� �� ���� �ǰ� �ϳ��� ���� ����
-- FOREIGN KEY �̰Ŵ� ���ɻ��� �� ����ó�� �� �� �Ǵ� �̸����� ����
-- �׷��� �̰� ��� �ų�? �ڹٿ��� �Ǵ� �̸����� ����
-- ��) �μ����̺� : 
SELECT * FROM DEPARTMENT;
-- FK�׽�Ʈ ���̺�
CREATE TABLE EMP_SECOND(
    ENO NUMBER(4) CONSTRAINT PK_ENO PRIMARY KEY,
    ENAME VARCHAR2(10),
    JOB VARCHAR2(9),
    -- REFERENCES : ���� ��, DEPARTMENT�� �����Ѵ� 
    DNO NUMBER(2) CONSTRAINT FK_DNO2 REFERENCES DEPARTMENT
);

-- DEPARTMENT DNO�� ���� 50�� ������ ���� 
INSERT INTO EMP_SECOND(ENO, ENAME, DNO)
VALUES(8000, '�̼���', 50);

-- 40�� DEPARTMENT�� ������ ����
INSERT INTO EMP_SECOND(ENO, ENAME, DNO)
VALUES(8000, '�̼���', 40);

SELECT * FROM EMP_SECOND;

-- DEFAULT �������� : 
-- �÷��� �����Ͱ� �ƹ��� ���� �Էµ��� �ʾ����� ����Ʈ�� ������ ���� �Էµ�
-- ���� ����Ʈ�� ���� �� �ϰ� �ƹ� ���� �� ������ NULL���� �����µ� �̰� ����Ʈ ���� 1000���� �������༭
-- SALARY�� �ƹ��� �����͸� �� �־ 1000�� ����
CREATE TABLE EMP_THIRD(
    ENO NUMBER(4) CONSTRAINT PK_ENO2 PRIMARY KEY,
    ENAME VARCHAR2(10),
    SALARY NUMBER(7, 2) DEFAULT 1000
);

INSERT INTO EMP_THIRD(ENO, ENAME)
VALUES(8000, 'ȫ�浿');

SELECT * FROM EMP_THIRD;

-- ���̺� ����(�⺻ ���̺� ����� �� ����)
-- ���� ���̺� : SALGRADE, EMPLOYEE, DEPARTMENT, BONUS
SELECT TABLE_NAME FROM USER_TABLES;

DROP TABLE EMP_COPY;

-- COPY�� �ϸ� �������� ��� �̷��� ī�ǰ� �� ��
-- EMP_COPY ���̺� : 
CREATE TABLE EMP_COPY
AS
SELECT *
FROM EMPLOYEE;

SELECT * FROM EMP_COPY;

--DEPT_COPY ���̺� : 
CREATE TABLE DEPT_COPY
AS
SELECT *
FROM DEPARTMENT;

SELECT * FROM DEPT_COPY;

-- ���̺� ����� �� �Ŀ� �������� �ɱ�(���̺� ������ �������� �Ŵ°� ���� �̷� ���̽��� ����)
-- PRIMARY KEY ����
ALTER TABLE EMP_COPY
ADD CONSTRAINT PK_EMP_COPY_ENO PRIMARY KEY(ENO);

-- �������� �ɷȴ��� Ȯ��
SELECT * FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EMP_COPY';

-- ���̺� ����� �� �Ŀ� �������� �ɱ�
-- DEPT_COPY PRIMARY KEY ����
ALTER TABLE DEPT_COPY
ADD CONSTRAINT PK_DEPT_COPY_ENO PRIMARY KEY(DNO);

-- �������� �ɷȴ��� Ȯ��
SELECT * FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'DEPT_COPY';

-- FOREIGN KEY ����
ALTER TABLE EMP_COPY
ADD CONSTRAINT FK_EMP_COPY_DNO
FOREIGN KEY(DNO) REFERENCES DEPT_COPY(DNO);

-- �������� �ɷȴ��� Ȯ��SELECT * FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EMP_COPY';


-- ���������� ������ �� �����ϱ�
-- ����) ���� �ڽ����̺��� FOREIGN KEY�� �����ϰ�, �θ� ���̺��� PRIMART KEY�� ���� �ؾ� ��
ALTER TABLE DEPT_COPY
DROP PRIMARY KEY; -- �̷��� �ϸ� ���� ��

-- �˾Ƽ� �����ϼ� �̶�� ���(�����ٰ� CASCADE ����)
-- PRIMARY KEY�� ���ÿ� �ڽ����̺��� FOREIGN KEY�� ã�Ƽ� �˾Ƽ� ��������
ALTER TABLE DEPT_COPY
DROP PRIMARY KEY CASCADE;

-- �������� ���� ��ųʸ� SQL��

SELECT * FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EMP_COPY';

-- �������ǿ� ���� ���̺�, �÷��� ���� SQL��
SELECT B.TABLE_NAME, A.COLUMN_NAME, B.CONSTRAINT_TYPE
FROM USER_CONS_COLUMNS A,
     USER_CONSTRAINTS B
WHERE A.CONSTRAINT_NAME = B.CONSTRAINT_NAME
AND B.TABLE_NAME NOT LIKE 'BIN%'
ORDER BY B.TABLE_NAME;
