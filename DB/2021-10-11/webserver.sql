CREATE TABLE PHOTO(
    PHOTO_NO        NUMBER          PRIMARY KEY,            --  사진게시판 관리번호
    PHOTO_WRITER    VARCHAR2(20)    REFERENCES MEMBER(MEMBER_ID) ON DELETE CASCADE, -- 작성자
    PHOTO_COMMENT   VARCHAR2(100)   NOT NULL,       -- 사진에 대한 설명
    PHOTO_DATE      CHAR(10),                       -- 작성일
    FILEPATH        VARCHAR2(100)                   -- 이미지 파일 업로드 경로
);
CREATE SEQUENCE PHOTO_SEQ;

select * from photo;

select * from (select rownum as rnum, p.* from (select * from photo order by 1 desc)p) where rnum between 1 and 5;