-- �������� ���� Ȯ��
-- P : PRIMARY KEY
-- R : FOREIGN KEY
-- C : CHECK �Ǵ� NOT NULL
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
SELECT EMP_ID, EMP_NAME, EMAIL, PHONE FROM EMPLOYEE WHERE PHONE IS NOT NULL;        --  ��ȸ������ ���̺��� ����(�÷���, �ڷ���(����) ����, ���������� NOT NULL)

SELECT * FROM COPY_EMPLOYEE1;


CREATE TABLE DEPT_COPY
AS
SELECT * FROM DEPARTMENT;

SELECT * FROM DEPT_COPY;
-- 1. ���̺��� �÷� �߰�
ALTER TABLE DEPT_COPY
ADD (ADD_COL1 VARCHAR2(10));

ALTER TABLE DEPT_COPY
ADD (ADD_COL2 NUMBER DEFAULT 100);

-- 2. �÷� �ڷ��� ����
ALTER TABLE DEPT_COPY
MODIFY DEPT_ID VARCHAR2(20);

ALTER TABLE DEPT_COPY
MODIFY DEPT_ID CHAR(2);

ALTER TABLE DEPT_COPY
MODIFY DEPT_ID VARCHAR2(20)
MODIFY DEPT_TITLE VARCHAR2(50);


SELECT UC.CONSTRAINT_NAME,  	        -- �������� �̸�
            UC.CONSTRAINT_TYPE,     	-- �������� Ÿ��
            UC.TABLE_NAME,              -- ���̺��̸�
            UCC.COLUMN_NAME, 	        -- �÷��̸�
            UC.SEARCH_CONDITION	        -- �������� ����
FROM USER_CONSTRAINTS UC
JOIN USER_CONS_COLUMNS UCC ON (UC.CONSTRAINT_NAME = UCC.CONSTRAINT_NAME)
WHERE UC.TABLE_NAME = 'DEPT_COPY';	    -- ���̺���(�ݵ�� �빮�ڷ� ����)


-- 3. �������� �߰�
SELECT * FROM DEPT_COPY;
ALTER TABLE DEPT_COPY
ADD CONSTRAINT DEPT_COPY_PK PRIMARY KEY (DEPT_ID); -- ADD CONSTRAINT ���������̸� �������� ����

ALTER TABLE DEPT_COPY
ADD CONSTRAINT DEPT_COPY_UNQ UNIQUE(DEPT_TITLE);

ALTER TABLE DEPT_COPY
MODIFY ADD_COL2 CONSTRAINT DEPT_COPY_NN NOT NULL; -- NOT NULL�� MODIFY�� �߰��ϰ� ���������� �ٸ�

ALTER TABLE DEPT_COPY
MODIFY ADD_COL1 CONSTRAINT DEPT_COPY_NN1 NOT NULL;

-- 4. �÷�����
ALTER TABLE DEPT_COPY
DROP COLUMN ADD_COL1;

SELECT * FROM DEPT_COPY;

-- 5. �������� ����
ALTER TABLE DEPT_COPY
DROP CONSTRAINT DEPT_COPY_UNQ;

ALTER TABLE DEPT_COPY
MODIFY ADD_COL2 NULL;       -- NOT NULL �������� �����ϴ� ��쿡�� MODIFY�� ���

--6. �÷��̸� ����
ALTER TABLE DEPT_COPY
RENAME COLUMN ADD_COL2 TO ADD_COL;
SELECT * FROM DEPT_COPY;


-- 7. �������� �̸� ����
ALTER TABLE DEPT_COPY
RENAME CONSTRAINT SYS_C007117 TO DEPT_ID_NN;

-- 8. ���̺� �̸� ����
ALTER TABLE DEPT_COPY
RENAME TO CHANGE_TABLE_NAME;
SELECT * FROM DEPT_COPY;
SELECT * FROM CHANGE_TABLE_NAME;

-- DROP : ��ü ����
DROP TABLE CHANGE_TABLE_NAME;

--===================================================================

CREATE TABLE EMP_01(
    EMP_ID      NUMBER,
    EMP_NAME    VARCHAR2(30),
    DEPT_TITLE  VARCHAR2(20)
);
SELECT * FROM EMP_01;
INSERT INTO EMP_01 VALUES(100, '���ο�1', NULL);
INSERT INTO EMP_01 VALUES(101, '���ο�2', '������');
INSERT INTO EMP_01 (EMP_ID, EMP_NAME, DEPT_TITLE) VALUES(102, '���ο�3', '��ȹ��');
INSERT INTO EMP_01 (DEPT_TITLE, EMP_ID, EMP_NAME) VALUES('��ȹ��', 103, '���ο�4');
INSERT INTO EMP_01 VALUES(100, '���ο�1', NULL);
INSERT INTO EMP_01 (EMP_NAME, EMP_ID) VALUES('������5', 105);
INSERT INTO EMP_01 (EMP_NAME, EMP_ID) VALUES('���ο�6', 107);


ALTER TABLE EMP_01
MODIFY DEPT_TITLE DEFAULT '��й�ȣ����';

INSERT INTO EMP_01 (
    SELECT EMP_ID, EMP_NAME, DEPT_TITLE
    FROM EMPLOYEE
    LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
);


SELECT EMP_ID, EMP_NAME, DEPT_TITLE
FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);
