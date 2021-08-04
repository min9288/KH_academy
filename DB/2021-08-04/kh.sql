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