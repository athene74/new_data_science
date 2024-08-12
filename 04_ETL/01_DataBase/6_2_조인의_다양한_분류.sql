-- ������ ����
-- ������ ���� ���������� ���� �� ������ �ַ� �Ʒ� �������� �з�
-- �Ϲ� �з�: Inner Join(��������) / Outer Join(�ܺ�����) / Cross Join(��������) => ������ ������ ���� �з�
-- ǥ�� ����: Ansi Join(�Ƚ� ����) vs Oracle Join(����Ŭ ����) => Ansi ����: SQL ǥ�� ����
-- ���� ����: Explicit Join(����� ����) vs Implicit Join(�Ͻ��� ����)
-- ���� ����:(Inner/Left/Right/Full Outer/������(Union)/������(Difference)/������(Intersection)
-- ���⼺: Simple Join(�ܼ� ����) / Complex Join(���� ����)

-- Inner Join,  Explicit Join, ANSI Join 
select count(*) from employees;
--select 
select * from departments;
-- step1]
select *
from employees  
join departments  -- join [���մ�� ���̺��], join �� ���� �Ǹ� inner join�� ����ȴ�.
on employees.department_id = departments.department_id; -- ON [���� Ű ����] / ���տ� ����ϴ� �÷��� Ű(KEY)��� �Ѵ�.
-- ������ ���ο��� ���ο� ���� ������ ��������� ����

-- STEP2] ���̺� ��Ī ����
select *
from employees e -- ���̺�� ������ ���̺���� ��Ī�� ������ �� �ִ�. ��Ī�� ���� ���̺���� ù���ڸ� �ҹ��ڷ�
join departments d -- join [���մ�� ���̺��]
on e.department_id = d.department_id; -- ON [���� Ű ����] / ���տ� ����ϴ� �÷��� Ű(KEY)��� �Ѵ�.

-- STEP3] ���ɻ� �÷�����, �ߺ� �÷� ����
select e.employee_id, e.first_name,e.department_id, d.department_name
from employees e -- ���̺�� ������ ���̺���� ��Ī�� ������ �� �ִ�. ��Ī�� ���� ���̺���� ù���ڸ� �ҹ��ڷ�
join departments d -- join [���մ�� ���̺��]
on e.department_id = d.department_id; -- ON [���� Ű ����] / ���տ� ����ϴ� �÷��� Ű(KEY)��� �Ѵ�.

-- Implicit Join(�Ͻ���/������ ����)
-- NATURAL JOIN: 
-- ��� ������ �̸��� ���� �÷��鿡 ���� ���� (Oracle Join�̸� ANSI Join���� �����ϴ� ����� ����.)
-- Inner Join,  Oracle Join, Implicit Join
SELECT employee_id, first_name, department_id, department_name
FROM employees 
NATURAL JOIN departments
order by department_id;
-- �� natural join�� �� ���̺� ������ �̸��� ���� �÷��� 2���̱� ������
-- �ΰ��� �ķ����� Join�� �����ϰ� �ȴ�. (���� ������ ��������)
select *
from employees e 
join departments d 
on  e.department_id = d.department_id and
    e.manager_id = d.manager_id;
select count(*)
from employees e, departments d 
where  e.department_id = d.department_id and
    e.manager_id = d.manager_id;    

SELECT employee_id, first_name, employees.department_id, department_name
FROM employees 
JOIN departments ON employees.department_id = departments.department_id;

select count(*) from employees;
select department_id from departments;

SELECT COUNT(*) AS record_count
FROM employees
WHERE department_id IN (SELECT department_id FROM departments);


-- USING: using ���� ����Ͽ� ���ϴ� �÷��� ���ؼ� ��������� ����
-- Inner Join,  Oracle Join, explicit Join
SELECT first_name, department_name
FROM   employees 
JOIN   departments 
USING (department_id); -- ���̺� ���� �����Ͽ� ���� ������ ����ȭ


-- ��������(Complex Join): ���� �̻��� ���̺�� �����ϰų� ������ ���������� �����ϴ� ���
SELECT e.first_name AS name,
       d.department_name AS department, 
       l.street_address || ', ' || l.city || ', ' || l.state_province AS address
FROM  employees e 
JOIN  departments d 
ON    e.department_id=d.department_id AND employee_id = 103
JOIN  locations l 
ON    d.location_id=l.location_id;
select table_name, 
select * from employees;


1. ������ �̸�, �μ� �̸�, �׸��� �μ� ��ġ�� �����ϴ� ���� ���� ��ȸ�ϱ�.
select e.first_name, d.department_name, d.location_id
from employees e 
join departments d
on e.department_id = d.department_id;

select * from employees;
select * from departments;
2. �Ŵ����� �� �Ŵ������� ���� �����ϴ� ������ ������ �Բ� ��ȸ�ϱ�.
select *
from employees e 
join employees f
on e.employee_id= f.manager_id
order by f.manager_id;

3. ������ �̸�, ����, �޿�, �μ� ��ġ, �׸��� �ٹ��ϴ� �Ŵ����� �̸� ��ȸ�ϱ�.
select e.first_name, e.job_id, e.salary, d.location_id, f.first_name
from employees e
join departments d, employees f
on e.department_id = d.department_id and
    e.employee_id= f.manager_id;

4. �μ����� ��ü ������ ��� �޿��� �ִ� �޿� ��ȸ�ϱ�.
select e.department_id, round(avg(e.salary),2), max(e.salary)
from employees e
group by e.department_id;

5. �μ����� ���� ���� 5�� �̻��� �μ��� ������ �ش� �μ��� ���� �������� ���� ��ȸ�մϴ�.
select e.department_id, d.department_name, count(e.employee_id)
from employees e
join departments d
on e.department_id = d.department_id
group by e.department_id
having count(e.department_id)>=5;
