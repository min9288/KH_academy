CREATE TABLE MEMBER(
    MEMBER_ID       VARCHAR2(20)    PRIMARY KEY,
    MEMBER_PW       VARCHAR2(20)    NOT NULL,
    MEMBER_NAME     VARCHAR2(20)    NOT NULL,
    MEMBER_ADDR     VARCHAR2(300),
    MEMBER_PHONE    CHAR(13),
    MEMBER_AGE      NUMBER,
    ENROLL_DATE     DATE
);
INSERT INTO MEMBER VALUES ('user01', '1234', '����01', '����� �������� ��굿', '010-0101-0101', 30, SYSDATE);
INSERT INTO MEMBER VALUES ('user02', '1357', '����02', '����� �������� ������', '010-0202-0202', 40, SYSDATE);
INSERT INTO MEMBER VALUES ('user03', '0009', '����03', '��⵵ ������ ����2��', '010-0101-0101', 30, SYSDATE);
INSERT INTO MEMBER VALUES ('test01', '1111', '�׽���01', '����� ������ ȭ���', '010-1111-1111', 20, SYSDATE);
INSERT INTO MEMBER VALUES ('test02', '2222', '�׽���02', '����� ���빮�� õ����', '010-2222-2222', 50, SYSDATE);
INSERT INTO MEMBER VALUES ('admin', '0000', '����01', '��⵵ ������ ����2��1111', '010-0101-0101', 40, SYSDATE);

SELECT * FROM MEMBER;
COMMIT;