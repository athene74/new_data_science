1. ��� ������ �Ի��� ��¥�� ���ƿ��� ���� ���� �ݿ����� �Ǵ� ��¥�� ����ϼ���.
�÷����� '���������̼���'�� �ϼ���
-- ��Ī�� as�� ��������
-- ���� �ݿ���
SELECT next_day(hire_date, '�ݿ���') ���������̼��� FROM Employees;

2. ���� ID�� 100�� ������ �Ի��� ��¥�� ���� ���� ȭ������ �Ǵ� ��¥�� ����ϼ���.
�÷����� '�Ŵ��������'�� �ϼ���
SELECT next_day(hire_date, 'ȭ����') �Ŵ�������� FROM Employees WHERE employee_id = 100;

3. ��� ������ �Ի��� ��¥�� �������� ������ ��¥�� ����ϼ���.
�÷����� '�Ի�ȯ��ȸ����'�� �ϼ���.
SELECT last_day(hire_date) �Ի�ȯ��ȸ���� FROM Employees;

4. ���� ID�� 100�� ������ �Ի��� ���� ������ ��¥�� ����ϼ���.
�÷����� '�Ի�ȯ��ȸ����'�� �ϼ���.
SELECT last_day(hire_date) FROM Employees WHERE employee_id = 100;

5. ���� ID�� 100�� ������ �Ի��� ��¥�� 3������ ���� ��¥�� ����ϼ���.
�÷����� '���İ����'�� �ϼ���
SELECT ADD_MONTHS(hire_date, 3) ���İ���� FROM Employees WHERE employee_id = 100;

6. ��� ������ �Ի��� ��¥�� 6������ ���� ��¥�� ����ϼ���.
�÷����� '�ű������λ�����'�� �ϼ���.
SELECT ADD_MONTHS(hire_date, 6) �ű������λ����� FROM Employees;

7. ���� ID�� 200�� ������ �Ի��� ��¥�� 12������ ���� ��¥�� ����ϼ���.
�÷����� '����������'�� �ϼ���.
SELECT ADD_MONTHS(hire_date, 12) ���������� FROM Employees WHERE employee_id = 200;

8. ��� ������ �Ի��� ��¥�� ���� ��¥ ������ ���� ���� ����ϼ���. 
ceil �Լ� ����ؼ� �ø� ó���ϼ���. 
�÷����� '�ټӿ���'�� �ϼ���.
SELECT ceil(months_between(SYSDATE, hire_date)) �ټӿ��� FROM Employees;

9. ���� ID�� 100�� ������ �Ի��� ��¥�� ���� ��¥ ������ ���� ���� ����ϼ���.
ceil �Լ� ����ؼ� �ø� ó���ϼ���. 
�÷����� '�ټӿ���'�� �ϼ���.
SELECT ceil(months_between(SYSDATE, hire_date)) �ټӿ��� FROM Employees WHERE employee_id = 100;