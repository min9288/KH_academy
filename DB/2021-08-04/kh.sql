--  EMPLOYEE ���̺��� ��� �÷��� ��ȸ
SELECT * FROM EMPLOYEE;

--  EMPLOYEE ���̺��� ���, �̸�, ��ȭ��ȣ ��ȸ
SELECT EMP_ID, EMP_NAME, PHONE FROM EMPLOYEE;
SELECT  EMP_NAME, EMP_ID, PHONE FROM EMPLOYEE;

-- EMPLOYEE ���̺��� �̸�, �̸���, �޿�, �ֹι�ȣ ��ȸ
SELECT  EMP_NAME, EMAIL, SALARY, EMP_NO FROM EMPLOYEE;

-- EMPLOYEE ���̺��� �̸��� �������� ������ ��� ������ ��ȸ
SELECT * FROM EMPLOYEE WHERE EMP_NAME ='������';

--  EMPLOYEE ���̺��� �μ��ڵ尡 D6�� ������ �̸�, ��ȭ��ȣ, �޿�
SELECT EMP_NAME, PHONE, SALARY FROM EMPLOYEE WHERE DEPT_CODE = 'D6'; 

-- EMPLOYEE ���̺��� �μ��ڵ尡 D6�� ������ �̸�, ��ȭ��ȣ, �޿�(����) ��ȸ
SELECT EMP_NAME, PHONE, SALARY*12 FROM EMPLOYEE WHERE DEPT_CODE = 'D6'; 

-- EMPLOYEE ���̺��� �μ��ڵ尡 D6�� ������ �̸�, ��ȭ��ȣ, �޿�(����) ��ȸ
SELECT EMP_NAME, PHONE, SALARY*12 AS ����, '��'  ���� FROM EMPLOYEE WHERE DEPT_CODE = 'D6';  
SELECT EMP_NAME, PHONE, SALARY*12 AS "������ ������ ����", '��'  ���� FROM EMPLOYEE WHERE DEPT_CODE = 'D6';  
--  -> ��Ī�� ���Ҷ� ���⸦ �Ϸ��� ' ' �� �ƴ� "" �� ����Ѵ�!    , �߰��� AS�� ��������
--  -> �̱�����(' ') �� ��������
-- -> AS ��������

--  EMPLOYEE ���̺��� �μ��ڵ� ��ȸ
SELECT DEPT_CODE FROM EMPLOYEE;

SELECT DISTINCT DEPT_CODE FROM EMPLOYEE;
SELECT DISTINCT EMP_NAME, DEPT_CODE FROM EMPLOYEE; -- DISTINCT �� ������ ���ǵ��� �Ѵ� ��ĥ ��� �ߺ����Ÿ� ���ְ� �ƴ϶�� �ߺ����Ű� �ȵ�

-- ���� ������ | |
SELECT EMP_NAME, PHONE, SALARY*12 | | '��' AS"������ ������ ����" FROM EMPLOYEE WHERE DEPT_CODE = 'D6';  


-- EMPLOYEE ���̺��� �μ��ڵ尡 D6�� ���� �� �޿��� 300���� �̻��� ������ �̸�, ��ȭ��ȣ, �μ��ڵ�, �޿��� ��ȸ
SELECT EMP_NAME, PHONE, DEPT_CODE, SALARY FROM EMPLOYEE WHERE DEPT_CODE = 'D6' AND SALARY >= 3000000;
-- EMPLOYEE ���̺��� �μ��ڵ尡 D6�� ���� �Ǵ� �޿��� 300���� �̻��� ������ �̸�, ��ȭ��ȣ, �μ��ڵ�, �޿��� ��ȸ
SELECT EMP_NAME, PHONE, DEPT_CODE, SALARY FROM EMPLOYEE WHERE DEPT_CODE = 'D6' OR SALARY >= 3000000;



--  �޿��� 350���� �̻� 600���� ���Ϸ� �޴� ������ �̸�, �޿�
SELECT EMP_NAME, SALARY FROM EMPLOYEE WHERE SALARY >= 3500000 AND SALARY <= 6000000;
SELECT EMP_NAME, SALARY FROM EMPLOYEE WHERE SALARY BETWEEN  3500000 AND  6000000;

--  EMPLOYEE ���̺��� �Ի��� 09/01/01 ~ 01/01/01 �� ����� ��ü���� ��ȸ
SELECT * FROM EMPLOYEE WHERE HIRE_DATE BETWEEN '90/01/01' AND '01/01/01'; 


--  LIKE / NOT LIKE
--  �̸� �� ���� '��'���� ������ �̸�, �޿� ��ȸ
--  ���ϵ�ī�� : �ƹ��ų� ��ü�ؼ� ����� �� �ִ� ��        ��XX
--  ->  _ :  �� ���� ���ϵ�ī��
--  ->  % : ���� ���� ������� ���ϵ�ī��
SELECT EMP_NAME, SALARY FROM EMPLOYEE WHERE EMP_NAME LIKE '��__';
SELECT EMP_NAME, SALARY FROM EMPLOYEE WHERE EMP_NAME LIKE '��%';
--  �̸� �� ���� '��'���� �ƴ� ������ �̸�, �޿� ��ȸ
SELECT EMP_NAME, SALARY FROM EMPLOYEE WHERE EMP_NAME NOT LIKE '��%';
--  �̸��� '��' ���ԵǾ� �ִ� ������ �̸�, �޿� ��ȸ
SELECT EMP_NAME, SALARY FROM EMPLOYEE WHERE EMP_NAME LIKE '%��%';
--  �̸� ��� '��' ���ԵǾ� �ִ� ������ �̸�, �޿� ��ȸ
SELECT EMP_NAME, SALARY FROM EMPLOYEE WHERE EMP_NAME LIKE '_��_';

--  EMAIL �տ� �۾��� 3������ ������ �̸�, �̸��� ��ȸ
SELECT EMP_NAME, EMAIL FROM EMPLOYEE WHERE EMAIL LIKE '___#_%'ESCAPE'#';


--  1.  EMPLOYEE ���̺��� �̸� ���� ������ ������ ����� �̸� ���
SELECT EMP_NAME FROM EMPLOYEE WHERE EMP_NAME LIKE '%��';
--  2.  EMPLOYEE ���̺��� ��ȭ��ȣ ó�� 3�ڸ��� 010�� �ƴ� ����� �̸�, ��ȭ��ȣ ���
SELECT EMP_NAME, PHONE FROM EMPLOYEE WHERE PHONE NOT LIKE '010%';
--  3.  EMPLOYEE ���̺��� ���� �ּҿ� 's'�� ���鼭 , DEPT_CODE�� D9 �Ǵ� D6 �̸�, ����� 90/01/01 ~ 00/12/01 �̸鼭 �޿��� 270���� �̻��� ����� ��ü����
SELECT * FROM EMPLOYEE 
WHERE 
(EMAIL LIKE '%s%') AND 
(DEPT_CODE = 'D9' OR DEPT_CODE ='D6') AND 
(HIRE_DATE BETWEEN '90/01/01' AND '00/12/01') AND 
SALARY >= 2700000;

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


