-- ȸ������ ����� ���̺�
-- � ������ �������� -> �̸�, ���̵�, ����, ��й�ȣ, �̸���, �������, �ּ�, ��ȭ��ȣ

/*
������ ������ �÷��̸�, �ڷ���
CHAR        :   �������� ���ڿ� -> �����͸� �����ϰ� �������� �������� ä��
VARCHAR2    :   �������� ���ڿ� -> �����͸� �����ϰ� �������� ����
�̸�(����� ���Ұ�) USER_NAME(userName)   VARCHAR2 -> 15(�ѱ� 1���ڴ� 3 BYTE -> �ִ� 5����)
���̵�    USER_ID                              VARCHAR2 -> 20(���� + ���� 20���� �̳�)
����      USER_AGE                             NUMBER
��й�ȣ  USER_PASS                            VARCHAR2 -> 30(���� + ���� 30���� �̳�)
�̸���    USER_EMAIL                           VARCHAR2 -> 50(���� + ���� 50���� �̳�)
�������  USER_BIRTH                           CHAR, VARCHAR2, NUMBER, DATE
�ּ�      USER_ADDR                            VARCHAR2 -> 30
��ȭ��ȣ  USER_PHONE                           CHAR -> 13 000 - 0000 - 0000 ����
-- ���̺� �̸� : USER_INFO
-- ���̺� ���� ����
CREATE TABLE ���̺��̸� (
    �÷��� �ڷ���(ũ��), 
    �÷��� �ڷ���(ũ��),
    ...
*/

CREATE TABLE USER_INFO(
    USER_NAME   VARCHAR2(15),
    USER_ID     VARCHAR2(20),
    USER_AGE    NUMBER,
    USER_PASS   VARCHAR2(20),
    USER_EMAIL  VARCHAR2(50),
    USER_BIRTH  DATE,
    USER_ADDR   VARCHAR2(300),
    USER_PHONE  CHAR(13)
);
SELECT * FROM USER_INFO;

COMMENT ON COLUMN USER_INFO.USER_NAME IS 'ȸ�� �̸�';
COMMENT ON COLUMN USER_INFO.USER_ID IS 'ȸ�� ���̵�';
COMMENT ON COLUMN USER_INFO.USER_AGE IS '����';
COMMENT ON COLUMN USER_INFO.USER_PASS IS '��й�ȣ';
COMMENT ON COLUMN USER_INFO.USER_EMAIL IS '�̸���';
COMMENT ON COLUMN USER_INFO.USER_BIRTH IS '�������';
COMMENT ON COLUMN USER_INFO.USER_ADDR IS '�ּ�';
COMMENT ON COLUMN USER_INFO.USER_PHONE IS '��ȭ��ȣ';


INSERT INTO USER_INFO VALUES ('���ο�1', 'user01', 30, '123456', 'user01@naver.com', to_date(19920808, 'yyyymmdd'),
                                '����� ������ �ʷϸ�����', '010-8764-2440');
                                
INSERT INTO USER_INFO VALUES ('���ο�2', 'user02', 20, '123456', 'user01@naver.com', to_date(20020809, 'yyyymmdd'),
                                '����� ��õ�� ������', '010-8764-2440');                

DELETE FROM USER_INFO WHERE USER_NAME = '���ο�1';                               
                                
-- NOT NULL   -> �÷����������� ����
CREATE TABLE USER_NOTNULL(
    USER_ID VARCHAR(20) NOT NULL,
    USER_PW VARCHAR(30) NOT NULL,
    USER_NAME VARCHAR2(15),
    GENDER VARCHAR2(10)
);
INSERT INTO USER_NOTNULL VALUES('user01', '1234', '����1', '��');
SELECT * FROM USER_NOTNULL;
INSERT INTO USER_NOTNULL VALUES('', '1234', '����1', '��');

-- UNIQUE 
CREATE TABLE USER_UNIQUE1(
    USER_ID VARCHAR(20) UNIQUE,
    USER_PW VARCHAR(30) NOT NULL,
    USER_NAME VARCHAR2(15) UNIQUE,
    GENDER VARCHAR2(10)
);

INSERT INTO USER_UNIQUE1 VALUES('user01', '1234', '����1', '��');
INSERT INTO USER_UNIQUE1 VALUES('user01', '1234', '����2', '��');


-- UNIQUE + NOT NULL
CREATE TABLE USER_UNIQUE2(
    USER_ID VARCHAR(20) UNIQUE NOT NULL,
    USER_PW VARCHAR(30) NOT NULL,
    USER_NAME VARCHAR2(15) UNIQUE,
    GENDER VARCHAR2(10)
);
INSERT INTO USER_UNIQUE2 VALUES('', '1234', '����1', '��');


-- �������� ���� �ٸ� �������, UNIQUE -> ���̺���
CREATE TABLE USER_UNIQUE3(
    USER_ID VARCHAR(20),
    USER_PW VARCHAR(30) NOT NULL,
    USER_NAME VARCHAR2(15),
    GENDER VARCHAR2(10),
    UNIQUE (USER_NAME)
);
INSERT INTO USER_UNIQUE3 VALUES('user01', '1234', '����1', '��');
INSERT INTO USER_UNIQUE3 VALUES('user02', '1234', '����1', '��');


CREATE TABLE USER_UNIQUE4(
    USER_ID VARCHAR(20),
    USER_PW VARCHAR(30) NOT NULL,
    USER_NAME VARCHAR2(15),
    GENDER VARCHAR2(10),
    UNIQUE (USER_ID, USER_NAME) -- USER_ID, USER_NAME 2�� ������ ��� ����Ǹ� �������� �ߵ�
);
INSERT INTO USER_UNIQUE4 VALUES('user01', '1234', '����1', '��');
INSERT INTO USER_UNIQUE4 VALUES('user02', '1234', '����1', '��');
INSERT INTO USER_UNIQUE4 VALUES('user01', '1234', '����2', '��');
INSERT INTO USER_UNIQUE4 VALUES('user02', '1234', '����2', '��'); -- 2�� ������ ���ÿ� ����Ǿ� ���ǹߵ�



-- PRIMARY KEY : UNIQUE + NOT NULL ���ÿ� ���� -> �� ���̺�� 1���� ���� ����
CREATE TABLE USER_PRIMARYKEY1(
    USER_ID VARCHAR(20)     PRIMARY KEY,    -- PRIMARY KEY �÷�����
    USER_PW VARCHAR(30)     NOT NULL,
    USER_NAME VARCHAR2(15)  UNIQUE,
    GENDER VARCHAR2(10)
);
INSERT INTO USER_PRIMARYKEY1 VALUES('user01', '1234', '����1', '��');
INSERT INTO USER_PRIMARYKEY1 VALUES('user01', '1234', '����2', '��');


CREATE TABLE USER_PRIMARYKEY2(
    USER_ID VARCHAR(20),
    USER_PW VARCHAR(30)     NOT NULL,
    USER_NAME VARCHAR2(15)  UNIQUE,
    GENDER VARCHAR2(10),
    PRIMARY KEY(USER_ID)        -- PRIMARY KEY ���̺���
);
INSERT INTO USER_PRIMARYKEY2 VALUES('user01', '1234', '����1', '��');
INSERT INTO USER_PRIMARYKEY2 VALUES('user01', '1234', '����2', '��');


CREATE TABLE USER_PRIMARYKEY3(
    USER_ID VARCHAR(20),
    USER_PW VARCHAR(30)     NOT NULL,
    USER_NAME VARCHAR2(15)  UNIQUE,
    GENDER VARCHAR2(10),
    PRIMARY KEY(USER_ID, USER_PW)        -- PRIMARY KEY ���̺���   -> �� �÷��� ���ļ� PRIMARY KEY�� ��� -> ����Ű
);
INSERT INTO USER_PRIMARYKEY3 VALUES('user01', '1234', '����1', '��');
INSERT INTO USER_PRIMARYKEY3 VALUES('user01', '12345', '����2', '��');
INSERT INTO USER_PRIMARYKEY3 VALUES('user01', '12345', '����2', '��');
SELECT * FROM USER_PRIMARYKEY3;



--  CHECK

CREATE TABLE USER_CHECK(
    USER_ID VARCHAR(20)     PRIMARY KEY,
    USER_PW VARCHAR(30)     NOT NULL,
    USER_NAME VARCHAR2(15)  UNIQUE,
    GENDER CHAR(1)          CHECK(GENDER IN ('M', 'F'))       -- GEMDER �÷��� �� �� �ִ� ���� M, F �ΰ��� ����
--    GENDER CHAR(1)          CHECK(GENDER IN ('M', 'F')) NOT NULL   -- NULL ���� �������ǿ� ���Խ�ų��
);
INSERT INTO USER_CHECK VALUES('user01', '1234', '����1', 'M');


--  DEFAULT : �⺻��
CREATE TABLE TEST_TBL(
    BOARD_TITLE VARCHAR2(300),
    READ_COUNT NUMBER DEFAULT 0
);
INSERT INTO TEST_TBL VALUES ('����2', 0);
INSERT INTO TEST_TBL (BOARD_TITLE) VALUES ('����3');      --  ���� �Է����� �ʾƵ� �ڵ����� DEFAULT���� ���Ե�. INSERT ������ ���� �ٸ�
SELECT * FROM TEST_TBL;





--  ȸ�����̺� ���� -> �Խ��� �ۼ�
CREATE TABLE USER_TBL1(
    USER_ID     VARCHAR(20)     PRIMARY KEY,
    USER_PW     VARCHAR(30)     NOT NULL,
    USER_NAME   VARCHAR2(15)    NOT NULL,
    NICKNAME    VARCHAR2(30)    UNIQUE
);
INSERT INTO USER_TBL1 VALUES ('user01', 'PASS01', '����1', '�׽�Ʈ1');
INSERT INTO USER_TBL1 VALUES ('user02', 'PASS02', '����2', '�׽�Ʈ2');
INSERT INTO USER_TBL1 VALUES ('user03', 'PASS03', '����3', '�׽�Ʈ3');
SELECT * FROM USER_TBL1;

--  �Խ��� ���̺� ����  ->  ȸ���� �ۼ��� ������ �Խ���
CREATE TABLE BOARD1(
    BOARD_NO        NUMBER          PRIMARY KEY,
    BOARD_TITLE     VARCHAR2(30)    NOT NULL,
    BOARD_CONTENT   VARCHAR2(100)   NOT NULL,
    BOARD_WRITER    VARCHAR2(20)    REFERENCES USER_TBL1(USER_ID),  --  USER_TBL1 ���̺��� USER_ID �÷��� �����ϴ� �÷�
    REG_DATE        DATE
);
INSERT INTO BOARD1 VALUES('1', '����1', '���볻��1', 'user01', SYSDATE);
INSERT INTO BOARD1 VALUES('2', '����2', '���볻��2', 'user02', SYSDATE);
INSERT INTO BOARD1 VALUES('3', '����3', '���볻��3', 'user03', SYSDATE);
INSERT INTO BOARD1 VALUES('4', '����4', '���볻��4', 'user02', SYSDATE);
INSERT INTO BOARD1 VALUES('5', '����5', '���볻��4', 'user00', SYSDATE);
SELECT * FROM BOARD1;


CREATE TABLE BOARD2(
    BOARD_NO        NUMBER          PRIMARY KEY,
    BOARD_TITLE     VARCHAR2(30)    NOT NULL,
    BOARD_CONTENT   VARCHAR2(100)   NOT NULL,
    BOARD_WRITER    VARCHAR2(20),    
    REG_DATE        DATE,
    FOREIGN KEY (BOARD_WRITER) REFERENCES USER_TBL1(USER_ID)    -- ���̺���
);
INSERT INTO BOARD2 VALUES('1', '����1', '���볻��1', 'user05', SYSDATE);


CREATE TABLE BOARD3(
    BOARD_NO        NUMBER          PRIMARY KEY,
    BOARD_TITLE     VARCHAR2(30)    NOT NULL,
    BOARD_CONTENT   VARCHAR2(100)   NOT NULL,
    BOARD_WRITER    VARCHAR2(20)    REFERENCES USER_TBL1(NICKNAME), --  USER_TBL1 ���̺��� NICKNAME �÷��� �����ϴ� �÷�
    REG_DATE        DATE
);
INSERT INTO BOARD3 VALUES('1', '����1', '���볻��1', '�׽�Ʈ1', SYSDATE);
SELECT * FROM BOARD3;


CREATE TABLE BOARD4(
    BOARD_NO        NUMBER          PRIMARY KEY,
    BOARD_TITLE     VARCHAR2(30)    NOT NULL,
    BOARD_CONTENT   VARCHAR2(100)   NOT NULL,
    BOARD_WRITER    VARCHAR2(20)    REFERENCES USER_TBL1,    -- �÷��� �����ϸ� �θ����̺��� PRIMARY KEY �÷��� �ڵ����� �ܷ�Ű �÷����� ����
    REG_DATE        DATE
);
INSERT INTO BOARD4 VALUES('1', '����1', '���볻��1', 'user01', SYSDATE);
SELECT * FROM BOARD4;

SELECT * FROM USER_CHECK;
DELETE FROM USER_CHECK WHERE USER_ID = 'user01';

DELETE FROM USER_TBL1 WHERE USER_ID = 'user01';     -- ���� �ɼ��� ���������� �ʴ´ٸ�, �ܷ�Ű�� ��� ���� �����ʹ� ������ �� ����.



CREATE TABLE USER_TBL2(
    USER_ID     VARCHAR(20)     PRIMARY KEY,
    USER_PW     VARCHAR(30)     NOT NULL,
    USER_NAME   VARCHAR2(15)    NOT NULL,
    NICKNAME    VARCHAR2(30)    UNIQUE
);

CREATE TABLE BOARD11(
    BOARD_NO        NUMBER          PRIMARY KEY,
    BOARD_TITLE     VARCHAR2(30)    NOT NULL,
    BOARD_CONTENT   VARCHAR2(100)   NOT NULL,
    BOARD_WRITER    VARCHAR2(20)    REFERENCES USER_TBL2(USER_ID) ON DELETE SET NULL,       --  �θ� ������ ������ �ش� �θ����͸� �����ϴ� �ڽĵ����� ���� NULL �ο�
    REG_DATE        DATE
);
INSERT INTO USER_TBL2 VALUES('user01', '1234', '����01', '�׽�Ʈ1');
INSERT INTO USER_TBL2 VALUES('user02', '12345', '����02', '�׽�Ʈ2');
INSERT INTO USER_TBL2 VALUES('user03', '1235', '����03', '�׽�Ʈ3');
DELETE FROM USER_TBL2 WHERE USER_ID = 'user02';
SELECT * FROM USER_TBL2;
SELECT * FROM BOARD11;
INSERT INTO BOARD11 VALUES('1', '����1', '����1', 'user01', SYSDATE);
INSERT INTO BOARD11 VALUES('2', '����2', '����2', 'user02', SYSDATE);
INSERT INTO BOARD11 VALUES('3', '����3', '����3', 'user01', SYSDATE);
INSERT INTO BOARD11 VALUES('4', '����4', '����4', 'user02', SYSDATE);
INSERT INTO BOARD11 VALUES('5', '����5', '����5', 'user01', SYSDATE);


CREATE TABLE USER_TBL3(
    USER_ID     VARCHAR(20)     PRIMARY KEY,
    USER_PW     VARCHAR(30)     NOT NULL,
    USER_NAME   VARCHAR2(15)    NOT NULL,
    NICKNAME    VARCHAR2(30)    UNIQUE
);
SELECT * FROM USER_TBL3;
INSERT INTO USER_TBL3 VALUES('user01', '1234', '����01', '�׽�Ʈ1');
INSERT INTO USER_TBL3 VALUES('user02', '12345', '����02', '�׽�Ʈ2');
INSERT INTO USER_TBL3 VALUES('user03', '1235', '����03', '�׽�Ʈ3');
DELETE FROM USER_TBL3 WHERE USER_ID = 'user02';

CREATE TABLE BOARD12(
    BOARD_NO        NUMBER          PRIMARY KEY,
    BOARD_TITLE     VARCHAR2(30)    NOT NULL,
    BOARD_CONTENT   VARCHAR2(100)   NOT NULL,
    BOARD_WRITER    VARCHAR2(20)    REFERENCES USER_TBL3(USER_ID) ON DELETE CASCADE,        --  �θ� ������ ������ �ش� �θ����͸� �����ϴ� �ڽĵ����� ���� ���� ����
    REG_DATE        DATE
);
SELECT * FROM BOARD12;
INSERT INTO BOARD12 VALUES('1', '����1', '����1', 'user01', SYSDATE);
INSERT INTO BOARD12 VALUES('2', '����2', '����2', 'user02', SYSDATE);
INSERT INTO BOARD12 VALUES('3', '����3', '����3', 'user01', SYSDATE);
INSERT INTO BOARD12 VALUES('4', '����4', '����4', 'user02', SYSDATE);
INSERT INTO BOARD12 VALUES('5', '����5', '����5', 'user01', SYSDATE);

---------------------------------------------------------------------------------------------------------
--  ���θ� (ȸ��, ��ǰ, ����)

CREATE TABLE SHOP_MEMBER(
    USER_NO NUMBER          PRIMARY KEY,
    MEMBER_ID VARCHAR2(20)    UNIQUE,
    USER_PW VARCHAR2(30)    NOT NULL,
    USER_NAME VARCHAR2(30),
    GENDER CHAR(6),
    PHONE CHAR(11)
);
INSERT INTO SHOP_MEMBER VALUES (1, 'user01', 'pass01', '����1', '����', '01012345678');
INSERT INTO SHOP_MEMBER VALUES (2, 'user02', 'pass02', '����2', '����', '01012345678');
INSERT INTO SHOP_MEMBER VALUES (3, 'user03', 'pass03', '����3', '����', '01012345678');
SELECT * FROM SHOP_MEMBER;

--  ��ǰ���̺�
CREATE TABLE PRODUCT(
    PRODUCT_NO      NUMBER          PRIMARY KEY,
    PRODUCT_NAME    VARCHAR2(100)   NOT NULL,
    PRODUCT_DETAIL  VARCHAR2(100)   NOT NULL,
    PRICE           NUMBER
);

INSERT INTO PRODUCT VALUES (1, 'Ź��밡����', '���� �ȳ־ �����̵�', '100000');
INSERT INTO PRODUCT VALUES (2, '�޴�뼱ǳ��', '������ ���ص� ��', '10000');
SELECT * FROM PRODUCT;

--  �������̺�(���Ź�ȣ, ���ų�¥, ����, �Ѱ���, ��ǰ����, ������ �������)
CREATE TABLE SHOP_BUY(
   BUY_NO       NUMBER          PRIMARY KEY,
   USER_ID      VARCHAR2(20)    REFERENCES SHOP_MEMBER(MEMBER_ID),
   PRODUCT_NO   NUMBER          REFERENCES PRODUCT(PRODUCT_NO),
   AMOUNT       NUMBER,
   BUY_DATE     DATE
);

-- user22 ȸ���� ��ǳ�⸦ 3�� ����
INSERT INTO SHOP_BUY VALUES(1, 'user02', 2, 3, SYSDATE);
SELECT * FROM SHOP_BUY;
SELECT USER_NAME, PRODUCT_NAME, PRICE, PRICE * AMOUNT ����, BUY_DATE
FROM SHOP_BUY
JOIN SHOP_MEMBER ON (USER_ID = MEMBER_ID)
JOIN PRODUCT USING (PRODUCT_NO);