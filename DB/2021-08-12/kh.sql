-- ���ν����� ����Ͽ� ����ϴ� ������ ȭ�鿡 �����ֵ����ϴ� ���� (DEFAULT : OFF)
SET SERVEROUTPUT ON;    


BEGIN       --  ����κ�
    DBMS_OUTPUT.PUT_LINE('HELLO ORACLE');       --  ����� ���ν���
END;        -- ��
/           -- ����





DECLARE
    ID  NUMBER;
BEGIN
    SELECT EMP_ID
    INTO ID
    FROM EMPLOYEE
    WHERE EMP_NAME = '������';
    DBMS_OUTPUT.PUT_LINE(ID);
EXCEPTION
    WHEN NO_DATA_FOUND THEN DBMS_OUTPUT.PUT_LINE('NO DATA!!');
END;
/



-- �����ȣ �Է��ؼ�, �̸�, �μ���, ���޸� ���

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
    WHERE EMP_ID = '&�����ȣ';
    DBMS_OUTPUT.PUT_LINE('�̸� : '||NAME);
    DBMS_OUTPUT.PUT_LINE('�μ��� : '||D_TITLE);
    DBMS_OUTPUT.PUT_LINE('���޸� : '||J_NAME);
END;
/


DECLARE
    DATA1   NUMBER;
    DATA2   VARCHAR2(20);
    DATA3   VARCHAR2(20)    := '�ʱ�ȭ';
BEGIN
    DATA1 := 100;
    DATA2 := '&�Է�';
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
    NAME := '������';
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
    ID := '&���';
    NAME := '&�̸�';
    D_CODE := '&�μ��ڵ�';
    J_CODE := '&�����ڵ�';
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
    WHERE EMP_ID = '&���';
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
    FROM EMPLOYEE WHERE EMP_ID = '&���';
    DBMS_OUTPUT.PUT_LINE('��� : ' || ID);
    DBMS_OUTPUT.PUT_LINE('�̸� : ' || NAME);
    DBMS_OUTPUT.PUT_LINE('�μ��ڵ� : ' || D_CODE);
    DBMS_OUTPUT.PUT_LINE('�����ڵ� : ' || J_CODE);
END;
/


DECLARE
    USERINFO    EMPLOYEE%ROWTYPE;
BEGIN
    SELECT EMP_ID, EMP_NAME, DEPT_CODE, JOB_CODE
    INTO USERINFO.EMP_ID, USERINFO.EMP_NAME, USERINFO.DEPT_CODE, USERINFO.JOB_CODE
    FROM EMPLOYEE
    WHERE EMP_ID = '&���';
    DBMS_OUTPUT.PUT_LINE('��� : ' || USERINFO.EMP_ID);
    DBMS_OUTPUT.PUT_LINE('�̸� : ' || USERINFO.EMP_NAME);
    DBMS_OUTPUT.PUT_LINE('�μ��ڵ� : ' || USERINFO.DEPT_CODE);
    DBMS_OUTPUT.PUT_LINE('�����ڵ� : ' || USERINFO.JOB_CODE);
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
    WHERE EMP_ID = '&���';
    DBMS_OUTPUT.PUT_LINE('��� : ' || MY.MYID);
    DBMS_OUTPUT.PUT_LINE('�̸� : ' || MY.MYNAME);
    DBMS_OUTPUT.PUT_LINE('�μ��ڵ� : ' || MY.MY_D_CODE);
    DBMS_OUTPUT.PUT_LINE('�����ڵ� : ' || MY.MY_J_CODE);
END;
/



--@�ǽ�����1
--���, �����, �����ڵ�, �޿��� ������ �ִ� ���������� ���ؼ� (%TYPE)
--���������� ���, �����, �����ڵ�,�޿��� ����ϼ���
DECLARE
    ID      EMPLOYEE.EMP_ID%TYPE;
    NAME    EMPLOYEE.EMP_NAME%TYPE;
    J_CODE  EMPLOYEE.JOB_CODE%TYPE;
    SALARY  EMPLOYEE.SALARY%TYPE;
BEGIN
    SELECT EMP_ID, EMP_NAME, JOB_CODE, SALARY
    INTO ID, NAME, J_CODE, SALARY
    FROM EMPLOYEE WHERE EMP_NAME = '&�̸�';
    DBMS_OUTPUT.PUT_LINE('��� : ' || ID);
    DBMS_OUTPUT.PUT_LINE('�̸� : ' || NAME);
    DBMS_OUTPUT.PUT_LINE('�����ڵ� : ' || J_CODE);
    DBMS_OUTPUT.PUT_LINE('�޿� : ' || SALARY );
END;
/

-- @�ǽ�����2
-- ���, �����, �μ���,���޸��� ������ �ִ� ���������� ���ؼ� (record)
-- ������� �˻��Ͽ� �ش� ����� ���, �����, �μ���,���޸��� ����ϼ���.

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
    WHERE EMP_NAME = '&�����';
    DBMS_OUTPUT.PUT_LINE('��� : ' || MY.MYID);
    DBMS_OUTPUT.PUT_LINE('�̸� : ' || MY.MYNAME);
    DBMS_OUTPUT.PUT_LINE('�μ��� : ' || MY.MY_D_TITLE);
    DBMS_OUTPUT.PUT_LINE('���޸� : ' || MY.MY_J_NAME);
END;
/

--@�ǽ�����3
-- �����ȣ�� �Է��Ͽ� �ش� ����� ã��  (%ROWTYPE�� ���)
-- �����, �ֹι�ȣ, �Ի���, �μ����� ����ϼ���.

DECLARE
    USERINFO    EMPLOYEE%ROWTYPE;
    USERINFO_D  DEPARTMENT%ROWTYPE;
BEGIN
    SELECT EMP_NAME, EMP_NO, HIRE_DATE, DEPT_TITLE
    INTO USERINFO.EMP_NAME, USERINFO.EMP_NO, USERINFO.HIRE_DATE, USERINFO_D.DEPT_TITLE
    FROM EMPLOYEE
    LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
    WHERE EMP_ID = '&���';
    DBMS_OUTPUT.PUT_LINE('����� : ' || USERINFO.EMP_NAME);
    DBMS_OUTPUT.PUT_LINE('�ֹι�ȣ : ' || USERINFO.EMP_NO);
    DBMS_OUTPUT.PUT_LINE('�Ի��� : ' || USERINFO.HIRE_DATE);
    DBMS_OUTPUT.PUT_LINE('�μ��� : ' || USERINFO_D.DEPT_TITLE);
END;
/



--  �����ȣ�� �޾Ƽ� ���, �̸�, �޿�, ���ʽ����� ���
--  ���ʽ����� ������ '���ʽ��� ���޹��� �ʴ� ����Դϴ�.' �߰� ���

DECLARE
    ID      EMPLOYEE.EMP_ID%TYPE;
    NAME    EMPLOYEE.EMP_NAME%TYPE;
    SAL     EMPLOYEE.SALARY%TYPE;
    BO      EMPLOYEE.BONUS%TYPE;
BEGIN
    SELECT EMP_ID, EMP_NAME, SALARY, BONUS
    INTO ID, NAME, SAL, BO
    FROM EMPLOYEE
    WHERE EMP_ID = '&���';
    DBMS_OUTPUT.PUT_LINE('��� : ' || ID);
    DBMS_OUTPUT.PUT_LINE('����� : ' || NAME);
    DBMS_OUTPUT.PUT_LINE('�޿� : ' || SAL);
    DBMS_OUTPUT.PUT_LINE('���ʽ� : ' || BO*100 || '%');
    
    IF(BO IS NULL)
    THEN
    DBMS_OUTPUT.PUT_LINE('���ʽ��� ���� �ʴ� ����Դϴ�.');
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
    WHERE EMP_ID = '&���';
    DBMS_OUTPUT.PUT_LINE('��� : ' || ID);
    DBMS_OUTPUT.PUT_LINE('����� : ' || NAME);
    DBMS_OUTPUT.PUT_LINE('�޿� : ' || SAL);
    DBMS_OUTPUT.PUT_LINE('���ʽ� : ' || BO*100 || '%');
    
    IF(BO = 0)
    THEN
    DBMS_OUTPUT.PUT_LINE('���ʽ��� ���� �ʴ� ����Դϴ�.');
    END IF;
END;
/



-- �����ȣ�� �Է¹޾�����
-- �̸�, �μ��ڵ�, ���� ���
-- IF / ELSIF ����
-- ELSEIF �ƴ�!  -> ELSIF : ELSE���� E�� ���ߵ�!

DECLARE
    NAME        EMPLOYEE.EMP_NAME%TYPE;
    D_CODE      EMPLOYEE.DEPT_CODE%TYPE;
    GENDER      NUMBER;
BEGIN
    SELECT EMP_NAME, DEPT_CODE, SUBSTR(EMP_NO, 8, 1)
    INTO NAME, D_CODE, GENDER
    FROM    EMPLOYEE
    WHERE   EMP_ID = '&���';
    DBMS_OUTPUT.PUT_LINE('�̸� : ' || NAME);
    DBMS_OUTPUT.PUT_LINE('�μ��ڵ� : ' || D_CODE);
    IF(GENDER = 1)      THEN     DBMS_OUTPUT.PUT_LINE('���� : ��');
    ELSIF(GENDER = 2)   THEN     DBMS_OUTPUT.PUT_LINE('���� : ��');
    ELSIF(GENDER = 3)   THEN     DBMS_OUTPUT.PUT_LINE('���� : ��');
    ELSE                         DBMS_OUTPUT.PUT_LINE('���� : ��');
    END IF;
END;
/

-- �����ȣ�� �Է¹޾�����
-- �̸�, �μ��ڵ�, ���� ���
-- �ڹ� SWICH ó�� ����ϴ¹�

DECLARE
    NAME        EMPLOYEE.EMP_NAME%TYPE;
    D_CODE      EMPLOYEE.DEPT_CODE%TYPE;
    GENDER      NUMBER;
BEGIN
    SELECT EMP_NAME, DEPT_CODE, SUBSTR(EMP_NO, 8, 1)
    INTO NAME, D_CODE, GENDER
    FROM    EMPLOYEE
    WHERE   EMP_ID = '&���';
    DBMS_OUTPUT.PUT_LINE('�̸� : ' || NAME);
    DBMS_OUTPUT.PUT_LINE('�μ��ڵ� : ' || D_CODE);
    
    CASE GENDER
        WHEN 1 THEN     DBMS_OUTPUT.PUT_LINE('���� : ��');
        WHEN 2 THEN     DBMS_OUTPUT.PUT_LINE('���� : ��');
        WHEN 3 THEN     DBMS_OUTPUT.PUT_LINE('���� : ��');
        ELSE            DBMS_OUTPUT.PUT_LINE('���� : ��');
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
    WHERE   EMP_ID = '&���';
    DBMS_OUTPUT.PUT_LINE('�̸� : ' || NAME);
    DBMS_OUTPUT.PUT_LINE('�μ��ڵ� : ' || D_CODE);
    CASE GENDER
        WHEN 1 THEN     GENDER_CHAR := '��';
        WHEN 2 THEN     GENDER_CHAR := '��';
        WHEN 3 THEN     GENDER_CHAR := '��';
        ELSE            GENDER_CHAR := '��';
    END CASE;
    DBMS_OUTPUT.PUT_LINE('���� : ' || GENDER_CHAR);
END;
/




--## �ǽ� 1 ##
--��� ��ȣ�� ������ �ش� ����� ��ȸ
--�̶� �����,�μ��� �� ����Ͽ���.
--���� �μ��� ���ٸ� �μ����� ������� �ʰ�,
--'�μ��� ���� ��� �Դϴ�' �� ����ϰ�
--�μ��� �ִٸ� �μ����� ����Ͽ���.

DECLARE
    NAME      EMPLOYEE.EMP_NAME%TYPE;
    D_TITLE   DEPARTMENT.DEPT_TITLE%TYPE;
    D_CODE    EMPLOYEE.DEPT_CODE%TYPE;
BEGIN
    SELECT EMP_NAME, DEPT_TITLE, DEPT_CODE
    INTO NAME, D_TITLE, D_CODE
    FROM EMPLOYEE
    LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
    WHERE EMP_ID = '&���';
    DBMS_OUTPUT.PUT_LINE('����� : ' || NAME);
    IF(D_CODE IS NULL)   THEN    DBMS_OUTPUT.PUT_LINE('�μ��� ���� ����Դϴ�.');
    ELSE                         DBMS_OUTPUT.PUT_LINE('�μ��� : ' || D_TITLE);
    END IF;
END;
/


--## �ǽ� 2 ##
--��� �ڵ带 �Է� �޾����� ���,�̸�,�μ��ڵ�,�μ���,�Ҽ� ���� ����Ͻÿ�
--�׶�, �ҼӰ��� J1,J2 �� �ӿ���, �׿ܿ��� �Ϲ��������� ��µǰ� �Ͻÿ�

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
    WHERE EMP_ID = '&���';
    DBMS_OUTPUT.PUT_LINE('��� : ' || ID);
    DBMS_OUTPUT.PUT_LINE('����� : ' || NAME);
    DBMS_OUTPUT.PUT_LINE('�μ��ڵ� : ' || D_TITLE);
    DBMS_OUTPUT.PUT_LINE('�μ��� : ' || D_CODE);
    IF(J_CODE IN ('J1', 'J2'))   THEN    DBMS_OUTPUT.PUT_LINE('�Ҽ� : �ӿ���');
    ELSE                         DBMS_OUTPUT.PUT_LINE('�Ҽ� : �Ϲ�����');
    END IF;
END;
/


--## �ǽ� 3 ##
--����� �Է� ���� �� �޿��� ���� ����� ������ ����ϵ��� �Ͻÿ� 
--�׶� ��� ���� ���,�̸�,�޿�,�޿������ ����Ͻÿ� (IF ~ ELSIF ~ ELSE ���)
--0���� ~ 99���� : F
--100���� ~ 199���� : E
--200���� ~ 299���� : D
--300���� ~ 399���� : C
--400���� ~ 499���� : B
--500���� �̻�(�׿�) : A
--ex) 200
--��� : 200
--�̸� : ������
--�޿� : 8000000
--��� : A

DECLARE
    ID        EMPLOYEE.EMP_ID%TYPE;
    NAME      EMPLOYEE.EMP_NAME%TYPE;
    SAL       EMPLOYEE.SALARY%TYPE;
BEGIN
    SELECT EMP_ID, EMP_NAME, SALARY
    INTO ID, NAME, SAL
    FROM EMPLOYEE
    WHERE EMP_ID = '&���';
    DBMS_OUTPUT.PUT_LINE('��� : ' || ID);
    DBMS_OUTPUT.PUT_LINE('����� : ' || NAME);
    DBMS_OUTPUT.PUT_LINE('�޿� : ' || SUBSTR(SAL, 0, 3) || '����');
    IF(SAL BETWEEN 0 AND 990000 )             THEN    DBMS_OUTPUT.PUT_LINE('��� : F');
    ELSIF(SAL BETWEEN 1000000 AND 1990000 )   THEN    DBMS_OUTPUT.PUT_LINE('��� : E');
    ELSIF(SAL BETWEEN 2000000 AND 2990000 )   THEN    DBMS_OUTPUT.PUT_LINE('��� : D');
    ELSIF(SAL BETWEEN 3000000 AND 3990000 )   THEN    DBMS_OUTPUT.PUT_LINE('��� : C');
    ELSIF(SAL BETWEEN 4000000 AND 4990000 )   THEN    DBMS_OUTPUT.PUT_LINE('��� : B');   
    ELSE                                              DBMS_OUTPUT.PUT_LINE('��� : A');
    END IF;
END;
/


--## �ǽ� ���� 4 ##
--����� �Է� ���� �� �޿��� ���� ����� ������ ����ϵ��� �Ͻÿ� 
--�׶� ��� ���� ���,�̸�,�޿�,�޿������ ����Ͻÿ� (CASE ���)
--0���� ~ 99���� : F
--100���� ~ 199���� : E
--200���� ~ 299���� : D
--300���� ~ 399���� : C
--400���� ~ 499���� : B
--500���� �̻�(�׿�) : A
--ex) 200
--��� : 200
--�̸� : ������
--�޿� : 8000000
--��� : A?

DECLARE
    ID        EMPLOYEE.EMP_ID%TYPE;
    NAME      EMPLOYEE.EMP_NAME%TYPE;
    SAL       EMPLOYEE.SALARY%TYPE;
BEGIN
    SELECT EMP_ID, EMP_NAME, SALARY
    INTO ID, NAME, SAL
    FROM EMPLOYEE
    WHERE EMP_ID = '&���';
    DBMS_OUTPUT.PUT_LINE('��� : ' || ID);
    DBMS_OUTPUT.PUT_LINE('����� : ' || NAME);
    DBMS_OUTPUT.PUT_LINE('�޿� : ' || SUBSTR(SAL, 0, 3) || '����');
    
    CASE
        WHEN SAL BETWEEN 0 AND 990000          THEN    DBMS_OUTPUT.PUT_LINE('��� : F');
        WHEN SAL BETWEEN 1000000 AND 1990000   THEN    DBMS_OUTPUT.PUT_LINE('��� : E');
        WHEN SAL BETWEEN 2000000 AND 2990000   THEN    DBMS_OUTPUT.PUT_LINE('��� : D');
        WHEN SAL BETWEEN 3000000 AND 3990000   THEN    DBMS_OUTPUT.PUT_LINE('��� : C');
        WHEN SAL BETWEEN 4000000 AND 4990000   THEN    DBMS_OUTPUT.PUT_LINE('��� : B');
    ELSE                                           DBMS_OUTPUT.PUT_LINE('��� : A');
    END CASE;
END;
/