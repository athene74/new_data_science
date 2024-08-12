-- �ݿø�: round
select round(45.832, 2), round(45.832, 0), round(45.832, -1)
from dual;
-- �ø�: ceil( �Ҽ��� ���ϸ� �ø��� ��ɸ� ����)
select ceil(7.3) from dual;
-- ����: floor( �Ҽ��� ���ϴ� ������ ��ɸ� ����)
select floor(7.3) from dual;
-- ����: trunc([������],[�ڸ���]) �ڸ�����ŭ �������� ���� ����
select trunc(45.923, 2), trunc(45.923), trunc(45.923, -1) from dual;

select first_name, salary, 
       to_char(hire_date,'yyyy"�� �Ի�"') as �Ի�⵵, 
       to_char(hire_date,'day') as �Ի����, 
       -- ���ϴ� �⵵�� �����Ͽ� �񱳿��� ����, ������ �Ϲ�����ȯ�� ������ �����̱� ������
       -- �߰����� ��ó���� ���� �ʾ���
       -- �޿��� ���� ������ �ְ� �ڸ����� 5�ڸ����� Ȯ���ϰ� ����
       case     when to_char(hire_date, 'yyyy') >= 2010 then to_char(salary * 1.10, '$99,999')
                when to_char(hire_date, 'yyyy') >= 2005 then to_char(salary * 1.05, '$99,999')     
                else to_char(salary, '$99,999')
       end as �޿��λ��
from employees;

-- view ��ȸ
select view_name from user_views;

select * from emp_dept60_salary;
create view emp_dept60_salary
as 
select
    employee_id as �����ȣ,
    first_name || ' ' || last_name as �����̸�,
    to_char(salary, '$9,999,999') �޿�
    from employees
    where department_id=60;

-- view ����
drop view emp_dept60_salary;

--�������� 1
--��� ������ �߿��� ���� ���� �޿��� �޴� ������ ������ ��ȸ�ϼ���.
select *
from employees
where salary = (select max(salary) from employees);

--�������� 2
--�μ����� ��� �޿����� ���� �޿��� �޴� �������� �̸��� �޿��� ��ȸ�ϼ���.
select employee_id, first_name, last_name, department_id, salary
from employees e
where salary > (
    select avg(salary) 
    from employees 
    where department_id = e.department_id);
--order by department_id, salary desc;

--�������� 3
--�������� �ٹ��ϴ� �μ��� ��ġ�� ��ȸ�ϼ���. (��, �μ��� ��ġ�� locations ���̺��� �����;� �մϴ�.)
--
--�������� 4
--�ڽ��� �Ŵ������� �� ���� �޿��� �޴� �������� �̸��� �޿��� ��ȸ�ϼ���.
--
--�������� 5
--�� �μ��� ���� �ֱٿ� ���� ������ �̸��� ��� ��¥�� ��ȸ�ϼ���.
--
--�� ������ ���� ���� �ʿ��ϸ� ��û�� �ּ���. �߰����� �����̳� �ٸ� ���������� �ʿ��ϸ� ������ �ּ���.

