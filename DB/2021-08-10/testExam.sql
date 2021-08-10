CREATE TABLE EXPERT_TBL(
    MEMBER_CODE     NUMBER          PRIMARY KEY,                    -- 회원전용 코드
    MEMBER_ID       VARCHAR2(20)    UNIQUE,                         -- 회원 아이디
    MEMBER_PWD      VARCHAR2(20)    NOT NULL,                       -- 회원 비밀번호
    MEMBER_NAME     VARCHAR2(10)    NOT NULL,                       -- 회원 이름
    MEMBER_ADDR     VARCHAR2(50)    NOT NULL,                       -- 회원 거주지
    GENDER          CHAR(3)         CHECK(GENDER IN ('남', '여')),  -- 성별
    PHONE           CHAR(13)
);
INSERT INTO EXPERT_TBL VALUES (01, 'USER01', '1234', '이름1', '서울시 강서구', '남', '010-1234-5678');
INSERT INTO EXPERT_TBL VALUES (02, 'USER02', '1234', '이름2', '서울시 마포구', '남', '010-1234-7895');
INSERT INTO EXPERT_TBL VALUES (03, 'USER03', '1234', '이름3', '서울시 중구', '남', '010-1234-5124');
INSERT INTO EXPERT_TBL VALUES (04, 'USER04', '1234', '이름4', '서울시 양천구', '남', '010-1234-4567');
SELECT * FROM EXPERT_TBL;

CREATE TABLE Company_TBL(   
    MEMBER_CODE     NUMBER          REFERENCES EXPERT_TBL ON DELETE CASCADE,      -- 회원전용 코드
    SKILL           VARCHAR2(50)                                                  -- 회원 능력
);

INSERT INTO Company_TBL VALUES (01, '숨쉬기');
INSERT INTO Company_TBL VALUES (02, '밥먹기');
INSERT INTO Company_TBL VALUES (03, '자기');
INSERT INTO Company_TBL VALUES (04, '코딩');
SELECT * FROM Company_TBL;
DELETE FROM COMPANY_TBL WHERE MEMBER_CODE = 01;