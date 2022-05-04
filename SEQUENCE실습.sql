-- 2022-05-04 SEQUENCE ����
-- �����Ҷ� Ű��(ID) : �ڵ� �����ϴ� ���� ���
--SEQUENCE : DB���� �ڵ� �����ϴ� ���� ����� �� �� ����(ä��)
-- ��) ���� ���� 10�̰� 1�� �����ϴ� ������ �����ϱ�(�̸� : SQ_EMP)
-- ����) CREATE SEQUENCE �������̸�
--      START WITH N : ������ ��ȣ�� ������ ����
--      INCREMENT BY N : N�� ����
--      MIN VALUE N : N ������ �ּҰ�
--      MAX VALUE N : N ������ �ִ밪
CREATE SEQUENCE SQ_EMP
INCREMENT BY 1 START WITH 10;
-- ������ ��Ϻ���
SELECT * FROM USER_SEQUENCES;

-- ������ �׽�Ʈ(�����ϴ��� ����)
-- ������ ������Ű��(SELECT �������̸�.NEXTVAL)
SELECT SQ_EMP.NEXTVAL FROM DUAL;
-- ���� ������ ��
SELECT SQ_EMP.CURRVAL FROM DUAL;

-- ���� ��)
-- �μ���ȣ�� ���� ������ ����
CREATE SEQUENCE SQ_DEPT
INCREMENT BY 1 START WITH 1;

-- �׽�Ʈ�� �� �μ����̺� ����
CREATE TABLE DEPT_COPY2
AS
SELECT *
FROM DEPARTMENT
WHERE 1 = 0;

-- ������ �߰��ϱ�
-- ID��ȣ ������ �������� �־ ��
-- �� �ؿ��� �����ϸ� �� �׷��� ��, ������ �����غ���
INSERT INTO DEPT_COPY2
VALUES(SQ_DEPT.NEXTVAL, 'ACCOUNTING', 'NEW YORK');

SELECT * FROM DEPT_COPY2;

-- ������ ��Ϻ���
SELECT * FROM USER_SEQUENCES;

-- ������ �����ϱ�
DROP SEQUENCE SQ_EMP;