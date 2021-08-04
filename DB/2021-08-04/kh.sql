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