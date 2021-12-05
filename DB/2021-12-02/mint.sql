
CREATE TABLE PROJECT (
	project_no	number		PRIMARY KEY,
    member_no number REFERENCES MEMBER(MEMBER_NO) ON DELETE CASCADE,
	recruit_start_date	date	DEFAULT sysdate	NOT NULL,
	recruit_end_date	date		NOT NULL,
	view_count	number	DEFAULT 0	NOT NULL,
	recruit_title	varchar2(100)		NOT NULL,
	recruit_content	varchar2(1000)		NULL,
	project_name	varchar2(70)		NULL,
	project_goal	varchar2(800)		NULL,
	project_reader	varchar2(20)		NULL,
	project_status	number	DEFAULT 1	NULL,
	project_start_date	char(10)		NULL,
	project_end_date	char(10)		NULL
);


COMMENT ON COLUMN PROJECT.project_no IS 'project_seq';

COMMENT ON COLUMN PROJECT.recruit_content IS '모집공고 내용';

COMMENT ON COLUMN PROJECT.project_status IS '1-모집 중 / 2- 프로젝트 진행 중 / 3 - 프로젝트 종료';


CREATE TABLE DEVELOP_LANGUAGE (
	language_no	number		PRIMARY KEY,
	language_name	varchar2(20)		NOT NULL,
	language_img	varchar2(300)		NOT NULL
);

COMMENT ON COLUMN DEVELOP_LANGUAGE.language_no IS 'lan_seq';

COMMENT ON COLUMN DEVELOP_LANGUAGE.language_img IS '언어 아이콘 이미지';





CREATE TABLE PROJECT_TEAM_MEMBER (
	team_member_no	number		PRIMARY KEY,
	project_no	number		REFERENCES PROJECT(project_no) ON DELETE CASCADE,
	member_no number REFERENCES MEMBER(MEMBER_NO) ON DELETE CASCADE,
    member_role varchar2(150) NULL
);

COMMENT ON COLUMN PROJECT_TEAM_MEMBER.team_member_no IS 'tm_seq';





CREATE TABLE PROJECT_REVIEW (
	review_no	number		PRIMARY KEY,
	team_member_no	number	REFERENCES project_team_member(team_member_no) ON DELETE CASCADE,
	review_point	number		NOT NULL,
	review_content	varchar2(800)		NULL,
	enroll_date	 char(10)   DEFAULT sysdate	NOT NULL
);

COMMENT ON COLUMN PROJECT_REVIEW.review_no IS 'review_seq';

COMMENT ON COLUMN PROJECT_REVIEW.team_member_no IS 'tm_seq';

COMMENT ON COLUMN PROJECT_REVIEW.review_point IS '5-매우 좋음 / 4-좋음 / 3- 보통 / 2-나쁨 / 1-매우나쁨';



CREATE TABLE PROJECT_ENTRY (
	entry_no	number		PRIMARY KEY,
    member_no number REFERENCES MEMBER(MEMBER_NO) ON DELETE CASCADE,
    project_no NUMBER REFERENCES PROJECT(project_no) ON DELETE CASCADE,
	ambition	varchar2(80)		NOT NULL,
	apply_content	varchar2(800)		NOT NULL,
	apply_date	date	DEFAULT sysdate	NOT NULL,
    entry_status number DEFAULT 1  not null
);

COMMENT ON COLUMN PROJECT_ENTRY.entry_no IS 'entry_seq';





CREATE TABLE TASK (
	task_no	varchar2(20)		PRIMARY KEY,
	project_no NUMBER REFERENCES PROJECT(project_no) ON DELETE CASCADE,
	team_member_no	NUMBER		REFERENCES project_team_member(team_member_no),
	task_sort	number		NOT NULL,
	task_title	varchar2(60)		NOT NULL,
	task_content	varchar2(800)		NULL,
	priority	number	DEFAULT 2	NOT NULL,
	connect_issue	varchar2(20)		NULL,
	reference_link	varchar2(100)		NULL,
	reference_link_name	varchar2(35)		NULL,
	start_date	date		NOT NULL,
	complete_date	date		NULL,
	end_date	date		NULL,
	process_sort	number	DEFAULT 1	NOT NULL
);

COMMENT ON COLUMN TASK.task_no IS '회의-M0 /  테스크-T0 / 버그-B0';

COMMENT ON COLUMN TASK.project_no IS 'project_seq';

COMMENT ON COLUMN TASK.team_member_no IS 'tm_seq';

COMMENT ON COLUMN TASK.task_sort IS 'meeting  / task  / bug';

COMMENT ON COLUMN TASK.priority IS '1-low / 2-medium / 3-high /4-urgency';

COMMENT ON COLUMN TASK.connect_issue IS '과업연결';

COMMENT ON COLUMN TASK.process_sort IS '1-해야 할일 / 2- 진행 중 / 3-완료 / 4-보류';


CREATE TABLE ATTACHMENT (
	file_no	number		PRIMARY KEY,
	member_no number REFERENCES MEMBER(MEMBER_NO) ON DELETE CASCADE,
	board_type	number		NOT NULL,
	board_no	number		NOT NULL,
	file_name	varchar2(80)		NOT NULL,
	file_path	varchar2(150)		NOT NULL
);

COMMENT ON COLUMN ATTACHMENT.board_type IS '게시판 어디인지구분(1.공모전,2.개발지식게시판,3.프로젝트 모집게시판4. 회사게시판, 5. 프로젝트 지원자 관리)';

COMMENT ON COLUMN ATTACHMENT.board_no IS '해당게시판의 게시물 번호';



CREATE TABLE REFERENCE_LINK (
	link_no	number		PRIMARY KEY,
	task_no	varchar2(20)	REFERENCES TASK(task_no) ON DELETE CASCADE,
	link_addr	varchar2(100)	NOT NULL,
	link_name	varchar2(50)	NULL
);

COMMENT ON COLUMN REFERENCE_LINK.link_no IS '링크번호(link_seq)';

COMMENT ON COLUMN REFERENCE_LINK.task_no IS '회의-m00 /  테스크-t00 / 버그-b00';

COMMENT ON COLUMN REFERENCE_LINK.link_addr IS '사이트 주소';



CREATE TABLE SHORTCUTS (
	shortcut_no	number		PRIMARY KEY,
	project_no	number		REFERENCES PROJECT(project_no) ON DELETE CASCADE,
	s_link_addr	varchar2(100)		NOT NULL,
	s_link_name	varchar2(50)		NULL
);

COMMENT ON COLUMN SHORTCUTS.shortcut_no IS 'shortcut_seq';




CREATE TABLE CALENDAR (
	calendar_no	number		PRIMARY KEY,
	project_no	number		REFERENCES PROJECT(project_no) ON DELETE CASCADE,
	calendar_name	varchar2(50)		NOT NULL,
	calendar_code	varchar2(120)		NOT NULL
);

COMMENT ON COLUMN CALENDAR.calendar_no IS 'calendar_seq';




CREATE TABLE SCHEDULE (
	schedule_no	number		PRIMARY KEY,
	calendar_no	number		REFERENCES calendar(calendar_no) ON DELETE CASCADE,
	task_no	varchar2(20)	REFERENCES TASK(task_no) ON DELETE CASCADE,
	schedule_title	varchar2(80)		NOT NULL,
	start_time	date		NOT NULL,
	start_date	date		NOT NULL,
	end_time	date		NOT NULL,
	end_date	date		NOT NULL,
	schedule_content	varchar2(1000)		NOT NULL
);

COMMENT ON COLUMN SCHEDULE.schedule_no IS 'schedule_seq';

COMMENT ON COLUMN SCHEDULE.calendar_no IS 'calendar_seq';

COMMENT ON COLUMN SCHEDULE.task_no IS '회의-M0 /  테스크-T0 / 버그-B0';

SELECT * FROM PROJECT;
SELECT * FROM MEMBER;
SELECT * FROM project_dibs;

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

select 
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
						where p.project_status = 1 
		       			order by project_No DESC) 
					where rnum between 1 and 20;
                    
        select 
			use_project_lang_no as upln,
           	project_no as projectNo,
           	language_no as langNo,
           	(select language_img from develop_language d where d.language_no = u.language_no) langImg 
		from use_project_language u;
        
        select 
			use_project_lang_no as upln,
           	project_no as projectNo,
           	language_no as langNo,
           	(select language_img from develop_language d where d.language_no = u.language_no) langImg 
		from use_project_language u;
        
        select count(*) from
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
						where p.project_status = 1 
		       			order by project_No DESC) 
					where rnum between 1 and 30;
        
        select * from develop_language;
        select 
			language_no as langNo,
           	language_name as langName,
           	language_img as langImg
		from develop_language;
        
            
commit;