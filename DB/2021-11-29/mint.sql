CREATE TABLE PROJECT (
	"project_no"	number		PRIMARY KEY,
    "member_no" number REFERENCES MEMBER(MEMBER_NO) ON DELETE CASCADE,
	"language_no"	number		NOT NULL,
	"dev_lang"	varchar2(40)		NOT NULL,
	"recruit_start_date"	date	DEFAULT sysdate	NOT NULL,
	"recruit_end_date"	date		NOT NULL,
	"view_count"	number	DEFAULT 0	NOT NULL,
	"recruit_title"	varchar2(100)		NOT NULL,
	"recruit_content"	varchar2(1000)		NULL,
	"project_name"	varchar2(70)		NULL,
	"project_goal"	varchar2(800)		NULL,
	"project_reader"	varchar2(20)		NULL,
	"project_status"	number	DEFAULT 1	NULL,
	"project_start_date"	date		NULL,
	"project_end_date"	date		NULL
);


COMMENT ON COLUMN "PROJECT"."project_no" IS 'project_seq';

COMMENT ON COLUMN "PROJECT"."language_no" IS '���߾�� ��ȣ';

COMMENT ON COLUMN "PROJECT"."recruit_content" IS '�������� ����';

COMMENT ON COLUMN "PROJECT"."project_status" IS '1-���� �� / 2- ������Ʈ ���� �� / 3 - ������Ʈ ����';

CREATE SEQUENCE project_seq;

CREATE TABLE DEVELOP_LANGUAGE (
	"language_no"	number		PRIMARY KEY,
	"member_no" number REFERENCES MEMBER(MEMBER_NO) ON DELETE CASCADE,
	"language_name"	varchar2(20)		NOT NULL,
	"language_img"	varchar2(300)		NOT NULL,
	"use_case"	number		NOT NULL
);

select * from user_tables;


COMMENT ON COLUMN DEVELOP_LANGUAGE."language_no" IS 'lan_seq';

COMMENT ON COLUMN DEVELOP_LANGUAGE."language_img" IS '��� ������ �̹���';

COMMENT ON COLUMN DEVELOP_LANGUAGE."use_case" IS '1-���������� / 2-������ / 3-������Ʈ';

CREATE SEQUENCE lan_seq;



CREATE TABLE PROJECT_TEAM_MEMBER (
	"team_member_no"	number		PRIMARY KEY,
	"project_no"	number		REFERENCES "PROJECT"("project_no") ON DELETE CASCADE,
	"member_no" number REFERENCES MEMBER(MEMBER_NO) ON DELETE CASCADE,
	"language_no"	number		REFERENCES DEVELOP_LANGUAGE("language_no") ON DELETE CASCADE,
    member_role varchar2(150) NULL
);

COMMENT ON COLUMN PROJECT_TEAM_MEMBER."team_member_no" IS 'tm_seq';

COMMENT ON COLUMN PROJECT_TEAM_MEMBER."language_no" IS '���߾�� ��ȣ';

CREATE SEQUENCE tm_seq;



CREATE TABLE PROJECT_REVIEW (
	"review_no"	number		PRIMARY KEY,
    "member_no" number REFERENCES MEMBER(MEMBER_NO) ON DELETE CASCADE,
	"team_member_no"	number		NOT NULL,
	"review_point"	number		NOT NULL,
	"review_content"	varchar2(800)		NULL,
	"enroll_date"	date	DEFAULT sysdate	NOT NULL
);

COMMENT ON COLUMN PROJECT_REVIEW."review_no" IS 'review_seq';

COMMENT ON COLUMN PROJECT_REVIEW."team_member_no" IS 'tm_seq';

COMMENT ON COLUMN PROJECT_REVIEW."review_point" IS '5-�ſ� ���� / 4-���� / 3- ���� / 2-���� / 1-�ſ쳪��';

CREATE SEQUENCE review_seq;


CREATE TABLE PROJECT_ENTRY (
	"entry_no"	number		PRIMARY KEY,
    member_no number REFERENCES MEMBER(MEMBER_NO) ON DELETE CASCADE,
    project_no NUMBER REFERENCES PROJECT("project_no") ON DELETE CASCADE,
	"language_no"	number	REFERENCES develop_language("language_no"),
	"ambition"	varchar2(80)		NOT NULL,
	"apply_content"	varchar2(800)		NOT NULL,
	"apply_date"	date	DEFAULT sysdate	NOT NULL
);

COMMENT ON COLUMN PROJECT_ENTRY."entry_no" IS 'entry_seq';

COMMENT ON COLUMN PROJECT_ENTRY."language_no" IS '���߾�� ��ȣ';

CREATE SEQUENCE entry_seq;



CREATE TABLE TASK (
	"task_no"	varchar2(20)		PRIMARY KEY,
	"project_no" NUMBER REFERENCES PROJECT("project_no") ON DELETE CASCADE,
	"team_member_no"	NUMBER		REFERENCES project_team_member("team_member_no"),
	"task_sort"	number		NOT NULL,
	"task_title"	varchar2(60)		NOT NULL,
	"task_content"	varchar2(800)		NULL,
	"priority"	number	DEFAULT 2	NOT NULL,
	"connect_issue"	varchar2(20)		NULL,
	"reference_link"	varchar2(100)		NULL,
	"reference_link_name"	varchar2(35)		NULL,
	"start_date"	date		NOT NULL,
	"complete_date"	date		NULL,
	"end_date"	date		NULL,
	"process_sort"	number	DEFAULT 1	NOT NULL
);

COMMENT ON COLUMN TASK."task_no" IS 'ȸ��-M0 /  �׽�ũ-T0 / ����-B0';

COMMENT ON COLUMN TASK."project_no" IS 'project_seq';

COMMENT ON COLUMN TASK."team_member_no" IS 'tm_seq';

COMMENT ON COLUMN TASK."task_sort" IS 'meeting  / task  / bug';

COMMENT ON COLUMN TASK."priority" IS '1-low / 2-medium / 3-high /4-urgency';

COMMENT ON COLUMN TASK."connect_issue" IS '��������';

COMMENT ON COLUMN TASK."process_sort" IS '1-�ؾ� ���� / 2- ���� �� / 3-�Ϸ� / 4-����';

CREATE SEQUENCE task_seq;

CREATE TABLE ATTACHMENT (
	"file_no"	number		PRIMARY KEY,
	"member_no" number REFERENCES MEMBER(MEMBER_NO) ON DELETE CASCADE,
	"board_type"	number		NOT NULL,
	"board_no"	number		NOT NULL,
	"file_name"	varchar2(80)		NOT NULL,
	"file_path"	varchar2(150)		NOT NULL
);

COMMENT ON COLUMN ATTACHMENT."board_type" IS '�Խ��� �����������(1.������,2.�������İԽ���,3.������Ʈ �����Խ���4. ȸ��Խ���, 5. ������Ʈ ������ ����)';

COMMENT ON COLUMN ATTACHMENT."board_no" IS '�ش�Խ����� �Խù� ��ȣ';

CREATE SEQUENCE atm_seq;


CREATE TABLE REFERENCE_LINK (
	"link_no"	number		PRIMARY KEY,
	"task_no"	varchar2(20)	REFERENCES TASK("task_no") ON DELETE CASCADE,
	"link_addr"	varchar2(100)	NOT NULL,
	"link_name"	varchar2(50)	NULL
);

COMMENT ON COLUMN REFERENCE_LINK."link_no" IS '��ũ��ȣ(link_seq)';

COMMENT ON COLUMN REFERENCE_LINK."task_no" IS 'ȸ��-m00 /  �׽�ũ-t00 / ����-b00';

COMMENT ON COLUMN REFERENCE_LINK."link_addr" IS '����Ʈ �ּ�';

CREATE SEQUENCE link_seq;


CREATE TABLE SHORTCUTS (
	"shortcut_no"	number		PRIMARY KEY,
	"project_no"	number		REFERENCES PROJECT("project_no") ON DELETE CASCADE,
	"s_link_addr"	varchar2(100)		NOT NULL,
	"s_link_name"	varchar2(50)		NULL
);

COMMENT ON COLUMN SHORTCUTS."shortcut_no" IS 'shortcut_seq';

CREATE SEQUENCE project_seq;



CREATE TABLE CALENDAR (
	"calendar_no"	number		PRIMARY KEY,
	"project_no"	number		REFERENCES PROJECT("project_no") ON DELETE CASCADE,
	"calendar_name"	varchar2(50)		NOT NULL,
	"calendar_code"	varchar2(120)		NOT NULL
);

COMMENT ON COLUMN CALENDAR."calendar_no" IS 'calendar_seq';

CREATE SEQUENCE calendar_seq;



CREATE TABLE SCHEDULE (
	"schedule_no"	number		PRIMARY KEY,
	"calendar_no"	number		REFERENCES calendar("calendar_no") ON DELETE CASCADE,
	"task_no"	varchar2(20)	REFERENCES TASK("task_no") ON DELETE CASCADE,
	"schedule_title"	varchar2(80)		NOT NULL,
	"start_time"	date		NOT NULL,
	"start_date"	date		NOT NULL,
	"end_time"	date		NOT NULL,
	"end_date"	date		NOT NULL,
	"schedule_content"	varchar2(1000)		NOT NULL
);

COMMENT ON COLUMN SCHEDULE."schedule_no" IS 'schedule_seq';

COMMENT ON COLUMN SCHEDULE."calendar_no" IS 'calendar_seq';

COMMENT ON COLUMN SCHEDULE."task_no" IS 'ȸ��-M0 /  �׽�ũ-T0 / ����-B0';

CREATE SEQUENCE schedule_seq;



