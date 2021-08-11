CREATE TABLE RUNNINGMAN(
    NO          NUMBER          PRIMARY KEY,
    ID          VARCHAR2(20)    UNIQUE,
    PASS        VARCHAR2(20)    NOT NULL,
    NAME        VARCHAR2(20)    NOT NULL,
    NICKNAME    VARCHAR2(20)    UNIQUE,
    GENDER      CHAR(1),
    TEL         VARCHAR2(20)    DEFAULT ('010-0000-0000'),
    ADDRESS     VARCHAR2(90)
);
SELECT * FROM RUNNINGMAN;

INSERT INTO RUNNINGMAN VALUES (1, 'muhan', 1234, '���缮', '��������', 'M', '010-4958-2333', '�б���');

INSERT INTO RUNNINGMAN (NO,ID,PASS,NAME,NICKNAME,GENDER,ADDRESS) VALUES 
                            (2, 'bignose', 4444, '������', '������', 'M', '����');
                            
INSERT INTO RUNNINGMAN VALUES (3, 'tiger', 6658, '������', '�Ȳ�', 'M', '010-6674-8986', '�Ⱦ�');

INSERT INTO RUNNINGMAN VALUES (4, 'haha', 5356, '����', '�źм�Ź', 'M', '010-8997-1122', '��������');

INSERT INTO RUNNINGMAN (NO,ID,PASS,NAME,NICKNAME,GENDER,ADDRESS) VALUES  
                            (5, 'ace', 5555, '����ȿ', 'õ����', 'F', '�����');
                            
INSERT INTO RUNNINGMAN VALUES (6, 'girrafe', 6658, '�̱���', '�߱�ģ��', 'M', '010-2378-9991', '������');

INSERT INTO RUNNINGMAN VALUES (7, 'ssapssap', 5356, '�缼��', '��������', 'M', '010-1215-7777', '����õ');

INSERT INTO RUNNINGMAN (NO,ID,PASS,NAME,NICKNAME,GENDER,ADDRESS) VALUES 
                            (8, 'doli', 5555, '���ҹ�', '���θ�', 'F', '�ϻ�');


UPDATE RUNNINGMAN SET PASS = 9999 WHERE NICKNAME = '�߱�ģ��';

UPDATE RUNNINGMAN SET TEL = '����' WHERE TEL = '010-0000-0000';

DELETE FROM RUNNINGMAN WHERE NAME = '���缮';

TRUNCATE TABLE RUNNINGMAN;

