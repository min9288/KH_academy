CREATE TABLE PHOTO(
    PHOTO_NO        NUMBER          PRIMARY KEY,            --  �����Խ��� ������ȣ
    PHOTO_WRITER    VARCHAR2(20)    REFERENCES MEMBER(MEMBER_ID) ON DELETE CASCADE, -- �ۼ���
    PHOTO_COMMENT   VARCHAR2(100)   NOT NULL,       -- ������ ���� ����
    PHOTO_DATE      CHAR(10),                       -- �ۼ���
    FILEPATH        VARCHAR2(100)                   -- �̹��� ���� ���ε� ���
);
CREATE SEQUENCE PHOTO_SEQ;

select * from photo;