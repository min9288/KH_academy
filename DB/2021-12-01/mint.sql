SELECT * FROM PROJECT;
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


INSERT INTO PROJECT VALUES(PROJECT_SEQ.nextval, 6, TO_DATE(SYSDATE, 'YYYY-MM-DD'), TO_DATE('2021-12-05', 'YYYY-MM-DD'), DEFAULT, '테스트 중입니당', NULL,NULL,NULL,NULL,DEFAULT,NULL,NULL);

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