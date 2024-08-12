--���� 1:
--EMPLOYEES ���̺��� FIRST_NAME�� ��� �빮�ڷ� ��ȯ�Ͽ� ����ϴ� SQL ���� �ۼ��ϼ���.
SELECT UPPER(FIRST_NAME)
FROM EMPLOYEES;

--���� 2:
--EMPLOYEES ���̺��� LAST_NAME�� ��� �ҹ��ڷ� ��ȯ�Ͽ� ����ϴ� SQL ���� �ۼ��ϼ���.
SELECT LOWER(LAST_NAME)
FROM EMPLOYEES;

--���� 3:
--EMPLOYEES ���̺��� FIRST_NAME�� ���̸� ����ϴ� SQL ���� �ۼ��ϼ���.
SELECT LENGTH(FIRST_NAME)
FROM EMPLOYEES;

--���� 4:
--EMPLOYEES ���̺��� FIRST_NAME�� ù ��° ���ڸ� ����ϴ� SQL ���� �ۼ��ϼ���.
SELECT SUBSTR(FIRST_NAME, 1, 1)
FROM EMPLOYEES;

--���� 5:
--EMPLOYEES ���̺��� FIRST_NAME�� ������ �� ���ڸ� ����ϴ� SQL ���� �ۼ��ϼ���.
SELECT SUBSTR(FIRST_NAME, -2)
FROM EMPLOYEES;

--���� 6:
--EMPLOYEES ���̺��� FIRST_NAME�� LAST_NAME�� ���ļ� FullName�̶�� �÷����� ��ȸ�Ϸ��� �մϴ�. �������� ���е� ��ü �̸��� ����ϴ� SQL ���� �ۼ��ϼ���.
SELECT FIRST_NAME || ' ' || LAST_NAME AS FullName
FROM EMPLOYEES;

--���� 7:
--dual ���̺���  '@' ��ȣ ������ ����� �̸� �κ��� ����ϴ� SQL ���� �ۼ��ϼ���.
--�׽�Ʈ ���̽�
--'haeun@alpha.com'
--'hklee0724@gmail.com' (�׸��� �������� �̸��� ����)
--EMPLOYEES ���̺��� EMAIL �÷��� ����� �̸��� �ּҿ��� '@' ��ȣ ������ ����� �̸� �κ��� ����ϴ� SQL ���� �ۼ��ϼ���.
-- select email from employees;
-- SELECT SUBSTR(EMAIL, 1, INSTR(EMAIL, '@') - 1) AS UserName
-- FROM EMPLOYEES;
-- step1]
select INSTR('haeun@joeun.com', '@') from dual;
select instr('athene74@naver.com','@') from dual;
select substr('haeun@joeun.com', 1, INSTR('haeun@joeun.com', '@')-1) as username from dual;
select substr('athene74@naver.com', 1, INSTR('athene74@naver.com','@')-1) as username from dual;
-- ��ø�Լ��ΰ�� ������ �Լ��� ���� �����Ѵ�.
-- ��) A( B() ) => ���� ���� B->A : B�Լ��� ���ϰ��� A�Լ��� �������ڷ� Ȱ���� �Ǵ� ����
SELECT SUBSTR('haeun@joeun.com', 1, INSTR('haeun@joeun.com', '@') - 1) AS UserName
FROM dual;
SELECT SUBSTR('hklee0724@gmail.com', 1, INSTR('haeun@joeun.com', '@') - 1) AS UserName
FROM dual; 

--���� 8:
--EMPLOYEES ���̺��� �̸��� �̸��״��, �ҹ��ڷ�, ù���ڸ� �빮�ڷ�, ��δ빮�ڷ� ����غ�����.
select last_name, lower(last_name),initcap(last_name),upper(last_name)
from employees;

--���� 9:
--EMPLOYEES ���̺��� JOB_ID �÷��� ����� ���� Ÿ��Ʋ���� �� ��°���� �� ��° ���ڱ����� �����Ͽ� ����ϴ� SQL ���� �ۼ��ϼ���.
SELECT JOB_ID, SUBSTR(JOB_ID, 4, 10) AS Substring
FROM EMPLOYEES;