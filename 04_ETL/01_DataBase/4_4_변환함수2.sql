-- DECODE: DECODE(Column or expression, search1, result
--                                      [search2, result2, ...]
-- �������� ���� ���ؼ��� �ϰ��� �� �� ����� �� �ִ�.
-- ù��° ����(������) java�� �ι�° ����(��ġ�� �Ǵ� �˻�����) java�� �־ ����° ���ڷ� ��ȯ
select decode('java', 'java', '�鿣�� ���') as language from dual;
-- ��ġ�� ���� ���� ��쿡�� null�� ��ȯ
select decode('python', 'java', '�鿣�� ���') as language from dual;
-- ù��° ����(������) python�� �׹�° ����(�ι�° ��ġ����) python�� �־ �ټ���° ���ڷ� ��ȯ
select decode('python', 'java', '�鿣�� ���', 'python', '�����ͺм� ���') as language from dual;
-- �������� ���� if/else ������ �ٹٲ��� �Ѵ�.
select decode('python', 'java', '�鿣�� ���', 
                        'python', '�����ͺм� ���') as language from dual;
-- �߰� ������ Ȯ���Ѵ�.
select decode('python', 'java', '�鿣�� ���', 
                        'python', '�����ͺм� ���',
                        'html', '����Ʈ ���') as language from dual;
-- �������� �ٲ㰡�� ��ȯ�� �ߵǴ��� �׽�Ʈ�Ѵ�.
select decode('html', 'java', '�鿣�� ���', 
                        'python', '�����ͺм� ���',
                        'html', '����Ʈ ���') as language from dual;
-- 'Ruby'�� ������ �����ϸ� ��ȯ �ڵ尡 ���� ������ null        
select decode('R', 'java', '�鿣�� ���', 
                        'python', '�����ͺм� ���',
                        'html', '����Ʈ ���') as language from dual;
-- decode ���� �ʴ� �⺻�� ó��(������ ���ڿ� ��ġ���� ���� ��ȯ ���� �߰�)       
select decode('R', 'java', '�鿣�� ���', 
                        'python', '�����ͺм� ���',
                        'html', '����Ʈ ���',
                        '��Ÿ���') as language from dual;
-- Q] ���� ���̺��� ���� ID, �޿�, �׸��� 'revised_salary' �� ����Ѵ�.
-- �޿� �λ����� ���� id�� IT_PROG, FI_MGR, FI_ACCOUNT�� ���� ���� 10, 15, 20% �λ����� �����Ѵ�.
-- DECODE ����� ��
select distinct job_id from employees;
select job_id, salary,
       decode(job_id,  'IT_PROG', salary*1.1,
                       'FI_MGR', salary*1.15, 
                       'FI_ACCOUNT', salary*1.2,
                       salary ) 
       as revised_salary 
from employees;

-- CASE ~ WHEN ~ THEN ~ END
select job_id, salary,
    case job_id when 'IT_PROG'      then salary*1.1
                when 'FI_MGR'       then salary*1.15
                when 'FI_ACCOUNT'   then salary*1.2
                else salary
    end as revised_salary
from employees;

-- ��ø�Լ� ����ϱ�
-- �Լ�1(�Լ�2(�Լ�3)))
-- �Լ� �������: �Լ�3 - �Լ� 2 - �Լ�1 ������ ����
-- �Լ�1(�Լ�2(�Լ�3�� ���ϰ�))
-- �Լ�1(�Լ�2�� ���ϰ�)
-- Step1] �Ի��� 6�������� ��¥
select first_name, add_months(hire_date, 6)
from employees
order by hire_date;

-- Stop2] �Ի� 6���� �� ���� ���� �ݿ���
select first_name, next_day(add_months(hire_date, 6),'��')
from employees
order by hire_date;

-- step3]�Ի� 6������ ���� ���� �ݿ��� ���� 'YYYY-MM-DD' �������� ���
select first_name, to_char(next_day(add_months(hire_date, 6),'��'), 'yyyy-mm-dd')
from employees
order by hire_date;

-- ����] �⵵�� 2�ڸ��� ǥ���� ������ �� �� �ִ� ���
select to_date('2024-07-25', 'yyyy-mm-dd') from dual;
select to_date('1924-07-25', 'yyyy-mm-dd') from dual;
select to_date('2024-07-25', 'yyyy-mm-dd'), to_date('1924-07-25', 'yyyy-mm-dd') from dual;

select to_char(to_date('2024-07-25', 'yyyy-mm-dd'), 'yyyy-mm-dd'), 
       to_char(to_date('1924-07-25', 'yyyy-mm-dd'), 'yyyy-mm-dd') 
from dual;

-- ���� ��ȯ�Լ�
-- to_number: ���ڸ� ���ڷ� ��ȯ

select to_number('12345') from dual;

-- Q] ���� �̸��� �޿�, �Ի�⵵, �Ի��� ���� ����, �޿� �λ���� ����Ͻÿ�.
-- ��� ���� ����
-- �޿� �λ���� ������ ����.
-- > �Ի�⵵�� 2010�� ���ĸ� 10% �λ�
-- > �Ի�⵵�� 2005�� ���ĸ� 5% �λ�
-- > �Ի�⵵�� 2005�� �����̸� �λ�� ����
select salary from employees order by salary desc;
select hire_date from employees;

-- case ������ ������ ���� �����Ѵٸ� decode ������� ��ġ�� �Ǵ� ���� ���� �����Ǹ� ����
-- ���������� ��ƴ�.
select case to_char(hire_date, 'yyyy') 
            when '2010' then to_char(salary * 1.10, '$99,999')  -- 2010�⸸ ����
            when '2005' then to_char(salary * 1.10, '$99,999')  -- 2005�⸸ ����
            else to_char(salary, '$99,999')
       end
from employees;
-- hire_date�� ���� case�� ���
-- ������ ���ǿ� ���� ��ȯ�� �� ��쿡�� ������ ������ ������ �����ϰ�
-- ���� when�� ������ ������ ���������� ���� �����Ͽ� ��ȯ�� �Ѵ�.
select first_name, salary, 
       to_char(hire_date,'yyyy"�� �Ի�"') as �Ի�⵵, 
       to_char(hire_date,'day') as �Ի����, 
       -- ���ϴ� �⵵�� �����Ͽ� �񱳿��� ����, ������ �Ϲ�����ȯ�� ������ �����̱� ������
       -- �߰����� ��ó���� ���� �ʾ���
       -- �޿��� ���� ������ �ְ� �ڸ����� 5�ڸ����� Ȯ���ϰ� ����
       case when to_char(hire_date, 'yyyy') >= 2010 then to_char(salary * 1.10, '$99,999')
            when to_char(hire_date, 'yyyy') >= 2005 then to_char(salary * 1.05, '$99,999')     
            else to_char(salary, '$99,999')
       end as �޿��λ��
from employees;
