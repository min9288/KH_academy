--  EMPLOYEE 테이블의 모든 컬럼을 조회
SELECT * FROM EMPLOYEE;

Select * From Department;
--  직원들 중 보너스를 받은 직원
SELECT * FROM EMPLOYEE WHERE BONUS IS NOT NULL;
--  직원들 중 보너스를 못 받은 직원
SELECT * FROM EMPLOYEE Where BONUS IS NULL;
--  직원들 중 부서를 배정받지 못한 직원의 전체정보
SELECT * FROM EMPLOYEE WHERE DEPT_CODE IS NULL;

--  D6부서 또는 D9부서 또는  D8부서 속한 부서원의 이름, 부서코드, 급여 조회
SELECT EMP_NAME, DEPT_CODE, SALARY 
FROM EMPLOYEE 
--  WHERE (DEPT_CODE = 'D6' OR DEPT_CODE = 'D9' OR DEPT_CODE = 'D8');     
WHERE
DEPT_CODE IN ('D6', 'D9', 'D8');
--DEPT_CODE NOT IN ('D6', 'D9', 'D8');

-- 직급코드가 J7 또는 J2이고, 급여가 200만원 초과인 사람의 이름, 급여 직급코드 출력
SELECT EMP_NAME, SALARY, DEPT_CODE, JOB_CODE FROM EMPLOYEE
WHERE
--(JOB_CODE = 'J7' OR JOB_CODE = 'J2') AND (SALARY > 2000000);
JOB_CODE IN ('J7', 'J2') AND (SALARY > 2000000); 

/*
SECLECT

FROM
        테이블이름
WHERE
        조건
ORDER BY
        정렬기준
*/

--  오름차순 
--  1)  숫자 : 작은 수 -> 큰 수
--  2)  문자 : 사전 순
--  3)  날짜 : 빠른 날 -> 느린 날

--  내림차순
--  1)  숫자 : 큰 수 -> 작은 수
--  2)  문자 : 사전 역순
--  3)  날짜 : 느린 날 -> 빠른 날
SELECT EMP_NAME, SALARY FROM EMPLOYEE ORDER BY EMP_NAME;    -- 오름차순 ASC -> 생략가능
SELECT EMP_NAME, SALARY FROM EMPLOYEE ORDER BY EMP_NAME DESC; -- 내림차순 DESC -> 생략 불가
SELECT EMP_NAME, SALARY FROM EMPLOYEE ORDER BY SALARY;
SELECT EMP_NAME, SALARY FROM EMPLOYEE ORDER BY SALARY DESC;

SELECT EMP_NAME, SALARY, HIRE_DATE, DEPT_CODE FROM EMPLOYEE ORDER BY DEPT_CODE;
-- DEPT_CODE 컬럼을 조회하지 않더라도 정렬기준으로는 사용이 가능
SELECT EMP_NAME, SALARY, HIRE_DATE FROM EMPLOYEE ORDER BY DEPT_CODE;

SELECT EMP_NAME, SALARY, HIRE_DATE, DEPT_CODE FROM EMPLOYEE WHERE DEPT_CODE = 'D9' ORDER BY EMP_NAME;


--  조회결과의 컬럼 순서를 이용해서 정렬 가능
SELECT EMP_NAME, SALARY, HIRE_DATE FROM EMPLOYEE WHERE DEPT_CODE = 'D9' ORDER BY 2 DESC;

SELECT * FROM EMPLOYEE ORDER BY SALARY, EMP_NAME;

--  문제 1.
--  입사일이 5년 이상, 10년 이하인 직원의 이름, 주민번호, 급여, 입사일 검색
SELECT EMP_NAME, EMP_NO, HIRE_DATE FROM EMPLOYEE
WHERE 
(SYSDATE - HIRE_DATE) / 365 BETWEEN 5 AND 10;

-- 문제 2.
--  재직중이 아닌 직원의 이름, 부서코드, 입사일, 퇴사일 조회(퇴사여부 : ENT_YN)
SELECT EMP_NAME, DEPT_CODE, HIRE_DATE, ENT_DATE FROM EMPLOYEE
WHERE 
ENT_YN = 'Y';

--  문제 3.
--  근속년수가 10년 이상인 직원들을 검색하여, 출력 결과는 이름, 급여, 근속년수를
--  근속년수가 오름차순으로 정렬하여 출력한다.
--  단, 급여는 50% 인상된 급여로 출력되도록 한다.
SELECT EMP_NAME, (SALARY*1.5) "인상급여", FLOOR((SYSDATE - HIRE_DATE) / 365) "근속년수" FROM EMPLOYEE
WHERE       -- WHERE 절은 위에 SELECT 절과 동시에 작업되어서,         근속년수 >= 10      과 같은 조건을 넣을 수 없다.
(SYSDATE - HIRE_DATE) / 365 >= 10
ORDER BY 근속년수;



SELECT EMP_NAME, PHONE, SALARY*12 AS 연봉, '원'  단위 FROM EMPLOYEE WHERE DEPT_CODE = 'D6';  


--  문제 4.
--  입사일이 99/01/01 ~ 10/01/01 인 사람 중에서 급여가 2000000 원 이하인 사람의
--  이름, 주민번호, 이메일, 폰번호, 급여를 검색한다.

SELECT EMP_NAME, EMP_NO, EMAIL, PHONE, SALARY FROM EMPLOYEE
WHERE
(HIRE_DATE BETWEEN '99/01/01' AND '10/01/01') AND (SALARY <= 2000000);

--  문제 5.
--  급여가 2000000원 ~ 3000000원 인 여직원 중에서 4월 생일자를 검색하여
--  이름, 주민번호, 급여, 부서코드를 주민번호 순으로(내림차순) 출력한다.
SELECT EMP_NAME, EMP_NO, SALARY, DEPT_CODE FROM EMPLOYEE
WHERE 
(EMP_NO LIKE  '___4___2%') AND (SALARY BETWEEN 2000000 AND 3000000)
ORDER BY EMP_NO DESC;



--  문자열 처리함수

--  1)  LENGTH : 주어진 값의 문자열 길이를 반환
SELECT EMP_NAME, LENGTH(EMP_NAME), EMAIL, LENGTH(EMAIL) FROM EMPLOYEE;


--  2)  LENGTHB : 주어진 값의 바이트를 반환                영어는 1바이트, 한글은 3바이트(EX버전), 다른 유료버전에서는 한글 2바이트
SELECT EMP_NAME, LENGTH(EMP_NAME), LENGTHB(EMP_NAME), EMAIL, LENGTH(EMAIL), LENGTHB(EMAIL) FROM EMPLOYEE;


--  3)  INSTR : 찾는 문자가 지정한 위치부터 지정한 횟수만큼 나타난 시작위치 리턴
SELECT INSTR( 'Hello World Hi High', 'H', 1, 1) FROM DUAL;      -- Hellow World Hi HIgh에서 H를 1번 위치부터 1번째 존재하는 위치를 반환
SELECT INSTR( 'Hello World Hi High', 'H', 1, 2) FROM DUAL;      -- Hellow World Hi HIgh에서 H를 1번 위치부터 2번째 존재하는 위치를 반환
SELECT INSTR( 'Hello World Hi High', 'H', 1, 3) FROM DUAL;      -- Hellow World Hi HIgh에서 H를 1번 위치부터 3번째 존재하는 위치를 반환
SELECT INSTR( 'Hello World Hi High', 'H', 2, 1) FROM DUAL;
SELECT INSTR( 'Hello World Hi High', 'H', 2, 2) FROM DUAL;
SELECT INSTR( 'Hello World Hi High', 'H', -1, 1) FROM DUAL;     -- 뒤에서 -1번째부터 1번째 H의 위치 반환 -> 검색은 뒤에서 부터하지만 값은 앞 순서부터로 센다
SELECT INSTR( 'Hello World Hi High', 'H', -1, 2) FROM DUAL;     -- 뒤에서 -1번째부터 2번째 H의 위치 반환 -> 검색은 뒤에서 부터하지만 값은 앞 순서부터로 센다

SELECT EMAIL, INSTR(EMAIL, '@', 1, 1) FROM EMPLOYEE;


--  4)   LPAD / RPAD : 주어진 컬럼 문자열에 임의의 문자열을 왼쪽 / 오른쪽에 덧붙여 일정길이 문자열을 반환
SELECT EMAIL, LENGTH(EMAIL), LPAD(EMAIL, 20, '#'), RPAD(EMAIL, 20, '#'), LPAD(EMAIL, 10, '#') FROM EMPLOYEE;


--  5)  LTRIM / RTRIM : 주어진 컬럼이나 문자열의 왼쪽 혹은 오른쪽에서 지정한 문자열에 포함된 모든문자를 제거한 나머지를 반환
SELECT  LTRIM( '    KH', ' ') FROM DUAL;
SELECT  LTRIM( '00000123400000', '0') FROM DUAL;
SELECT  RTRIM( '00000123400000', '0') FROM DUAL;
SELECT LTRIM('ACABAACCBBKHACABAACCBB', 'ABC') FROM DUAL;        -- ABC 를 지우는게 아니라 'A' 'B' 'C' 순서없이 연달아 나오는 패턴이 끝날때 까지 있는 부분 삭제
SELECT RTRIM('ACABAACCBBKHACABAACCBB', 'ABC') FROM DUAL;        -- ==


--  6)  TRIM : 주어진 컬럼이나 문자열 앞 / 뒤 양쪽에 지정한 문자를 제거한 나머지를 반환
SELECT TRIM('Z' FROM 'ZZZKHZZZ') FROM DUAL;                      --  앞 / 뒤 모두 제거    // BOTH 는 생략된 상태
SELECT TRIM(BOTH 'Z' FROM 'ZZZKHZZZ') FROM DUAL;            --  앞 / 뒤 모두 제거   // BOTH 는 생략 가능
SELECT TRIM(LEADING 'Z' FROM 'ZZZKHZZZ') FROM DUAL;     --  앞에만 제거
SELECT TRIM(TRAILING 'Z' FROM 'ZZZKHZZZ') FROM DUAL;     -- 뒤에만 제거


--  실습  문제 1
--  Hello KH Java 문자열을 Hello KH 가 출력되게 한다.
SELECT  RTRIM( 'Hello KH Java', ' Java') FROM DUAL;
SELECT  LPAD( 'Hello KH Java', INSTR('Hello KH Java', 'J', 1, 1)-2) FROM DUAL;

--  실습  문제 2
--  Hello KH Java 문자열을 KH Java 가 출력되게 한다.
SELECT  LTRIM( 'Hello KH Java', 'Hello ') FROM DUAL;

--  실습  문제 3 ( TRIM 으로 해보세요)
--  DEPARTMENT 테이블에서 DEPT_TITLE을 출력하여라
--  이때, 마지막 부 글자를 빼고 출력되도록 하여라      /   EX) 회계관리부 -> 회계관리
SELECT TRIM(TRAILING '부' FROM DEPT_TITLE) FROM DEPARTMENT;

--  실습 문제 4
--  다음 문자열에서 앞 뒤 모든 숫자를 제거하세요.
--  '982341678934509hello89798739273402'
SELECT RTRIM( LTRIM( '982341678934509hello89798739273402', '982341678934509'), '89798739273402') FROM DUAL;


--  7)  SUBSTR : 지정된 컬럼이나 문자열에서 지정한 위치부터 지정한 개수의 문자열을 잘라내어 리턴
SELECT SUBSTR('ABCDEFGHIJK', 3, 4) FROM DUAL;       -- 3번 문자부터 4개
SELECT SUBSTR('ABCDEFGHIJK', 7, 2) FROM DUAL;       -- 7번 문자부터 2개
SELECT SUBSTR('ABCDEFGHIJK', 7) FROM DUAL;           -- 7번문자부터 가져올 문자개수 생략 시 끝까지 출력
SELECT SUBSTR('ABCDEFGHIJK', -7, 2) FROM DUAL;      -- 뒤에서 7번째 문자부터 2개

--  실습문제1
----    사원명에서 성만 중복없이 사전순으로 출력하세요.
SELECT DISTINCT SUBSTR(EMP_NAME, 1, 1)  AS "성" FROM EMPLOYEE ORDER BY 1;        -- DISTINCT 를 사용하여 기존 테이블을 편집하여 사용하기 때문에 ORDER BY 가 EMP_NAME이 아닌 1

-- 실습문제2
-- employee 테이블에서 남자만 사원번호, 사원명, 주민번호, 연봉을 나타내세요.
-- 주민번호의 뒷6자리는 *처리하세요.
-- 1)
SELECT EMP_ID, EMP_NAME, RPAD(SUBSTR(EMP_NO, 1, 8), 14, '*'), SALARY*12 AS "연봉"
FROM EMPLOYEE
WHERE
-- EMP_NO LIKE '%-1%' OR EMP_NO LIKE '%-3%'
SUBSTR(EMP_NO, 8, 1) IN ('1', '3')
;
-- 2)
SELECT EMP_ID, EMP_NAME, SUBSTR(EMP_NO, 1, 8) || '*****', SALARY*12 AS "연봉"
FROM EMPLOYEE
WHERE
-- EMP_NO LIKE '%-1%' OR EMP_NO LIKE '%-3%'
SUBSTR(EMP_NO, 8, 1) IN ('1', '3')
;

--  8) LOWER / UPPER / INITCAP : 컬럼 또는 문자열 을 소문자 / 대문자 / 첫글자만 대문자로 변환하여 리턴
SELECT LOWER('Welcome To Kh') FROM DUAL;
SELECT UPPER('Welcome To Kh') FROM DUAL;
SELECT INITCAP('Welcome To Kh') FROM DUAL;


-- 9) CONCAT : 컬럼 또는 문자열을 2개 전달받아 하나로 합친 후 리턴
SELECT CONCAT(CONCAT('가나다라', 'ABCD'),'1234') FROM DUAL;
SELECT '가나다라' || 'ABCD' || '1234' FROM DUAL;


--  10) REPLACE : 컬럼 혹은 문자열을 두 개(변경할, 변경될) 값을 받아서 변경 후 리턴
SELECT REPLACE('가나다라ABCD1234', 'ABCD', 'abcd') FROM DUAL;


-- 실습문제 
-- EMPLOYEE 테이블의 모든 직원의 이름,주민번호,Email을 출력하시오
-- 단, 출력시 Email은 kh.or.kr에서 iei.or.kr 로 변경하여 출력되게 하시오 
-- eX) sun_di@kh.or.kr -> sun_di@iei.or.kr

SELECT * FROM EMPLOYEE;
SELECT EMP_NAME, EMP_NO, REPLACE(EMAIL, 'kh','iei')
FROM EMPLOYEE;



--  숫자 처리 함수

-- 1) ABS   :   절대값
SELECT ABS(10), ABS(-10) FROM DUAL;


--  2) MOD  :   인자로 전달받은 숫자를 나누어 나머지를 구하는 함수
SELECT MOD(10, 3)  FROM DUAL;
SELECT MOD(10, 2)  FROM DUAL;
SELECT MOD(10, 4)  FROM DUAL;


--  3)  ROUND   :   반올림
SELECT ROUND(123.456, 3) FROM DUAL;     --  123.456
SELECT ROUND(123.456, 2) FROM DUAL;     --  123.46
SELECT ROUND(123.456, 1) FROM DUAL;     --  123.5
SELECT ROUND(123.456, 0) FROM DUAL;     --  123
SELECT ROUND(123.456, -1) FROM DUAL;    --  120
SELECT ROUND(123.456, -2) FROM DUAL;    --  100


--  4)  FLOOR   :   소수점 자리수를 버림
SELECT FLOOR(123.456) FROM DUAL;        --  123
SELECT FLOOR(123.956) FROM DUAL;        --  123  


--  5)  TRUNC   :   버림 -> 특정 소수점 이후를 버림 (반올림이 아니라 버림이다)
SELECT TRUNC (123.456, 1) FROM DUAL;    --  123.4
SELECT TRUNC (123.456, 2) FROM DUAL;    --  123.45
SELECT TRUNC (123.456, -1) FROM DUAL;   --  120


--  6)  CEIL : 올림
SELECT CEIL(123.456) FROM DUAL; -- 124




--  날짜 처리 함수
--  1)  SYSDATE : 시스템에 저장되어 있는 현재 날짜 반환
SELECT SYSDATE FROM DUAL;


--  2)  MONTHS_BETWEEN : 날짜 두개를 받아 개월 수 차이를 숫자형으로 리턴
SELECT EMP_NAME, HIRE_DATE, FLOOR(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)) "입사부터 현재까지 월 차이" FROM EMPLOYEE;


--  3)  ADD_MONTHS : 인자로 전달받은 날짜에 숫자만큼 개월 수를 더해서 리턴
SELECT SYSDATE, ADD_MONTHS(SYSDATE, 5) FROM DUAL;
SELECT EMP_NAME, HIRE_DATE, ADD_MONTHS(HIRE_DATE, 3) FROM EMPLOYEE;


--  4)  NEXT_DAY    :   인자로 전달받은 날짜에 인자로 전달받은 요일 중 가장 가까운 다음 날짜
--  요일  :    1 = 일요일 ~ 7 = 토요일
SELECT SYSDATE, NEXT_DAY(SYSDATE, 4) FROM DUAL;
SELECT SYSDATE, NEXT_DAY(SYSDATE, '수') FROM DUAL;



--  5)  LAST_DAY    :   인자로 전달받은 날짜가 속한 월의 마지막날
SELECT SYSDATE, LAST_DAY(SYSDATE) FROM DUAL;
SELECT SYSDATE - 10, LAST_DAY(SYSDATE - 10) FROM DUAL;


--  6)  EXTRACT :  날짜에서 년, 월, 일 정보를 추출
SELECT SYSDATE, EXTRACT(YEAR FROM SYSDATE), EXTRACT(MONTH FROM SYSDATE), EXTRACT(DAY FROM SYSDATE) FROM DUAL;



-- 실습문제
-- EMPLOYEE 테이블에서 사원의 이름,입사일,년차를 출력하여라. 
-- 단, 입사일은 YYYY년M월D일로 출력하도록 하여라.
-- 년차 출력은 소수점 일경우 올림으로 하여 출력하여라. (28.144 -> 29년차)
-- (출력시 정렬은 입사일 기준으로 오름차순)
SELECT * FROM EMPLOYEE;
SELECT EMP_NAME, EXTRACT(YEAR FROM HIRE_DATE) || '년' || EXTRACT(MONTH FROM HIRE_DATE) || '월' || EXTRACT(DAY FROM HIRE_DATE) || '일' "입사일", 
CEIL((SYSDATE - HIRE_DATE) / 365) "년차" 
FROM EMPLOYEE 
ORDER BY 입사일
;



--  형 변환 함수

--  1)  TO_CHAR :   날짜형 데이터 또는  숫자형 데이터를 문자형으로 변환
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD') FROM DUAL; 
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD/DAY') FROM DUAL; 
SELECT TO_CHAR(SYSDATE, 'YYYY/MONTH/DD') FROM DUAL; 
SELECT TO_CHAR(SYSDATE, 'YEAR/MONTH/DAY') FROM DUAL;       --  YEAR :  TWENTY TWENTY-ONE  (2021년 아님)
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD/PMHH12"시"MI"분"ss"초') FROM DUAL; 
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD/PMHH24"시"MI"분"ss"초') FROM DUAL; 
SELECT TO_CHAR(SYSDATE, 'FMYYYY/MM/DD/PMHH24"시"MI"분"ss"초') FROM DUAL;  --   FM을 붙임으로써  00월 00일 => 0월0일      으로 바뀜


-- 숫자   ->  문자
SELECT EMP_NAME, SALARY, 
TO_CHAR (SALARY, '999,999,999'),         -- 자리수를 여유있게 줘야지, 부족하게 주면 ##### 이런식으로 데이터 값이 안나옴
TO_CHAR(SALARY, '000,000,000'),          -- 000붙이면 남은 공간 000으로 채워짐
TO_CHAR (SALARY, 'L999,999,999'),        --  L을 붙이면 지금 현재 국가(프로그램 설치된 지역)의 통화 단위로 출력
TO_CHAR (SALARY, '999,999,999.999')
FROM EMPLOYEE
;

--  TO_DATE : 숫자 혹은 문자형 데이터를 날짜형 데이터로 변환하여 리턴
SELECT TO_DATE(20210805, 'YYYYMMDD') FROM DUAL;
SELECT TO_DATE('20210805', 'YYYYMMDD') FROM DUAL;       -- 문자형이나 숫자형이나 동일하게 결과값이 출력됨
SELECT TO_CHAR(TO_DATE(20210805, 'YYYYMMDD'), 'YYYY-MM-DD HH24:MI:SS') FROM DUAL;       --  TO_DATE에서 시분초 정보는 변환하지 않았기에 시분초 정보는 존재하지 않는다.


--  EMPLOYEE  테이블에서 2000년도 이후에 입사한 사원의 이름, 입사일 조회
SELECT EMP_NAME, HIRE_DATE FROM EMPLOYEE
WHERE
EXTRACT(YEAR FROM HIRE_DATE) >= 2000
;

SELECT EMP_NAME, HIRE_DATE FROM EMPLOYEE
WHERE
HIRE_DATE >= TO_DATE(20000101, 'YYYYMMDD')
;


--  3)  TO_NUMBER   :   문자형 데이터를 숫자형 데이터로 변환    //  '문자' 이런 문자형은 안됨 '123456' 이런 문자형만 가능
SELECT TO_NUMBER('1,000,000', '999,999,999') FROM DUAL;
SELECT TO_NUMBER('123') FROM DUAL;

SELECT '1000'+'100' FROM DUAL;          --  자바("1000" + "100" = "1000100")와 다르게 SQL은 문자열을 보고 숫자면 산술 연산이 진행됨
SELECT '1000' || '100' FROM DUAL;




--  기타함수
--  1) NVL  :   NULL로 되어있는 컬럼값을 지정한 숫자 혹은 문자로 변경하여 리턴           //     단, 컬럼값 데이터 타입과 같아야한다. -> (문자열, 문자열) / (숫자, 숫자)
SELECT EMP_NAME, NVL(DEPT_CODE, '부서없음') FROM EMPLOYEE;
SELECT EMP_NAME, SALARY, BONUS, SALARY + SALARY * NVL(BONUS, 0)  FROM EMPLOYEE;


--  2)  DECODE  :   선택함수    ->  여러가지 경우에 선택을 할 수 있는 기능 제공(SWITCH 유사)
SELECT EMP_NAME, EMP_NO, DECODE(SUBSTR(EMP_NO, 8, 1),'1', '남', '2', '여', '3', '남', '4', '여','???') 성별 FROM EMPLOYEE;    -- 값 안에 '???' 이 부분은 자바 SWITCH 문에서 default 값이라고 생각하면 됨. 
SELECT EMP_NAME, EMP_NO, DECODE(SUBSTR(EMP_NO, 8, 1),'1', '남', '여') 성별 FROM EMPLOYEE; 


--  3)  CASE    :   선택함수    ->  여러가지 경우에 선택을 할 수 있는 기능 제공 (범위값 가능   ->  IF - ELSE IF   유사)
SELECT EMP_NAME, EMP_NO,
    CASE
                WHEN SUBSTR(EMP_NO, 1, 2) < 65 THEN '60년대 초반'
                WHEN SUBSTR(EMP_NO, 1, 2) >= 65 THEN '60년대 후반'
                ELSE '둘다아님'
    END
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO, 1, 2) BETWEEN 60 AND 69;





--  그룹함수        ==> NULL값은 연산에 포함되지 않는다!!!, NULL 값을 포함해서 연산하려면 NVL 같은 함수와 같이 사용해야됨

--  1)  SUM :   해당 컬럼의 총 합을 구하는 함수
SELECT SUM(SALARY) FROM EMPLOYEE;
SELECT SUM(SALARY) FROM EMPLOYEE WHERE DEPT_CODE = 'D9';
SELECT EMP_NAME, SUM(SALARY) FROM EMPLOYEE WHERE DEPT_CODE = 'D9';      -- 결과값이 나오는 ROW(행)의 갯수가 다른 값이랑 맞지 않아 오류남, 이러한 이유로 일반 컬럼과 같이 사용할 수 없다.


--  2)  AVG :   해당 컬럼의 평균을 구하는 함수
SELECT ROUND(AVG(SALARY),2) FROM EMPLOYEE;
SELECT AVG(BONUS) FROM EMPLOYEE;  
SELECT AVG(NVL(BONUS, 0)) FROM EMPLOYEE;        -- NULL 값을 0으로 바꿔 연산함.


--  3)  COUNT   :   테이블에서 조건을 만족하는 행의 개수를 반환
SELECT COUNT (SALARY) FROM EMPLOYEE;
SELECT COUNT (*) FROM EMPLOYEE;     --  어차피 행의 갯수를 세는 거니 전체를 지칭하는 * 기호를 사용해도 됨.
SELECT COUNT (*) FROM EMPLOYEE WHERE DEPT_CODE = 'D9';
SELECT COUNT(DEPT_CODE) FROM EMPLOYEE;


--  4)  MAX / MIN   :   최대값, 최소값
SELECT MAX(SALARY), MIN(SALARY) FROM EMPLOYEE;
SELECT MAX(HIRE_DATE), MIN(HIRE_DATE) FROM EMPLOYEE;

