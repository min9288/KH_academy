-- ����� ���� �����ϴ� ���
-- CREATE USER �����̸� IDENTIFIED BY ��й�ȣ
CREATE USER testuser IDENTIFIED BY 1234;
GRANT CONNECT, RESOURCE TO testuser;
REVOKE CONNECT FROM testuser;

CREATE USER ddlexam IDENTIFIED BY 1111;
GRANT CONNECT, RESOURCE TO ddlexam;

DROP USER ddlexam; -- ���� ����
