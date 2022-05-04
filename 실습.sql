-- 참고) ROLLBACK / COMMIT
-- 트랜잭션(Transaction)관리
-- ROLLBACK : DML(INSERT / UPDATE / DELETE) 실행 취소
-- COMMIT : DML(INSERT / UPDATE / DELETE) 실행 영구 반영
-- 예) 트랜잭션 시작
--     INSETR ~
--     UPDATE ~
--     DELETE ~
--     COMMIT[ROLLBACK] : 트랜잭션 종료 ( 1개의 트랜잭션 )

-- 참고 사항) AUTOCOMMIT : 자동 DB 영구 반영
--          Oracle DB : AUTOCOMMIT = FALSE로 되있음
--          MYSQL/MRIADB : AUTOCOMMIT = TRUE로 되있음




-- 2022-05-04 데이터 무결성(PK / FK) 실습
-- 제약 조건(Constraint)
-- 테이블의 컬럼에 유효하지 않은 값을 걸러내기 위해 걸어주는 것
-- 무결성 제약조건
-- 1. NOT NULL 조건
CREATE TABLE CUSTOMER(
    ID VARCHAR2(20) NOT NULL,
    PWD VARCHAR2(20) NOT NULL,
    NAME VARCHAR2(20) NOT NULL,
    PHONE VARCHAR2(30),
    ADDRESS VARCHAR2(100)
);
DESC CUSTOMER;
-- NOT NULL INSERT 테스트(당연히 실행 안 됨)
INSERT INTO CUSTOMER
VALUES(NULL, NULL, NULL, '010-1111-1111', 'BUSAN'); -- 제약조건 때문에 에러남

-- 2. UNIQUE : 테이블의 컬럼에 데이터가 무조건 유일한 값만 들어 갈 수 있게 함(테이터 중복 X)
CREATE TABLE CUSTOMER2(
    ID VARCHAR2(20) UNIQUE,
    PWD VARCHAR2(20) NOT NULL,
    NAME VARCHAR2(20) NOT NULL,
    PHONE VARCHAR2(30),
    ADDRESS VARCHAR2(100)
);
DESC CUSTOMER2;
-- UNIQUE는 NULL은 중복 ㅇㅋ 다른 값들은 안 됨
-- NULL : UNIQUE 제약조건에 위반되지 않음
INSERT INTO CUSTOMER2
VALUES('1', '1111', '홍길동', '010-1111-1111', 'BUSAN');

SELECT * FROM CUSTOMER2;
-- 1이 중복이 돼서 오류 남
INSERT INTO CUSTOMER2
VALUES('1', '1111', '이순신', '010-1111-1111', 'BUSAN');

-- 제약조건에 이름을 지정 할 수 있음(걍 이름 넣는 법만 알면 됨)
CREATE TABLE CUSTOMER3(
    ID VARCHAR2(20) CONSTRAINT UK_ID UNIQUE,
    PWD VARCHAR2(20) NOT NULL,
    NAME VARCHAR2(20) NOT NULL,
    PHONE VARCHAR2(30),
    ADDRESS VARCHAR2(100)
);
-- 제약조건 보는 딕셔너리
SELECT * FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'CUSTOMER3';

-- 3) Primary Key(UNIQUE 랑 같은 작용하는 놈인데 얘를 그냥 씀 UNIQUE 얘 안 씀)
-- UNIQUE + NOT NULL 효과 : 유일한 값 + NOT NULL 조건 + INDEX 자동생성
CREATE TABLE CUSTOMER4(
    ID VARCHAR2(20),
    PWD VARCHAR2(20) NOT NULL,
    NAME VARCHAR2(20) NOT NULL,
    PHONE VARCHAR2(30),
    ADDRESS VARCHAR2(100),
    CONSTRAINT PK_ID PRIMARY KEY(ID)
);

INSERT INTO CUSTOMER4
VALUES('1', '1111', '홍길동', '010-1111-1111', 'BUSAN');
-- ID중복이기 때문에 에러
INSERT INTO CUSTOMER4
VALUES('1', '1111', '이순신', '010-1111-1111', 'BUSAN');
-- ID가 NULL이기 때문에 에러
INSERT INTO CUSTOMER4
VALUES(NULL, '1111', '홍길동', '010-1111-1111', 'BUSAN');

-- 4) FOREIGN KEY : 참조되는 테이블에 컬럼 값이 항상 존재해야 함
-- 부모테이블(ID : 1, 2, 3) - 자식테이블(ID : 1, 2, 3)
-- 부모테이블에 있는 값만 자식테이블에 있어야 함(다른 데이터가 들어가 있으면 에러)
-- 예) 부모테이블 : 부서 테이블, 자식 테이블 : 직원 테이블 => FK(참조 무결성)
-- 그러니깐 부모 테이블 부서 컬럼에 영업부, 기술부, 운영부가 있으면 자식 테이블 부서 컬럼에도 영업부, 기술부, 운영부 이 3개만 들어갈수 있음
-- 단, 다 안 들어가도 되고 하나만 들어가도 ㅇㅋ
-- FOREIGN KEY 이거는 성능상의 밑 예제처럼 잘 안 건다 이마리야 ㅇㅇ
-- 그래서 이걸 어디서 거냐? 자바에서 건다 이마리야 ㅇㅇ
-- 예) 부서테이블 : 
SELECT * FROM DEPARTMENT;
-- FK테스트 테이블
CREATE TABLE EMP_SECOND(
    ENO NUMBER(4) CONSTRAINT PK_ENO PRIMARY KEY,
    ENAME VARCHAR2(10),
    JOB VARCHAR2(9),
    -- REFERENCES : 참조 즉, DEPARTMENT를 참조한다 
    DNO NUMBER(2) CONSTRAINT FK_DNO2 REFERENCES DEPARTMENT
);

-- DEPARTMENT DNO에 없는 50을 넣으니 에러 
INSERT INTO EMP_SECOND(ENO, ENAME, DNO)
VALUES(8000, '이순신', 50);

-- 40은 DEPARTMENT에 있으니 가능
INSERT INTO EMP_SECOND(ENO, ENAME, DNO)
VALUES(8000, '이순신', 40);

SELECT * FROM EMP_SECOND;

-- DEFAULT 제약조건 : 
-- 컬럼에 데이터가 아무런 값이 입력되지 않았을때 디폴트로 지정된 값이 입력됨
-- 원래 디폴트로 지정 안 하고 아무 값도 안 넣으면 NULL값이 들어오는데 이건 디폴트 값을 1000으로 지정해줘서
-- SALARY에 아무런 데이터를 안 넣어도 1000이 나옴
CREATE TABLE EMP_THIRD(
    ENO NUMBER(4) CONSTRAINT PK_ENO2 PRIMARY KEY,
    ENAME VARCHAR2(10),
    SALARY NUMBER(7, 2) DEFAULT 1000
);

INSERT INTO EMP_THIRD(ENO, ENAME)
VALUES(8000, '홍길동');

SELECT * FROM EMP_THIRD;

-- 테이블 정리(기본 테이블만 남기고 다 제거)
-- 기존 테이블 : SALGRADE, EMPLOYEE, DEPARTMENT, BONUS
SELECT TABLE_NAME FROM USER_TABLES;

DROP TABLE EMP_COPY;

-- COPY를 하면 제약조건 등등 이런건 카피가 안 됨
-- EMP_COPY 테이블 : 
CREATE TABLE EMP_COPY
AS
SELECT *
FROM EMPLOYEE;

SELECT * FROM EMP_COPY;

--DEPT_COPY 테이블 : 
CREATE TABLE DEPT_COPY
AS
SELECT *
FROM DEPARTMENT;

SELECT * FROM DEPT_COPY;

-- 테이블 만들고 난 후에 제약조건 걸기(테이블 생성때 제약조건 거는거 보다 이런 케이스가 많음)
-- PRIMARY KEY 생성
ALTER TABLE EMP_COPY
ADD CONSTRAINT PK_EMP_COPY_ENO PRIMARY KEY(ENO);

-- 제약조건 걸렸는지 확인
SELECT * FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EMP_COPY';

-- 테이블 만들고 난 후에 제약조건 걸기
-- DEPT_COPY PRIMARY KEY 생성
ALTER TABLE DEPT_COPY
ADD CONSTRAINT PK_DEPT_COPY_ENO PRIMARY KEY(DNO);

-- 제약조건 걸렸는지 확인
SELECT * FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'DEPT_COPY';

-- FOREIGN KEY 생성
ALTER TABLE EMP_COPY
ADD CONSTRAINT FK_EMP_COPY_DNO
FOREIGN KEY(DNO) REFERENCES DEPT_COPY(DNO);

-- 제약조건 걸렸는지 확인SELECT * FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EMP_COPY';


-- 제약조건이 생성된 후 삭제하기
-- 에러) 먼저 자식테이블의 FOREIGN KEY를 제거하고, 부모 테이블의 PRIMART KEY를 제거 해야 됨
ALTER TABLE DEPT_COPY
DROP PRIMARY KEY; -- 이렇게 하면 에러 남

-- 알아서 삭제하셈 이라는 명령(끝에다가 CASCADE 붙임)
-- PRIMARY KEY와 동시에 자식테이블의 FOREIGN KEY를 찾아서 알아서 삭제해줌
ALTER TABLE DEPT_COPY
DROP PRIMARY KEY CASCADE;

-- 제약조건 보는 딕셔너리 SQL문

SELECT * FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EMP_COPY';

-- 제약조건에 따른 테이블, 컬럼을 보는 SQL문
SELECT B.TABLE_NAME, A.COLUMN_NAME, B.CONSTRAINT_TYPE
FROM USER_CONS_COLUMNS A,
     USER_CONSTRAINTS B
WHERE A.CONSTRAINT_NAME = B.CONSTRAINT_NAME
AND B.TABLE_NAME NOT LIKE 'BIN%'
ORDER BY B.TABLE_NAME;
