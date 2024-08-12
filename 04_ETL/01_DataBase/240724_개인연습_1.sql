-- 반올림: round
select round(45.832, 2), round(45.832, 0), round(45.832, -1)
from dual;
-- 올림: ceil( 소수점 이하를 올리는 기능만 제공)
select ceil(7.3) from dual;
-- 버림: floor( 소수점 이하는 버리는 기능만 제공)
select floor(7.3) from dual;
-- 절삭: trunc([데이터],[자리수]) 자리수만큼 데이터의 값을 절삭
select trunc(45.923, 2), trunc(45.923), trunc(45.923, -1) from dual;

select first_name, salary, 
       to_char(hire_date,'yyyy"년 입사"') as 입사년도, 
       to_char(hire_date,'day') as 입사요일, 
       -- 원하는 년도를 추출하여 비교연산 수행, 연도는 암묵적변환이 가능한 숫자이기 때문에
       -- 추가적인 전처리를 하지 않았음
       -- 급여에 대한 서식은 최고 자리수가 5자리임을 확인하고 적용
       case     when to_char(hire_date, 'yyyy') >= 2010 then to_char(salary * 1.10, '$99,999')
                when to_char(hire_date, 'yyyy') >= 2005 then to_char(salary * 1.05, '$99,999')     
                else to_char(salary, '$99,999')
       end as 급여인상액
from employees;

-- view 조회
select view_name from user_views;

select * from emp_dept60_salary;
create view emp_dept60_salary
as 
select
    employee_id as 사원번호,
    first_name || ' ' || last_name as 직원이름,
    to_char(salary, '$9,999,999') 급여
    from employees
    where department_id=60;

-- view 삭제
drop view emp_dept60_salary;

--연습문제 1
--모든 직원들 중에서 가장 높은 급여를 받는 직원의 정보를 조회하세요.
select *
from employees
where salary = (select max(salary) from employees);

--연습문제 2
--부서별로 평균 급여보다 높은 급여를 받는 직원들의 이름과 급여를 조회하세요.
select employee_id, first_name, last_name, department_id, salary
from employees e
where salary > (
    select avg(salary) 
    from employees 
    where department_id = e.department_id);
--order by department_id, salary desc;

--연습문제 3
--직원들이 근무하는 부서의 위치를 조회하세요. (단, 부서의 위치는 locations 테이블에서 가져와야 합니다.)
--
--연습문제 4
--자신의 매니저보다 더 높은 급여를 받는 직원들의 이름과 급여를 조회하세요.
--
--연습문제 5
--각 부서의 가장 최근에 고용된 직원의 이름과 고용 날짜를 조회하세요.
--
--각 문제에 대해 답이 필요하면 요청해 주세요. 추가적인 설명이나 다른 연습문제가 필요하면 말씀해 주세요.

