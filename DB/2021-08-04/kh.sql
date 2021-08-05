--  EMPLOYEE 테이블의 모든 컬럼을 조회
SELECT * FROM EMPLOYEE;

--  EMPLOYEE 테이블에서 사번, 이름, 전화번호 조회
SELECT EMP_ID, EMP_NAME, PHONE FROM EMPLOYEE;
SELECT  EMP_NAME, EMP_ID, PHONE FROM EMPLOYEE;

-- EMPLOYEE 테이블에서 이름, 이메일, 급여, 주민번호 조회
SELECT  EMP_NAME, EMAIL, SALARY, EMP_NO FROM EMPLOYEE;

-- EMPLOYEE 테이블에서 이름이 송종기인 직원의 모든 정보를 조회
SELECT * FROM EMPLOYEE WHERE EMP_NAME ='송종기';

--  EMPLOYEE 테이블에서 부서코드가 D6인 직원의 이름, 전화번호, 급여
SELECT EMP_NAME, PHONE, SALARY FROM EMPLOYEE WHERE DEPT_CODE = 'D6'; 

-- EMPLOYEE 테이블에서 부서코드가 D6인 직원의 이름, 전화번호, 급여(연봉) 조회
SELECT EMP_NAME, PHONE, SALARY*12 FROM EMPLOYEE WHERE DEPT_CODE = 'D6'; 

-- EMPLOYEE 테이블에서 부서코드가 D6인 직원의 이름, 전화번호, 급여(연봉) 조회
SELECT EMP_NAME, PHONE, SALARY*12 AS 연봉, '원'  단위 FROM EMPLOYEE WHERE DEPT_CODE = 'D6';  
SELECT EMP_NAME, PHONE, SALARY*12 AS "세금을 포함한 연봉", '원'  단위 FROM EMPLOYEE WHERE DEPT_CODE = 'D6';  
--  -> 별칭을 정할때 띄어쓰기를 하려면 ' ' 가 아닌 "" 를 써야한다!    , 추가로 AS는 생략가능
--  -> 싱글쿼터(' ') 는 생략가능
-- -> AS 생략가능

--  EMPLOYEE 테이블에서 부서코드 조회
SELECT DEPT_CODE FROM EMPLOYEE;

SELECT DISTINCT DEPT_CODE FROM EMPLOYEE;
SELECT DISTINCT EMP_NAME, DEPT_CODE FROM EMPLOYEE; -- DISTINCT 는 제시한 조건들이 둘다 겹칠 경우 중복제거를 해주고 아니라면 중복제거가 안됨

-- 연결 연산자 | |
SELECT EMP_NAME, PHONE, SALARY*12 | | '원' AS"세금을 포함한 연봉" FROM EMPLOYEE WHERE DEPT_CODE = 'D6';  


-- EMPLOYEE 테이블에서 부서코드가 D6인 직원 중 급여가 300만원 이상인 직원의 이름, 전화번호, 부서코드, 급여를 조회
SELECT EMP_NAME, PHONE, DEPT_CODE, SALARY FROM EMPLOYEE WHERE DEPT_CODE = 'D6' AND SALARY >= 3000000;
-- EMPLOYEE 테이블에서 부서코드가 D6인 직원 또는 급여가 300만원 이상인 직원의 이름, 전화번호, 부서코드, 급여를 조회
SELECT EMP_NAME, PHONE, DEPT_CODE, SALARY FROM EMPLOYEE WHERE DEPT_CODE = 'D6' OR SALARY >= 3000000;



--  급여를 350만원 이상 600만원 이하로 받는 직원의 이름, 급여
SELECT EMP_NAME, SALARY FROM EMPLOYEE WHERE SALARY >= 3500000 AND SALARY <= 6000000;
SELECT EMP_NAME, SALARY FROM EMPLOYEE WHERE SALARY BETWEEN  3500000 AND  6000000;

--  EMPLOYEE 테이블에서 입사일 09/01/01 ~ 01/01/01 인 사원의 전체정보 조회
SELECT * FROM EMPLOYEE WHERE HIRE_DATE BETWEEN '90/01/01' AND '01/01/01'; 


--  LIKE / NOT LIKE
--  이름 중 성이 '전'씨인 직원의 이름, 급여 조회
--  와일드카드 : 아무거나 대체해서 사용할 수 있는 것        전XX
--  ->  _ :  한 문자 와일드카드
--  ->  % : 글자 수와 상관없는 와일드카드
SELECT EMP_NAME, SALARY FROM EMPLOYEE WHERE EMP_NAME LIKE '전__';
SELECT EMP_NAME, SALARY FROM EMPLOYEE WHERE EMP_NAME LIKE '전%';
--  이름 중 성이 '전'씨가 아닌 직원의 이름, 급여 조회
SELECT EMP_NAME, SALARY FROM EMPLOYEE WHERE EMP_NAME NOT LIKE '전%';
--  이름에 '하' 포함되어 있는 직원의 이름, 급여 조회
SELECT EMP_NAME, SALARY FROM EMPLOYEE WHERE EMP_NAME LIKE '%하%';
--  이름 가운데 '하' 포함되어 있는 직원의 이름, 급여 조회
SELECT EMP_NAME, SALARY FROM EMPLOYEE WHERE EMP_NAME LIKE '_하_';

--  EMAIL 앞에 글씨가 3글자인 직원의 이름, 이메일 조회
SELECT EMP_NAME, EMAIL FROM EMPLOYEE WHERE EMAIL LIKE '___#_%'ESCAPE'#';


--  1.  EMPLOYEE 테이블에서 이름 끝이 연으로 끝나는 사원의 이름 출력
SELECT EMP_NAME FROM EMPLOYEE WHERE EMP_NAME LIKE '%연';
--  2.  EMPLOYEE 테이블에서 전화번호 처음 3자리가 010이 아닌 사원의 이름, 전화번호 출력
SELECT EMP_NAME, PHONE FROM EMPLOYEE WHERE PHONE NOT LIKE '010%';
--  3.  EMPLOYEE 테이블에서 매일 주소에 's'가 들어가면서 , DEPT_CODE는 D9 또는 D6 이며, 고용일 90/01/01 ~ 00/12/01 이면서 급여가 270만원 이상인 사원의 전체정보
SELECT * FROM EMPLOYEE 
WHERE 
(EMAIL LIKE '%s%') AND 
(DEPT_CODE = 'D9' OR DEPT_CODE ='D6') AND 
(HIRE_DATE BETWEEN '90/01/01' AND '00/12/01') AND 
SALARY >= 2700000;

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


