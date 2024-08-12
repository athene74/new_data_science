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

-- �̸�, ��, �޿�, 10% �λ�� �޿��� ��ȸ
select first_name, last_name, salary, salary*1.1 as salary_increased_by_10pct
from employees;