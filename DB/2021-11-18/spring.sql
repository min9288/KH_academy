CREATE TABLE DM(
    DM_NO NUMBER PRIMARY KEY,
    SENDER VARCHAR2(20) REFERENCES MEMBER(MEMBER_ID),
    RECEIVER VARCHAR2(20) REFERENCES MEMBER(MEMBER_ID),
    DM_CONTENT VARCHAR2(300) NOT NULL,
    DM_TIME DATE,
    READ_STATUS CHAR(1)
);

DROP TABLE DM;

CREATE SEQUENCE DM_SEQ;

INSERT INTO DM VALUES(DM_SEQ.NEXTVAL, 'user01', '�̴���1', '����3', sysdate, 'N');
INSERT INTO DM VALUES(DM_SEQ.NEXTVAL, '�̴���1', 'user01', '�δ���1', sysdate, 'Y');

COMMIT;

SELECT * FROM DM;