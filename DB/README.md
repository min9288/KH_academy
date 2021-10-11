# DB

## 1. 개요
- 이 폴더는 KH 정보교육 SQL 파일들을 모아놓기 위한 폴더입니다.

## 2. 목록
- 16일차(2021-08-04)
  - admin.sql : kh 계정 생성
  - KH_pratice.txt : 테스트용 INSERT 데이터
  - kh.sql : 각종 SELECT문 테스트
    1. SELECT 기초
    2. 리터럴
    3. ||을 이용한 연결 연산자
    4. 논리 연산자
    5. 비교 연산자 BETWEEN AND
    6. 비교 연산자 LIKE
    7. 비교 연산자 IS NULL/IS NOT NULL
    9. ORDER BY 정렬
    10. 실습문제

- 17일차(2021-08-05)
  - kh.sql : 각종 함수 테스트
    1. LENGTH 함수
    2. LENGTHB 함수
    3. INSTR 함수
    4. LPAD/RPAD
    5. LTRIM/RTRIM
    6. TRIM
    7. SUBSTR
    8. LOWER/UPPER/INITCAP
    9. CONCAT
    10. REPLACE
    11. ABS
    12. MOD
    13. ROUND
    14. FLOOR
    15. CEIL
    16. SYSDATE
    17. MONTHS_BETWEEN
    18. ADD_MONTHS
    19. NEXT_DAY
    20. LAST_DAY
    21. TO_CHAR
    22. TO_DATE
    23. TO_NUMBER
    24. NVL
    25. DECODE
    26. CASE
    27. SUM
    28. AVG
    29. COUNT
    30. MAX, MIN

- 18일차(2021-08-06)
  - kh.sql : GROUP BY, JOIN 테스트
    1. GROUP BY, HAVING
    2. JOIN

- 19일차(2021-08-09)
  - kh.sql : 18일차 연속
    1. SET OPERATOR
    2. 단일행 서브쿼리
    3. 다중행 서브쿼리
    4. 다중열 서브쿼리
    5. 다중행 다중열 서브쿼리
    6. 상관쿼리
    7. 스칼라 서브쿼리
    8. ROWNUM
    9. RANK() OVER
    10. DENSE_RANK() OVER
    11. ROW_NUMBER() OVER
  - 테스트계정 : 테이블 생성 테스트
    1. CREATE TABLE
  - admin.sql
    1. 계정 생성

- 20일차(2021-08-10)
  - ddlexam.sql : CREATE TABLE 연습문제
    1. CREATE TABLE
    2. 제약조건
  - kh.sql : 수정 및 삭제, 테이블 복사
    1. AS를 이용한 테이블 복사 생성
    2. 컬럼 추가
    3. 컬럼 수정
    4. 제약조건 확인
    5. 제약조건 추가
    6. 컬럼 삭제
    7. 제약조건 삭제
    8. 컬럼 이름 변경
    9. 제약조건 이름 변경
    10. 테이블 이름 변경
    11. 테이블 삭제
  - admin.sql : 계정 삭제
    1. 계정 삭제

- 21일차(2021-08-11)
  - kh.sql : VIEW, SEQUENC, TCL 테스트
    1. ROLLBACK
    2. COMMIT
    3. SAVEPOINT
    4. ROLLBACK TO
    5. VIEW 테스트
    6. SEQUENCE 테스트
    7. 비공개 동의어
  - admin.sql
    1. 뷰 생성 권한 획득
    2. 뷰 SELECT 권한 획득
    3. SYNONYM 생성 권한 획득
    4. 공개 동의어
    5. OBJECT 실습
  - HOMEPAGE_TEST.sql, testExam.sql : OBJECT 실습
    1. MEMBER 테이블 생성
    2. BOARD 테이블 생성
    3. SEQUENCE 객체 생성
    4. VIEW 생성
    5. SYNONYM 생성
   
- 22일차(2021-08-12)
  - kh.sql : PL/SQL 테스트   
    1. PL/SQL 테스트
    2. PL/SQL 타입 테스트
    3. PL/SQL 타입 실습
    4. PL/SQL IF문 테스트
  - admin.sql
    1. 공개 동의어
    2. OBJECT 실습
  - 태스트계정.sql
    1. 다른 계정에서 뷰 SELECT
    2. 공개 동의어
   
- 23일차(2021-08-13)
  - kh.sql
    1. 반복문 테스트
    2. 반복문 실습
   
- 24일차(2021-08-16)
  - 엔디티도출_실습_3_20210816_21_45.TXT
    1. DB 설계
  - admin.sql
  - jdbc.sql
    - JDBC 테스트용 테이블 생성
  
- 27일차(2021-08-19)
  - admin.sql
  - JDBC1.sql
    - JDBC 실습용 테이블 생성
    - JDBC 실습용 테이블
    
- 54일차(2021-09-29)
  - admin.sql
  - webtest.sql
    - Servlet 테스트용 테이블
    
- 60일차(2021-10-07)
  - webtest.sql
    - 댓글관련 테이블 생성

- 63일차(2021-10-11)
  - webtest.sql
    - 사진게시판 테이블 생성
