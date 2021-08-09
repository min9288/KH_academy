-- ȸ������ ����� ���̺�
-- � ������ �������� -> �̸�, ���̵�, ����, ��й�ȣ, �̸���, �������, �ּ�, ��ȭ��ȣ

/*
������ ������ �÷��̸�, �ڷ���
CHAR        :   �������� ���ڿ� -> �����͸� �����ϰ� �������� �������� ä��
VARCHAR2    :   �������� ���ڿ� -> �����͸� �����ϰ� �������� ����
�̸�(����� ���Ұ�) USER_NAME(userName)   VARCHAR2 -> 15(�ѱ� 1���ڴ� 3 BYTE -> �ִ� 5����)
���̵�    USER_ID                              VARCHAR2 -> 20(���� + ���� 20���� �̳�)
����      USER_AGE                             NUMBER
��й�ȣ  USER_PASS                            VARCHAR2 -> 30(���� + ���� 30���� �̳�)
�̸���    USER_EMAIL                           VARCHAR2 -> 50(���� + ���� 50���� �̳�)
�������  USER_BIRTH                           CHAR, VARCHAR2, NUMBER, DATE
�ּ�      USER_ADDR                            VARCHAR2 -> 30
��ȭ��ȣ  USER_PHONE                           CHAR -> 13 000 - 0000 - 0000 ����
-- ���̺� �̸� : USER_INFO
-- ���̺� ���� ����
CREATE TABLE ���̺��̸� (
    �÷��� �ڷ���(ũ��), 
    �÷��� �ڷ���(ũ��),
    ...
*/

CREATE TABLE USER_INFO(
    USER_NAME   VARCHAR2(15),
    USER_ID     VARCHAR2(20),
    USER_AGE    NUMBER,
    USER_PASS   VARCHAR2(20),
    USER_EMAIL  VARCHAR2(50),
    USER_BIRTH  DATE,
    USER_ADDR   VARCHAR2(300),
    USER_PHONE  CHAR(13)
);
SELECT * FROM USER_INFO;

COMMENT ON COLUMN USER_INFO.USER_NAME IS 'ȸ�� �̸�';
COMMENT ON COLUMN USER_INFO.USER_ID IS 'ȸ�� ���̵�';
COMMENT ON COLUMN USER_INFO.USER_AGE IS '����';
COMMENT ON COLUMN USER_INFO.USER_PASS IS '��й�ȣ';
COMMENT ON COLUMN USER_INFO.USER_EMAIL IS '�̸���';
COMMENT ON COLUMN USER_INFO.USER_BIRTH IS '�������';
COMMENT ON COLUMN USER_INFO.USER_ADDR IS '�ּ�';
COMMENT ON COLUMN USER_INFO.USER_PHONE IS '��ȭ��ȣ';


INSERT INTO USER_INFO VALUES ('���ο�1', 'user01', 30, '123456', 'user01@naver.com', to_date(19920808, 'yyyymmdd'),
                                '����� ������ �ʷϸ�����', '010-8764-2440');
                                
INSERT INTO USER_INFO VALUES ('���ο�2', 'user02', 20, '123456', 'user01@naver.com', to_date(20020809, 'yyyymmdd'),
                                '����� ��õ�� ������', '010-8764-2440');                

DELETE FROM USER_INFO WHERE USER_NAME = '���ο�1';                               
                                
COMMIT;