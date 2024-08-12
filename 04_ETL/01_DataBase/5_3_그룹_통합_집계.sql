-- union all�� ���� ����
-- step1] ���� ����
-- �μ��� ��� �޿�
select department_id, round(avg(salary),2)
from employees
group by department_id;

-- ������ ��ձ޿�
select job_id, round(avg(salary),2)
from employees
group by job_id;

-- union all : ���� �ٸ� ������ ����� ����
-- union all�� ���ս� �����ϴ� ���� Ÿ���� �����ؾ� �Ѵ�.

describe employees;
select distinct job_id from employees;

-- �μ��� ��� �޿�
-- department_id�� ����Ÿ���̰� ������ job_id�� Ÿ�� ���ڿ��� �ٸ��� ������ ������ �� ����.
-- select department_id, round(avg(salary),2)
select to_char(department_id), round(avg(salary),2)
from employees
group by department_id
union all
-- ������ ��ձ޿�
-- job_id�� �����ϱ� ���ؼ� ���ڷ� ������ �ؾ������� ����Ұ��� ���� ������ �ֱ� ������
-- Ÿ�Ժ����� department_id�� ���ڷ� �����Ѵ�.
select job_id, round(avg(salary),2)
from employees
group by job_id;

-- union all�� ����� grouping sets �Լ��� ����
select department_id, job_id, round(avg(salary),2) 
from employees
-- set ( ����1, ����2 )
-- ����1�� �׷����� ����� ����2�� �׷����� ����� ������ 
group by grouping sets (department_id, job_id)
order by department_id, job_id;


-- ��з�, �Һз��� ������ �����Ϸ��� �� ��
select department_id, job_id, round(avg(salary),2) 
from employees
-- set ( ( ����1, ....,  ����N ) )
-- ��)
-- set ( ( ����1, ����2 ) )
-- ����1�� ����2�� �׷����� ���
group by grouping sets ( (department_id, job_id) ) -- �μ��� ������ ��ձ޿�
order by department_id, job_id;

-- grouping set ���Ȯ��
-- �׷��1 ~ �׷��N������ ������
-- grouping set ( (�׷��1), (�׷��2) ...)
select department_id, job_id, manager_id, round(avg(salary),2) ��ձ޿�  
from employees
group by grouping sets ( (department_id, job_id), (job_id, manager_id ))
order by department_id, job_id, manager_id;


-- Rollup, Cube
-- ������ grouping ��ĺ��� �� ���� ���� ����� ����

-- Rollup
-- ��������(���� �ұ׷�) �Ұ�, �Ѱ�(��׷�)�� ����
select department_id, job_id, round(avg(salary), 2), count(*)
from employees
group by rollup(department_id, job_id)
order by department_id, job_id;

-- cube
-- rollup ������ ������ �׷��� ���� ���� �Ұ� ������ �߰�
select department_id, job_id, round(avg(salary), 2), count(*)
from employees
group by cube(department_id, job_id)
order by department_id, job_id;