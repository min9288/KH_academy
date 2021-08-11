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

INSERT INTO RUNNINGMAN VALUES (1, 'muhan', 1234, '유재석', '못생긴형', 'M', '010-4958-2333', '압구정');

INSERT INTO RUNNINGMAN (NO,ID,PASS,NAME,NICKNAME,GENDER,ADDRESS) VALUES 
                            (2, 'bignose', 4444, '지석진', '지는해', 'M', '서울');
                            
INSERT INTO RUNNINGMAN VALUES (3, 'tiger', 6658, '김종국', '안꼬', 'M', '010-6674-8986', '안양');

INSERT INTO RUNNINGMAN VALUES (4, 'haha', 5356, '하하', '신분세탁', 'M', '010-8997-1122', '서래마을');

INSERT INTO RUNNINGMAN (NO,ID,PASS,NAME,NICKNAME,GENDER,ADDRESS) VALUES  
                            (5, 'ace', 5555, '송지효', '천성임', 'F', '서울시');
                            
INSERT INTO RUNNINGMAN VALUES (6, 'girrafe', 6658, '이광수', '중기친구', 'M', '010-2378-9991', '남양주');

INSERT INTO RUNNINGMAN VALUES (7, 'ssapssap', 5356, '양세찬', '김종국팬', 'M', '010-1215-7777', '동두천');

INSERT INTO RUNNINGMAN (NO,ID,PASS,NAME,NICKNAME,GENDER,ADDRESS) VALUES 
                            (8, 'doli', 5555, '전소민', '전두릅', 'F', '일산');


UPDATE RUNNINGMAN SET PASS = 9999 WHERE NICKNAME = '중기친구';

UPDATE RUNNINGMAN SET TEL = '없음' WHERE TEL = '010-0000-0000';

DELETE FROM RUNNINGMAN WHERE NAME = '유재석';

TRUNCATE TABLE RUNNINGMAN;

