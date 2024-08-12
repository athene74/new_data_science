--DB ������ ������ �������� ����
select table_name from user_tables;
-- ��� ������ ����� Ȯ�ΰ������ϴ� ������ ���̺� ����`
-- ���̺� A ����
drop table employees;
CREATE TABLE employees (
  employee_id number PRIMARY KEY,
  employee_name VARCHAR2(50), 
  department_id number
);

-- ���̺� A ������ ����
INSERT INTO employees (employee_id, employee_name, department_id)
VALUES (1, 'ȫ�浿', 101);
INSERT INTO employees (employee_id, employee_name, department_id)
VALUES (2, '��ö��', 102);
INSERT INTO employees (employee_id, employee_name, department_id)
VALUES (3, '�̿���', 101);
INSERT INTO employees (employee_id, employee_name, department_id)
VALUES (4, '�ڹ���', 102);
INSERT INTO employees (employee_id, employee_name, department_id)
VALUES (5, '�ֿ�ȣ', 103);
INSERT INTO employees (employee_id, employee_name, department_id)
VALUES (6, '������', 201);

-- ���̺� B ����
drop table departments;
CREATE TABLE departments (
  department_id number PRIMARY KEY,
  department_name VARCHAR2(50)
);


-- ���̺� B ������ ����
INSERT INTO departments (department_id, department_name)
VALUES (101, '����');
INSERT INTO departments (department_id, department_name)
VALUES (102, '����');
INSERT INTO departments (department_id, department_name)
VALUES (103, '������');
INSERT INTO departments (department_id, department_name)
VALUES (104, '�繫');

select * from employees;
select * from departments;
-- department_id: ����Ű
-- employees ���̺��� �μ�ID
select distinct department_id from employees order by department_id;

-- departments ���̺��� �μ� ID
-- 101, 102, 103, 104
-- Inner Join (ANSI Style): ������ ����� �� ���տ��� ���εǴ� Ű�� �����չ������� �Ͼ��.
SELECT e.employee_id, e.employee_name, e.department_id, d.department_name
FROM employees e
INNER JOIN departments d 
ON e.department_id = d.department_id;
--1    ȫ�浿    101    ����
--2    ��ö��    102    ����
--3    �̿���    101    ����
--4    �ڹ���    102    ����
--5    �ֿ�ȣ    103    ������

select e.employee_id, e.employee_name, e.department_id, d.department_name
from employees e
inner join departments d
on e.department_id = d.department_id;

-- Left Join (ANSI Style): Left ���̺��� �������� ����(�׷��� ������ Left ���̺��� ����Ű ������ ����.)
-- ���ν� ù��°�� �����ϴ� ���̺��� Left, �ι�?�� �����ϴ� ���̺��� Right
SELECT e.employee_id, e.employee_name, e.department_id, d.department_name
FROM employees e
LEFT JOIN departments d 
ON e.department_id = d.department_id;
--3    �̿���    101    ����
--1    ȫ�浿    101    ����
--4    �ڹ���    102    ����
--2    ��ö��    102    ����
--5    �ֿ�ȣ    103    ������
--6    ������    201          => A(Employees)�� �������� �����Ǹ� �ʵǱ� ������ 201������ ����
--                    => ������ B(Departments)���̺��� 201�� ������ ���� ������ null�� ǥ��
--������ ��� ������ �Ϲ������� �����ͺ��̽� ���ο��� ó���Ǵ� ���, �������� ����, �ε��� � ���� �޶��� �� �ֽ��ϴ�. 
--Ư�� ������ �����Ͱ� ������ ���� ������� �ʽ��ϴ�.

-- right join (ANSI Style)
SELECT e.employee_id, e.employee_name, e.department_id, d.department_name
FROM employees e
RIGHT JOIN departments d 
ON e.department_id = d.department_id;
--1    ȫ�浿    101    ����
--2    ��ö��    102    ����
--3    �̿���    101    ����
--4    �ڹ���    102    ����
--5    �ֿ�ȣ    103    ������
--                �繫
-- Right ���� ��� ������ ���̺��� �����̱� ������ ����Ű�� ������ ���̺��� �������� �Ѵ�.
-- ���� ����Ű�� left ���̺�� ���������ϸ� ������ �� �ִ�.

SELECT e.employee_id, e.employee_name, d.department_id, d.department_name
FROM employees e
RIGHT JOIN departments d 
ON e.department_id = d.department_id;

-- Left/Right ������ ����� ������� ���������� ���� ��
SELECT e.employee_id, e.employee_name, coalesce(e.department_id, d.department_id), d.department_name
FROM employees e
RIGHT JOIN departments d 
ON e.department_id = d.department_id;

-- Full Outer Join (ANSI Style): ����Ű�� ������ ���������� ���� ����
-- step1] Outer Join �õ�
SELECT e.employee_id, e.employee_name, e.department_id, d.department_name
FROM employees e
FULL OUTER JOIN departments d ON e.department_id = d.department_id;
-- �� ���̺� ����� ���� ���̺� department_id�� null �ΰ�찡 ��� �����Ѵ�.
--1    ȫ�浿    101    ����
--2    ��ö��    102    ����
--3    �̿���    101    ����
--4    �ڹ���    102    ����
--5    �ֿ�ȣ    103    ������
--6    ������    201    
--                �繫
-- Full Outer Join�� �� ���̺��� ������ ����Ű�� ���� ��� �� ���̺��� ����Ű�� null�� ��찡 �߻�����
-- step2] ���� ���� ó��
SELECT e.employee_id, e.employee_name, coalesce(e.department_id, d.department_id), d.department_name
FROM employees e
FULL OUTER JOIN departments d ON e.department_id = d.department_id;

-- A-B(Employees-Departments) ������ (ANSI Style)
-- step1] A(Employees Inner) ���� ��� ���ϱ�
SELECT e.employee_id, e.employee_name, e.department_id, d.department_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id;

SELECT e.employee_id, e.employee_name, e.department_id, d.department_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id
-- Left join�� ����� A(employees) ���̺��� �������� �ϱ� ������ A(employees) ���� �������� �ʴ´�.
-- ������ ������ department_id�� A(employees) ���̺��� �����ϴ� ���̴�.
-- Left Join�� ����� department_id�� null���� ���ڵ�� A(Employees) ���̺��� �����ϴ� ���̴�.
-- A-B�� ����� A���̺��� ������ ����� �����̴�. ���� �����Ϸ��� ���̺��� ���� �÷����� null�� ������
-- �������� ���ϴ� �����̵ȴ�.
WHERE d.department_id IS NULL; 

-- B-A(Departments - Employees) ������ (ANSI Style)
SELECT e.employee_id, e.employee_name, d.department_id, d.department_name
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id
WHERE e.department_id IS NULL;

-- Full Outer Join (ANSI Style): ����Ű�� ������ ���������� ���� ����
-- step1] Outer Join �õ�
SELECT e.employee_id, e.employee_name, e.department_id, d.department_name
FROM employees e
FULL OUTER JOIN departments d ON e.department_id = d.department_id;
-- �� ���̺� ����� ���� ���̺� department_id�� null �ΰ�찡 ��� �����Ѵ�.
--1    ȫ�浿    101    ����
--2    ��ö��    102    ����
--3    �̿���    101    ����
--4    �ڹ���    102    ����
--5    �ֿ�ȣ    103    ������
--6    ������    201    
--                �繫
-- Full Outer Join�� �� ���̺��� ������ ����Ű�� ���� ��� �� ���̺��� ����Ű�� null�� ��찡 �߻�����
SELECT  e.employee_id, e.employee_name, 
        coalesce(e.department_id, d.department_id) �μ�id, 
        d.department_name
FROM employees e
FULL OUTER JOIN departments d ON e.department_id = d.department_id;

-- Full Outer Join - Inner Join (ANSI Style): �� ���̺� ������ ����Ű���� ��ȸ�ϰ� ���� ���(�ߺ������� ����)
SELECT  e.employee_id, e.employee_name, 
        coalesce(e.department_id, d.department_id) �μ�id,
        d.department_name
FROM employees e
FULL OUTER JOIN departments d ON e.department_id = d.department_id
WHERE e.department_id IS NULL OR d.department_id IS NULL; 

-- Full Outer Join - Inner Join
-- A-B
SELECT e.employee_id, e.employee_name, e.department_id
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id
WHERE d.department_id IS NULL

UNION all
-- B-A
SELECT e.employee_id, e.employee_name, d.department_id 
FROM employees e
RIGHT JOIN departments d ON e.department_id = d.department_id
WHERE e.department_id IS NULL;

-- CROSS JOIN: �� ���� ���̺� ���� ī�׽þ� ���δ�Ʈ(Cartesian Product)�� ���� ���(��� ����)�� ����ϴ� Join
-- ������ ����� ���� �ִ� ��� ������ ����ϰ��� �� ��
-- select table1.column1, table2.column2
-- from table1
-- cross join table2;
select employee_id from employees;
select department_name from departments;
SELECT employee_id, department_name
FROM  employees 
CROSS JOIN departments;
