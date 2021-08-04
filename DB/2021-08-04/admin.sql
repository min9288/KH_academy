CREATE USER kh IDENTIFIED BY kh;
GRANT CONNECT,RESOURCE TO kh;

-- 잘 못 된것을 선언했다면 다시 만들기 위해 기존 것을 삭제해야됨
drop user kh;

