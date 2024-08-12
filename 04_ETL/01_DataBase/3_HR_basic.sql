-- HR(Human Resource, �λ�����) ������ �����ͺ��̽� ���̺� �н�
select count(*) from employees;
select table_name from user_tables;
select * from employees;
describe employees;

/*
�̸�             ��?       ����           
-------------- -------- ------------ 
EMPLOYEE_ID    NOT NULL NUMBER(6)    : �����ȣ(���������� ��Ÿ���� �⺻Ű)
FIRST_NAME              VARCHAR2(20) : �̸�
LAST_NAME      NOT NULL VARCHAR2(25) : ��
EMAIL          NOT NULL VARCHAR2(25) : �̸���
PHONE_NUMBER            VARCHAR2(20) : ��ȭ��ȣ
HIRE_DATE      NOT NULL DATE         : �����
JOB_ID         NOT NULL VARCHAR2(10) : �������̵�
SALARY                  NUMBER(8,2)  : �޿� (��ü 8�ڸ� �� �Ҽ��� ���� 2�ڸ�)
COMMISSION_PCT          NUMBER(2,2)  : Ŀ�̼�(���ʽ� �λ���)
MANAGER_ID              NUMBER(6)    : �Ŵ������̵�
DEPARTMENT_ID           NUMBER(4)    : �μ����̵�
*/

-- �� ���͸�(Projection)
-- ������ �̸�, ��, �޿� ��ȸ
select first_name, last_name, salary from employees;

-- ���� �̸�, �����, �޿� ��ȸ
-- date Ÿ���� YY/MM/DD �������� ������
select first_name, hire_date, salary from employees;

-- �̸�, ��, �޿�, 10% �λ�� �޿��� ��ȸ
select first_name, last_name, salary, salary*0.1 from employees;
-- �̸� ��, �޿� 10% �λ�� �޿��� ��ȸ, �űԿ� �̸��� ������ �ְ� �ۼ��� ��
select first_name, last_name, salary, salary*0.1 as salary_increased_by_10pct from employees;

-- ���̸��� Ư������ ����X
-- selectg first_name, last_name, salary, salary*10 as 10%_increased_salary from employees;
-- selectg first_name, last_name, salary, salary*10 as salary_increased_by_10% from employees;

-- ���̸��� ���ڰ� ���Ǿ �Ϲ������� ���ڸ� ���̸����� �������� �ʴ� ���� ����.
-- ����Ŭ������ ���ڸ� ������ ���̸��� �տ� ���ڰ� ��ü ���� �Ҵ�Ǳ⵵ �Ѵ�.
-- select 1st_name, last_name, salary, salary*0.1 from employees;

-- ��ȸ ���̸��� �ѱ۷� ��Ī�ϴ� �͵� ����
-- ����: ��ȸ ����� ���� �������� �ö󰣴�.
-- ����: ��ȸ ����� �ܺ����Ϸ� export �� ��� ĳ���ͼ¹����� �߻��� �� �ִ�.
-- select first_name as �̸�, last_name as ��,
--    salary as �޿�, salary*10 as �޿�_10�ۼ�Ʈ_�λ�� from employees;

-- �̸�, ��, �޿� 10% �λ�� �ѱ޿��� ��ȸ, �űԿ� �̸��� ������ �ְ� �ۼ��� ��
select first_name, last_name, salary, salary*1.1 as increased_total_salary from employees;

-- �̸�, �μ�id, commission ����
-- �����Ͱ� ���ǵ��� ���� ��쿡�� null�� ǥ���Ѵ�.
select first_name, department_id, commission_pct
from employees;

-- ���ͷ�(literal)���� ��Ʈ������ ����
-- || : ���� ������
-- '���ڸ� ǥ���ϱ� ���ؼ� ''�� ���
select * from employees;

-- dual ���̺�: ����Ŭ ��ü���� ���̳� ����Ŭ ������ Ȯ���ϱ� �뵵�� �����ϴ� ���̺�
select * from dual;

select 'Steven' from dual;
-- ���� �׽�Ʈ
select 'Steven' || 'King''s salary is  $' ||'24000' from dual;


-- SQLDevelope���� ���� �����ϱ� ���� ���� ������ �ִٸ� �ٷ� ���콺 �����Ͽ� Ȯ���� �� �ִ�.
-- select 'Steven' || ' ' || 'King's' from dual;
select 'Steven' || ' ' || 'King''s' from dual;
-- ���� ���� �����͸� �����ϴ� ���
select 'Steven' || ' ' || 'King' || '''s' from dual;
-- ������ ���� �ϼ�
select 'Steven' || ' ' || 'King' || '''s salary is $' ||'24000' from dual;


-- �Ʒ��� ���� �м� ����� �� ������ ����ϼ���.
-- Steven King's salary is $24000(�������� Steven, King, 24000)
select first_name || ' ' || last_name || '''s salary is $' || salary as ����޿����� 
from employees;
-- Steven King�� �޿��� 24000�޷��Դϴ�.
-- ������ �������� �߽����� �ؽ�Ʈ�� �籸���Ѵ�.
select 'Steven' || ' ' || 'King' || '�� �޿��� ' || '24000' || '�޷� �Դϴ�.' from dual;
-- �������� ��ġ�ϴ� ���̸��� �ٲ�ġ���Ѵ�.
select first_name || ' ' || last_name || '�� �޿��� ' || salary || '�޷� �Դϴ�.' from employees;


-- �ߺ� �� ����
-- DISTINCT: �ߺ� ���ڵ� ���� (�Ǵٽ����� unique�Լ��� ����� ����)
-- �μ�ID ��ȸ(�ߺ�����)
-- departments ���̺��� �μ������� �����ϴ� ���̺��̴�. ���� departments ���̺� ��������
-- department_id�� �ߺ��� ������ �ʴ� primary key�̴�
select * from departments;

-- employees ���̺��� �μ������� departments ���̺�� �и��ϰ� id�� �����ϰ� �ִ�.
-- ���� department_id�� employees ���̺� �������� �ߺ��� �Ǵ� �������̴�.
select * from employees;
select department_id from employees;
select distinct department_id from employees;

-- �� ���͸�(���� ����) => Selection
-- ���� 'King'�� ���� ���� ��ȸ
select * from employees
where last_name = 'King';

-- �� ����
-- �޿��� 15000 �̻��� ��������
select * from employees
where salary >= 15000;

-- ��¥��
-- 2004�� 1�� 30�Ͽ� ���� ���� ���� ��ȸ
select * from employees
-- ��¥Ÿ�� �����Ϳ� ���� ����� ������ Ȱ��
where hire_date = to_date('2004-01-30','yyyy-mm-dd');
-- ��¥Ÿ�� �����Ϳ� ���� ������ ������ ��ȯ Ȱ��
select * from employees
-- ��¥Ÿ������ ���氡���� ���ڿ��� ����ȯ�̳� ��¥ ������Ÿ���� �������� �ʾƵ�
-- �������� ����ȯ�� �ڵ�����ȴ�.
where hire_date = '04/01/30';

-- between ������ 
-- between [��������] and [��������]
-- �������ǰ� ���������� ������ ��� ��� ���ԵǴ� ����
-- �޿��� 10000 ~ 12000 �� ����
select * from employees
where salary between 10000 and 12000;

select * from employees
where salary >= 10000 and salary <= 12000;


-- ���� Set
-- in ������
-- in (����1, ... , ����N) : �ش� ������ or�� ó��
-- �Ŵ���ID�� 101, 102, 103�� ���� �̸�, �޿�, �Ŵ���id ��ȸ
select first_name, salary, manager_id
from employees
where manager_id in (101,102,103);

select first_name, salary, manager_id
from employees
where manager_id = 101 or manager_id = 102 or manager_id = 103;

select * from jobs;
-- LIKE ������
-- %: �ƹ� ���� 0������ N�� ��ġ
-- ����ID�� IT�� �����ϴ� ��������
select distinct job_id from employees;
select * from employees
where job_id like 'IT%';

select * from employees;
-- 2003�⵵�� �Ի��� ���� ���� ��ȸ
select * from employees
where hire_date like '03%'; -- ��¥ Ÿ�Կ� ���ؼ� like ������ ����ϸ� �Ϲ��� ����ȯ�� �Ͼ��.
-- 1���� �Ի��� ���� ���� ��ȸ
select * from employees
where hire_date like '__/01%';
-- 1�Ͽ� �Ի��� ���� ���� ��ȸ
select * from employees
where hire_date like '__/__/01';
�Ǵ�
select * from employees
where hire_date like '%01';

-- �̸����� �� ��° ���ڰ� 'A'�� ���� ����
select * from employees
where email like '_A%';

-- null �����͸� ã�� �� => ���ǵ��� ���� ������(����ġ)�� ã�� ��
-- is null
-- �Ŵ��� id�� null�� �����̸�, �Ŵ���id ��ȸ
select manager_id from employees;
select first_name, manager_id from employees
where manager_id is null;
select * from employees;

-- �� ������
-- and ����
-- ���� id�� IT_PROG�̰� �޿��� 5000 �̻��� ���� ����
select * from employees
where job_id='IT_PROG' and salary >= 5000;

-- Q] ���� ���̵� 'IT_PROG' �Ǵ� 'FI_MGR' �̰� �޿��� 6000 �̻��� 
-- ������ �̸�, ����id, �޿��� ����ϼ���.
-- ����Ŭ���� and �������� �켱������ or ���� ����.
-- ���� �ǹ̸� �и��ϰ� �ϱ� ���ؼ� () �����ڸ� Ȱ���� ��
select first_name, job_id, salary from employees
where (job_id ='IT_PROG' or job_id ='FI_MGR') and salary >= 6000;



-- ������ ����
-- order by (�⺻ �������� ����)
-- ����
-- select
-- from
-- where
-- order by <- �� ��ġ���� ���

select first_name, hire_date
from employees
order by hire_date;

select first_name, hire_date
from employees
order by hire_date asc; -- ��������� ������������ ����

-- �������� ���� (desc)
select first_name, hire_date
from employees
order by hire_date desc;

--select hire_date from employees order by hire_date desc;

-- �� ��Ī ����
select first_name, salary
from employees
order by salary desc;

select first_name, salary*1.2 -- <= salary*1.2 : �޿��� 20% �λ��� �ݿ��� �ݾ�
from employees
order by salary*1.2;

select first_name, salary*1.2 as �λ�ȱ޿� -- <= salary*1.2 : �޿��� 20% �λ��� �ݿ��� �ݾ�
from employees
order by �λ�ȱ޿�;

select first_name, salary*1.2 as raise_salary -- <= salary*1.2 : �޿��� 20% �λ��� �ݿ��� �ݾ�
from employees
order by raise_salary;

