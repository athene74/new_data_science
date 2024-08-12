-- Group by: ������ ������ �����͸� �׷����Ѵ�. 
-- �׷�ȭ�� �����ͼ��� �������� �پ��� ������ �Լ��� �����Ͽ� �����͸� �м��� �� Ȱ��ȴ�.
-- Step1] group by�� ��(������ ���� ���� ��)�� select���� ��ġ ��Ų��.
-- �μ�ID�� �׷����Ͽ� �μ�ID ���
select department_id from employees;
select distinct department_id from employees;

select department_id
from employees
group by department_id;

-- group by�� ���� �Լ� ����
-- �μ��� �޿����
-- step2] group by �� ����� ���� �������Լ��� �����Ѵ�.
-- �μ��� ������
select department_id, count(*)
from employees
group by department_id;

-- ����] �μ��� ��ձ޿�

select department_id, round(avg(salary),2) as �μ���_��ձ޿�
from employees
group by department_id;

-- �׷��Լ��� �߸��� ��뿹
-- �������� �׷��Լ��� ȥ���ؼ� ����ϴ� ���� ���������� �߻�
-- �������� ���� ���� ���� ����� ������� �ϱ� ������ ������ �׷��Լ��� ���� ����Ϸ���
-- �������� ���� ���� group by�� ����� �ؾ��Ѵ�.
select department_id, avg(salary)
from employees;

/*
    group by�� ���� ���밡���� ��� ����

    select
    from
    where
    group by
    having
    order by
*/
-- having: group by �� ����� ���͸� �� �� ���
-- �μ��� ��� �޿�
select department_id, round(avg(salary),2)
from employees
group by department_id;
-- ��ձ޿��� 8000�̻��� �μ��� ��ձ޿�
select department_id, round(avg(salary),2)
from employees
group by department_id
having avg(salary) >=8000;

-- SQL ���� ����: select - from - where - group by - having - order by
-- ���� ���� ����: from - where - group by - having - select - order by
select job_id, avg(salary) ��ձ޿�
from employees
where job_id not like 'SA%' 
group by job_id
having avg(salary) > 8000
order by ��ձ޿� desc;

-- 2�� �̻� group by
SELECT 
    department_id, job_id,
    COUNT(*) AS employee_count
FROM 
    employees
GROUP BY 
    department_id, job_id
ORDER BY  -- ��з� ���� ������ ���� order by�� �Ѵ�. �����ϰ� �غ��� ���غ���
    department_id ASC;

1��~6�� select - from - group by
1. employees ���̺��� �� �μ����� ��� �޿��� ���ϼ���.
�Ҽ������� �ݿø�ó���ϼ���

select department_id, round(avg(salary),2) as �μ���_��ձ޿�
from employees
group by department_id;

2. �� �μ��� �ְ� �޿� ���ϱ�:

select department_id, round(max(salary),2) as �μ���_�ְ�޿�
from employees
group by department_id;

3. �� ��å���� ��� �޿� ���ϱ�:
select job_id,round(avg(salary),2) as ��å��_��ձ޿�
from employees
group by job_id;

4. �� ��å���� �ּ� �޿��� �ְ� �޿��� ���� ���ϱ�:
select job_id, max(salary)-min(salary) as ��å��_���̱޿�
from employees
group by job_id;

5. �� �Ŵ������� �Ҽӵ� �μ��� �� ���� �� ���ϱ�:
select manager_id, count(employee_id) as �Ŵ�����_����
from employees
group by manager_id;

6. �޿��� 10000 �̻��� �μ��� ���� �� ���ϱ�
===============================
select department_id, salary, count(*)
from employees
where salary >= 10000
group by department_id, salary;

7�� ���� select from group by having
7. �� ��å���� ��� �޿��� 5000 �̻��� ��å�� �������� �� ���ϱ�:
select job_id, salary, count(*)
from employees
group by job_id, salary
having avg(salary)>=5000;

select table_name from user_tables;

8. �� �μ��� ���� ���� 5�� �̻��� �μ��� ����:
select department_id, count(*)
from employees
group by department_id
having count(department_id)>=5;
9. �� ��å���� ���� ���� 3�� �̻��� ��å�� ����:
select job_id, count(*)
from employees
group by job_id
having count(job_id)>=3;
10. �Ŵ����� ���� ���� ���� ���� 5�� �̻��� �Ŵ��� ���ϱ�
select manager_id, count(*) as ������
from employees
group by manager_id
having count(manager_id)>=5;

-- ��������2
1. �μ��� ���� �� ��ȸ�Ͽ� �μ� id ������������ ����
������������ ����
select department_id, count(*)
from employees
group by department_id
order by count(department_id);

2. �μ��� ��� �޿��� �ּ� �޿� ��ȸ�ϱ� (�μ� ��� �޿��� 5000 �̻��� ��츸)
- ��ձ޿��� �Ҽ��� ���� �ݿø��ϼ���.
- �μ� id�� ���������Ͽ� �����ϼ���.
select department_id, round(avg(salary),2), min(salary)
from employees
group by department_id;

-- order by 

3. ������ �޿��� �հ�� �ְ� �޿� ��ȸ�ϱ� (�޿� �հ谡 10000 �̻��� ��츸)
- �޿� �հ�� �������� �����ϼ���.

4. �����ں� ���� ���� ���� ���� ���� �μ��� ��� �޿� ��ȸ�ϱ�
-- �Ŵ��� id�� �������� �����ϼ���.

5. �μ���, ������, �Ŵ����� �������� ���ϼ���.
- �μ�id, ����id, �Ŵ���id������ ���� ���� �����ϼ���.
select department_id, job_id, magener_id count(*)
from employees
group by department_id, job_id, magener_id;
6. �޿� ������ ���� ���� �� ��ȸ�ϱ�
�޿����� �� group by ����
0~3000, 3001~6000, 6001~9000, 9001 �̻�

1. employees ���̺��� �� �μ����� ��� �޿��� ���ϼ���.
�Ҽ������� �ݿø�ó���ϼ���

SELECT department_id, round(AVG(salary))
FROM employees
GROUP BY department_id;


2. �� �μ��� �ְ� �޿� ���ϱ�:

SELECT department_id, MAX(salary) AS max_salary
FROM employees
GROUP BY department_id;


3. �� ��å���� ��� �޿� ���ϱ�:

SELECT job_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY job_id;


4. �� ��å����  �ְ� �޿��� �ּ� �޿��� ���� ���ϱ�:

SELECT job_id, MAX(salary) - MIN(salary) AS salary_difference
FROM employees
GROUP BY job_id;


5. �� �Ŵ������� �� ���� �� ���ϱ�:

SELECT manager_id, COUNT(employee_id) AS total_employees
FROM employees
GROUP BY manager_id;

6. �޿��� 10000 �̻��� �μ��� ���� �� ���ϱ�
SELECT department_id, COUNT(*) AS employee_count
FROM employees
WHERE salary >= 10000
GROUP BY department_id;

7. �� ��å���� ��� �޿��� 5000 �̻��� (��å��) �������� �� ���ϱ�:
SELECT job_id, COUNT(employee_id) AS employee_count
FROM employees
GROUP BY job_id
HAVING AVG(salary) >= 5000;

8. �� �μ��� ���� ���� 5�� �̻��� �μ��� ������ ����:
SELECT department_id, COUNT(employee_id) AS total_employees
FROM employees
GROUP BY department_id
HAVING COUNT(employee_id) >= 5;

9. �� ��å���� ���� ���� 3�� �̻��� ������ ����:
SELECT job_id, COUNT(employee_id) AS employee_count
FROM employees
GROUP BY job_id
HAVING COUNT(employee_id) >= 3;

10. �Ŵ����� ���� ���� ���� ���� 5�� �̻��� �Ŵ����� ������ ���ϱ�
SELECT manager_id, COUNT(*) AS subordinate_count
FROM employees
GROUP BY manager_id
HAVING COUNT(*) >= 5;
-- 1. �μ��� ���� �� ��ȸ�Ͽ� �μ� id ������������ ����
SELECT department_id, COUNT(*) AS employee_count
FROM employees
GROUP BY department_id
ORDER BY department_id;

-- 2. �μ��� ��� �޿��� �ּ� �޿� ��ȸ�ϱ� (�μ� ��� �޿��� 5000 �̻��� ��츸)
SELECT department_id, ROUND(AVG(salary), 2) AS avg_salary, MIN(salary) AS min_salary
FROM employees
GROUP BY department_id
HAVING AVG(salary) >= 5000
ORDER BY department_id;

-- 3. ������ �޿��� �հ�� �ְ� �޿� ��ȸ�ϱ� (�޿� �հ谡 10000 �̻��� ��츸)
-- �޿� �հ�� ������������ ����
SELECT job_id, SUM(salary) AS total_salary, MAX(salary) AS max_salary
FROM employees
GROUP BY job_id
HAVING SUM(salary) >= 10000
ORDER BY total_salary DESC;

-- 4. �����ں� ���� ���� ���� ���� ���� �μ��� ��� �޿� ��ȸ�ϱ�
-- �Ŵ��� ID�� �������� ����
SELECT manager_id, COUNT(*) AS subordinate_count, AVG(salary) AS avg_salary
FROM employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id
ORDER BY manager_id;

-- 5. �μ���, ������, �Ŵ����� �������� ���ϼ���.
-- �μ�ID, ����ID, �Ŵ���ID �������� ����
SELECT department_id, job_id, manager_id, COUNT(*) AS employee_count
FROM employees
GROUP BY department_id, job_id, manager_id
ORDER BY department_id, job_id, manager_id;

-- 6. �޿� ������ ���� ���� �� ��ȸ�ϱ�
�޿����� �� group by ����
0~3000, 3001~6000, 6001~9000, 9001 �̻�
SELECT CASE 
         WHEN salary BETWEEN 0 AND 3000 THEN '0-3000'
         WHEN salary BETWEEN 3001 AND 6000 THEN '3001-6000'
         WHEN salary BETWEEN 6001 AND 9000 THEN '6001-9000'
         ELSE '9001 �̻�'
       END AS salary_range,
       COUNT(*) AS employee_count
FROM employees
GROUP BY 
       CASE 
         WHEN salary BETWEEN 0 AND 3000 THEN '0-3000'
         WHEN salary BETWEEN 3001 AND 6000 THEN '3001-6000'
         WHEN salary BETWEEN 6001 AND 9000 THEN '6001-9000'
         ELSE '9001 �̻�'
       END;
-- �ߺ� �ڵ� ����	   
WITH salary_ranges AS (
    SELECT CASE 
             WHEN salary BETWEEN 0 AND 3000 THEN '0-3000'
             WHEN salary BETWEEN 3001 AND 6000 THEN '3001-6000'
             WHEN salary BETWEEN 6001 AND 9000 THEN '6001-9000'
             ELSE '9001 �̻�'
           END AS salary_range
    FROM employees
)
SELECT salary_range,
       COUNT(*) AS employee_count
FROM salary_ranges
GROUP BY salary_range;