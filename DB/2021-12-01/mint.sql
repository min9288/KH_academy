SELECT * FROM MEMBER;
SELECT * FROM likes;


SELECT * FROM develop_language;

ALTER TABLE PROJECT DROP COLUMN "language_no";

CREATE TABLE USE_DEVELOP_LANGUAGE(
    USE_LANG_NO     NUMBER  PRIMARY KEY,
    MEMBER_NO   NUMBER      REFERENCES MEMBER(MEMBER_NO) ON DELETE CASCADE,
    LANGUAGE_NO     NUMBER  REFERENCES develop_language("language_no")ON DELETE CASCADE,
    USECASE NUMBER  NOT NULL
);

CREATE TABLE USE_PROJECT_LANGUAGE(
    USE_PROJECT_LANG_NO     NUMBER  PRIMARY KEY,
    PROJECT_NO   NUMBER      REFERENCES PROJECT("project_no") ON DELETE CASCADE,
    LANGUAGE_NO     NUMBER  REFERENCES develop_language("language_no")ON DELETE CASCADE
);
CREATE SEQUENCE UP_LANG_SEQ;

CREATE TABLE project_dibs(
    project_dib_no    NUMBER  PRIMARY KEY,
    project_no   NUMBER     REFERENCES project("project_no") ON DELETE CASCADE,
    member_no     NUMBER  REFERENCES member(member_no)ON DELETE CASCADE
);
CREATE SEQUENCE pDib_seq;


drop table USE_DEVELOP_LANGUAGE;

CREATE SEQUENCE ULANG_SEQ;

SELECT * FROM MEMBER;

INSERT INTO MEMBER VALUES(MEMBER_SEQ.nextval,'정민우', '010-1234-5678', 'testda', 1234, 'wjdalsdnchlr@naver.com', 1, sysdate, '/resources/img/recruitTeamProject/common/testda_profile.jpg', 3, '');


INSERT INTO develop_language VALUES(LAN_SEQ.nextval,'c++', '/resources/img/recruitTeamProject/common/language/c++.png');
INSERT INTO develop_language VALUES(LAN_SEQ.nextval,'django', '/resources/img/recruitTeamProject/common/language/django.png');
INSERT INTO develop_language VALUES(LAN_SEQ.nextval,'flutter', '/resources/img/recruitTeamProject/common/language/flutter.png');
INSERT INTO develop_language VALUES(LAN_SEQ.nextval,'go', '/resources/img/recruitTeamProject/common/language/go.png');
INSERT INTO develop_language VALUES(LAN_SEQ.nextval,'java', '/resources/img/recruitTeamProject/common/language/java.png');
INSERT INTO develop_language VALUES(LAN_SEQ.nextval,'javascript', '/resources/img/recruitTeamProject/common/language/javascript.png');
INSERT INTO develop_language VALUES(LAN_SEQ.nextval,'kotlin', '/resources/img/recruitTeamProject/common/language/kotlin.png');
INSERT INTO develop_language VALUES(LAN_SEQ.nextval,'node.js', '/resources/img/recruitTeamProject/common/language/node.js.png');
INSERT INTO develop_language VALUES(LAN_SEQ.nextval,'python', '/resources/img/recruitTeamProject/common/language/python.png');
INSERT INTO develop_language VALUES(LAN_SEQ.nextval,'react', '/resources/img/recruitTeamProject/common/language/react.png');
INSERT INTO develop_language VALUES(LAN_SEQ.nextval,'spring', '/resources/img/recruitTeamProject/common/language/spring.png');
INSERT INTO develop_language VALUES(LAN_SEQ.nextval,'swift', '/resources/img/recruitTeamProject/common/language/swift.png');
INSERT INTO develop_language VALUES(LAN_SEQ.nextval,'typescript', '/resources/img/recruitTeamProject/common/language/typescript.png');
INSERT INTO develop_language VALUES(LAN_SEQ.nextval,'vue', '/resources/img/recruitTeamProject/common/language/vue.png');


INSERT INTO PROJECT VALUES(PROJECT_SEQ.nextval, 6, '2021-11-11', '2021-12-10', DEFAULT, '테스트 중입니당', NULL,NULL,NULL,NULL,DEFAULT,NULL,NULL);
INSERT INTO PROJECT VALUES(PROJECT_SEQ.nextval, 6, '2021-11-12', '2021-12-13', DEFAULT, '테스트 중입니당', NULL,NULL,NULL,NULL,DEFAULT,NULL,NULL);
INSERT INTO PROJECT VALUES(PROJECT_SEQ.nextval, 6, '2021-11-13', '2021-12-15', DEFAULT, '테스트 중입니당', NULL,NULL,NULL,NULL,DEFAULT,NULL,NULL);
INSERT INTO PROJECT VALUES(PROJECT_SEQ.nextval, 6, '2021-11-14', '2021-12-17', DEFAULT, '테스트 중입니당', NULL,NULL,NULL,NULL,DEFAULT,NULL,NULL);
INSERT INTO PROJECT VALUES(PROJECT_SEQ.nextval, 6, '2021-11-15', '2021-12-18', DEFAULT, '테스트 중입니당', NULL,NULL,NULL,NULL,DEFAULT,NULL,NULL);
INSERT INTO PROJECT VALUES(PROJECT_SEQ.nextval, 6, '2021-11-17', '2021-12-19', DEFAULT, '테스트 중입니당', NULL,NULL,NULL,NULL,DEFAULT,NULL,NULL);
INSERT INTO PROJECT VALUES(PROJECT_SEQ.nextval, 6, '2021-11-19', '2021-12-23', DEFAULT, '테스트 중입니당', NULL,NULL,NULL,NULL,DEFAULT,NULL,NULL);
INSERT INTO PROJECT VALUES(PROJECT_SEQ.nextval, 6, '2021-12-01', '2021-12-24', DEFAULT, '테스트 중입니당', NULL,NULL,NULL,NULL,DEFAULT,NULL,NULL);
INSERT INTO PROJECT VALUES(PROJECT_SEQ.nextval, 6, '2021-12-02', '2021-12-25', DEFAULT, '테스트 중입니당', NULL,NULL,NULL,NULL,DEFAULT,NULL,NULL);

select 
			"project_no" as projectNo,
			"member_no" as projectWriterMemberNo,
			"recruit_start_date" as rStartDate,
			"recruit_end_date" as rEndDate,
			"view_count" as viewCount,
			"recruit_title" as rTitle,
			"recruit_content" as rContent,
			"project_name" as projectName,
			"project_goal" as projectGoal,
			"project_reader" as projectReader,
			"project_status" as projectStatus,
			"project_start_date" as pStartDate,
			"project_end_date" as pEndDate,
			(select filepath from member m where m.member_no = p."member_no") as writerImgPath
from project p;

select 
			"project_no" as projectNo,
			"member_no" as projectWriterMemberNo,
			"recruit_start_date" as rStartDate,
			"recruit_end_date" as rEndDate,
			"view_count" as viewCount,
			"recruit_title" as rTitle,
			"recruit_content" as rContent,
			"project_name" as projectName,
			"project_goal" as projectGoal,
			"project_reader" as projectReader,
			"project_status" as projectStatus,
			"project_start_date" as pStartDate,
			"project_end_date" as pEndDate,
			(select filepath from member m where m.member_no = p."member_no") as writerImgPath,
			(select count(*) from project_dibs) as dibCount,
            (select count(*) from comments) as commentCount
from project p;

SELECT * FROM PROJECT;
SELECT * FROM COMMENTS;
SELECT * FROM use_project_language;
SELECT * FROM COMMENTS;
DELETE from project where project_no=2;
SELECT * FROM develop_language;


ALTER TABLE PROJECT MODIFY RECRUIT_START_DATE CHAR(10);
ALTER TABLE PROJECT MODIFY RECRUIT_END_DATE CHAR(10);

INSERT INTO use_project_language VALUES(UP_LANG_SEQ.nextval, 5, 16);
INSERT INTO use_project_language VALUES(UP_LANG_SEQ.nextval, 5, 23);
INSERT INTO use_project_language VALUES(UP_LANG_SEQ.nextval, 5, 22);

ALTER TABLE project_entry MODIFY apply_content VARCHAR2(3999);


COMMIT;

select * from
            (select
            rownum as rnum,
			p.project_no as projectNo,
			p.member_no as projectWriterMemberNo,
			p.recruit_start_date as rStartDate,
			p.recruit_end_date as rEndDate,
			p.view_count as viewCount,
			p.recruit_title as rTitle,
			p.recruit_content as rContent,
			p.project_name as projectName,
			p.project_goal as projectGoal,
			p.project_reader as projectReader,
			p.project_status as projectStatus,
			p.project_start_date as pStartDate,
			p.project_end_date as pEndDate,
			(select filepath from member m where m.member_no = p.member_no) as writerImgPath,
			(select count(*) from project_dibs) as dibCount,
            (select count(*) from comments) as commentCount
		from project p 
        order by project_No DESC) 
		where rnum between 1 and 10;

select * from (select 
			rownum as rnum,
			project_no as projectNo,
			member_no as projectWriterMemberNo,
			recruit_start_date as rStartDate,
			recruit_end_date as rEndDate,
			view_count as viewCount,
			recruit_title as rTitle,
			recruit_content as rContent,
			project_name as projectName,
			project_goal as projectGoal,
			project_reader as projectReader,
			project_status as projectStatus,
			project_start_date as pStartDate,
			project_end_date as pEndDate,
			(select filepath from member m where m.member_no = p.member_no) as writerImgPath,
			(select count(*) from project_dibs) as dibCount,
            (select count(*) from comments) as commentCount
		from project p)
		where rnum between 1 and 10;
        
        
        
        select 
			rownum as rnum,
			project_no as projectNo,
			member_no as projectWriterMemberNo,
			recruit_start_date as rStartDate,
			recruit_end_date as rEndDate,
			view_count as viewCount,
			recruit_title as rTitle,
			recruit_content as rContent,
			project_name as projectName,
			project_goal as projectGoal,
			project_reader as projectReader,
			project_status as projectStatus,
			project_start_date as pStartDate,
			project_end_date as pEndDate,
			(select filepath from member m where m.member_no = p.member_no) as writerImgPath,
			(select count(*) from project_dibs) as dibCount,
            (select count(*) from comments) as commentCount
		from project p;
        
        
       select count(*) as cnt from project;
       
        
select * from use_project_language;

select * from
		            (select
			            rownum as rnum,
						p.project_no as projectNo,
						p.member_no as projectWriterMemberNo,
						p.recruit_start_date as rStartDate,
						p.recruit_end_date as rEndDate,
						p.view_count as viewCount,
						p.recruit_title as rTitle,
						p.recruit_content as rContent,
						p.project_name as projectName,
						p.project_goal as projectGoal,
						p.project_reader as projectReader,
						p.project_status as projectStatus,
						p.project_start_date as pStartDate,
						p.project_end_date as pEndDate,
						(select filepath from member m where m.member_no = p.member_no) as writerImgPath,
						(select count(*) from project_dibs) as dibCount,
			            (select count(*) from comments) as commentCount
					from project p 
	       			order by viewCount DESC, dibCount DESC, commentCount DESC) 
				where rnum between 1 and 2;
       
select * from project_entry;
select * from comments;
select * from member where member_id in ('testda','testda2','testda3');
select * from project;
select * from project_review;
select * from project_team_member;
select * from use_project_language;
select * from member;
select * from task;

update project set project_reader = 'testda'; where project_no = 122; 
ROLLBACK;

select 
  			ptm.team_member_no as teamMemberNo,
  			ptm.project_no as projectNo,
  			ptm.member_no as memberNo,
  			ptm.member_role as memberRole,
  			(select member_id from member m where m.member_no = ptm.member_no) as memberId,
  			(select filepath from member m where m.member_no = ptm.member_no) as memberImg,
  			(select member_grade from member m where m.member_no = ptm.member_no ) as memberGrade
  		from project_team_member ptm
  		where project_no =121;


update project_entry set entry_status = 3 where entry_status = 4;
update project set project_status = 1 where project_status = 2;

drop table project_review;

CREATE TABLE project_review(
    review_no    NUMBER  PRIMARY KEY,
    team_member_no number REFERENCES project_team_member(team_member_no) ON DELETE CASCADE,
    project_no   NUMBER   REFERENCES project(project_no) ON DELETE CASCADE,
    review_point number not null,
    review_content varchar2(1000),
    review_writer number REFERENCES member(member_no) ON DELETE CASCADE,
    enroll_date char(10) not null
);


select count(*) from project_review 
where project_no in((select project_no from project where project_status = 3)) and review_writer = 'null';

select * from project_dibs;
delete from project_dibs;
drop table project_dibs;

CREATE TABLE project_dibs(
    project_dib_no    NUMBER  PRIMARY KEY,
    project_no   NUMBER     REFERENCES project(project_no) ON DELETE CASCADE,
    member_no     NUMBER  REFERENCES member(member_no)ON DELETE CASCADE
);

CREATE SEQUENCE pDib_seq;

select * from project_dibs;

select count(*) from project_entry where project_no=122;
select count(*) from project_entry where project_no=122 and entry_status in (3,4);


select 
			p.project_no as projectNo,
			p.member_no as projectWriterMemberNo,
			p.recruit_start_date as rStartDate,
			p.recruit_end_date as rEndDate,
			p.view_count as viewCount,
			p.recruit_title as rTitle,
			p.recruit_content as rContent,
			p.project_name as projectName,
			p.project_goal as projectGoal,
			p.project_reader as projectReader,
			p.project_status as projectStatus,
			p.project_start_date as pStartDate,
			p.project_end_date as pEndDate,
			(select filepath from member m where m.member_no = p.member_no) as writerImgPath,
			(select count(*) from project_dibs pd where pd.project_no = 122) as dibCount,
            (select count(*) from comments where BOARD_TYPE = 3 and BOARD_NO = 122) as commentCount,
            (select member_id from member m where m.member_no = p.member_no) as projectWriterId,
            (select member_grade from member m where m.member_no = p.member_no) as projectWriterGrade,
            (select count(*) from project_dibs pd where pd.project_no = 122 and pd.member_no = 6) as dibCountClickValue,
            (select count(*) from project_entry where project_no=122) as applyValue,
            (select count(*) from project_entry where project_no=122 and entry_status in (3,4)) as finalApplyValue,
            (select count(*) from project_entry where project_no=122 and member_no=6) as myApplyValue,
            (select count(*) from project_review where project_no in
            	((select pp.project_no from project pp where pp.project_status = 3 and pp.project_no in ((select pm.project_no from project_team_member pm where pm.member_no=6)))) 
                and review_writer = null) as writeReviewCheck
	from project p 
	where project_no = 122;
    
    select count(*) from project_review where project_no = 122 and review_writer = 110;
         
commit;