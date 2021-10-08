select * from (select rownum as rnum, n.* from (select * from notice where notice_title like '%9%' order by notice_no desc)n) where rnum BETWEEN 1 and 10;

select * from 
(select rownum as rnum, n.* from (select * from notice where notice_writer like '%a%' order by notice_no desc)n) 
where rnum BETWEEN 1 and 10;

-- 댓글번호, 작성자, 시간, 내용, 글번호
CREATE TABLE NOTICE_COMMENT(
    NC_NO           NUMBER          PRIMARY KEY,        -- 댓글번호
    NC_LEVEL        NUMBER,                             -- 댓글인지, 대댓글인지 구분하는 컬럼(1 : 일반댓글, 2 : 댓글의 댓글)
    NC_WRITER       VARCHAR2(20)    REFERENCES MEMBER(MEMBER_ID) ON DELETE CASCADE,     -- 댓글 작성자
    NC_CONTENT      VARCHAR2(500)   NOT NULL,           -- 댓글 내용
    NC_DATE         CHAR(10),                           -- 작성 날짜
    NOTICE_REF      NUMBER          REFERENCES NOTICE(NOTICE_NO) ON DELETE CASCADE,     -- 어떤 공지사항의 댓글인지 기록
    NC_REF          NUMBER          REFERENCES NOTICE_COMMENT(NC_NO) ON DELETE CASCADE  -- 어떤 댓글의 댓글인지
);
CREATE SEQUENCE NC_SEQ;

SELECT * FROM NOTICE_COMMENT;

-- 1. 공지사항을 최신순 정렬 (공지사항 번호 내림차순 정렬)
select * from notice order by notice_no desc;
-- 2. 최신순으로 정렬된 공지사항에 순번을 붙여줌
select * from(select rownum as rnum, n.*from (select * from notice order by notice_no desc)n)where rnum BETWEEN 1 and 10;

select nn.*,(select count(*) from notice_comment where notice_ref=nn.notice_no) as "nc_count" from(select rownum as rnum, n.*from (select * from notice order by notice_no desc)n)nn where rnum BETWEEN 1 and 10;

select count(*) from notice_comment where notice_ref=105;