-- 회원 테이블 생성

CREATE TABLE MEMBER(
    MEMBER_NO       NUMBER          PRIMARY KEY,        -- 회원번호
    MEMBER_ID       VARCHAR2(20)    UNIQUE NOT NULL,    -- 회원 아이디
    MEMBER_PW       VARCHAR2(30)    NOT NULL,           -- 비밀번호
    MEMBER_NAME     VARCHAR2(20)    NOT NULL,           -- 이름
    PHONE           CHAR(13)        NOT NULL,           -- 전화번호
    ADDRESS         VARCHAR2(500)   NOT NULL,           -- 주소
    MEMBER_LEVEL    NUMBER          NOT NULL,           -- 회원 등급(3:준회원, 2: 정회원, 1: 관리자)
    ENROLL_DATE     CHAR(10)                            -- 가입일(YYYY-MM-DD)    
);
SELECT * FROM MEMBER;

CREATE SEQUENCE MEMBER_SEQ;

desc member;

insert into member values(member_seq.nextval, 'admin', '1234', '관리자', '010-9999-9999', '회사', 1, to_char(sysdate, 'yyyy-mm-dd'));
commit;

insert into member values(member_seq.nextval, 'test1', '1234', '테스터', '010-9999-9999', '회사', 3, to_char(sysdate, 'yyyy-mm-dd'));
commit;