--  EMPLOYEE 테이블의 모든 컬럼을 조회
SELECT * FROM EMPLOYEE;


--  실습 문제 1.
--  직원명과 이메일, 이메일 길이를 출력하시오.
SELECT EMP_NAME 직원명, EMAIL 이메일, LENGTH(EMAIL) 이메일길이 FROM EMPLOYEE;

--  실습 문제 2.
--  직원의 이름과 이메일 주소 중 아이디 부분만 출력하시오.
SELECT EMP_NAME 이름, SUBSTR(EMAIL, 1, INSTR(EMAIL, '@') - 1) AS "이메일 아이디" FROM EMPLOYEE;

--  실습 문제 3.
--  60년생의 직원명과 년생, 보너스 값을 출력하시오
--  그때 보너스 값이 NULL인 경우에는  0 이라고 출력 되게 만드시오
SELECT EMP_NAME 직원명, SUBSTR(EMP_NO, 1, 2) 년생, NVL(BONUS, 0) 보너스 FROM EMPLOYEE
WHERE
SUBSTR(EMP_NO, 1, 2) BETWEEN 60 AND 69;

--  실습 문제 4.
--  '010' 핸드폰 번호를 쓰지 않는 사람의 수를 출력하시오 (뒤에 단위는 명을 붙이시오)
 SELECT COUNT(PHONE) 인원 FROM EMPLOYEE
 WHERE
 SUBSTR(PHONE, 1, 3) != 010;
 
-- 실습 문제 5.
--  직원명과 입사년월을 출력하시오
--  단, 아래와 같이 출력되도록 만들어 보시오
--  직원명        입사년월
--  전지연        1997년 3월
SELECT EMP_NAME 직원명, EXTRACT(YEAR FROM HIRE_DATE)||'년' ||LPAD(EXTRACT(MONTH FROM HIRE_DATE), 2)||'월' 입사년월 
FROM EMPLOYEE;

--  실습 문제 6.
--  직원명과 주민번호를 조회하시오
--  단, 주민번호 9번째 자리부터 끝까지는 '*' 문자로 채워서 출력 하시오
SELECT EMP_NAME 직원명,  RPAD(SUBSTR(EMP_NO, 1, 8), 14, '*') 주민등록번호 FROM EMPLOYEE;

--  실습 문제 7.
--  직원명, 직급코드, 연봉(원) 조회
--  단, 연봉은 \57,000,000 으로 표시되게 함
--  연봉은 보너스포인트가 적용된 1년치 급여임
SELECT EMP_NAME 직원명, JOB_CODE, TO_CHAR((SALARY+SALARY * NVL(BONUS, 0))*12, 'L999,999,999') AS "연봉(원)"
FROM EMPLOYEE;

--  실습 문제 8.
--  부서코드가 D5, D9인 직원들 중에서 2004년도에 입사한 직원의 수 조회함.
--  사번 사원명 부서코드 입사일
SELECT EMP_ID 사번, EMP_NAME 사원명, DEPT_CODE 부서코드, HIRE_DATE 입사일 FROM EMPLOYEE
WHERE
DEPT_CODE IN ('D5', 'D9') AND EXTRACT(YEAR FROM HIRE_DATE) = 2004
;

--  실습 문제 9.
--  직원명, 입사일, 오늘까지의 근무일수 조회
--  * 주말도 포함, 소수점 아래는 버림
SELECT EMP_NAME 직원명, HIRE_DATE 입사일, FLOOR(SYSDATE - HIRE_DATE) AS "총 근무일수" FROM EMPLOYEE
ORDER BY 입사일;

--  실습 문제 10.
--  모든 직원의 나이 중 가장 많은 나이와 가장 적은 나이를 출력 하라 (나이만 출력)
--  풀이 1)
SELECT 
MAX(CEIL(MONTHS_BETWEEN(SYSDATE, TO_DATE('19'||SUBSTR(EMP_NO, 1, 2), 'YYYY')) / 12)) "최대 나이",
MIN(CEIL(MONTHS_BETWEEN(SYSDATE, TO_DATE('19'||SUBSTR(EMP_NO, 1, 2), 'YYYY')) / 12)) "최소 나이"
FROM EMPLOYEE;
--  풀이 2)
SELECT
    MAX(EXTRACT(YEAR FROM SYSDATE)  -  (SUBSTR(EMP_NO, 1, 2) + 1900))  +  1 최대나이,
    MIN(EXTRACT(YEAR FROM SYSDATE) - (SUBSTR(EMP_NO, 1, 2) + 1900)) + 1 최대나이
FROM EMPLOYEE;

--  실습 문제 11.
--  회사에서 야근을 해야 되는 부서를 발표해야 한다.
--  부서코드가 D5, D6, D9 야근, 그외는 야근없음 으로 출력되도록 한다.
--  출력 값은 이름, 부서코드, 야근유무 (부서코드 기준 오름차순 정렬함.)
--  (부서코드가 NULL 인 사람도 야근없음 으로 해야됨)

--  풀이 1)
SELECT EMP_NAME 직원명, DEPT_CODE 부서코드,
DECODE(DEPT_CODE, 'D5', '야근', 'D6', '야근', 'D9', '야근', '야근없음')  야근유무
FROM EMPLOYEE
ORDER BY DEPT_CODE;

--  풀이 2)
SELECT EMP_NAME 직원명, DEPT_CODE 부서코드,
    CASE
            WHEN DEPT_CODE IN ('D5', 'D6', 'D9') THEN '야근'
            ELSE '야근없음'
    END
    야근유무
FROM EMPLOYEE ORDER BY DEPT_CODE;


--  실습 문제 12.
--  부서코드가 D5이면 총무부, D6이면 기획부, D9이면 영업부로 처리하시오.
--  단, 부서코드가 D5, D6, D9 인 직원의 정보만 조회함
--  부서코드 기준 오름차순 정렬함.
SELECT EMP_NAME 직원명, DEPT_CODE 부서코드, 
DECODE(DEPT_CODE, 'D5', '총무부', 'D6', '기획부', 'D9', '영업부') 부서명
FROM EMPLOYEE
WHERE 
DEPT_CODE IN ('D5', 'D6', 'D9') 
ORDER BY DEPT_CODE;


--  실습 문제 13.
--  직원명, 부서코드, 생년월일, 나이 조회
--  단, 생년월일은 주민번호에서 추출해서, 
--  00년 00월 00일로 출력되게 함.
--  나이는 주민번호에서 추출해서 날짜데이터로 변환한 다음, 계산함
--  *   주민번호가 이상한 사람들은 제외시키고 진행 (200, 201, 214 번 제외)
--  *   힌트 : NOT IN 사용
--  풀이 1)
SELECT EMP_NAME 직원명, DEPT_CODE 부서코드,
    SUBSTR(EMP_NO, 1, 2)||'년 '|| SUBSTR(EMP_NO, 3, 2)||'월 '||
    SUBSTR(EMP_NO, 5, 2)||'일' 생년월일,
    CEIL(MONTHS_BETWEEN (SYSDATE, TO_DATE('19'||TO_DATE(SUBSTR(EMP_NO, 1, 2), 'YYYY'))) / 12) 나이
FROM EMPLOYEE
WHERE
EMP_ID NOT IN(200, 201, 214)
;
-- 풀이 2)
SELECT EMP_NAME 직원명, DEPT_CODE 부서코드,
    SUBSTR(EMP_NO, 1, 2) || '년' || SUBSTR(EMP_NO, 3, 2) || '월' || SUBSTR(EMP_NO, 5, 2) || '일' 생년월일,
    EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM TO_DATE(SUBSTR(EMP_NO, 1 ,6), 'RRMMDD'))+1 나이
FROM EMPLOYEE
WHERE EMP_ID NOT IN(200, 201, 214)
;

--  실습 문제 14.
--  직원들의 입사일로 부터 년도만 가지고, 각 년도별 입사인원수를 구하시오.
--  1998~2004 년도에 입사한 인원수를 조회하시오. 마지막으로 전체직원수도 구하시오.

--  풀이 1)
--COUNT를 사용하는 방법. COUNT는 NULL인 경우만 세지 않으므로 0도 카운트 되기에 DECODE를 할 때 0을 넣지 않는다.
SELECT 
    COUNT(DECODE(TO_CHAR(HIRE_DATE, 'YYYY'), 1998, 1)) "1998년",
    COUNT(DECODE(TO_CHAR(HIRE_DATE, 'YYYY'), 1999, 1)) "1999년",
    COUNT(DECODE(TO_CHAR(HIRE_DATE, 'YYYY'), 2000, 1))" 2000년",
    COUNT(DECODE(TO_CHAR(HIRE_DATE, 'YYYY'), 2001, 1)) "2001년",
    COUNT(DECODE(TO_CHAR(HIRE_DATE, 'YYYY'), 2002, 1)) "2002년",
    COUNT(DECODE(TO_CHAR(HIRE_DATE, 'YYYY'), 2003, 1)) "2003년",
    COUNT(DECODE(TO_CHAR(HIRE_DATE, 'YYYY'), 2004, 1)) "2004년",
    COUNT(*) 전체직원수
FROM EMPLOYEE;

--  풀이 2)
--  SUM을 사용하는 방법. SUM을 할 때는 한개라도 NULL이 들어가면 더해지는 값도 NULL로 처리되기에 DECODE를 할 때 0을 넣는다.
SELECT
    SUM(DECODE(EXTRACT(YEAR FROM HIRE_DATE), 1998, 1, 0)) "1998년",
    SUM(DECODE(EXTRACT(YEAR FROM HIRE_DATE), 1999, 1, 0)) "1999년",
    SUM(DECODE(EXTRACT(YEAR FROM HIRE_DATE), 2000, 1, 0)) "2000년",
    SUM(DECODE(EXTRACT(YEAR FROM HIRE_DATE), 2001, 1, 0)) "2001년",
    SUM(DECODE(EXTRACT(YEAR FROM HIRE_DATE), 2002, 1, 0)) "2002년",
    SUM(DECODE(EXTRACT(YEAR FROM HIRE_DATE), 2003, 1, 0)) "2003년",
    SUM(DECODE(EXTRACT(YEAR FROM HIRE_DATE), 2004, 1, 0)) "2004년",
    COUNT(*) 전체직원수
    FROM EMPLOYEE;
--  풀이 3)
SELECT 
    NVL(SUM(DECODE(TO_CHAR(HIRE_DATE, 'YYYY'), 1998, 1)), 0) AS "1998년",
    NVL(SUM(DECODE(TO_CHAR(HIRE_DATE, 'YYYY'), 1999, 1)), 0) AS "1999년",
    NVL(SUM(DECODE(TO_CHAR(HIRE_DATE, 'YYYY'), 2000, 1)), 0) AS "2000년",
    NVL(SUM(DECODE(TO_CHAR(HIRE_DATE, 'YYYY'), 2001, 1)), 0) AS "2001년",
    NVL(SUM(DECODE(TO_CHAR(HIRE_DATE, 'YYYY'), 2002, 1)), 0) AS "2002년",
    NVL(SUM(DECODE(TO_CHAR(HIRE_DATE, 'YYYY'), 2003, 1)), 0) AS "2003년",
    NVL(SUM(DECODE(TO_CHAR(HIRE_DATE, 'YYYY'), 2004, 1)), 0) AS "2004년",
    COUNT(*) AS "전체직원수"
FROM EMPLOYEE;


--  GROUP BY
SELECT DEPT_CODE, COUNT(*), FLOOR(AVG(SALARY))FROM EMPLOYEE 
GROUP BY DEPT_CODE
ORDER BY 3;

--  GROUP BY에 위의 함수를 가져다 사용해도 된다.
SELECT
    DECODE(SUBSTR(EMP_NO, 8, 1), 1, '남', 2, '여') 성별,
    FLOOR(AVG(SALARY))급여평균,
    COUNT(*) 인원수
FROM EMPLOYEE
GROUP BY DECODE(SUBSTR(EMP_NO, 8, 1), 1, '남', 2, '여');


--  급여가 300만원 이상인 직원의 부서코드별 평균
-- 처리순서!
-- 1) WHERE SALARY >= 3000000
-- 2) FLOOR(AVG(SALARY)) 평균급여
-- > 연산시 처리순서를 고려안하고 코드를 짜면 원하는 값이 안나오니 꼭 주의..!
-- > 그룹 함수 동작 전
SELECT
    DEPT_CODE, FLOOR(AVG(SALARY)) 평균급여
FROM EMPLOYEE
WHERE SALARY >= 3000000
GROUP BY DEPT_CODE;

-- 부서별 전체 직원의 평균급여를 구하고, 그중에 평균급여 300만원 이상인 부서만 출력
-- > 그룹 함수 동작 후
-- > 처리 순서는, 
-- 1) WHERE
-- 2) GROUP BY
-- 3) HAVING
SELECT
    DEPT_CODE, FLOOR(AVG(SALARY)) 평균급여
FROM EMPLOYEE
GROUP BY DEPT_CODE;
HAVING FLOOR(AVG(SALARY)) >= 3000000;

SELECT COUNT(*) FROM EMPLOYEE WHERE DEPT_CODE = 'D9';
SELECT SALARY FROM EMPLOYEE WHERE DEPT_CODE = 'D1';
SELECT FLOOR(AVG(SALARY)) FROM EMPLOYEE WHERE DEPT_CODE = 'D1';


--=============================================================================
--  JOIN

SELECT EMP_NAME, DEPT_CODE FROM EMPLOYEE;
SELECT * FROM DEPARTMENT;

-- 오라클 전용구문(비교하는 컬럼의 이름이 다른경우)
SELECT EMP_NAME, DEPT_CODE, DEPT_TITLE
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_CODE = DEPT_ID;

-- 표준구문(비교하는 컬럼의 이름이 다른경우)
SELECT EMP_NAME, DEPT_CODE, DEPT_TITLE
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);
------------------------------------------------------------------------------

SELECT EMP_NAME, JOB_CODE FROM EMPLOYEE;
SELECT * FROM JOB;

--  오라클 전용 (비교하는 컬럼 이름이 같은 경우)
SELECT EMP_NAME, EMPLOYEE.JOB_CODE, JOB_NAME
FROM EMPLOYEE, JOB
WHERE EMPLOYEE.JOB_CODE = JOB.JOB_CODE;
--  오라클 전용 (비교하는 컬럼 이름이 같은 경우) + 별칭 이용
SELECT EMP_NAME, E.JOB_CODE, JOB_NAME
FROM EMPLOYEE E, JOB J
WHERE E.JOB_CODE = J.JOB_CODE;

-- 표준문법 (비교하는 컬럼 이름이 같은 경우), 별칭사용
SELECT EMP_NAME, E.JOB_CODE, JOB_NAME
FROM EMPLOYEE E
JOIN JOB J ON (E.JOB_CODE = J.JOB_CODE);
-- 표준문법 (비교하는 컬럼 이름이 같은 경우) + USING 두 테이블에서 제시한 같은 값 가져오기 (컬럼명이 다른경우 사용불가)
SELECT EMP_NAME, JOB_CODE, JOB_NAME
FROM EMPLOYEE 
JOIN JOB USING (JOB_CODE);
-------------------------------------------------------------------------------
-- 내부조인
-- 두 개 이상의 테이블을 조인할 때 일치하는 값이 없는 행이 조인에서 제외되는 것
SELECT EMP_NAME, DEPT_CODE, DEPT_TITLE
FROM EMPLOYEE
INNER JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);

--  외부조인
-- 두개 이상의 테이블을 조인할 때, 일치하는 값이 없는 행도 조인에 포함시키는 것

-- 1) LEFT JOIN  --외부조인 중 가장 많이 사용됨
-- LEFT는 먼저 온 테이블(FROM)은 출력을 하고, 나중에 온 테이블(JOIN)은 출력하지 않는다.
SELECT EMP_NAME, DEPT_CODE, DEPT_TITLE
FROM EMPLOYEE LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);

-- 2) RIGHT JOIN
-- RIGHT는 나중에 온 테이블(JOIN)은 출력을 하고, 먼저 온 테이블(FROM)은 출력하지 않는다.
SELECT EMP_NAME, DEPT_CODE, DEPT_TITLE
FROM EMPLOYEE RIGHT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);

-- 3) FULL JOIN (완전 외부 조인)
-- FULL은 양쪽 모두 출력을 한다.
SELECT EMP_NAME, DEPT_CODE, DEPT_TITLE
FROM EMPLOYEE FULL JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);

-- 상호조인 CROSS JOIN, Cartensian Product
-- 카테이션 곱(Ccarensian prjuct)라고도 하며, 조인되는 테이블의 각 행들이 모두 매핑된 데이터가 검색되는 조인
SELECT EMP_NAME, DEPT_TITLE
FROM EMPLOYEE
CROSS JOIN DEPARTMENT;


-- SELF JOIN (자기자신 테이블과 조인)
-- 같은 테이블 내에서 JOIN이 필요한 경우 사용을 한다.
-- 테이블 이름에 별칭을 입력하여 JOIN을 사용한다.

-- 모든 직원의 관리자 ID를 확인
SELECT EMP_NAME, MANAGER_ID FROM EMPLOYEE;
-- 모든 직원의 관리자 ID, 관리자 이름을 조회
SELECT E1.EMP_NAME 사원명, E1.EMP_ID 사번, E2.EMP_NAME 매니저이름 
FROM EMPLOYEE E1
JOIN EMPLOYEE E2 ON (E1.MANAGER_ID = E2.EMP_ID);
-- 모든 직원의 관리자 ID, 관리자 이름을 조회 (관리자 할당 안된 직원도 조회)
SELECT E1.EMP_NAME 사원명, E1.EMP_ID 사번, NVL(E2.EMP_NAME,'관리가안됨') 매니저이름 
FROM EMPLOYEE E1
LEFT JOIN EMPLOYEE E2 ON (E1.MANAGER_ID = E2.EMP_ID);


-- 다중조인 : 여러개 테이블을 한번에 조인
-- 여러개의 테이블을 JOIN을 하고 싶다면 먼저 JOIN을 한 뒤 뒤에 JOIN을 추가로 진행하면 된다.
-- JOIN은 위에서부터 차례대로 진행하게 되므로 JOIN의 순서가 중요하다. (테이블끼리 서로 연관이 있다면)
-- 메인테이블 말고 다른 JOIN할 테이블끼리 서로 연관이 없다면 순서는 상관없다.
 SELECT EMP_NAME, DEPT_CODE, DEPT_TITLE, JOB_CODE, JOB_NAME
 FROM EMPLOYEE
 JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
 JOIN JOB USING(JOB_CODE);
 
 SELECT EMP_NAME, DEPT_CODE, DEPT_TITLE, JOB_CODE, JOB_NAME
 FROM EMPLOYEE
 LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
 LEFT JOIN JOB USING(JOB_CODE);
 
 SELECT EMP_NAME, DEPT_CODE, DEPT_TITLE
 FROM EMPLOYEE
 JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);
 
SELECT EMP_NAME, JOB_CODE, JOB_NAME
 FROM EMPLOYEE
 JOIN JOB USING (JOB_CODE);
 
-- 메인테이블 말고 다른 JOIN할 테이블끼리 서로 연관이 없다면 순서는 상관없다.
SELECT EMP_NAME, DEPT_TITLE, JOB_NAME
FROM EMPLOYEE
JOIN JOB USING(JOB_CODE);
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)

-- 아래 코드처럼 서로 연관이 있는 테이블끼리는 순서가 중요하다.
SELECT EMP_NAME, DEPT_CODE FROM EMPLOYEE;
SELECT * FROM DEPARTMENT;
SELECT * FROM LOCATION;

SELECT EMP_NAME, DEPT_CODE, DEPT_TITLE, NATIONAL_CODE
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
JOIN LOCATION ON (LOCATION_ID = LOCAL_CODE);

--------------------------------------------------------------------------
SELECT * FROM EMPLOYEE;
SELECT * FROM DEPARTMENT;
SELECT * FROM JOB;
SELECT * FROM LOCATION;
SELECT * FROM NATIONAL;

-- 조인 실습문제 1)
-- 주민번호가 1970년대 생이면서 성별이 여자이고, 성이 전씨인 직원들의
-- 사원명, 주민번호, 부서명, 직급명을 조회하시오.
SELECT EMP_NAME 사원명, EMP_NO 주민번호, DEPT_TITLE 부서명, JOB_NAME 직급명
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
JOIN JOB USING (JOB_CODE)
WHERE
(SUBSTR(EMP_NO, 1, 2) BETWEEN 70 AND 79) AND
(SUBSTR(EMP_NO, 8, 1) = 2) AND(EMP_NAME LIKE '전%')
;

-- 조인 실습문제 2)
-- 이름에 '형'자가 들어가는 직원들의 사번, 사원명, 부서명을 조회하시오.
SELECT EMP_ID 사번, EMP_NAME 사원명, DEPT_TITLE 부서명
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
WHERE
EMP_NAME LIKE '%형%'
;

-- 조인 실습문제 3)
-- 해외영업부에 근무하는 사원명, 직급명, 부서코드, 부서명을 조회하시오
SELECT EMP_NAME 사원명, JOB_NAME 직급명, DEPT_CODE 부서코드, DEPT_TITLE 부서명
FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
LEFT JOIN JOB USING (JOB_CODE)
WHERE
DEPT_TITLE LIKE '해외영업%'
;

-- 조인 실습문제 4)
-- 보너스포인트를 받는 직원들의 사원명, 보너스포인트, 부서명, 근무 지역명을 조회하시오.
SELECT EMP_NAME 사원명, BONUS 보너스, DEPT_TITLE 부서명, LOCAL_NAME 근무지역명
FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
LEFT JOIN LOCATION ON(LOCATION_ID = LOCAL_CODE)
WHERE
BONUS IS NOT NULL
;

-- 조인 실습문제 5)
-- 부서코드가 D2인 직원들의 사원명, 직급명, 부서명, 근무지역명을 조회하시오.
SELECT EMP_NAME 사원명, JOB_NAME 직급명 , DEPT_TITLE 부서명, LOCAL_NAME 근무지역명
FROM EMPLOYEE
JOIN JOB USING (JOB_CODE) 
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
JOIN LOCATION ON(LOCATION_ID = LOCAL_CODE)
WHERE
DEPT_CODE = 'D2'
;

-- 조인 실습문제 6)
-- 한국(KO)과 일본(JP)에 근무하는 직원들의 사원명, 부서명, 지역명, 국가명을 조회하시오.
SELECT EMP_NAME 사원명, DEPT_TITLE 부서명, LOCAL_NAME 근무지역명, NATIONAL_NAME 국가명
FROM EMPLOYEE 
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
JOIN LOCATION ON(LOCATION_ID = LOCAL_CODE)
JOIN NATIONAL USING (NATIONAL_CODE)
WHERE
NATIONAL_CODE IN ('KO', 'JP')
;

-- 조인 실습문제 7)
-- 같은 부서에 근무하는 직원들의 사원명, 부서명, 동료이름을 조회하시오.
SELECT E1.EMP_NAME 사원명, DEPT_TITLE 부서명, E2.EMP_NAME 동료이름
FROM EMPLOYEE E1
JOIN EMPLOYEE E2 USING (DEPT_CODE)
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
WHERE
E1.EMP_NAME != E2.EMP_NAME
;

-- 조인 실습문제 8)
-- 직급이 차장과 사원인 직원들의 사원명, 직급명, 급여를 조회하시오.
-- 단, JOIN과 IN 사용할 것
SELECT EMP_NAME 사원명, JOB_NAME 직급명, SALARY 급여
FROM EMPLOYEE
JOIN JOB USING(JOB_CODE)
WHERE
JOB_NAME IN ('차장', '사원')
;