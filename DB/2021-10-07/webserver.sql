select * from (select rownum as rnum, n.* from (select * from notice where notice_title like '%9%' order by notice_no desc)n) where rnum BETWEEN 1 and 10;

select * from 
(select rownum as rnum, n.* from (select * from notice where notice_writer like '%a%' order by notice_no desc)n) 
where rnum BETWEEN 1 and 10;

-- ´ñ±Û¹øÈ£, ÀÛ¼ºÀÚ, ½Ã°£, ³»¿ë, ±Û¹øÈ£
CREATE TABLE NOTICE_COMMENT(
    NC_NO           NUMBER          PRIMARY KEY,        -- ´ñ±Û¹øÈ£
    NC_LEVEL        NUMBER,                             -- ´ñ±ÛÀÎÁö, ´ë´ñ±ÛÀÎÁö ±¸ºÐÇÏ´Â ÄÃ·³(1 : ÀÏ¹Ý´ñ±Û, 2 : ´ñ±ÛÀÇ ´ñ±Û)
    NC_WRITER       VARCHAR2(20)    REFERENCES MEMBER(MEMBER_ID) ON DELETE CASCADE,     -- ´ñ±Û ÀÛ¼ºÀÚ
    NC_CONTENT      VARCHAR2(500)   NOT NULL,           -- ´ñ±Û ³»¿ë
    NC_DATE         CHAR(10),                           -- ÀÛ¼º ³¯Â¥
    NOTICE_REF      NUMBER          REFERENCES NOTICE(NOTICE_NO) ON DELETE CASCADE,     -- ¾î¶² °øÁö»çÇ×ÀÇ ´ñ±ÛÀÎÁö ±â·Ï
    NC_REF          NUMBER          REFERENCES NOTICE_COMMENT(NC_NO) ON DELETE CASCADE  -- ¾î¶² ´ñ±ÛÀÇ ´ñ±ÛÀÎÁö
);
CREATE SEQUENCE NC_SEQ;