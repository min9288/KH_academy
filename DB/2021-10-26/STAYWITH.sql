SELECT * FROM MEMBER;
SELECT * FROM QUESTION;

SELECT * FROM ANSWER;
SELECT * FROM ROOM_RES;
SELECT * FROM ROOM;
SELECT * FROM DINING_RES;
SELECT * FROM DINING;
SELECT * FROM LF_RES;
SELECT * FROM LIFESTYLE;

SELECT * FROM ROOM_REVIEW;
SELECT * FROM DINING_REVIEW;
SELECT * FROM LIFE_REVIEW;

SELECT * FROM USER_SEQUENCES;  

SELECT * FROM QUESTION Q JOIN ANSWER A ON(Q.Q_NO = A.Q_NO);


select ivv.*,(select count(*) from answer where Q_NO=ivv.Q_NO) as "A_count" from(select rownum as rnum, iv.*from (select * from question order by q_no desc)iv)ivv where rnum BETWEEN 0 and 10;

select ivv.*,(select count(*) from answer where Q_NO=ivv.Q_NO) as "A_count" from(select rownum as rnum, iv.*from (select * from question order by q_no desc)iv)ivv where q_no=7;

INSERT INTO QUESTION 
VALUES(Q_SEQ.NEXTVAL, DEFAULT, '문의', 1, '테스트하는중', 0, 'FILE', to_char(sysdate,'yyyymmdd'), '테스트가 너무나 잘되기를 제발', '테스트', 'min9288@gmail.com', '010-1234-5487', '02-123-4567', 'AUTO'); 

INSERT INTO QUESTION 
VALUES(Q_SEQ.NEXTVAL, DEFAULT, '의견', 1, '이미지 테스트', 'null', 'img09.jpg', to_char(sysdate,'yyyymmdd'), '이미지 넣고 테스트', '테스트', 'min9288@gmail.com', '010-1234-5487', '02-123-4567', 'AUTO', 'img09.jpg'); 

UPDATE QUESTION
  SET Q_FILE = 'img09.jpg' WHERE Q_NO=14;
  
UPDATE ROOM_RES
  SET PAY_STATUS=1 WHERE RES_NUM='R21';

DELETE FROM ANSWER WHERE Q_NO = 38;

INSERT INTO ANSWER 
VALUES(A_SEQ.NEXTVAL, 38, '답변테스트했어요 길게길게길게길게', to_char(sysdate,'yy/mm/dd')); 

COMMIT;

select bkk.*,(select count(*) from answer where q_no=ivv.q_no) as "a_count" from(select rownum as rnum, bk.*from (select * from question order by q_no desc)bk)bkk where rnum BETWEEN ? and ? and member_id=?;

SELECT ROWNUM, TO_CHAR(CHECKIN, 'YYYY/MM/DD')TRANSDATE, B.* FROM (SELECT * FROM ROOM_RES ORDER BY RES_NUM DESC)B WHERE ROWNUM BETWEEN 0 AND 10 AND MEMBER_ID='testda';

SELECT TO_CHAR(CHECKIN, 'YYYY/MM/DD')TRANSINDATE, TO_CHAR(CHECKOUT, 'YYYY/MM/DD')TRANSOUTDATE, B.* FROM (SELECT * FROM ROOM_RES ORDER BY RES_NUM DESC)B WHERE MEMBER_ID='testda';

SELECT ROWNUM, TO_CHAR(RES_DATE, 'YYYY/MM/DD')TRANSDATE, D.* FROM (SELECT * FROM DINING_RES ORDER BY RES_NO DESC)D WHERE ROWNUM BETWEEN 0 AND 10 AND MEMBER_ID='testda';


INSERT INTO ROOM_RES 
VALUES('R'||RRES_SEQ.NEXTVAL, 11, 'testda', '업데이트테스트3', '스위트', '스위트', DEFAULT, DEFAULT, 120000, 1, 2, 2); 

INSERT INTO DINING_RES 
VALUES('D'||DINING_RES_SEQ.NEXTVAL, 42, 'testda', 2, 3, SYSDATE, '12:00', 1, 2, 2); 

INSERT INTO LF_RES 
VALUES('LF'||LF_RES_SEQ.NEXTVAL, 15, 'testda', 3, SYSDATE, '12:00', 2, 30000); 



ALTER TABLE ROOM_REVIEW MODIFY RES_NUM VARCHAR2(20);
ALTER TABLE DINING_REVIEW MODIFY RES_NO VARCHAR2(20);
ALTER TABLE LIFE_REVIEW MODIFY RES_NO VARCHAR2(20);

SELECT ROWNUM, DINING_NAME, TO_CHAR(RES_DATE, 'YYYY/MM/DD')TRANSDATE, D.* FROM (SELECT * FROM DINING_RES ORDER BY RES_NO DESC)D JOIN DINING B ON (D.DINING_NO = B.DINING_NO) WHERE ROWNUM BETWEEN 0 AND 10 AND MEMBER_ID='testda';

SELECT ROWNUM, LF_TITLE, TO_CHAR(RES_DATE, 'YYYY/MM/DD')TRANSDATE, LF.* FROM (SELECT * FROM LF_RES ORDER BY RES_NO DESC)LF JOIN LIFESTYLE LS ON (LF.LF_NO = LS.LF_NO) WHERE ROWNUM BETWEEN ? AND ? AND MEMBER_ID=?

ALTER TABLE DINING_REVIEW ADD DINING_NAME VARCHAR(40) NOT NULL;
ALTER TABLE ROOM_REVIEW ADD ROOM_NAME VARCHAR(40) NOT NULL;
ALTER TABLE LIFE_REVIEW ADD LIFE_NAME VARCHAR(40) NOT NULL;

ALTER TABLE DINING_REVIEW ADD RES_DATE CHAR(10) NOT NULL;
ALTER TABLE ROOM_REVIEW ADD CHECKIN_DATE CHAR(10) NOT NULL;
ALTER TABLE ROOM_REVIEW ADD CHECKOUT_DATE CHAR(10) NOT NULL;
ALTER TABLE LIFE_REVIEW ADD RES_DATE CHAR(10) NOT NULL;

DELETE FROM ROOM_REVIEW WHERE ROOM_NO=11;
DELETE FROM DINING_REVIEW WHERE DINING_NO=42;
DELETE FROM LIFE_REVIEW WHERE LF_NO=15;


select * from room_review where review_writer='testda';

COMMIT;

SELECT RE.RES_NUM FROM ROOM_RES RS LEFT OUTER JOIN ROOM_REVIEW RE ON(RS.RES_NUM = RE.RES_NUM) WHERE MEMBER_ID='testda';

SELECT ROWNUM, RE.RES_NUM CHECK_REVIEW, TO_CHAR(CHECKIN, 'YYYY/MM/DD')TRANSINDATE, TO_CHAR(CHECKOUT, 'YYYY/MM/DD')TRANSOUTDATE, B.* FROM (SELECT * FROM ROOM_RES ORDER BY RES_NUM DESC)B LEFT OUTER JOIN ROOM_REVIEW RE ON(B.RES_NUM = RE.RES_NUM) WHERE ROWNUM BETWEEN 0 AND 10 AND MEMBER_ID='testda';

SELECT  RE.RES_NUM CHECK_REVIEW, TO_CHAR(CHECKIN, 'YYYY/MM/DD')TRANSINDATE, TO_CHAR(CHECKOUT, 'YYYY/MM/DD')TRANSOUTDATE, B.* 
FROM (SELECT * FROM ROOM_RES ORDER BY RES_NUM DESC)B LEFT OUTER JOIN ROOM_REVIEW RE ON(B.RES_NUM = RE.RES_NUM) WHERE MEMBER_ID='testda';


SELECT ROWNUM, DR.RES_NO CHECK_REVIEW, B.DINING_NAME, TO_CHAR(DE.RES_DATE, 'YYYY/MM/DD')TRANSDATE, DE.* 
FROM (SELECT * FROM DINING_RES ORDER BY RES_NO DESC)DE 
JOIN DINING B ON (DE.DINING_NO = B.DINING_NO) 
LEFT OUTER JOIN DINING_REVIEW DR ON(DE.RES_NO = DR.RES_NO)
WHERE ROWNUM BETWEEN 0 AND 10 AND MEMBER_ID='testda';


SELECT ROWNUM, LR.RES_NO CHECK_REVIEW, LS.LF_TITLE LT, TO_CHAR(LF.RES_DATE, 'YYYY/MM/DD')TRANSDATE, LF.* FROM (SELECT * FROM LF_RES ORDER BY RES_NO DESC)LF JOIN LIFESTYLE LS ON (LF.LF_NO = LS.LF_NO) LEFT OUTER JOIN LIFE_REVIEW LR ON(LF.RES_NO = LR.RES_NO) WHERE ROWNUM BETWEEN 0 AND 10 AND MEMBER_ID='testda';


select nn.*,(select count(*) from notice_comment where notice_ref=nn.notice_no) as \"nc_count\" 
from(select rownum as rnum, n.*from (select * from notice order by notice_no desc)n)nn 
where rnum BETWEEN ? and ?";

/

SELECT DR.RES_NO CHECK_REVIEW, B.DINING_NAME DN, TO_CHAR(DE.RES_DATE, 'YYYY/MM/DD')TRANSDATE, DE.* 
FROM (SELECT ROWNUM AS RNUM, D.* FROM(SELECT * FROM DINING_RES ORDER BY RES_NO DESC)D)DE 
JOIN DINING B ON (DE.DINING_NO = B.DINING_NO) 
LEFT OUTER JOIN DINING_REVIEW DR ON(DE.RES_NO = DR.RES_NO)
WHERE RNUM BETWEEN 0 AND 10 AND MEMBER_ID='testda' ORDER BY LPAD(DE.RES_NO,4,'0');


select b.* from (select rownum rnum, a.* from (select * from room_review order by r_r_no desc )a)b where rnum between 0 and 10 and review_writer='testda';


UPDATE /*+ bypass_ujvc */
(SELECT RE.RES_NUM CHECK_REVIEW, TO_CHAR(CHECKIN, 'YYYY/MM/DD')TRANSINDATE, TO_CHAR(CHECKOUT, 'YYYY/MM/DD')TRANSOUTDATE, B.* 
FROM (SELECT ROWNUM AS RNUM, A.* FROM (SELECT * FROM ROOM_RES ORDER BY RES_NUM DESC)A)B 
LEFT OUTER JOIN ROOM_REVIEW RE ON(B.RES_NUM = RE.RES_NUM) 
WHERE RNUM BETWEEN 0 AND 10 AND MEMBER_ID='testda')
SET PAY_STATUS = 2 WHERE CHECKIN=SYSDATE AND PAY_STATUS = 1;


                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
