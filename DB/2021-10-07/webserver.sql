select * from (select rownum as rnum, n.* from (select * from notice where notice_title like '%9%' order by notice_no desc)n) where rnum BETWEEN 1 and 10;

select * from 
(select rownum as rnum, n.* from (select * from notice where notice_writer like '%a%' order by notice_no desc)n) 
where rnum BETWEEN 1 and 10;

-- ��۹�ȣ, �ۼ���, �ð�, ����, �۹�ȣ
CREATE TABLE NOTICE_COMMENT(
    NC_NO           NUMBER          PRIMARY KEY,        -- ��۹�ȣ
    NC_LEVEL        NUMBER,                             -- �������, �������� �����ϴ� �÷�(1 : �Ϲݴ��, 2 : ����� ���)
    NC_WRITER       VARCHAR2(20)    REFERENCES MEMBER(MEMBER_ID) ON DELETE CASCADE,     -- ��� �ۼ���
    NC_CONTENT      VARCHAR2(500)   NOT NULL,           -- ��� ����
    NC_DATE         CHAR(10),                           -- �ۼ� ��¥
    NOTICE_REF      NUMBER          REFERENCES NOTICE(NOTICE_NO) ON DELETE CASCADE,     -- � ���������� ������� ���
    NC_REF          NUMBER          REFERENCES NOTICE_COMMENT(NC_NO) ON DELETE CASCADE  -- � ����� �������
);
CREATE SEQUENCE NC_SEQ;

SELECT * FROM NOTICE_COMMENT;

-- 1. ���������� �ֽż� ���� (�������� ��ȣ �������� ����)
select * from notice order by notice_no desc;
-- 2. �ֽż����� ���ĵ� �������׿� ������ �ٿ���
select * from(select rownum as rnum, n.*from (select * from notice order by notice_no desc)n)where rnum BETWEEN 1 and 10;

select nn.*,(select count(*) from notice_comment where notice_ref=nn.notice_no) as "nc_count" from(select rownum as rnum, n.*from (select * from notice order by notice_no desc)n)nn where rnum BETWEEN 1 and 10;

select count(*) from notice_comment where notice_ref=105;