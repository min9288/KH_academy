-- 회원정보 저장용 테이블
-- 어떤 정보를 저장할지 -> 이름, 아이디, 나이, 비밀번호, 이메일, 생년월일, 주소, 전화번호

/*
저장할 정보별 컬럼이름, 자료형
CHAR        :   고정길이 문자열 -> 데이터를 저장하고 남은공간 공백으로 채움
VARCHAR2    :   가변길이 문자열 -> 데이터를 저장하고 남은공간 삭제
이름(예약어 사용불가) USER_NAME(userName)   VARCHAR2 -> 15(한글 1글자당 3 BYTE -> 최대 5글자)
아이디    USER_ID                              VARCHAR2 -> 20(영어 + 숫자 20글자 이내)
나이      USER_AGE                             NUMBER
비밀번호  USER_PASS                            VARCHAR2 -> 30(영어 + 숫자 30글자 이내)
이메일    USER_EMAIL                           VARCHAR2 -> 50(영어 + 숫자 50글자 이내)
생년월일  USER_BIRTH                           CHAR, VARCHAR2, NUMBER, DATE
주소      USER_ADDR                            VARCHAR2 -> 30
전화번호  USER_PHONE                           CHAR -> 13 000 - 0000 - 0000 형태
-- 테이블 이름 : USER_INFO
-- 테이블 생성 구문
CREATE TABLE 테이블이름 (
    컬럼명 자료형(크기), 
    컬럼명 자료형(크기),
    ...
*/

CREATE TABLE USER_INFO(
    USER_NAME   VARCHAR2(15),
    USER_ID     VARCHAR2(20),
    USER_AGE    NUMBER,
    USER_PASS   VARCHAR2(20),
    USER_EMAIL  VARCHAR2(50),
    USER_BIRTH  DATE,
    USER_ADDR   VARCHAR2(300),
    USER_PHONE  CHAR(13)
);
SELECT * FROM USER_INFO;

COMMENT ON COLUMN USER_INFO.USER_NAME IS '회원 이름';
COMMENT ON COLUMN USER_INFO.USER_ID IS '회원 아이디';
COMMENT ON COLUMN USER_INFO.USER_AGE IS '나이';
COMMENT ON COLUMN USER_INFO.USER_PASS IS '비밀번호';
COMMENT ON COLUMN USER_INFO.USER_EMAIL IS '이메일';
COMMENT ON COLUMN USER_INFO.USER_BIRTH IS '생년월일';
COMMENT ON COLUMN USER_INFO.USER_ADDR IS '주소';
COMMENT ON COLUMN USER_INFO.USER_PHONE IS '전화번호';


INSERT INTO USER_INFO VALUES ('정민우1', 'user01', 30, '123456', 'user01@naver.com', to_date(19920808, 'yyyymmdd'),
                                '서울시 강서구 초록마을로', '010-8764-2440');
                                
INSERT INTO USER_INFO VALUES ('정민우2', 'user02', 20, '123456', 'user01@naver.com', to_date(20020809, 'yyyymmdd'),
                                '서울시 양천구 딴따라', '010-8764-2440');                

DELETE FROM USER_INFO WHERE USER_NAME = '정민우1';                               
                                
COMMIT;