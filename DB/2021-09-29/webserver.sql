-- ȸ�� ���̺� ����

CREATE TABLE MEMBER(
    MEMBER_NO       NUMBER          PRIMARY KEY,        -- ȸ����ȣ
    MEMBER_ID       VARCHAR2(20)    UNIQUE NOT NULL,    -- ȸ�� ���̵�
    MEMBER_PW       VARCHAR2(30)    NOT NULL,           -- ��й�ȣ
    MEMBER_NAME     VARCHAR2(20)    NOT NULL,           -- �̸�
    PHONE           CHAR(13)        NOT NULL,           -- ��ȭ��ȣ
    ADDRESS         VARCHAR2(500)   NOT NULL,           -- �ּ�
    MEMBER_LEVEL    NUMBER          NOT NULL,           -- ȸ�� ���(3:��ȸ��, 2: ��ȸ��, 1: ������)
    ENROLL_DATE     CHAR(10)                            -- ������(YYYY-MM-DD)    
);
SELECT * FROM MEMBER;

CREATE SEQUENCE MEMBER_SEQ;

desc member;

insert into member values(member_seq.nextval, 'admin', '1234', '������', '010-9999-9999', 'ȸ��', 1, to_char(sysdate, 'yyyy-mm-dd'));
commit;

insert into member values(member_seq.nextval, 'test1', '1234', '�׽���', '010-9999-9999', 'ȸ��', 3, to_char(sysdate, 'yyyy-mm-dd'));
commit;