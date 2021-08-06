--  EMPLOYEE ���̺��� ��� �÷��� ��ȸ
SELECT * FROM EMPLOYEE;


--  �ǽ� ���� 1.
--  ������� �̸���, �̸��� ���̸� ����Ͻÿ�.
SELECT EMP_NAME ������, EMAIL �̸���, LENGTH(EMAIL) �̸��ϱ��� FROM EMPLOYEE;

--  �ǽ� ���� 2.
--  ������ �̸��� �̸��� �ּ� �� ���̵� �κи� ����Ͻÿ�.
SELECT EMP_NAME �̸�, SUBSTR(EMAIL, 1, INSTR(EMAIL, '@') - 1) AS "�̸��� ���̵�" FROM EMPLOYEE;

--  �ǽ� ���� 3.
--  60����� ������� ���, ���ʽ� ���� ����Ͻÿ�
--  �׶� ���ʽ� ���� NULL�� ��쿡��  0 �̶�� ��� �ǰ� ����ÿ�
SELECT EMP_NAME ������, SUBSTR(EMP_NO, 1, 2) ���, NVL(BONUS, 0) ���ʽ� FROM EMPLOYEE
WHERE
SUBSTR(EMP_NO, 1, 2) BETWEEN 60 AND 69;

--  �ǽ� ���� 4.
--  '010' �ڵ��� ��ȣ�� ���� �ʴ� ����� ���� ����Ͻÿ� (�ڿ� ������ ���� ���̽ÿ�)
 SELECT COUNT(PHONE) �ο� FROM EMPLOYEE
 WHERE
 SUBSTR(PHONE, 1, 3) != 010;
 
-- �ǽ� ���� 5.
--  ������� �Ի����� ����Ͻÿ�
--  ��, �Ʒ��� ���� ��µǵ��� ����� ���ÿ�
--  ������        �Ի���
--  ������        1997�� 3��
SELECT EMP_NAME ������, EXTRACT(YEAR FROM HIRE_DATE)||'��' ||LPAD(EXTRACT(MONTH FROM HIRE_DATE), 2)||'��' �Ի��� 
FROM EMPLOYEE;

--  �ǽ� ���� 6.
--  ������� �ֹι�ȣ�� ��ȸ�Ͻÿ�
--  ��, �ֹι�ȣ 9��° �ڸ����� �������� '*' ���ڷ� ä���� ��� �Ͻÿ�
SELECT EMP_NAME ������,  RPAD(SUBSTR(EMP_NO, 1, 8), 14, '*') �ֹε�Ϲ�ȣ FROM EMPLOYEE;

--  �ǽ� ���� 7.
--  ������, �����ڵ�, ����(��) ��ȸ
--  ��, ������ \57,000,000 ���� ǥ�õǰ� ��
--  ������ ���ʽ�����Ʈ�� ����� 1��ġ �޿���
SELECT EMP_NAME ������, JOB_CODE, TO_CHAR((SALARY+SALARY * NVL(BONUS, 0))*12, 'L999,999,999') AS "����(��)"
FROM EMPLOYEE;

--  �ǽ� ���� 8.
--  �μ��ڵ尡 D5, D9�� ������ �߿��� 2004�⵵�� �Ի��� ������ �� ��ȸ��.
--  ��� ����� �μ��ڵ� �Ի���
SELECT EMP_ID ���, EMP_NAME �����, DEPT_CODE �μ��ڵ�, HIRE_DATE �Ի��� FROM EMPLOYEE
WHERE
DEPT_CODE IN ('D5', 'D9') AND EXTRACT(YEAR FROM HIRE_DATE) = 2004
;

--  �ǽ� ���� 9.
--  ������, �Ի���, ���ñ����� �ٹ��ϼ� ��ȸ
--  * �ָ��� ����, �Ҽ��� �Ʒ��� ����
SELECT EMP_NAME ������, HIRE_DATE �Ի���, FLOOR(SYSDATE - HIRE_DATE) AS "�� �ٹ��ϼ�" FROM EMPLOYEE
ORDER BY �Ի���;

--  �ǽ� ���� 10.
--  ��� ������ ���� �� ���� ���� ���̿� ���� ���� ���̸� ��� �϶� (���̸� ���)
--  Ǯ�� 1)
SELECT 
MAX(CEIL(MONTHS_BETWEEN(SYSDATE, TO_DATE('19'||SUBSTR(EMP_NO, 1, 2), 'YYYY')) / 12)) "�ִ� ����",
MIN(CEIL(MONTHS_BETWEEN(SYSDATE, TO_DATE('19'||SUBSTR(EMP_NO, 1, 2), 'YYYY')) / 12)) "�ּ� ����"
FROM EMPLOYEE;
--  Ǯ�� 2)
SELECT
    MAX(EXTRACT(YEAR FROM SYSDATE)  -  (SUBSTR(EMP_NO, 1, 2) + 1900))  +  1 �ִ볪��,
    MIN(EXTRACT(YEAR FROM SYSDATE) - (SUBSTR(EMP_NO, 1, 2) + 1900)) + 1 �ִ볪��
FROM EMPLOYEE;

--  �ǽ� ���� 11.
--  ȸ�翡�� �߱��� �ؾ� �Ǵ� �μ��� ��ǥ�ؾ� �Ѵ�.
--  �μ��ڵ尡 D5, D6, D9 �߱�, �׿ܴ� �߱پ��� ���� ��µǵ��� �Ѵ�.
--  ��� ���� �̸�, �μ��ڵ�, �߱����� (�μ��ڵ� ���� �������� ������.)
--  (�μ��ڵ尡 NULL �� ����� �߱پ��� ���� �ؾߵ�)

--  Ǯ�� 1)
SELECT EMP_NAME ������, DEPT_CODE �μ��ڵ�,
DECODE(DEPT_CODE, 'D5', '�߱�', 'D6', '�߱�', 'D9', '�߱�', '�߱پ���')  �߱�����
FROM EMPLOYEE
ORDER BY DEPT_CODE;

--  Ǯ�� 2)
SELECT EMP_NAME ������, DEPT_CODE �μ��ڵ�,
    CASE
            WHEN DEPT_CODE IN ('D5', 'D6', 'D9') THEN '�߱�'
            ELSE '�߱پ���'
    END
    �߱�����
FROM EMPLOYEE ORDER BY DEPT_CODE;


--  �ǽ� ���� 12.
--  �μ��ڵ尡 D5�̸� �ѹ���, D6�̸� ��ȹ��, D9�̸� �����η� ó���Ͻÿ�.
--  ��, �μ��ڵ尡 D5, D6, D9 �� ������ ������ ��ȸ��
--  �μ��ڵ� ���� �������� ������.
SELECT EMP_NAME ������, DEPT_CODE �μ��ڵ�, 
DECODE(DEPT_CODE, 'D5', '�ѹ���', 'D6', '��ȹ��', 'D9', '������') �μ���
FROM EMPLOYEE
WHERE 
DEPT_CODE IN ('D5', 'D6', 'D9') 
ORDER BY DEPT_CODE;


--  �ǽ� ���� 13.
--  ������, �μ��ڵ�, �������, ���� ��ȸ
--  ��, ��������� �ֹι�ȣ���� �����ؼ�, 
--  00�� 00�� 00�Ϸ� ��µǰ� ��.
--  ���̴� �ֹι�ȣ���� �����ؼ� ��¥�����ͷ� ��ȯ�� ����, �����
--  *   �ֹι�ȣ�� �̻��� ������� ���ܽ�Ű�� ���� (200, 201, 214 �� ����)
--  *   ��Ʈ : NOT IN ���
--  Ǯ�� 1)
SELECT EMP_NAME ������, DEPT_CODE �μ��ڵ�,
    SUBSTR(EMP_NO, 1, 2)||'�� '|| SUBSTR(EMP_NO, 3, 2)||'�� '||
    SUBSTR(EMP_NO, 5, 2)||'��' �������,
    CEIL(MONTHS_BETWEEN (SYSDATE, TO_DATE('19'||TO_DATE(SUBSTR(EMP_NO, 1, 2), 'YYYY'))) / 12) ����
FROM EMPLOYEE
WHERE
EMP_ID NOT IN(200, 201, 214)
;
-- Ǯ�� 2)
SELECT EMP_NAME ������, DEPT_CODE �μ��ڵ�,
    SUBSTR(EMP_NO, 1, 2) || '��' || SUBSTR(EMP_NO, 3, 2) || '��' || SUBSTR(EMP_NO, 5, 2) || '��' �������,
    EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM TO_DATE(SUBSTR(EMP_NO, 1 ,6), 'RRMMDD'))+1 ����
FROM EMPLOYEE
WHERE EMP_ID NOT IN(200, 201, 214)
;

--  �ǽ� ���� 14.
--  �������� �Ի��Ϸ� ���� �⵵�� ������, �� �⵵�� �Ի��ο����� ���Ͻÿ�.
--  1998~2004 �⵵�� �Ի��� �ο����� ��ȸ�Ͻÿ�. ���������� ��ü�������� ���Ͻÿ�.

--  Ǯ�� 1)
--COUNT�� ����ϴ� ���. COUNT�� NULL�� ��츸 ���� �����Ƿ� 0�� ī��Ʈ �Ǳ⿡ DECODE�� �� �� 0�� ���� �ʴ´�.
SELECT 
    COUNT(DECODE(TO_CHAR(HIRE_DATE, 'YYYY'), 1998, 1)) "1998��",
    COUNT(DECODE(TO_CHAR(HIRE_DATE, 'YYYY'), 1999, 1)) "1999��",
    COUNT(DECODE(TO_CHAR(HIRE_DATE, 'YYYY'), 2000, 1))" 2000��",
    COUNT(DECODE(TO_CHAR(HIRE_DATE, 'YYYY'), 2001, 1)) "2001��",
    COUNT(DECODE(TO_CHAR(HIRE_DATE, 'YYYY'), 2002, 1)) "2002��",
    COUNT(DECODE(TO_CHAR(HIRE_DATE, 'YYYY'), 2003, 1)) "2003��",
    COUNT(DECODE(TO_CHAR(HIRE_DATE, 'YYYY'), 2004, 1)) "2004��",
    COUNT(*) ��ü������
FROM EMPLOYEE;

--  Ǯ�� 2)
--  SUM�� ����ϴ� ���. SUM�� �� ���� �Ѱ��� NULL�� ���� �������� ���� NULL�� ó���Ǳ⿡ DECODE�� �� �� 0�� �ִ´�.
SELECT
    SUM(DECODE(EXTRACT(YEAR FROM HIRE_DATE), 1998, 1, 0)) "1998��",
    SUM(DECODE(EXTRACT(YEAR FROM HIRE_DATE), 1999, 1, 0)) "1999��",
    SUM(DECODE(EXTRACT(YEAR FROM HIRE_DATE), 2000, 1, 0)) "2000��",
    SUM(DECODE(EXTRACT(YEAR FROM HIRE_DATE), 2001, 1, 0)) "2001��",
    SUM(DECODE(EXTRACT(YEAR FROM HIRE_DATE), 2002, 1, 0)) "2002��",
    SUM(DECODE(EXTRACT(YEAR FROM HIRE_DATE), 2003, 1, 0)) "2003��",
    SUM(DECODE(EXTRACT(YEAR FROM HIRE_DATE), 2004, 1, 0)) "2004��",
    COUNT(*) ��ü������
    FROM EMPLOYEE;
--  Ǯ�� 3)
SELECT 
    NVL(SUM(DECODE(TO_CHAR(HIRE_DATE, 'YYYY'), 1998, 1)), 0) AS "1998��",
    NVL(SUM(DECODE(TO_CHAR(HIRE_DATE, 'YYYY'), 1999, 1)), 0) AS "1999��",
    NVL(SUM(DECODE(TO_CHAR(HIRE_DATE, 'YYYY'), 2000, 1)), 0) AS "2000��",
    NVL(SUM(DECODE(TO_CHAR(HIRE_DATE, 'YYYY'), 2001, 1)), 0) AS "2001��",
    NVL(SUM(DECODE(TO_CHAR(HIRE_DATE, 'YYYY'), 2002, 1)), 0) AS "2002��",
    NVL(SUM(DECODE(TO_CHAR(HIRE_DATE, 'YYYY'), 2003, 1)), 0) AS "2003��",
    NVL(SUM(DECODE(TO_CHAR(HIRE_DATE, 'YYYY'), 2004, 1)), 0) AS "2004��",
    COUNT(*) AS "��ü������"
FROM EMPLOYEE;


--  GROUP BY
SELECT DEPT_CODE, COUNT(*), FLOOR(AVG(SALARY))FROM EMPLOYEE 
GROUP BY DEPT_CODE
ORDER BY 3;

--  GROUP BY�� ���� �Լ��� ������ ����ص� �ȴ�.
SELECT
    DECODE(SUBSTR(EMP_NO, 8, 1), 1, '��', 2, '��') ����,
    FLOOR(AVG(SALARY))�޿����,
    COUNT(*) �ο���
FROM EMPLOYEE
GROUP BY DECODE(SUBSTR(EMP_NO, 8, 1), 1, '��', 2, '��');


--  �޿��� 300���� �̻��� ������ �μ��ڵ庰 ���
-- ó������!
-- 1) WHERE SALARY >= 3000000
-- 2) FLOOR(AVG(SALARY)) ��ձ޿�
-- > ����� ó�������� ������ϰ� �ڵ带 ¥�� ���ϴ� ���� �ȳ����� �� ����..!
-- > �׷� �Լ� ���� ��
SELECT
    DEPT_CODE, FLOOR(AVG(SALARY)) ��ձ޿�
FROM EMPLOYEE
WHERE SALARY >= 3000000
GROUP BY DEPT_CODE;

-- �μ��� ��ü ������ ��ձ޿��� ���ϰ�, ���߿� ��ձ޿� 300���� �̻��� �μ��� ���
-- > �׷� �Լ� ���� ��
-- > ó�� ������, 
-- 1) WHERE
-- 2) GROUP BY
-- 3) HAVING
SELECT
    DEPT_CODE, FLOOR(AVG(SALARY)) ��ձ޿�
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

-- ����Ŭ ���뱸��(���ϴ� �÷��� �̸��� �ٸ����)
SELECT EMP_NAME, DEPT_CODE, DEPT_TITLE
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_CODE = DEPT_ID;

-- ǥ�ر���(���ϴ� �÷��� �̸��� �ٸ����)
SELECT EMP_NAME, DEPT_CODE, DEPT_TITLE
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);
------------------------------------------------------------------------------

SELECT EMP_NAME, JOB_CODE FROM EMPLOYEE;
SELECT * FROM JOB;

--  ����Ŭ ���� (���ϴ� �÷� �̸��� ���� ���)
SELECT EMP_NAME, EMPLOYEE.JOB_CODE, JOB_NAME
FROM EMPLOYEE, JOB
WHERE EMPLOYEE.JOB_CODE = JOB.JOB_CODE;
--  ����Ŭ ���� (���ϴ� �÷� �̸��� ���� ���) + ��Ī �̿�
SELECT EMP_NAME, E.JOB_CODE, JOB_NAME
FROM EMPLOYEE E, JOB J
WHERE E.JOB_CODE = J.JOB_CODE;

-- ǥ�ع��� (���ϴ� �÷� �̸��� ���� ���), ��Ī���
SELECT EMP_NAME, E.JOB_CODE, JOB_NAME
FROM EMPLOYEE E
JOIN JOB J ON (E.JOB_CODE = J.JOB_CODE);
-- ǥ�ع��� (���ϴ� �÷� �̸��� ���� ���) + USING �� ���̺��� ������ ���� �� �������� (�÷����� �ٸ���� ���Ұ�)
SELECT EMP_NAME, JOB_CODE, JOB_NAME
FROM EMPLOYEE 
JOIN JOB USING (JOB_CODE);
-------------------------------------------------------------------------------
-- ��������
-- �� �� �̻��� ���̺��� ������ �� ��ġ�ϴ� ���� ���� ���� ���ο��� ���ܵǴ� ��
SELECT EMP_NAME, DEPT_CODE, DEPT_TITLE
FROM EMPLOYEE
INNER JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);

--  �ܺ�����
-- �ΰ� �̻��� ���̺��� ������ ��, ��ġ�ϴ� ���� ���� �൵ ���ο� ���Խ�Ű�� ��

-- 1) LEFT JOIN  --�ܺ����� �� ���� ���� ����
-- LEFT�� ���� �� ���̺�(FROM)�� ����� �ϰ�, ���߿� �� ���̺�(JOIN)�� ������� �ʴ´�.
SELECT EMP_NAME, DEPT_CODE, DEPT_TITLE
FROM EMPLOYEE LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);

-- 2) RIGHT JOIN
-- RIGHT�� ���߿� �� ���̺�(JOIN)�� ����� �ϰ�, ���� �� ���̺�(FROM)�� ������� �ʴ´�.
SELECT EMP_NAME, DEPT_CODE, DEPT_TITLE
FROM EMPLOYEE RIGHT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);

-- 3) FULL JOIN (���� �ܺ� ����)
-- FULL�� ���� ��� ����� �Ѵ�.
SELECT EMP_NAME, DEPT_CODE, DEPT_TITLE
FROM EMPLOYEE FULL JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);

-- ��ȣ���� CROSS JOIN, Cartensian Product
-- ī���̼� ��(Ccarensian prjuct)��� �ϸ�, ���εǴ� ���̺��� �� ����� ��� ���ε� �����Ͱ� �˻��Ǵ� ����
SELECT EMP_NAME, DEPT_TITLE
FROM EMPLOYEE
CROSS JOIN DEPARTMENT;


-- SELF JOIN (�ڱ��ڽ� ���̺�� ����)
-- ���� ���̺� ������ JOIN�� �ʿ��� ��� ����� �Ѵ�.
-- ���̺� �̸��� ��Ī�� �Է��Ͽ� JOIN�� ����Ѵ�.

-- ��� ������ ������ ID�� Ȯ��
SELECT EMP_NAME, MANAGER_ID FROM EMPLOYEE;
-- ��� ������ ������ ID, ������ �̸��� ��ȸ
SELECT E1.EMP_NAME �����, E1.EMP_ID ���, E2.EMP_NAME �Ŵ����̸� 
FROM EMPLOYEE E1
JOIN EMPLOYEE E2 ON (E1.MANAGER_ID = E2.EMP_ID);
-- ��� ������ ������ ID, ������ �̸��� ��ȸ (������ �Ҵ� �ȵ� ������ ��ȸ)
SELECT E1.EMP_NAME �����, E1.EMP_ID ���, NVL(E2.EMP_NAME,'�������ȵ�') �Ŵ����̸� 
FROM EMPLOYEE E1
LEFT JOIN EMPLOYEE E2 ON (E1.MANAGER_ID = E2.EMP_ID);


-- �������� : ������ ���̺��� �ѹ��� ����
-- �������� ���̺��� JOIN�� �ϰ� �ʹٸ� ���� JOIN�� �� �� �ڿ� JOIN�� �߰��� �����ϸ� �ȴ�.
-- JOIN�� ���������� ���ʴ�� �����ϰ� �ǹǷ� JOIN�� ������ �߿��ϴ�. (���̺��� ���� ������ �ִٸ�)
-- �������̺� ���� �ٸ� JOIN�� ���̺��� ���� ������ ���ٸ� ������ �������.
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
 
-- �������̺� ���� �ٸ� JOIN�� ���̺��� ���� ������ ���ٸ� ������ �������.
SELECT EMP_NAME, DEPT_TITLE, JOB_NAME
FROM EMPLOYEE
JOIN JOB USING(JOB_CODE);
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)

-- �Ʒ� �ڵ�ó�� ���� ������ �ִ� ���̺����� ������ �߿��ϴ�.
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

-- ���� �ǽ����� 1)
-- �ֹι�ȣ�� 1970��� ���̸鼭 ������ �����̰�, ���� ������ ��������
-- �����, �ֹι�ȣ, �μ���, ���޸��� ��ȸ�Ͻÿ�.
SELECT EMP_NAME �����, EMP_NO �ֹι�ȣ, DEPT_TITLE �μ���, JOB_NAME ���޸�
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
JOIN JOB USING (JOB_CODE)
WHERE
(SUBSTR(EMP_NO, 1, 2) BETWEEN 70 AND 79) AND
(SUBSTR(EMP_NO, 8, 1) = 2) AND(EMP_NAME LIKE '��%')
;

-- ���� �ǽ����� 2)
-- �̸��� '��'�ڰ� ���� �������� ���, �����, �μ����� ��ȸ�Ͻÿ�.
SELECT EMP_ID ���, EMP_NAME �����, DEPT_TITLE �μ���
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
WHERE
EMP_NAME LIKE '%��%'
;

-- ���� �ǽ����� 3)
-- �ؿܿ����ο� �ٹ��ϴ� �����, ���޸�, �μ��ڵ�, �μ����� ��ȸ�Ͻÿ�
SELECT EMP_NAME �����, JOB_NAME ���޸�, DEPT_CODE �μ��ڵ�, DEPT_TITLE �μ���
FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
LEFT JOIN JOB USING (JOB_CODE)
WHERE
DEPT_TITLE LIKE '�ؿܿ���%'
;

-- ���� �ǽ����� 4)
-- ���ʽ�����Ʈ�� �޴� �������� �����, ���ʽ�����Ʈ, �μ���, �ٹ� �������� ��ȸ�Ͻÿ�.
SELECT EMP_NAME �����, BONUS ���ʽ�, DEPT_TITLE �μ���, LOCAL_NAME �ٹ�������
FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
LEFT JOIN LOCATION ON(LOCATION_ID = LOCAL_CODE)
WHERE
BONUS IS NOT NULL
;

-- ���� �ǽ����� 5)
-- �μ��ڵ尡 D2�� �������� �����, ���޸�, �μ���, �ٹ��������� ��ȸ�Ͻÿ�.
SELECT EMP_NAME �����, JOB_NAME ���޸� , DEPT_TITLE �μ���, LOCAL_NAME �ٹ�������
FROM EMPLOYEE
JOIN JOB USING (JOB_CODE) 
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
JOIN LOCATION ON(LOCATION_ID = LOCAL_CODE)
WHERE
DEPT_CODE = 'D2'
;

-- ���� �ǽ����� 6)
-- �ѱ�(KO)�� �Ϻ�(JP)�� �ٹ��ϴ� �������� �����, �μ���, ������, �������� ��ȸ�Ͻÿ�.
SELECT EMP_NAME �����, DEPT_TITLE �μ���, LOCAL_NAME �ٹ�������, NATIONAL_NAME ������
FROM EMPLOYEE 
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
JOIN LOCATION ON(LOCATION_ID = LOCAL_CODE)
JOIN NATIONAL USING (NATIONAL_CODE)
WHERE
NATIONAL_CODE IN ('KO', 'JP')
;

-- ���� �ǽ����� 7)
-- ���� �μ��� �ٹ��ϴ� �������� �����, �μ���, �����̸��� ��ȸ�Ͻÿ�.
SELECT E1.EMP_NAME �����, DEPT_TITLE �μ���, E2.EMP_NAME �����̸�
FROM EMPLOYEE E1
JOIN EMPLOYEE E2 USING (DEPT_CODE)
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
WHERE
E1.EMP_NAME != E2.EMP_NAME
;

-- ���� �ǽ����� 8)
-- ������ ����� ����� �������� �����, ���޸�, �޿��� ��ȸ�Ͻÿ�.
-- ��, JOIN�� IN ����� ��
SELECT EMP_NAME �����, JOB_NAME ���޸�, SALARY �޿�
FROM EMPLOYEE
JOIN JOB USING(JOB_CODE)
WHERE
JOB_NAME IN ('����', '���')
;