-- * �Լ�
-- - ������ �Լ�: ���� �࿡���� ���� �����ϰ� �ະ�� �ϳ��� ����� ����
-- - ������ �Լ�: ������ ���� �����Ͽ� ���� �׷�� �ϳ��� ����� ���� (��: count())
--  > ������ �Լ�: �����Լ�, �����Լ�, ��¥ �Լ�, ��ȯ�Լ�, �Ϲ��Լ�
-----------------------------------
--          �����Լ�
-----------------------------------
-- dual ���̺�: ����Ŭ ��ü���� ���� Ȯ���ϱ� �뵵�� �����ϴ� ���̺�
select * from dual;
select * from employees;
-- initcap: �ܾ �������� ù ���ڸ� �빮�ڷ� �������� �ҹ��ڷ� ��ȯ�ϴ� �Լ�
select email from employees;
select initcap(email) from employees;
select initcap('database specialist') from dual;
-- Database Specialist
select initcap('databasespecialist') from dual;
-- Databasespecialist



-- lower: ��ü���ڸ� �ҹ��ڷ� ����� �Լ�
select lower('DATABASE SPECIALIST') from dual;
-- database specialist

-- upper: ��ü���ڸ� �빮�ڷ� ����� �Լ�
select upper('database specialist') from dual;
-- DATABASE SPECIALIST

-- length: ���ڿ��� ���̸� ��ȯ�ϴ� �Լ�
select length('database specialist') from dual;
-- 19
select length('�����ͺ��̽� ������') from dual;
-- 10: �ѱ��� ��� ���ڸ� 1�� ī��Ʈ

-- concat: �� ���ڿ��� �����Ͽ� ��ȯ
select concat('�����ͺ��̽�', '������') from dual;
-- �����ͺ��̽�������
select concat('�����ͺ��̽� ', '������') from dual;
select concat('�����ͺ��̽�', ' ������') from dual;
-- �����ͺ��̽� ������

-- substr: substr([���ڿ�],[�����ε���],[�����ε����κ��� Offset])
-- ���ڿ��� �������� �����ε������� (�����±��� ������)�� �ε����� ���ڿ� ��ȯ
-- ���ǻ���: ���ڿ��� �����ε��� 1
select substr('database specialist',5,8) from dual;
select substr('database specialist',1,8) from dual;
select substr('database specialist',10,7) from dual;
-- base ���ڸ� substr�� �ĺ��ϼ���.
select substr('database specialist', 5, 4) from dual;
-- ���ڿ� ���� ���������� 3���� ��ȯ (���� ���̽� �����̰̽� ���� ȿ�� [-3:])
select substr('database specialist is you', -3) from dual;

-- instr: instr([���ڿ�],[ã���� �ϴ� ���ڿ�]) => ã�����ϴ� ���ڿ��� �ִٸ� �ش� ���ڿ��� �ε���
select instr('�����ͺ��̽� ������','��') from dual;
-- 8
select instr('�����ͺ��̽� ������','��') from dual; => ã�����ϴ� ���ڿ��� ������ 0 ��ȯ
-- 0

-- rpad/lpad: �־��� �ڸ��� ��ŭ ������(rpad)/����(lpad)�� ������ ���ڿ��� ä���.
-- rpad/lpad([���ڿ�],[ä���ڸ���],[ä�﹮��])
select rpad('James',10,'*') from dual;
-- James*****
select rpad('ȫ�浿',10,'*') from dual;
-- ȫ�浿******* (X)
-- ȫ�浿****  : �ѱ��� ��� �ѱ��ڴ� 2�� ��� 
select lpad('ȫ�浿',10,'*') from dual;
-- ****ȫ�浿

-- Q] �������̺��� �̸� 10�ڸ��� ������ �������� '-'�� ä���
--      �޿� 10�ڸ��� ������ ������ '*'�� ä���� ���
select rpad(last_name, 10, '-'), lpad(salary, 10,'*')
from employees;

-- ltrim/rtrim/trim: ���ڿ��� �������� ������ ���ڸ� ���� ����, ������, �������� ����
-- ltrim/rtrim([���ڿ�],[�����ҹ��ڿ�]) ������ ���ڿ� �⺻���� ���鹮��
-- trim([���ڿ�]) ���� ���� ���� ����
select ltrim('    �����ͺ��̽�    ������    ') as name from dual;
select ltrim('####�����ͺ��̽�####������####','#') as name from dual;
-- �����ͺ��̽�####������####

select rtrim('    �����ͺ��̽�    ������    ') as name from dual;
select rtrim('####�����ͺ��̽�####������####','#') as name from dual;

select trim('    �����ͺ��̽�    ������    ') as name from dual;
-- �����ͺ��̽�    ������
-- trim �Լ� �Ű������� ����ġ, ���鸸 ����
select trim('####�����ͺ��̽�####������####','#') as name from dual; -- �����߻�

-- replace
select replace('JavaSpecailist','Java','BigData') from dual;
-- BigDataSpecailist
select replace('Java Specailist', ' ', '') from dual; -- ���� ���ſ����� replace ���
select replace('�����ͺ��̽�    ������','    ','') as name from dual;    -- ��� Ư�������� �������
select replace('�����ͺ��̽�    ������','   ','') as name from dual;  -- ������ ��ġ���� ������ �����Ұ�
-- ��� ���鹮�ڸ� ���ڰ����� ������� ����
select replace('�����ͺ��̽�    ������',' ','') as name from dual;
select replace('�����ͺ��̽�    ������','   ','') as name from dual;
-- �����ͺ��̽�������

���� 1:
EMPLOYEES ���̺��� FIRST_NAME�� ��� �빮�ڷ� ��ȯ�Ͽ� ����ϴ� SQL ���� �ۼ��ϼ���.
select upper('first_name') from dual;
select upper(first_name) from employees;

���� 2:
EMPLOYEES ���̺��� LAST_NAME�� ��� �ҹ��ڷ� ��ȯ�Ͽ� ����ϴ� SQL ���� �ۼ��ϼ���.
select lower(first_name) from employees;
���� 3:
EMPLOYEES ���̺��� FIRST_NAME�� ���̸� ����ϴ� SQL ���� �ۼ��ϼ���.
select length(first_name) from employees;
���� 4:
EMPLOYEES ���̺��� FIRST_NAME�� ù ��° ���ڸ� ����ϴ� SQL ���� �ۼ��ϼ���.
select substr(first_name,1,1) from employees;
���� 5:
EMPLOYEES ���̺��� FIRST_NAME�� ������ �� ���ڸ� ����ϴ� SQL ���� �ۼ��ϼ���.
select substr(first_name,-2) from employees;
���� 6:
EMPLOYEES ���̺��� FIRST_NAME�� LAST_NAME�� ���ļ� FullName�̶�� �÷����� ��ȸ�Ϸ��� �մϴ�. �������� ���е� ��ü �̸��� ����ϴ� SQL ���� �ۼ��ϼ���.
select first_name||' ' ||last_name as FullName from employees;
���� 7:
dual ���̺���  '@' ��ȣ ������ ����� �̸� �κ��� ����ϴ� SQL ���� �ۼ��ϼ���.
�׽�Ʈ ���̽�
'haeun@alpha.com'
'hklee0724@gmail.com' (�׸��� �������� �̸��� ����).
select substr('haeun@alpha.com',) from dual;
���� 8:
EMPLOYEES ���̺��� �̸��� �̸��״��, �ҹ��ڷ�, ù���ڸ� �빮�ڷ�, ��δ빮�ڷ� ����غ�����.
select first_name, lower(first_name), initcap(first_name), upper(first_name) from employees;
���� 9:
EMPLOYEES ���̺��� JOB_ID �÷��� ����� ���� Ÿ��Ʋ���� �� ��°���� �� ��° ���ڱ����� �����Ͽ� ����ϴ� SQL ���� �ۼ��ϼ���.
select job_id, substr(job_id, 4,10) as Substring
from employees;

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
--EMPLOYEES ���̺��� EMAIL �÷��� ����� �̸��� �ּҿ��� '@' ��ȣ ������ ����� �̸� �κ��� ����ϴ� SQL ���� �ۼ��ϼ���.
-- select email from employees;
-- SELECT SUBSTR(EMAIL, 1, INSTR(EMAIL, '@') - 1) AS UserName
-- FROM EMPLOYEES;

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