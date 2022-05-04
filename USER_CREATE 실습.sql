-- ���� �����
CREATE USER GUEST IDENTIFIED BY 1111; -- ������ �� �༭ ������

-- SCOTT ���� ���� ��� : ��(ROLE : ���� ���ѵ��� ��� ��Ƴ���)
-- CONNECT(���ӿ� ���õ� ���� ������)
-- RESOURCE(���̺�, ��, ���ν��� ����, ����)
-- DBA(����, DB���� ��� �ֻ��� ����)
-- ���� ��� ��Ű�� �� : 
-- dba������ �൵ user�� ����� ������ ��� ���� ��� ��
grant connect, resource, dba to scott;
grant create user to scott;

-- ���� �ְ� �� �� ���� ����
-- ����Ŭ �������� ���� : TABLESPACE(�� �ȿ��ٰ� ���̺���� ��Ƶ�, ���̺��� �����ϴ� ��ũ ����)
CREATE USER GUEST02 IDENTIFIED BY 1111
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP;

-- ���� ����
-- CREATE TABLE : ���̺� ���� ����
-- CREATE VIEW : �� ���� ����
-- CREATE SEQUENCE : ������ ���� ����

-- ���Ѻο� ��ɾ�
-- GRANT ����[��] TO ������

-- ���� ��� ��ɾ�
-- REVOKE ����[��] FROM ������

-- ���Ǿ� : ���̺� : SELECT * FROM SCOTT.EMPLOYEE
--                ��Ī���� �����ؼ� �̸��� �������� �� ����

-- �������� 01) KBS��� ����ڸ� �����ϼ�. ��ȣ�� 1234�� �����
-- DEFAULT TABLESPACE���� USERS���� ����ϰ�,
-- TEMPORARY TABLESPACE ���� TEMP�� ����ϼ�
CREATE USER KBS IDENTIFIED BY 1234
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP;

-- ���� 2) 1������ ������ ������ CONNECT, RESOURCE ����(��)�� �ο��ϼ���
grant connect, resource to KBS;