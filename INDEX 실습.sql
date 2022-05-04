-- 2022-05-04 INDEX ����(*****)
-- �ַ� ��ȸ�� ���� ��� �÷��� ������ ��
-- �ε��� ���� : ��ȸ(SELECT) ����(�ӵ�)�� ���̱� ���ؼ� �ε����� ����
-- �ε��� �˰��� : B* TREE(�˻� �ӵ� ��� �˰���)
-- ���� : CREATE INDEX �ε����̸�
--       ON ���̺��(�÷���);

-- �ε����� �ɾ�� �Ǵ� �÷�
-- 1) ���̺� ���� ���� �ʹ� ������ : 10���� �̻�
-- 2) WHERE���� ��� �÷��� �ʹ� ���� ���ö�
-- 3) �˻� ��� ��ü�� �뷫 2% ~ 5% ���� ���ö�(�ݴ�� 10%�Ѿ� �� �� �ε��� �ɸ� �� �� ����)
-- 4) ���ο� ���Ǵ� �÷��� �ε����� �Ŵ� ���� ���
-- ��)
CREATE INDEX IDX_EMPLOYEE_ENAME
ON EMPLOYEE(ENAME);

-- �ε��� ���� Ȯ��(�ε��� ���� ��ųʸ�)
SELECT * FROM USER_IND_COLUMNS
WHERE TABLE_NAME = 'EMPLOYEE';

-- �ε��� ����
DROP INDEX IDX_EMPLOYEE_ENAME;

-- Ư��) ���� �ε��� : �ΰ� �̻��� �÷����� �����ϴ� �ε���
CREATE INDEX IDX_DEPT_COM
ON DEPARTMENT(DNAME, LOC);

-- �ε��� ���� Ȯ��(�ε��� ���� ��ųʸ�)
SELECT * FROM USER_IND_COLUMNS
WHERE TABLE_NAME = 'DEPARTMENT';

-- Ư��) �Լ� ��� �ε��� : �����̳� �Լ��� �����ؼ� ���� �ε���
-- ��ȣ�ȿ� �ִ� �������� ��ȸ�� ���� �Ѵٸ� �� ������ �� �� ���� ���
CREATE INDEX IDX_EMO_ANNSAL
ON EMPLOYEE(SALARY * 12);

