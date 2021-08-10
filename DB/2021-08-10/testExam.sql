CREATE TABLE EXPERT_TBL(
    MEMBER_CODE     NUMBER          PRIMARY KEY,                    -- ȸ������ �ڵ�
    MEMBER_ID       VARCHAR2(20)    UNIQUE,                         -- ȸ�� ���̵�
    MEMBER_PWD      VARCHAR2(20)    NOT NULL,                       -- ȸ�� ��й�ȣ
    MEMBER_NAME     VARCHAR2(10)    NOT NULL,                       -- ȸ�� �̸�
    MEMBER_ADDR     VARCHAR2(50)    NOT NULL,                       -- ȸ�� ������
    GENDER          CHAR(3)         CHECK(GENDER IN ('��', '��')),  -- ����
    PHONE           CHAR(13)
);
INSERT INTO EXPERT_TBL VALUES (01, 'USER01', '1234', '�̸�1', '����� ������', '��', '010-1234-5678');
INSERT INTO EXPERT_TBL VALUES (02, 'USER02', '1234', '�̸�2', '����� ������', '��', '010-1234-7895');
INSERT INTO EXPERT_TBL VALUES (03, 'USER03', '1234', '�̸�3', '����� �߱�', '��', '010-1234-5124');
INSERT INTO EXPERT_TBL VALUES (04, 'USER04', '1234', '�̸�4', '����� ��õ��', '��', '010-1234-4567');
SELECT * FROM EXPERT_TBL;

CREATE TABLE Company_TBL(   
    MEMBER_CODE     NUMBER          REFERENCES EXPERT_TBL ON DELETE CASCADE,      -- ȸ������ �ڵ�
    SKILL           VARCHAR2(50)                                                  -- ȸ�� �ɷ�
);

INSERT INTO Company_TBL VALUES (01, '������');
INSERT INTO Company_TBL VALUES (02, '��Ա�');
INSERT INTO Company_TBL VALUES (03, '�ڱ�');
INSERT INTO Company_TBL VALUES (04, '�ڵ�');
SELECT * FROM Company_TBL;
DELETE FROM COMPANY_TBL WHERE MEMBER_CODE = 01;