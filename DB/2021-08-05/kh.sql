--  EMPLOYEE ���̺��� ��� �÷��� ��ȸ
SELECT * FROM EMPLOYEE;

Select * From Department;
--  ������ �� ���ʽ��� ���� ����
SELECT * FROM EMPLOYEE WHERE BONUS IS NOT NULL;
--  ������ �� ���ʽ��� �� ���� ����
SELECT * FROM EMPLOYEE Where BONUS IS NULL;
--  ������ �� �μ��� �������� ���� ������ ��ü����
SELECT * FROM EMPLOYEE WHERE DEPT_CODE IS NULL;

--  D6�μ� �Ǵ� D9�μ� �Ǵ�  D8�μ� ���� �μ����� �̸�, �μ��ڵ�, �޿� ��ȸ
SELECT EMP_NAME, DEPT_CODE, SALARY 
FROM EMPLOYEE 
--  WHERE (DEPT_CODE = 'D6' OR DEPT_CODE = 'D9' OR DEPT_CODE = 'D8');     
WHERE
DEPT_CODE IN ('D6', 'D9', 'D8');
--DEPT_CODE NOT IN ('D6', 'D9', 'D8');

-- �����ڵ尡 J7 �Ǵ� J2�̰�, �޿��� 200���� �ʰ��� ����� �̸�, �޿� �����ڵ� ���
SELECT EMP_NAME, SALARY, DEPT_CODE, JOB_CODE FROM EMPLOYEE
WHERE
--(JOB_CODE = 'J7' OR JOB_CODE = 'J2') AND (SALARY > 2000000);
JOB_CODE IN ('J7', 'J2') AND (SALARY > 2000000); 

/*
SECLECT

FROM
        ���̺��̸�
WHERE
        ����
ORDER BY
        ���ı���
*/

--  �������� 
--  1)  ���� : ���� �� -> ū ��
--  2)  ���� : ���� ��
--  3)  ��¥ : ���� �� -> ���� ��

--  ��������
--  1)  ���� : ū �� -> ���� ��
--  2)  ���� : ���� ����
--  3)  ��¥ : ���� �� -> ���� ��
SELECT EMP_NAME, SALARY FROM EMPLOYEE ORDER BY EMP_NAME;    -- �������� ASC -> ��������
SELECT EMP_NAME, SALARY FROM EMPLOYEE ORDER BY EMP_NAME DESC; -- �������� DESC -> ���� �Ұ�
SELECT EMP_NAME, SALARY FROM EMPLOYEE ORDER BY SALARY;
SELECT EMP_NAME, SALARY FROM EMPLOYEE ORDER BY SALARY DESC;

SELECT EMP_NAME, SALARY, HIRE_DATE, DEPT_CODE FROM EMPLOYEE ORDER BY DEPT_CODE;
-- DEPT_CODE �÷��� ��ȸ���� �ʴ��� ���ı������δ� ����� ����
SELECT EMP_NAME, SALARY, HIRE_DATE FROM EMPLOYEE ORDER BY DEPT_CODE;

SELECT EMP_NAME, SALARY, HIRE_DATE, DEPT_CODE FROM EMPLOYEE WHERE DEPT_CODE = 'D9' ORDER BY EMP_NAME;


--  ��ȸ����� �÷� ������ �̿��ؼ� ���� ����
SELECT EMP_NAME, SALARY, HIRE_DATE FROM EMPLOYEE WHERE DEPT_CODE = 'D9' ORDER BY 2 DESC;

SELECT * FROM EMPLOYEE ORDER BY SALARY, EMP_NAME;

--  ���� 1.
--  �Ի����� 5�� �̻�, 10�� ������ ������ �̸�, �ֹι�ȣ, �޿�, �Ի��� �˻�
SELECT EMP_NAME, EMP_NO, HIRE_DATE FROM EMPLOYEE
WHERE 
(SYSDATE - HIRE_DATE) / 365 BETWEEN 5 AND 10;

-- ���� 2.
--  �������� �ƴ� ������ �̸�, �μ��ڵ�, �Ի���, ����� ��ȸ(��翩�� : ENT_YN)
SELECT EMP_NAME, DEPT_CODE, HIRE_DATE, ENT_DATE FROM EMPLOYEE
WHERE 
ENT_YN = 'Y';

--  ���� 3.
--  �ټӳ���� 10�� �̻��� �������� �˻��Ͽ�, ��� ����� �̸�, �޿�, �ټӳ����
--  �ټӳ���� ������������ �����Ͽ� ����Ѵ�.
--  ��, �޿��� 50% �λ�� �޿��� ��µǵ��� �Ѵ�.
SELECT EMP_NAME, (SALARY*1.5) "�λ�޿�", FLOOR((SYSDATE - HIRE_DATE) / 365) "�ټӳ��" FROM EMPLOYEE
WHERE       -- WHERE ���� ���� SELECT ���� ���ÿ� �۾��Ǿ,         �ټӳ�� >= 10      �� ���� ������ ���� �� ����.
(SYSDATE - HIRE_DATE) / 365 >= 10
ORDER BY �ټӳ��;



SELECT EMP_NAME, PHONE, SALARY*12 AS ����, '��'  ���� FROM EMPLOYEE WHERE DEPT_CODE = 'D6';  


--  ���� 4.
--  �Ի����� 99/01/01 ~ 10/01/01 �� ��� �߿��� �޿��� 2000000 �� ������ �����
--  �̸�, �ֹι�ȣ, �̸���, ����ȣ, �޿��� �˻��Ѵ�.

SELECT EMP_NAME, EMP_NO, EMAIL, PHONE, SALARY FROM EMPLOYEE
WHERE
(HIRE_DATE BETWEEN '99/01/01' AND '10/01/01') AND (SALARY <= 2000000);

--  ���� 5.
--  �޿��� 2000000�� ~ 3000000�� �� ������ �߿��� 4�� �����ڸ� �˻��Ͽ�
--  �̸�, �ֹι�ȣ, �޿�, �μ��ڵ带 �ֹι�ȣ ������(��������) ����Ѵ�.
SELECT EMP_NAME, EMP_NO, SALARY, DEPT_CODE FROM EMPLOYEE
WHERE 
(EMP_NO LIKE  '___4___2%') AND (SALARY BETWEEN 2000000 AND 3000000)
ORDER BY EMP_NO DESC;



--  ���ڿ� ó���Լ�

--  1)  LENGTH : �־��� ���� ���ڿ� ���̸� ��ȯ
SELECT EMP_NAME, LENGTH(EMP_NAME), EMAIL, LENGTH(EMAIL) FROM EMPLOYEE;


--  2)  LENGTHB : �־��� ���� ����Ʈ�� ��ȯ                ����� 1����Ʈ, �ѱ��� 3����Ʈ(EX����), �ٸ� ������������� �ѱ� 2����Ʈ
SELECT EMP_NAME, LENGTH(EMP_NAME), LENGTHB(EMP_NAME), EMAIL, LENGTH(EMAIL), LENGTHB(EMAIL) FROM EMPLOYEE;


--  3)  INSTR : ã�� ���ڰ� ������ ��ġ���� ������ Ƚ����ŭ ��Ÿ�� ������ġ ����
SELECT INSTR( 'Hello World Hi High', 'H', 1, 1) FROM DUAL;      -- Hellow World Hi HIgh���� H�� 1�� ��ġ���� 1��° �����ϴ� ��ġ�� ��ȯ
SELECT INSTR( 'Hello World Hi High', 'H', 1, 2) FROM DUAL;      -- Hellow World Hi HIgh���� H�� 1�� ��ġ���� 2��° �����ϴ� ��ġ�� ��ȯ
SELECT INSTR( 'Hello World Hi High', 'H', 1, 3) FROM DUAL;      -- Hellow World Hi HIgh���� H�� 1�� ��ġ���� 3��° �����ϴ� ��ġ�� ��ȯ
SELECT INSTR( 'Hello World Hi High', 'H', 2, 1) FROM DUAL;
SELECT INSTR( 'Hello World Hi High', 'H', 2, 2) FROM DUAL;
SELECT INSTR( 'Hello World Hi High', 'H', -1, 1) FROM DUAL;     -- �ڿ��� -1��°���� 1��° H�� ��ġ ��ȯ -> �˻��� �ڿ��� ���������� ���� �� �������ͷ� ����
SELECT INSTR( 'Hello World Hi High', 'H', -1, 2) FROM DUAL;     -- �ڿ��� -1��°���� 2��° H�� ��ġ ��ȯ -> �˻��� �ڿ��� ���������� ���� �� �������ͷ� ����

SELECT EMAIL, INSTR(EMAIL, '@', 1, 1) FROM EMPLOYEE;


--  4)   LPAD / RPAD : �־��� �÷� ���ڿ��� ������ ���ڿ��� ���� / �����ʿ� ���ٿ� �������� ���ڿ��� ��ȯ
SELECT EMAIL, LENGTH(EMAIL), LPAD(EMAIL, 20, '#'), RPAD(EMAIL, 20, '#'), LPAD(EMAIL, 10, '#') FROM EMPLOYEE;


--  5)  LTRIM / RTRIM : �־��� �÷��̳� ���ڿ��� ���� Ȥ�� �����ʿ��� ������ ���ڿ��� ���Ե� ��繮�ڸ� ������ �������� ��ȯ
SELECT  LTRIM( '    KH', ' ') FROM DUAL;
SELECT  LTRIM( '00000123400000', '0') FROM DUAL;
SELECT  RTRIM( '00000123400000', '0') FROM DUAL;
SELECT LTRIM('ACABAACCBBKHACABAACCBB', 'ABC') FROM DUAL;        -- ABC �� ����°� �ƴ϶� 'A' 'B' 'C' �������� ���޾� ������ ������ ������ ���� �ִ� �κ� ����
SELECT RTRIM('ACABAACCBBKHACABAACCBB', 'ABC') FROM DUAL;        -- ==


--  6)  TRIM : �־��� �÷��̳� ���ڿ� �� / �� ���ʿ� ������ ���ڸ� ������ �������� ��ȯ
SELECT TRIM('Z' FROM 'ZZZKHZZZ') FROM DUAL;                      --  �� / �� ��� ����    // BOTH �� ������ ����
SELECT TRIM(BOTH 'Z' FROM 'ZZZKHZZZ') FROM DUAL;            --  �� / �� ��� ����   // BOTH �� ���� ����
SELECT TRIM(LEADING 'Z' FROM 'ZZZKHZZZ') FROM DUAL;     --  �տ��� ����
SELECT TRIM(TRAILING 'Z' FROM 'ZZZKHZZZ') FROM DUAL;     -- �ڿ��� ����


--  �ǽ�  ���� 1
--  Hello KH Java ���ڿ��� Hello KH �� ��µǰ� �Ѵ�.
SELECT  RTRIM( 'Hello KH Java', ' Java') FROM DUAL;
SELECT  LPAD( 'Hello KH Java', INSTR('Hello KH Java', 'J', 1, 1)-2) FROM DUAL;

--  �ǽ�  ���� 2
--  Hello KH Java ���ڿ��� KH Java �� ��µǰ� �Ѵ�.
SELECT  LTRIM( 'Hello KH Java', 'Hello ') FROM DUAL;

--  �ǽ�  ���� 3 ( TRIM ���� �غ�����)
--  DEPARTMENT ���̺��� DEPT_TITLE�� ����Ͽ���
--  �̶�, ������ �� ���ڸ� ���� ��µǵ��� �Ͽ���      /   EX) ȸ������� -> ȸ�����
SELECT TRIM(TRAILING '��' FROM DEPT_TITLE) FROM DEPARTMENT;

--  �ǽ� ���� 4
--  ���� ���ڿ����� �� �� ��� ���ڸ� �����ϼ���.
--  '982341678934509hello89798739273402'
SELECT RTRIM( LTRIM( '982341678934509hello89798739273402', '982341678934509'), '89798739273402') FROM DUAL;


--  7)  SUBSTR : ������ �÷��̳� ���ڿ����� ������ ��ġ���� ������ ������ ���ڿ��� �߶󳻾� ����
SELECT SUBSTR('ABCDEFGHIJK', 3, 4) FROM DUAL;       -- 3�� ���ں��� 4��
SELECT SUBSTR('ABCDEFGHIJK', 7, 2) FROM DUAL;       -- 7�� ���ں��� 2��
SELECT SUBSTR('ABCDEFGHIJK', 7) FROM DUAL;           -- 7�����ں��� ������ ���ڰ��� ���� �� ������ ���
SELECT SUBSTR('ABCDEFGHIJK', -7, 2) FROM DUAL;      -- �ڿ��� 7��° ���ں��� 2��

--  �ǽ�����1
----    ������� ���� �ߺ����� ���������� ����ϼ���.
SELECT DISTINCT SUBSTR(EMP_NAME, 1, 1)  AS "��" FROM EMPLOYEE ORDER BY 1;        -- DISTINCT �� ����Ͽ� ���� ���̺��� �����Ͽ� ����ϱ� ������ ORDER BY �� EMP_NAME�� �ƴ� 1

-- �ǽ�����2
-- employee ���̺��� ���ڸ� �����ȣ, �����, �ֹι�ȣ, ������ ��Ÿ������.
-- �ֹι�ȣ�� ��6�ڸ��� *ó���ϼ���.
-- 1)
SELECT EMP_ID, EMP_NAME, RPAD(SUBSTR(EMP_NO, 1, 8), 14, '*'), SALARY*12 AS "����"
FROM EMPLOYEE
WHERE
-- EMP_NO LIKE '%-1%' OR EMP_NO LIKE '%-3%'
SUBSTR(EMP_NO, 8, 1) IN ('1', '3')
;
-- 2)
SELECT EMP_ID, EMP_NAME, SUBSTR(EMP_NO, 1, 8) || '*****', SALARY*12 AS "����"
FROM EMPLOYEE
WHERE
-- EMP_NO LIKE '%-1%' OR EMP_NO LIKE '%-3%'
SUBSTR(EMP_NO, 8, 1) IN ('1', '3')
;

--  8) LOWER / UPPER / INITCAP : �÷� �Ǵ� ���ڿ� �� �ҹ��� / �빮�� / ù���ڸ� �빮�ڷ� ��ȯ�Ͽ� ����
SELECT LOWER('Welcome To Kh') FROM DUAL;
SELECT UPPER('Welcome To Kh') FROM DUAL;
SELECT INITCAP('Welcome To Kh') FROM DUAL;


-- 9) CONCAT : �÷� �Ǵ� ���ڿ��� 2�� ���޹޾� �ϳ��� ��ģ �� ����
SELECT CONCAT(CONCAT('�����ٶ�', 'ABCD'),'1234') FROM DUAL;
SELECT '�����ٶ�' || 'ABCD' || '1234' FROM DUAL;


--  10) REPLACE : �÷� Ȥ�� ���ڿ��� �� ��(������, �����) ���� �޾Ƽ� ���� �� ����
SELECT REPLACE('�����ٶ�ABCD1234', 'ABCD', 'abcd') FROM DUAL;


-- �ǽ����� 
-- EMPLOYEE ���̺��� ��� ������ �̸�,�ֹι�ȣ,Email�� ����Ͻÿ�
-- ��, ��½� Email�� kh.or.kr���� iei.or.kr �� �����Ͽ� ��µǰ� �Ͻÿ� 
-- eX) sun_di@kh.or.kr -> sun_di@iei.or.kr

SELECT * FROM EMPLOYEE;
SELECT EMP_NAME, EMP_NO, REPLACE(EMAIL, 'kh','iei')
FROM EMPLOYEE;



--  ���� ó�� �Լ�

-- 1) ABS   :   ���밪
SELECT ABS(10), ABS(-10) FROM DUAL;


--  2) MOD  :   ���ڷ� ���޹��� ���ڸ� ������ �������� ���ϴ� �Լ�
SELECT MOD(10, 3)  FROM DUAL;
SELECT MOD(10, 2)  FROM DUAL;
SELECT MOD(10, 4)  FROM DUAL;


--  3)  ROUND   :   �ݿø�
SELECT ROUND(123.456, 3) FROM DUAL;     --  123.456
SELECT ROUND(123.456, 2) FROM DUAL;     --  123.46
SELECT ROUND(123.456, 1) FROM DUAL;     --  123.5
SELECT ROUND(123.456, 0) FROM DUAL;     --  123
SELECT ROUND(123.456, -1) FROM DUAL;    --  120
SELECT ROUND(123.456, -2) FROM DUAL;    --  100


--  4)  FLOOR   :   �Ҽ��� �ڸ����� ����
SELECT FLOOR(123.456) FROM DUAL;        --  123
SELECT FLOOR(123.956) FROM DUAL;        --  123  


--  5)  TRUNC   :   ���� -> Ư�� �Ҽ��� ���ĸ� ���� (�ݿø��� �ƴ϶� �����̴�)
SELECT TRUNC (123.456, 1) FROM DUAL;    --  123.4
SELECT TRUNC (123.456, 2) FROM DUAL;    --  123.45
SELECT TRUNC (123.456, -1) FROM DUAL;   --  120


--  6)  CEIL : �ø�
SELECT CEIL(123.456) FROM DUAL; -- 124




--  ��¥ ó�� �Լ�
--  1)  SYSDATE : �ý��ۿ� ����Ǿ� �ִ� ���� ��¥ ��ȯ
SELECT SYSDATE FROM DUAL;


--  2)  MONTHS_BETWEEN : ��¥ �ΰ��� �޾� ���� �� ���̸� ���������� ����
SELECT EMP_NAME, HIRE_DATE, FLOOR(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)) "�Ի���� ������� �� ����" FROM EMPLOYEE;


--  3)  ADD_MONTHS : ���ڷ� ���޹��� ��¥�� ���ڸ�ŭ ���� ���� ���ؼ� ����
SELECT SYSDATE, ADD_MONTHS(SYSDATE, 5) FROM DUAL;
SELECT EMP_NAME, HIRE_DATE, ADD_MONTHS(HIRE_DATE, 3) FROM EMPLOYEE;


--  4)  NEXT_DAY    :   ���ڷ� ���޹��� ��¥�� ���ڷ� ���޹��� ���� �� ���� ����� ���� ��¥
--  ����  :    1 = �Ͽ��� ~ 7 = �����
SELECT SYSDATE, NEXT_DAY(SYSDATE, 4) FROM DUAL;
SELECT SYSDATE, NEXT_DAY(SYSDATE, '��') FROM DUAL;



--  5)  LAST_DAY    :   ���ڷ� ���޹��� ��¥�� ���� ���� ��������
SELECT SYSDATE, LAST_DAY(SYSDATE) FROM DUAL;
SELECT SYSDATE - 10, LAST_DAY(SYSDATE - 10) FROM DUAL;


--  6)  EXTRACT :  ��¥���� ��, ��, �� ������ ����
SELECT SYSDATE, EXTRACT(YEAR FROM SYSDATE), EXTRACT(MONTH FROM SYSDATE), EXTRACT(DAY FROM SYSDATE) FROM DUAL;



-- �ǽ�����
-- EMPLOYEE ���̺��� ����� �̸�,�Ի���,������ ����Ͽ���. 
-- ��, �Ի����� YYYY��M��D�Ϸ� ����ϵ��� �Ͽ���.
-- ���� ����� �Ҽ��� �ϰ�� �ø����� �Ͽ� ����Ͽ���. (28.144 -> 29����)
-- (��½� ������ �Ի��� �������� ��������)
SELECT * FROM EMPLOYEE;
SELECT EMP_NAME, EXTRACT(YEAR FROM HIRE_DATE) || '��' || EXTRACT(MONTH FROM HIRE_DATE) || '��' || EXTRACT(DAY FROM HIRE_DATE) || '��' "�Ի���", 
CEIL((SYSDATE - HIRE_DATE) / 365) "����" 
FROM EMPLOYEE 
ORDER BY �Ի���
;



--  �� ��ȯ �Լ�

--  1)  TO_CHAR :   ��¥�� ������ �Ǵ�  ������ �����͸� ���������� ��ȯ
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD') FROM DUAL; 
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD/DAY') FROM DUAL; 
SELECT TO_CHAR(SYSDATE, 'YYYY/MONTH/DD') FROM DUAL; 
SELECT TO_CHAR(SYSDATE, 'YEAR/MONTH/DAY') FROM DUAL;       --  YEAR :  TWENTY TWENTY-ONE  (2021�� �ƴ�)
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD/PMHH12"��"MI"��"ss"��') FROM DUAL; 
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD/PMHH24"��"MI"��"ss"��') FROM DUAL; 
SELECT TO_CHAR(SYSDATE, 'FMYYYY/MM/DD/PMHH24"��"MI"��"ss"��') FROM DUAL;  --   FM�� �������ν�  00�� 00�� => 0��0��      ���� �ٲ�


-- ����   ->  ����
SELECT EMP_NAME, SALARY, 
TO_CHAR (SALARY, '999,999,999'),         -- �ڸ����� �����ְ� �����, �����ϰ� �ָ� ##### �̷������� ������ ���� �ȳ���
TO_CHAR(SALARY, '000,000,000'),          -- 000���̸� ���� ���� 000���� ä����
TO_CHAR (SALARY, 'L999,999,999'),        --  L�� ���̸� ���� ���� ����(���α׷� ��ġ�� ����)�� ��ȭ ������ ���
TO_CHAR (SALARY, '999,999,999.999')
FROM EMPLOYEE
;

--  TO_DATE : ���� Ȥ�� ������ �����͸� ��¥�� �����ͷ� ��ȯ�Ͽ� ����
SELECT TO_DATE(20210805, 'YYYYMMDD') FROM DUAL;
SELECT TO_DATE('20210805', 'YYYYMMDD') FROM DUAL;       -- �������̳� �������̳� �����ϰ� ������� ��µ�
SELECT TO_CHAR(TO_DATE(20210805, 'YYYYMMDD'), 'YYYY-MM-DD HH24:MI:SS') FROM DUAL;       --  TO_DATE���� �ú��� ������ ��ȯ���� �ʾұ⿡ �ú��� ������ �������� �ʴ´�.


--  EMPLOYEE  ���̺��� 2000�⵵ ���Ŀ� �Ի��� ����� �̸�, �Ի��� ��ȸ
SELECT EMP_NAME, HIRE_DATE FROM EMPLOYEE
WHERE
EXTRACT(YEAR FROM HIRE_DATE) >= 2000
;

SELECT EMP_NAME, HIRE_DATE FROM EMPLOYEE
WHERE
HIRE_DATE >= TO_DATE(20000101, 'YYYYMMDD')
;


--  3)  TO_NUMBER   :   ������ �����͸� ������ �����ͷ� ��ȯ    //  '����' �̷� �������� �ȵ� '123456' �̷� �������� ����
SELECT TO_NUMBER('1,000,000', '999,999,999') FROM DUAL;
SELECT TO_NUMBER('123') FROM DUAL;

SELECT '1000'+'100' FROM DUAL;          --  �ڹ�("1000" + "100" = "1000100")�� �ٸ��� SQL�� ���ڿ��� ���� ���ڸ� ��� ������ �����
SELECT '1000' || '100' FROM DUAL;




--  ��Ÿ�Լ�
--  1) NVL  :   NULL�� �Ǿ��ִ� �÷����� ������ ���� Ȥ�� ���ڷ� �����Ͽ� ����           //     ��, �÷��� ������ Ÿ�԰� ���ƾ��Ѵ�. -> (���ڿ�, ���ڿ�) / (����, ����)
SELECT EMP_NAME, NVL(DEPT_CODE, '�μ�����') FROM EMPLOYEE;
SELECT EMP_NAME, SALARY, BONUS, SALARY + SALARY * NVL(BONUS, 0)  FROM EMPLOYEE;


--  2)  DECODE  :   �����Լ�    ->  �������� ��쿡 ������ �� �� �ִ� ��� ����(SWITCH ����)
SELECT EMP_NAME, EMP_NO, DECODE(SUBSTR(EMP_NO, 8, 1),'1', '��', '2', '��', '3', '��', '4', '��','???') ���� FROM EMPLOYEE;    -- �� �ȿ� '???' �� �κ��� �ڹ� SWITCH ������ default ���̶�� �����ϸ� ��. 
SELECT EMP_NAME, EMP_NO, DECODE(SUBSTR(EMP_NO, 8, 1),'1', '��', '��') ���� FROM EMPLOYEE; 


--  3)  CASE    :   �����Լ�    ->  �������� ��쿡 ������ �� �� �ִ� ��� ���� (������ ����   ->  IF - ELSE IF   ����)
SELECT EMP_NAME, EMP_NO,
    CASE
                WHEN SUBSTR(EMP_NO, 1, 2) < 65 THEN '60��� �ʹ�'
                WHEN SUBSTR(EMP_NO, 1, 2) >= 65 THEN '60��� �Ĺ�'
                ELSE '�Ѵپƴ�'
    END
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO, 1, 2) BETWEEN 60 AND 69;





--  �׷��Լ�        ==> NULL���� ���꿡 ���Ե��� �ʴ´�!!!, NULL ���� �����ؼ� �����Ϸ��� NVL ���� �Լ��� ���� ����ؾߵ�

--  1)  SUM :   �ش� �÷��� �� ���� ���ϴ� �Լ�
SELECT SUM(SALARY) FROM EMPLOYEE;
SELECT SUM(SALARY) FROM EMPLOYEE WHERE DEPT_CODE = 'D9';
SELECT EMP_NAME, SUM(SALARY) FROM EMPLOYEE WHERE DEPT_CODE = 'D9';      -- ������� ������ ROW(��)�� ������ �ٸ� ���̶� ���� �ʾ� ������, �̷��� ������ �Ϲ� �÷��� ���� ����� �� ����.


--  2)  AVG :   �ش� �÷��� ����� ���ϴ� �Լ�
SELECT ROUND(AVG(SALARY),2) FROM EMPLOYEE;
SELECT AVG(BONUS) FROM EMPLOYEE;  
SELECT AVG(NVL(BONUS, 0)) FROM EMPLOYEE;        -- NULL ���� 0���� �ٲ� ������.


--  3)  COUNT   :   ���̺��� ������ �����ϴ� ���� ������ ��ȯ
SELECT COUNT (SALARY) FROM EMPLOYEE;
SELECT COUNT (*) FROM EMPLOYEE;     --  ������ ���� ������ ���� �Ŵ� ��ü�� ��Ī�ϴ� * ��ȣ�� ����ص� ��.
SELECT COUNT (*) FROM EMPLOYEE WHERE DEPT_CODE = 'D9';
SELECT COUNT(DEPT_CODE) FROM EMPLOYEE;


--  4)  MAX / MIN   :   �ִ밪, �ּҰ�
SELECT MAX(SALARY), MIN(SALARY) FROM EMPLOYEE;
SELECT MAX(HIRE_DATE), MIN(HIRE_DATE) FROM EMPLOYEE;

