-- ��������: ������ �� ���� �������踦 Ȱ���Ͽ� ��ø�� ������ �ۼ��� �ϳ��� �˻������ �ڵ����� �ϼ�
-- ����: 
-- where: �Ϲ� ��������, 
-- from: �ζ��κ�(Inline View), 
-- select: ��Į�� ��������(Scalar Subquery)

-- Nancy�� �޿����� ���� �޿��� �޴� ����� �̸��� �޿��� ���
select salary from employees where first_name ='Nancy';
select first_name, salary from employees where salary > 12008;

-- ���������� ����: ������ ��������, ������ ��������, �����÷� ��������
-- �������� Ȱ��(������ ��������: �ϳ��� ���� ��ü)
select first_name, salary 
from employees 
where salary > (select salary 
                    from employees 
                    where first_name ='Nancy');

-- WHERE �ڿ� ��(���ͷ�)�� ���� �񱳴� �ϳ��� ���� ��ġ�� �Ǿ�� �Ѵ�. �������� ���� ��ġ�� �Ϸ��� �Ѵٸ�
-- ������ �߻��ϰ� �ȴ�.
-- ��)
select salary from employees where first_name ='David';
select first_name, salary from employees where first_name ='David';

select first_name, salary 
from employees 
where salary > (select salary 
                    from employees 
                    where first_name ='David');
                    
-- ������ ��������
-- ANY/ALL
-- ANY: �ϳ��� �����ϴ� ���� / ALL: ��� ���� �����ϴ� ����
-- > ANY: ���ʰ��� �����ʰ��� ��� ������ ū���� => ������ ���� ���� ���� ����(MIN ����)
-- < ANY: ���ʰ��� �����ʰ��� ��� ������ �������� => ������ ���� ���� ū ����(MAX ����)
-- > ALL: ���ʰ��� �������� ��� ������ ū ���� => ������ ���� ���� ū ����(MAX ����)
-- < ALL: ���ʰ��� �������� ��� ������ ���� ���� => ������ ���� ���� ���� ����(MIN ����)

--4800
--9500
--6800
-- ������ �������� Min ���� => ���ϰ� ����
select first_name, salary 
from employees 
-- salary�� 4800(Min)�� ���� ū����
where salary > ANY(select salary 
                    from employees 
                    where first_name ='David');
                    
-- ������ �������� Max ����
select first_name, salary 
from employees 
-- salary�� 9500(MAX)�� ���� ���� ����
where salary < ANY(select salary 
                    from employees 
                    where first_name ='David');                    

-- �׷��Լ��� ����� where�� �˻��������� Ȱ��                    
-- Q] 20�� �μ��� �ٹ��ϴ� ����� ��պ��� ���� �޿��� �޴� ����� �̸��� �޿��� ���      
select first_name, salary
from employees
where salary > (
                select avg(salary)
                from employees
                where department_id = 20
);

-- Q] ���� ���̺��� ���� ���� �޿��� �޴� ������ ��� ����
select *
from employees
where salary = (
                select max(salary)
                from employees
);
                    
      
                    
-- IN ������ Ȱ���� ������ �������� 
-- In ������ where �ڿ� ������ �������� ������ ��ġ��ų�� �ִ�.          
-- ���� in ���� �ȿ� �������� �����ϴ� ���������� �ۼ��� �� �ִ�.
select department_id from employees where first_name ='David'; -- 60, 80

select first_name, department_id, job_id
from employees
where department_id in (60, 80);

select first_name, department_id, job_id
from employees
where department_id in (select distinct department_id 
                        from employees 
                        where first_name ='David'
);


-- ���� �÷� ��������: ���� �÷� ���� ��ȯ�ϴ� ��������
-- �μ��� �ְ� �޿��� �޴� ���� ����
-- STEP1] �μ��� �ְ� �޿��� ���� ������ ���
SELECT DEPARTMENT_ID, MAX(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

SELECT *
FROM EMPLOYEES
-- where ������ �ΰ��� �����μ� in ���� ������ ����� ��ġ�ϴ� ������
WHERE (DEPARTMENT_ID, SALARY) IN ( 
    SELECT DEPARTMENT_ID, MAX(SALARY)
    FROM EMPLOYEES
    GROUP BY DEPARTMENT_ID
); 

--Q] �μ��� �ְ�޿� �޴� ����� �̸��̶� �ְ�޿��� ��ȸ 
SELECT first_name, salary
FROM EMPLOYEES
-- where ������ �ΰ��� �����μ� in ���� ������ ����� ��ġ�ϴ� ������
WHERE (DEPARTMENT_ID, SALARY) IN ( 
    SELECT DEPARTMENT_ID, MAX(SALARY)
    FROM EMPLOYEES
    GROUP BY DEPARTMENT_ID
); 


-- Scalar Sub Query
-- select ������ �������� ��� -> Scalar Sub Query
-- Select������ Join�� ������ ����Ͽ� Join�� ��� ������ ����
-- ��Ȳ�� ���� Join ���� ���� ������ ���̱� ������ ��� (��, �׻� ������ ���� ���� �ƴ�)
-- ������ � ������ ������ �ۼ��Ͽ��� DBMS Optimizer�� ������ ������ �� �� �ֵ��� ������ ����ȭ�Ѵ�.
select first_name, department_name
from employees e 
join departments d 
on (e.department_id = d.department_id)
order by first_name;

select first_name,(select department_name
                    from departments d
                    where d.department_id = e.department_id) department_name
from employees e
order by first_name;

-- �ζ��� ��
-- from ���� �����ϴ� ��������. from ������ ���̺� �Ǵ� �䰡 �� �� ����
-- ���������� �������� ���� ���� �ֱ⶧���� �ζ��� ��� Ī��

-- ? �޿��� ���� ���� �޴� ���� 10������ ����� �̸��� �޿��� ���
select first_name, salary
from(
    select first_name, salary
    from employees
    order by salary desc
    )
-- order by �� ������� TOP 10�� �ǻ翭�� ���Ͽ� ���� �ؾ��ϴµ� 
-- where�� order by ������ ���� �Ǵ� ������ �ζ��� �並 ����� ���
-- �Ʒ� ������ ���� �� ��
where rownum between 1 and 10; -- rownum: �ǻ翭 => ��������� ����Ŭ���� �ڵ����� �����ϴ� ���ȣ

-- ������ �Ǳ��� 10�� ����
    select first_name, salary
    from employees
    where rownum between 1 and 10
    order by salary desc;
    
    
-- ��: ���� ����ϴ� ������ View�� ����Ͽ� ��� SQL���� ����
--  ���α׷��� ����� �Լ��� ����� ����
--STEP1] View ���� ����
SELECT   
     employee_id AS �����ȣ, 
     first_name || ' ' || last_name AS �����̸�, 
    to_char(salary,'$9,999,999') �޿�
   FROM     employees
   WHERE    department_id=60;     
   
--STEP2] View ���
create view emp_dept60_salary
as
SELECT   
     employee_id AS �����ȣ, 
     first_name || ' ' || last_name AS �����̸�, 
    to_char(salary,'$9,999,999') �޿�
   FROM     employees
   WHERE    department_id=60;  
   
-- view ��ȸ
select view_name from user_views;
select * from emp_dept60_salary;

-- view ����
drop view emp_dept60_salary;

--STEP3] View�� SQL�������� ���
select *
from emp_dept60_salary;