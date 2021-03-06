-- 제약조건 정보 확인
-- P : PRIMARY KEY
-- R : FOREIGN KEY
-- C : CHECK 또는 NOT NULL
-- U : UNIQUE
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EMPLOYEE';


SELECT TABLE_NAME, COLUMN_NAME, CONSTRAINT_NAME 
FROM USER_CONS_COLUMNS
WHERE TABLE_NAME = 'EMPLOYEE'
UNION
SELECT TABLE_NAME, CONSTRAINT_NAME, CONSTRAINT_TYPE
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EMPLOYEE'
ORDER BY 3 DESC
;

SELECT * FROM USER_TABLES;
DESC EMPLOYEE;


CREATE TABLE COPY_EMPLOYEE
AS
SELECT EMP_ID, EMP_NAME, EMAIL, PHONE FROM EMPLOYEE;

SELECT * FROM COPY_EMPLOYEE


CREATE TABLE COPY_EMPLOYEE1
AS
SELECT EMP_ID, EMP_NAME, EMAIL, PHONE FROM EMPLOYEE WHERE PHONE IS NOT NULL;        --  조회결과대로 테이블을 생성(컬럼명, 자료형(길이) 복사, 제약조건은 NOT NULL)

SELECT * FROM COPY_EMPLOYEE1;


CREATE TABLE DEPT_COPY
AS
SELECT * FROM DEPARTMENT;

SELECT * FROM DEPT_COPY;
-- 1. 테이블에 컬럼 추가
ALTER TABLE DEPT_COPY
ADD (ADD_COL1 VARCHAR2(10));

ALTER TABLE DEPT_COPY
ADD (ADD_COL2 NUMBER DEFAULT 100);

-- 2. 컬럼 자료형 수정
ALTER TABLE DEPT_COPY
MODIFY DEPT_ID VARCHAR2(20);

ALTER TABLE DEPT_COPY
MODIFY DEPT_ID CHAR(2);

ALTER TABLE DEPT_COPY
MODIFY DEPT_ID VARCHAR2(20)
MODIFY DEPT_TITLE VARCHAR2(50);


SELECT UC.CONSTRAINT_NAME,  	        -- 제약조건 이름
            UC.CONSTRAINT_TYPE,     	-- 제약조건 타입
            UC.TABLE_NAME,              -- 테이블이름
            UCC.COLUMN_NAME, 	        -- 컬럼이름
            UC.SEARCH_CONDITION	        -- 제약조건 설명
FROM USER_CONSTRAINTS UC
JOIN USER_CONS_COLUMNS UCC ON (UC.CONSTRAINT_NAME = UCC.CONSTRAINT_NAME)
WHERE UC.TABLE_NAME = 'DEPT_COPY';	    -- 테이블명(반드시 대문자로 기입)


-- 3. 제약조건 추가
SELECT * FROM DEPT_COPY;
ALTER TABLE DEPT_COPY
ADD CONSTRAINT DEPT_COPY_PK PRIMARY KEY (DEPT_ID); -- ADD CONSTRAINT 제약조건이름 제약조건 설정

ALTER TABLE DEPT_COPY
ADD CONSTRAINT DEPT_COPY_UNQ UNIQUE(DEPT_TITLE);

ALTER TABLE DEPT_COPY
MODIFY ADD_COL2 CONSTRAINT DEPT_COPY_NN NOT NULL; -- NOT NULL은 MODIFY로 추가하고 문법순서가 다름

ALTER TABLE DEPT_COPY
MODIFY ADD_COL1 CONSTRAINT DEPT_COPY_NN1 NOT NULL;

-- 4. 컬럼삭제
ALTER TABLE DEPT_COPY
DROP COLUMN ADD_COL1;

SELECT * FROM DEPT_COPY;

-- 5. 제약조건 삭제
ALTER TABLE DEPT_COPY
DROP CONSTRAINT DEPT_COPY_UNQ;

ALTER TABLE DEPT_COPY
MODIFY ADD_COL2 NULL;       -- NOT NULL 제약조건 삭제하는 경우에도 MODIFY를 사용

--6. 컬럼이름 변경
ALTER TABLE DEPT_COPY
RENAME COLUMN ADD_COL2 TO ADD_COL;
SELECT * FROM DEPT_COPY;


-- 7. 제약조건 이름 변경
ALTER TABLE DEPT_COPY
RENAME CONSTRAINT SYS_C007117 TO DEPT_ID_NN;

-- 8. 테이블 이름 변경
ALTER TABLE DEPT_COPY
RENAME TO CHANGE_TABLE_NAME;
SELECT * FROM DEPT_COPY;
SELECT * FROM CHANGE_TABLE_NAME;

-- DROP : 객체 삭제
DROP TABLE CHANGE_TABLE_NAME;

--===================================================================

CREATE TABLE EMP_01(
    EMP_ID      NUMBER,
    EMP_NAME    VARCHAR2(30),
    DEPT_TITLE  VARCHAR2(20)
);
SELECT * FROM EMP_01;
INSERT INTO EMP_01 VALUES(100, '정민우1', NULL);
INSERT INTO EMP_01 VALUES(101, '정민우2', '교육부');
INSERT INTO EMP_01 (EMP_ID, EMP_NAME, DEPT_TITLE) VALUES(102, '정민우3', '기획부');
INSERT INTO EMP_01 (DEPT_TITLE, EMP_ID, EMP_NAME) VALUES('기획부', 103, '정민우4');
INSERT INTO EMP_01 VALUES(100, '정민우1', NULL);
INSERT INTO EMP_01 (EMP_NAME, EMP_ID) VALUES('이윤수5', 105);
INSERT INTO EMP_01 (EMP_NAME, EMP_ID) VALUES('정민우6', 107);


ALTER TABLE EMP_01
MODIFY DEPT_TITLE DEFAULT '비밀번호없음';

INSERT INTO EMP_01 (
    SELECT EMP_ID, EMP_NAME, DEPT_TITLE
    FROM EMPLOYEE
    LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
);


SELECT EMP_ID, EMP_NAME, DEPT_TITLE
FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);

