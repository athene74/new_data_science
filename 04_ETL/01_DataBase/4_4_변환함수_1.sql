-- �Ͻ��� �� ��ȯ: ��������� Ÿ���� ��ȯ���� �ʾƵ� �ڵ� �� ��ȯ �Ǵ� ���
-- ���� ���: �Ʒ� Ÿ���� ��ȯ ������ �������� ��� �ڵ� �� ��ȯ
-- number <-> ���ڿ� <-> ��¥(date)

describe employees;
select first_name from employees
where department_id=40;

select first_name from employees
where department_id='40'; --'40'�� ���ڿ� Ÿ�������� �Ͻ��� �� ��ȯ�� �����ϴ�.

select hire_date from employees;

select first_name from employees
where hire_date='03/06/17'; -- ���ڿ� Ÿ�������� Date Ÿ�Կ� ����Ǵ� ������ ���ڿ��̹Ƿ�
                            -- �Ϲ��� �� ��ȯ�� �����ϴ�.
--where hire_date='03-06-17';
--where hire_date='03��06��17��'; -- date Ÿ�Կ��� ��� ������ ����� ��� ����ȯ �Ұ�

select 5500 - 4000 from dual;
select '5500' - 4000 from dual;
select '5,500' - 4000 from dual; -- ���ڴ� ��� ���ĵ� ������� �ʴ´�.
select '5500' + 4000 from dual;

-- ����� �� ��ȯ
-- TO_CHAR: ����(��¥)���� ��¥������ �����Ͽ� ���ڿ��� ��ȯ, 
-- TO_CHAR([��¥],[��¥����])
select first_name, to_char(hire_date,'MM/YY') as �Ի��
from employees
where first_name='Steven';

--select first_name, to_char(hire_date,'YYYY-MM-DD') as �Ի��
select first_name, to_char(hire_date,'YYYY"��" MM"��" DD"��"') as �Ի��
from employees
where first_name='Steven';

-- TO_CHAR: ����(����)���� ���������� �����Ͽ� ���ڷ� ��ȯ
-- TO_CHAR([����],[��������])
-- ��Ģ) $999,999 <- ���ڴ� 9�� ǥ��
-- ��Ģ) ���亸�� ��ȯ ������ ���̰� ū ��쿡�� '#'���� ǥ��
select to_char(2000000,'$999,999') salary from dual; -- ���亸�� ��ȯ ���� ���̰� ū ���
-- #########
select to_char(2000000,'$9,999,999') salary from dual; -- ���亸�� ��ȯ ���� ���̰� ū ���
--  $2,000,000
-- �е�(�⺻��)�� �ְ� ������
-- ��뿹)��ǥ �ݾ��� �ڸ����� ����Ͽ� ���ڸ� ǥ���ϰ� ���� ���
select to_char(2000000,'$009,999,999') salary from dual;

-- ���� ���� �����ϰ��� �� ��
-- �Ҽ������Ͽ� ���� ������ ���ٸ� �� ���� �����ȴ�.
select to_char(2000000.324,'$009,999,999') salary from dual;

select to_char(2000000.324,'$009,999,999.99') salary from dual;
-- L: �ش� ������ ȭ�� ��ȣ�� ���
select to_char(2000000.324,'L009,999,999.99') salary from dual;

-- Q] ���� ���̺� �̸��� David�� �̸�, ��, �޿�, 15% �λ�� �ݾ��� salary1 ����
-- 15.23% �λ����� ������ ���� ����($1,446.85)�� ����� �λ�ݾ��� salary2���� ����ϼ���.
select first_name, last_name, salary, salary*0.15 as salary1, 
    to_char(salary*0.153, '$9,999.99')  as salary2
from employees
where first_name = 'David';

-- Q] ��¥ Ÿ���� �Ʒ��� ���� ��µǵ��� �����̸�,�Ի����� ����ϼ���.
-- '2003-06-17'
select first_name, to_char(hire_date, 'yyyy-mm-dd')  as �Ի���
from employees
where hire_date = '03/06/17';

-- null ��ȯ
-- NVL: ����ġ�� ���� ó���� ���� ���
-- NVL([������],[�������� ���̸� ��ȯ�Ǵ� ��]) <= ���̾ƴϸ� �������� ��ȯ

select commission_pct from employees;
-- ���ʽ� �λ����� ������ �λ�� �ѱ޿� ���
-- ����Ŭ���� null���� ��� �������� null
select first_name,salary, commission_pct, salary + salary*commission_pct �λ���ѱ޿�
from employees;

select nvl(1000, 100) from dual;
select nvl(null, 100) from dual;

-- Q] NVL �Լ��� ����Ͽ� �λ�� �ѱ޿����� NULL�� ������ �ʵ��� �����ϼ���.
select  first_name,salary, commission_pct,
        salary + salary*nvl(commission_pct, 0) �λ���ѱ޿�
from employees;

-- NVL2([������],[���� �ƴϸ� ��ȯ�Ǵ� ��],[���̸� ��ȯ�Ǵ� ��]) 
select nvl2(0.2, 1000*0.2,0) from dual;
select nvl2(null, 1000*0.2,0) from dual;

-- Q] �� ������ nvl2 �Լ��� �����ؼ� Ǯ�����.
select  first_name,salary, commission_pct,
        nvl2(commission_pct, salary + salary*commission_pct, salary) �λ���ѱ޿�
from employees;
describe employees;

-- COALESCE([�� �Ǵ� ����1], [�� �Ǵ� ����2] ...) : ���� �ƴ� ù��° ������ ���� ����
-- ��) �� �����ͺ��̽����� ���������� ��ȣ�� �����ϰ��� �Ҷ�
-- ������ �� �� ���������� ����: ����ȭ��ȣ, ȸ���ȣ, �޴�����ȣ
-- ���ð����� �� �� �켱����(�����ֺ��ΰ��: �޴���, ����ȭ, ȸ���ȣ, ������: �޴���, ȸ���ȣ, ����ȭ)�� 
-- ���Ͽ� ���� �ƴ� ���� �����ϰ��� �� �� ����

select coalesce('010-123-4567','070-123-7777','053-555-6666') from dual;
select coalesce(null,'070-123-7777','053-555-6666') from dual;
select coalesce(null,null,'053-555-6666') from dual;

-- Q] �� ������ coalesce�� �Լ��� �����ؼ� Ǯ�����.
select  first_name,salary, commission_pct,
        coalesce(salary + salary*commission_pct, salary) �λ���ѱ޿�
from employees;