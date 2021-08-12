-- 프로시저를 사용하여 출력하는 내용을 화면에 보여주도록하는 설정 (DEFAULT : OFF)
SET SERVEROUTPUT ON;    


BEGIN       --  실행부분
    DBMS_OUTPUT.PUT_LINE('HELLO ORACLE');       --  실행될 프로시져
END;        -- 끝
/           -- 실행





DECLARE
    ID  NUMBER;
BEGIN
    SELECT EMP_ID
    INTO ID
    FROM EMPLOYEE
    WHERE EMP_NAME = '선동일';
    DBMS_OUTPUT.PUT_LINE(ID);
EXCEPTION
    WHEN NO_DATA_FOUND THEN DBMS_OUTPUT.PUT_LINE('NO DATA!!');
END;
/



-- 사원번호 입력해서, 이름, 부서명, 직급명 출력

DECLARE
    NAME            VARCHAR2(20);
    D_TITLE         VARCHAR2(30);
    J_NAME          VARCHAR2(30);
BEGIN
    SELECT EMP_NAME, DEPT_TITLE, JOB_NAME
    INTO NAME, D_TITLE, J_NAME
    FROM EMPLOYEE
    LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
    LEFT JOIN JOB USING (JOB_CODE)
    WHERE EMP_ID = '&사원번호';
    DBMS_OUTPUT.PUT_LINE('이름 : '||NAME);
    DBMS_OUTPUT.PUT_LINE('부서명 : '||D_TITLE);
    DBMS_OUTPUT.PUT_LINE('직급명 : '||J_NAME);
END;
/


DECLARE
    DATA1   NUMBER;
    DATA2   VARCHAR2(20);
    DATA3   VARCHAR2(20)    := '초기화';
BEGIN
    DATA1 := 100;
    DATA2 := '&입력';
    DBMS_OUTPUT.PUT_LINE(DATA1);
    DBMS_OUTPUT.PUT_LINE(DATA2);
    DBMS_OUTPUT.PUT_LINE(DATA3);
END;
/


CREATE TABLE TEST_EMP
AS
SELECT EMP_ID, EMP_NAME, DEPT_CODE, JOB_CODE
FROM EMPLOYEE WHERE 1 = 0;

SELECT * FROM TEST_EMP;

DECLARE
    ID      NUMBER;
    NAME    VARCHAR2(20);
    D_CODE  VARCHAR2(10);
    J_CODE  VARCHAR2(10);
BEGIN
    ID := 100;
    NAME := '이윤수';
    D_CODE := 'D9';
    J_CODE := 'J7';
    INSERT INTO TEST_EMP VALUES (ID, NAME, D_CODE, J_CODE);
END;
/



DECLARE
    ID      NUMBER;
    NAME    VARCHAR2(20);
    D_CODE  VARCHAR2(10);
    J_CODE  VARCHAR2(10);
BEGIN
    ID := '&사번';
    NAME := '&이름';
    D_CODE := '&부서코드';
    J_CODE := '&직급코드';
    INSERT INTO TEST_EMP VALUES (ID, NAME, D_CODE, J_CODE);
END;
/


DECLARE
    ID      NUMBER;
    NAME    VARCHAR2(20);
    D_CODE  VARCHAR2(10);
    J_CODE  VARCHAR2(10);
BEGIN
    SELECT EMP_ID, EMP_NAME, DEPT_CODE, JOB_CODE
    INTO ID, NAME, D_CODE, J_CODE
    FROM EMPLOYEE
    WHERE EMP_ID = '&사번';
    INSERT INTO TEST_EMP VALUES (ID, NAME, D_CODE, J_CODE);
END;
/


DECLARE
    ID      EMPLOYEE.EMP_ID%TYPE;
    NAME    EMPLOYEE.EMP_NAME%TYPE;
    D_CODE  EMPLOYEE.DEPT_CODE%TYPE;
    J_CODE  EMPLOYEE.JOB_CODE%TYPE;
BEGIN
    SELECT EMP_ID, EMP_NAME, DEPT_CODE, JOB_CODE
    INTO ID, NAME, D_CODE, J_CODE
    FROM EMPLOYEE WHERE EMP_ID = '&사번';
    DBMS_OUTPUT.PUT_LINE('사번 : ' || ID);
    DBMS_OUTPUT.PUT_LINE('이름 : ' || NAME);
    DBMS_OUTPUT.PUT_LINE('부서코드 : ' || D_CODE);
    DBMS_OUTPUT.PUT_LINE('직급코드 : ' || J_CODE);
END;
/


DECLARE
    USERINFO    EMPLOYEE%ROWTYPE;
BEGIN
    SELECT EMP_ID, EMP_NAME, DEPT_CODE, JOB_CODE
    INTO USERINFO.EMP_ID, USERINFO.EMP_NAME, USERINFO.DEPT_CODE, USERINFO.JOB_CODE
    FROM EMPLOYEE
    WHERE EMP_ID = '&사번';
    DBMS_OUTPUT.PUT_LINE('사번 : ' || USERINFO.EMP_ID);
    DBMS_OUTPUT.PUT_LINE('이름 : ' || USERINFO.EMP_NAME);
    DBMS_OUTPUT.PUT_LINE('부서코드 : ' || USERINFO.DEPT_CODE);
    DBMS_OUTPUT.PUT_LINE('직급코드 : ' || USERINFO.JOB_CODE);
END;
/


DECLARE
    TYPE    MY_RECORD IS RECORD(
        MYID        EMPLOYEE.EMP_ID%TYPE,
        MYNAME      EMPLOYEE.EMP_NAME%TYPE,
        MY_D_CODE   EMPLOYEE.DEPT_CODE%TYPE,
        MY_J_CODE   EMPLOYEE.JOB_CODE%TYPE
    );
    MY MY_RECORD;
BEGIN
    SELECT EMP_ID, EMP_NAME, DEPT_CODE, JOB_CODE
    INTO MY
    FROM EMPLOYEE
    WHERE EMP_ID = '&사번';
    DBMS_OUTPUT.PUT_LINE('사번 : ' || MY.MYID);
    DBMS_OUTPUT.PUT_LINE('이름 : ' || MY.MYNAME);
    DBMS_OUTPUT.PUT_LINE('부서코드 : ' || MY.MY_D_CODE);
    DBMS_OUTPUT.PUT_LINE('직급코드 : ' || MY.MY_J_CODE);
END;
/



--@실습문제1
--사번, 사원명, 직급코드, 급여를 담을수 있는 참조변수를 통해서 (%TYPE)
--송종기사원의 사번, 사원명, 직급코드,급여를 출력하세요
DECLARE
    ID      EMPLOYEE.EMP_ID%TYPE;
    NAME    EMPLOYEE.EMP_NAME%TYPE;
    J_CODE  EMPLOYEE.JOB_CODE%TYPE;
    SALARY  EMPLOYEE.SALARY%TYPE;
BEGIN
    SELECT EMP_ID, EMP_NAME, JOB_CODE, SALARY
    INTO ID, NAME, J_CODE, SALARY
    FROM EMPLOYEE WHERE EMP_NAME = '&이름';
    DBMS_OUTPUT.PUT_LINE('사번 : ' || ID);
    DBMS_OUTPUT.PUT_LINE('이름 : ' || NAME);
    DBMS_OUTPUT.PUT_LINE('직급코드 : ' || J_CODE);
    DBMS_OUTPUT.PUT_LINE('급여 : ' || SALARY );
END;
/

-- @실습문제2
-- 사번, 사원명, 부서명,직급명을 담을수 있는 참조변수를 통해서 (record)
-- 사원명을 검색하여 해당 사원의 사번, 사원명, 부서명,직급명을 출력하세요.

DECLARE
    TYPE    MY_RECORD IS RECORD(
        MYID        EMPLOYEE.EMP_ID%TYPE,
        MYNAME      EMPLOYEE.EMP_NAME%TYPE,
        MY_D_TITLE  DEPARTMENT.DEPT_TITLE%TYPE,
        MY_J_NAME   JOB.JOB_NAME%TYPE
    );
    MY MY_RECORD;
BEGIN
    SELECT EMP_ID, EMP_NAME, DEPT_TITLE, JOB_NAME
    INTO MY
    FROM EMPLOYEE
    LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
    LEFT JOIN JOB USING (JOB_CODE)
    WHERE EMP_NAME = '&사원명';
    DBMS_OUTPUT.PUT_LINE('사번 : ' || MY.MYID);
    DBMS_OUTPUT.PUT_LINE('이름 : ' || MY.MYNAME);
    DBMS_OUTPUT.PUT_LINE('부서명 : ' || MY.MY_D_TITLE);
    DBMS_OUTPUT.PUT_LINE('직급명 : ' || MY.MY_J_NAME);
END;
/

--@실습문제3
-- 사원번호를 입력하여 해당 사원을 찾아  (%ROWTYPE을 사용)
-- 사원명, 주민번호, 입사일, 부서명을 출력하세요.

DECLARE
    USERINFO    EMPLOYEE%ROWTYPE;
    USERINFO_D  DEPARTMENT%ROWTYPE;
BEGIN
    SELECT EMP_NAME, EMP_NO, HIRE_DATE, DEPT_TITLE
    INTO USERINFO.EMP_NAME, USERINFO.EMP_NO, USERINFO.HIRE_DATE, USERINFO_D.DEPT_TITLE
    FROM EMPLOYEE
    LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
    WHERE EMP_ID = '&사번';
    DBMS_OUTPUT.PUT_LINE('사원명 : ' || USERINFO.EMP_NAME);
    DBMS_OUTPUT.PUT_LINE('주민번호 : ' || USERINFO.EMP_NO);
    DBMS_OUTPUT.PUT_LINE('입사일 : ' || USERINFO.HIRE_DATE);
    DBMS_OUTPUT.PUT_LINE('부서명 : ' || USERINFO_D.DEPT_TITLE);
END;
/



--  사원번호를 받아서 사번, 이름, 급여, 보너스율을 출력
--  보너스율이 없으면 '보너스를 지급받지 않는 사원입니다.' 추가 출력

DECLARE
    ID      EMPLOYEE.EMP_ID%TYPE;
    NAME    EMPLOYEE.EMP_NAME%TYPE;
    SAL     EMPLOYEE.SALARY%TYPE;
    BO      EMPLOYEE.BONUS%TYPE;
BEGIN
    SELECT EMP_ID, EMP_NAME, SALARY, BONUS
    INTO ID, NAME, SAL, BO
    FROM EMPLOYEE
    WHERE EMP_ID = '&사번';
    DBMS_OUTPUT.PUT_LINE('사번 : ' || ID);
    DBMS_OUTPUT.PUT_LINE('사원명 : ' || NAME);
    DBMS_OUTPUT.PUT_LINE('급여 : ' || SAL);
    DBMS_OUTPUT.PUT_LINE('보너스 : ' || BO*100 || '%');
    
    IF(BO IS NULL)
    THEN
    DBMS_OUTPUT.PUT_LINE('보너스를 받지 않는 사원입니다.');
    END IF;
END;
/


DECLARE
    ID      EMPLOYEE.EMP_ID%TYPE;
    NAME    EMPLOYEE.EMP_NAME%TYPE;
    SAL     EMPLOYEE.SALARY%TYPE;
    BO      EMPLOYEE.BONUS%TYPE;
BEGIN
    SELECT EMP_ID, EMP_NAME, SALARY, NVL(BONUS, 0)
    INTO ID, NAME, SAL, BO
    FROM EMPLOYEE
    WHERE EMP_ID = '&사번';
    DBMS_OUTPUT.PUT_LINE('사번 : ' || ID);
    DBMS_OUTPUT.PUT_LINE('사원명 : ' || NAME);
    DBMS_OUTPUT.PUT_LINE('급여 : ' || SAL);
    DBMS_OUTPUT.PUT_LINE('보너스 : ' || BO*100 || '%');
    
    IF(BO = 0)
    THEN
    DBMS_OUTPUT.PUT_LINE('보너스를 받지 않는 사원입니다.');
    END IF;
END;
/



-- 사원번호를 입력받았을때
-- 이름, 부서코드, 성별 출력
-- IF / ELSIF 사용법
-- ELSEIF 아님!  -> ELSIF : ELSE에서 E를 빼야됨!

DECLARE
    NAME        EMPLOYEE.EMP_NAME%TYPE;
    D_CODE      EMPLOYEE.DEPT_CODE%TYPE;
    GENDER      NUMBER;
BEGIN
    SELECT EMP_NAME, DEPT_CODE, SUBSTR(EMP_NO, 8, 1)
    INTO NAME, D_CODE, GENDER
    FROM    EMPLOYEE
    WHERE   EMP_ID = '&사번';
    DBMS_OUTPUT.PUT_LINE('이름 : ' || NAME);
    DBMS_OUTPUT.PUT_LINE('부서코드 : ' || D_CODE);
    IF(GENDER = 1)      THEN     DBMS_OUTPUT.PUT_LINE('성별 : 남');
    ELSIF(GENDER = 2)   THEN     DBMS_OUTPUT.PUT_LINE('성별 : 여');
    ELSIF(GENDER = 3)   THEN     DBMS_OUTPUT.PUT_LINE('성별 : 남');
    ELSE                         DBMS_OUTPUT.PUT_LINE('성별 : 여');
    END IF;
END;
/

-- 사원번호를 입력받았을때
-- 이름, 부서코드, 성별 출력
-- 자바 SWICH 처럼 사용하는법

DECLARE
    NAME        EMPLOYEE.EMP_NAME%TYPE;
    D_CODE      EMPLOYEE.DEPT_CODE%TYPE;
    GENDER      NUMBER;
BEGIN
    SELECT EMP_NAME, DEPT_CODE, SUBSTR(EMP_NO, 8, 1)
    INTO NAME, D_CODE, GENDER
    FROM    EMPLOYEE
    WHERE   EMP_ID = '&사번';
    DBMS_OUTPUT.PUT_LINE('이름 : ' || NAME);
    DBMS_OUTPUT.PUT_LINE('부서코드 : ' || D_CODE);
    
    CASE GENDER
        WHEN 1 THEN     DBMS_OUTPUT.PUT_LINE('성별 : 남');
        WHEN 2 THEN     DBMS_OUTPUT.PUT_LINE('성별 : 여');
        WHEN 3 THEN     DBMS_OUTPUT.PUT_LINE('성별 : 남');
        ELSE            DBMS_OUTPUT.PUT_LINE('성별 : 여');
    END CASE;
END;
/


DECLARE
    NAME        EMPLOYEE.EMP_NAME%TYPE;
    D_CODE      EMPLOYEE.DEPT_CODE%TYPE;
    GENDER      NUMBER;
    GENDER_CHAR CHAR(3);
BEGIN
    SELECT EMP_NAME, DEPT_CODE, SUBSTR(EMP_NO, 8, 1)
    INTO NAME, D_CODE, GENDER
    FROM    EMPLOYEE
    WHERE   EMP_ID = '&사번';
    DBMS_OUTPUT.PUT_LINE('이름 : ' || NAME);
    DBMS_OUTPUT.PUT_LINE('부서코드 : ' || D_CODE);
    CASE GENDER
        WHEN 1 THEN     GENDER_CHAR := '남';
        WHEN 2 THEN     GENDER_CHAR := '여';
        WHEN 3 THEN     GENDER_CHAR := '남';
        ELSE            GENDER_CHAR := '여';
    END CASE;
    DBMS_OUTPUT.PUT_LINE('성별 : ' || GENDER_CHAR);
END;
/




--## 실습 1 ##
--사원 번호를 가지고 해당 사원을 조회
--이때 사원명,부서명 을 출력하여라.
--만약 부서가 없다면 부서명을 출력하지 않고,
--'부서가 없는 사원 입니다' 를 출력하고
--부서가 있다면 부서명을 출력하여라.

DECLARE
    NAME      EMPLOYEE.EMP_NAME%TYPE;
    D_TITLE   DEPARTMENT.DEPT_TITLE%TYPE;
    D_CODE    EMPLOYEE.DEPT_CODE%TYPE;
BEGIN
    SELECT EMP_NAME, DEPT_TITLE, DEPT_CODE
    INTO NAME, D_TITLE, D_CODE
    FROM EMPLOYEE
    LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
    WHERE EMP_ID = '&사번';
    DBMS_OUTPUT.PUT_LINE('사원명 : ' || NAME);
    IF(D_CODE IS NULL)   THEN    DBMS_OUTPUT.PUT_LINE('부서가 없는 사원입니다.');
    ELSE                         DBMS_OUTPUT.PUT_LINE('부서명 : ' || D_TITLE);
    END IF;
END;
/


--## 실습 2 ##
--사원 코드를 입력 받았을때 사번,이름,부서코드,부서명,소속 값을 출력하시오
--그때, 소속값은 J1,J2 는 임원진, 그외에는 일반직원으로 출력되게 하시오

SELECT * FROM EMPLOYEE;

DECLARE
    ID        EMPLOYEE.EMP_ID%TYPE;
    NAME      EMPLOYEE.EMP_NAME%TYPE;
    D_CODE    EMPLOYEE.DEPT_CODE%TYPE;
    D_TITLE   DEPARTMENT.DEPT_TITLE%TYPE;
    J_CODE    EMPLOYEE.JOB_CODE%TYPE;
BEGIN
    SELECT EMP_ID, EMP_NAME,  DEPT_CODE, DEPT_TITLE, JOB_CODE
    INTO ID, NAME, D_CODE, D_TITLE, J_CODE
    FROM EMPLOYEE
    LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
    WHERE EMP_ID = '&사번';
    DBMS_OUTPUT.PUT_LINE('사번 : ' || ID);
    DBMS_OUTPUT.PUT_LINE('사원명 : ' || NAME);
    DBMS_OUTPUT.PUT_LINE('부서코드 : ' || D_TITLE);
    DBMS_OUTPUT.PUT_LINE('부서명 : ' || D_CODE);
    IF(J_CODE IN ('J1', 'J2'))   THEN    DBMS_OUTPUT.PUT_LINE('소속 : 임원진');
    ELSE                         DBMS_OUTPUT.PUT_LINE('소속 : 일반직원');
    END IF;
END;
/


--## 실습 3 ##
--사번을 입력 받은 후 급여에 따라 등급을 나누어 출력하도록 하시오 
--그때 출력 값은 사번,이름,급여,급여등급을 출력하시오 (IF ~ ELSIF ~ ELSE 사용)
--0만원 ~ 99만원 : F
--100만원 ~ 199만원 : E
--200만원 ~ 299만원 : D
--300만원 ~ 399만원 : C
--400만원 ~ 499만원 : B
--500만원 이상(그외) : A
--ex) 200
--사번 : 200
--이름 : 선동일
--급여 : 8000000
--등급 : A

DECLARE
    ID        EMPLOYEE.EMP_ID%TYPE;
    NAME      EMPLOYEE.EMP_NAME%TYPE;
    SAL       EMPLOYEE.SALARY%TYPE;
BEGIN
    SELECT EMP_ID, EMP_NAME, SALARY
    INTO ID, NAME, SAL
    FROM EMPLOYEE
    WHERE EMP_ID = '&사번';
    DBMS_OUTPUT.PUT_LINE('사번 : ' || ID);
    DBMS_OUTPUT.PUT_LINE('사원명 : ' || NAME);
    DBMS_OUTPUT.PUT_LINE('급여 : ' || SUBSTR(SAL, 0, 3) || '만원');
    IF(SAL BETWEEN 0 AND 990000 )             THEN    DBMS_OUTPUT.PUT_LINE('등급 : F');
    ELSIF(SAL BETWEEN 1000000 AND 1990000 )   THEN    DBMS_OUTPUT.PUT_LINE('등급 : E');
    ELSIF(SAL BETWEEN 2000000 AND 2990000 )   THEN    DBMS_OUTPUT.PUT_LINE('등급 : D');
    ELSIF(SAL BETWEEN 3000000 AND 3990000 )   THEN    DBMS_OUTPUT.PUT_LINE('등급 : C');
    ELSIF(SAL BETWEEN 4000000 AND 4990000 )   THEN    DBMS_OUTPUT.PUT_LINE('등급 : B');   
    ELSE                                              DBMS_OUTPUT.PUT_LINE('등급 : A');
    END IF;
END;
/


--## 실습 문제 4 ##
--사번을 입력 받은 후 급여에 따라 등급을 나누어 출력하도록 하시오 
--그때 출력 값은 사번,이름,급여,급여등급을 출력하시오 (CASE 사용)
--0만원 ~ 99만원 : F
--100만원 ~ 199만원 : E
--200만원 ~ 299만원 : D
--300만원 ~ 399만원 : C
--400만원 ~ 499만원 : B
--500만원 이상(그외) : A
--ex) 200
--사번 : 200
--이름 : 선동일
--급여 : 8000000
--등급 : A?

DECLARE
    ID        EMPLOYEE.EMP_ID%TYPE;
    NAME      EMPLOYEE.EMP_NAME%TYPE;
    SAL       EMPLOYEE.SALARY%TYPE;
BEGIN
    SELECT EMP_ID, EMP_NAME, SALARY
    INTO ID, NAME, SAL
    FROM EMPLOYEE
    WHERE EMP_ID = '&사번';
    DBMS_OUTPUT.PUT_LINE('사번 : ' || ID);
    DBMS_OUTPUT.PUT_LINE('사원명 : ' || NAME);
    DBMS_OUTPUT.PUT_LINE('급여 : ' || SUBSTR(SAL, 0, 3) || '만원');
    
    CASE
        WHEN SAL BETWEEN 0 AND 990000          THEN    DBMS_OUTPUT.PUT_LINE('등급 : F');
        WHEN SAL BETWEEN 1000000 AND 1990000   THEN    DBMS_OUTPUT.PUT_LINE('등급 : E');
        WHEN SAL BETWEEN 2000000 AND 2990000   THEN    DBMS_OUTPUT.PUT_LINE('등급 : D');
        WHEN SAL BETWEEN 3000000 AND 3990000   THEN    DBMS_OUTPUT.PUT_LINE('등급 : C');
        WHEN SAL BETWEEN 4000000 AND 4990000   THEN    DBMS_OUTPUT.PUT_LINE('등급 : B');
    ELSE                                           DBMS_OUTPUT.PUT_LINE('등급 : A');
    END CASE;
END;
/