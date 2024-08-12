-- �ݿø�: round
-- �ι�° ���ڴ� �ڸ����� ����̸� �Ҽ��� ������ �ڸ�, �����̸� �Ҽ��� ������ �ڸ������� �ݿø��� �̷������.
select round(45.962,2),round(45.962,0),round(45.962,-1)
from dual;


-- �ø�: ceil (ceil �Լ��� �Ҽ��� ���ϸ� �ø��� ��ɸ� �����Ѵ�.)
select ceil(7.3)from dual;
-- 8

-- ����: floor (floor�Լ��� �Ҽ��� ���ϸ� ������ ��ɸ� �����Ѵ�.)
select floor(7.3)from dual;
-- 7
-- select floor(7.33434343, 2)from dual; -- ���� X

-- ����: trunc([������],[�ڸ���]) �ڸ��� ��ŭ �������� ���� ����
-- 340,343,056,234,656 ��
select trunc(45.923,2), trunc(45.923), trunc(45.923, -1) from dual;

-- to_date([��¥��Ʈ��],[����])
select to_date('2023-06-01','YYYY-MM-DD') from dual;

-- trunc �Լ��� ��¥Ÿ�Կ��� ���밡���ϴ�.
-- �ش�� ù°�� ���ϱ�
select trunc(
    to_date('2024-07-24','YYYY-MM-DD'),
    'MM'
    )
from dual;
select trunc(
    to_date('2024-12-25','YYYY-MM-DD'),
    'MM'
    ) 
from dual;
-- ���� ù°�� ���ϱ�
select trunc(
    to_date('2024-07-24','YYYY-MM-DD'),
    'YYYY'
    ) 
from dual;
-- 23/01/01
select trunc(to_date('2024-07-24','YYYY-MM-DD'),'DD') from dual;
-- 24/07/24 : ��¥ ���ķδ� ������ ������ ���� ������ ���� ��¥�� ��ȯ

-- �� ���� ù��° �Ͽ��� ��ȯ
select trunc(to_date('2024-07-24','YYYY-MM-DD'),'DAY') from dual;

-- ���밪
select abs(-1000) from dual;

-- ������
select power(2,2) from dual;
--4
select power(2,3) from dual;
--8
-- ������
select sqrt(100) from dual;

-- ������
select mod(10,3) from dual;
-- 1

Q] HK �����ͺм��� ������ �Ի��� �ش� ���� �ݿ��Ͽ� ȸ���� �ϰ� �˴ϴ�.
������ ȸ������ ���ϼ���. trunc �Լ� ���.
2024-02-07 �� �Ի��ߴٰ� �����սô�.
select trunc(to_date('2024-02-07','YYYY-MM-DD'),'DAY')+5 
from dual;
select trunc(to_date('2024-09-23','YYYY-MM-DD'),'DAY')+5 
from dual;

-- Q] employees ���̺��� �Ի��� �ش� ���� �ݿ��Ͽ� �ش��ϴ� ȸ������ ����Ͽ�
-- '�̸�', '�Ի���', 'ȸ����' ���� ����ϼ���.
select first_name as �̸�, hire_date as �Ի���,
    trunc(hire_date,'day')+5 as ȸ����
from employees;

-- Q] employees ���̺��� �Ի��� ���� ���� �ݿ��Ͽ� �ٷΰ�༭�� �ۼ��Ѵ�.
-- '�̸�', '�Ի���', '�ٷΰ�༭_�ۼ���' ���� ����ϼ���.
-- ���̺� �ۼ��ϱ� �� �׽�Ʈ
select trunc(to_date('2024-07-24','YYYY-MM-DD'),'DAY')+12 
from dual;
-- ���̺� ����
select first_name as �̸�, hire_date as �Ի���,
    trunc(hire_date,'day')+ 12 as �ٷΰ�༭_�ۼ���
from employees;

-- next_day(��¥, ����): Ư������ �������� ���ƿ��� ���� ���� ���� ��ȯ
-- trunc() �Լ��� �ش����� Ư�� ���� ���
select trunc( to_date( '2024-07-24','YYYY-MM-DD'),'DAY' ) + 5 
from dual;
select next_day( to_date('2024-07-24','YYYY-MM-DD') , '�ݿ���' ) 
from dual;
select next_day( to_date('2024-07-24','YYYY-MM-DD') , '�����' ) 
from dual;

-- last_day(��¥): �ش��� �������� ��ȯ
select last_day( to_date('2024-07-24','YYYY-MM-DD') ) 
from dual;

-- add_months(��¥, ������): �������� ���� ��¥
-- 7�� 24�Ͽ��� �Ѵ��� ���� ��¥
select add_months( to_date('2024-07-24','YYYY-MM-DD'), 1 ) from dual;
-- 7�� 24�Ͽ��� �δ��� ���� ��¥
select add_months( to_date('2024-07-24','YYYY-MM-DD'), 2 ) from dual;

-- sysdate ���� ��¥
select sysdate from dual;

-- months_between(����, ������): �����ϰ� ���� ������ �Ⱓ, �����Լ��� ����ؼ� �������� ����Ѵ�.
-- ������� ���� �� ���
select months_between(to_date('2024-07-31', 'yyyy-mm-dd'), to_date('2024-07-24', 'yyyy-mm-dd') )
from dual;

-- 1������ ���
select ceil(months_between(to_date('2024-07-31', 'yyyy-mm-dd'), to_date('2024-07-24', 'yyyy-mm-dd') ))
from dual;

-- 2������ ���
select ceil(months_between(to_date('2024-08-25', 'yyyy-mm-dd'), to_date('2024-07-24', 'yyyy-mm-dd') ))
from dual;

1. ��� ������ �Ի��� ��¥�� ���� ���� �ݿ����� �Ǵ� ��¥�� ����ϼ���.
�÷����� '���������̼���'�� �ϼ���
select next_day(hire_date,'�ݿ���') as ���������̼���
from employees;

2. ���� ID�� 100�� ������ �Ի��� ��¥�� ���� ���� ȭ������ �Ǵ� ��¥�� ����ϼ���.
�÷����� '�Ŵ��������'�� �ϼ���
select next_day(hire_date,'ȭ����') as �Ŵ��������
from employees
where employee_id = 100;

3. ��� ������ �Ի��� ��¥�� �������� ������ ��¥�� ����ϼ���.
�÷����� '�Ի�ȯ��ȸ����'�� �ϼ���.
select last_day(hire_date) as �Ի�ȯ��ȸ����
from employees;

4. ���� ID�� 100�� ������ �Ի��� ���� ������ ��¥�� ����ϼ���.
�÷����� '�Ի�ȯ��ȸ����'�� �ϼ���.
select last_day(hire_date) as �Ի�ȯ��ȸ����
from employees
where employee_id = 100;

5. ���� ID�� 100�� ������ �Ի��� ��¥�� 3������ ���� ��¥�� ����ϼ���.
�÷����� '���İ����'�� �ϼ���
select add_months(hire_date,3) as ���İ����
from employees
where employee_id = 100;

6. ��� ������ �Ի��� ��¥�� 6������ ���� ��¥�� ����ϼ���.
�÷����� '�ű������λ�����'�� �ϼ���.
select add_months(hire_date,6) as �ű������λ�����
from employees;

7. ���� ID�� 200�� ������ �Ի��� ��¥�� 12������ ���� ��¥�� ����ϼ���.
�÷����� '����������'�� �ϼ���.
select add_months(hire_date,12) as ����������
from employees
where employee_id = 200;

8. ��� ������ �Ի��� ��¥�� ���� ��¥ ������ ���� ���� ����ϼ���. 
ceil �Լ� ����ؼ� �ø� ó���ϼ���. 
�÷����� '�ټӿ���'�� �ϼ���.
select ceil(months_between(sysdate, hire_date)) as �ټӿ���
from employees;

9. ���� ID�� 100�� ������ �Ի��� ��¥�� ���� ��¥ ������ ���� ���� ����ϼ���.
ceil �Լ� ����ؼ� �ø� ó���ϼ���. 
�÷����� '�ټӿ���'�� �ϼ���.
select ceil(months_between(sysdate, hire_date)) as �ټӿ���
from employees
where employee_id = 100;