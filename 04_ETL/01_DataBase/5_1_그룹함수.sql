/*
    �׷��Լ�(������ �Լ�)��?
    ������ ���� �����Ͽ� ���� �׷�� �ϳ��� ����� �����ϴ� ������ �м�/���� �Լ�
    �ֿ��Լ�
    count, sum, avg, min, max, variance, stddev
*/

select  count(salary), sum(salary), avg(salary), min(salary), max(salary), 
        variance(salary), stddev(salary)
from employees;

-- ��¥�� ��� min(): ���� ������ ��¥/max(): ���� �ֱ� ��¥.
select min(hire_date), max(hire_date)
from employees;

-- ������ ���:min(): ���ڼ����� ���� ���� ���/max(): ���� ������ ���� ���� ���
select min(first_name), max(first_name)
from employees;

-- ����] �������̺��� ���� ū �޿�����?
select max(salary) from employees;

-- Q] ������� �޿��� ����, ���, ǥ������, �׸��� �л��� ���ϼ���.
-- �� �Ҽ��� ���� ��  �ڸ����� �ݿø��Ұ�
-- Q] ������� �޿��� ����, ���, ǥ������, �׸��� �л��� ���ϼ���.
-- �� �Ҽ��� ���� �� ��? �ڸ����� �ݿø��Ұ�
--  ������ ��ȸ�� �̸��� �հ�, ���, ǥ������, �л� ���� �� ��
select sum(salary) as �հ�, 
       round(avg(salary),2) as ���, 
       round(stddev(salary),2) as ǥ������, 
       round(variance(salary),2) as �л�
from employees;

-- count �Լ� ���� ���ǻ���
-- count(*) �Լ��� null�� ���� ����.
select commission_pct from employees;
select * from employees; -- ��ü ���ڵ���� 107��
select count(*) from employees; -- ��ü ���ڵ���� 107��
-- commission_pct �� �������� ����: ���� �ִ� �͸� ī��Ʈ
select count(commission_pct) from employees;

-- ��� �λ�� ���ϱ�(���λ�ݾ�/�λ�ȷ��ڵ��� ��ü����) ���ϱ�
select
    sum(salary*commission_pct) ���λ�ݾ�,
    -- �� ���� �и��� ������ null�� �ִ� ��� ���ڵ嵵 �����Ͽ� ���
    round(sum(salary*commission_pct) / count(*),2) ���_�λ��_by_cnt_ast,
    -- �� ���� �и��� ������ null�� �ִ� ��� ���ڵ带 �����Ͽ� ���
    round(avg(salary*commission_pct), 2) ���_�λ��_by_avg
from employees;

����1: ���� ���̺��� ��ü ������ ���� ����ϼ���.
select count(*) as total_employees 
from employees;

����2: ���� ���̺��� ������ �ּ� �޿�(salary)�� ����ϼ���.
select min(salary) as min_salary
from employees;
����3: ���� ���̺��� ������ �ִ� �޿�(salary)�� ����ϼ���.
select max(salary) as max_salary
from employees;
����4: ���� ���̺��� ������ ��� �޿�(salary)�� ����ϼ���.
�ݿø� ó���ϼ���.
select round(avg(salary)) as average_salary
from employees;
����5: ���� ���̺��� ������ �޿� �հ踦 ����ϼ���.
select sum(salary) as total_salary
from employees;
����6: ���� ���̺��� ������ ���� ������ �Ի���(hire_date)�� ��ȸ�ϼ���.
select min(hire_date) as oldest_hire_date
from employees;
����7: ���� ���̺��� ������ ���� �ֱ� �Ի���(hire_date)�� ��ȸ�ϼ���.
select max(hire_date) recent_hire_date
from employees;
����8: ���� ���̺��� ������ �ּ� Ŀ�̼�(commission)�� ����ϼ���.
select min(commission_pct) as min_commission
from employees;
����9: ���� ���̺��� ������ �ִ� Ŀ�̼�(commission)�� ����ϼ���.
select max(commission_pct) as max_commission
from employees;
����10: ���� ���̺��� ������ Ŀ�̼�(commission)�� null�� ������ ���� ����ϼ���.
select count(*) as null_commission_employees 
from employees
where commission_pct is null;

-- ����1: ���� ���̺��� ��ü ������ ���� ����ϼ���.
SELECT COUNT(*) AS total_employees
FROM employees;

-- ����2: ���� ���̺��� ������ �ּ� �޿�(salary)�� ����ϼ���.
SELECT MIN(salary) AS min_salary
FROM employees;

-- ����3: ���� ���̺��� ������ �ִ� �޿�(salary)�� ����ϼ���.
SELECT MAX(salary) AS max_salary
FROM employees;

-- ����4: ���� ���̺��� ������ ��� �޿�(salary)�� ����ϼ���. �ݿø� ó���ϼ���.
SELECT ROUND(AVG(salary), 2) AS average_salary
FROM employees;

-- ����5: ���� ���̺��� ������ �޿� �հ踦 ����ϼ���.
SELECT SUM(salary) AS total_salary
FROM employees;

-- ����6: ���� ���̺��� ������ ���� ������ �Ի���(hire_date)�� ��ȸ�ϼ���.
SELECT MIN(hire_date) AS oldest_hire_date
FROM employees;

-- ����7: ���� ���̺��� ������ ���� �ֱ� �Ի���(hire_date)�� ��ȸ�ϼ���.
SELECT MAX(hire_date) AS recent_hire_date
FROM employees;

-- ����8: ���� ���̺��� ������ �ּ� Ŀ�̼�(commission)�� ����ϼ���.
SELECT MIN(commission_pct) AS min_commission
FROM employees;

-- ����9: ���� ���̺��� ������ �ִ� Ŀ�̼�(commission)�� ����ϼ���.
SELECT MAX(commission_pct) AS max_commission
FROM employees;

-- ����10: ���� ���̺��� ������ Ŀ�̼�(commission)�� null�� ������ ���� ����ϼ���.
SELECT COUNT(*) AS null_commission_employees
FROM employees
WHERE commission_pct IS NULL;