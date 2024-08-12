-- union all에 대한 이해
-- step1] 개별 쿼리
-- 부서별 평균 급여
select department_id, round(avg(salary),2)
from employees
group by department_id;

-- 직무별 평균급여
select job_id, round(avg(salary),2)
from employees
group by job_id;

-- union all : 서로 다른 쿼리의 결과를 통합
-- union all로 통합시 통합하는 열의 타입은 동일해야 한다.

describe employees;
select distinct job_id from employees;

-- 부서별 평균 급여
-- department_id는 숫자타입이고 통합할 job_id의 타입 문자열과 다르기 때문에 통합할 수 없다.
-- select department_id, round(avg(salary),2)
select to_char(department_id), round(avg(salary),2)
from employees
group by department_id
union all
-- 직무별 평균급여
-- job_id는 통합하기 위해서 숫자로 변경을 해야하지만 변경불가의 값을 가지고 있기 때문에
-- 타입변경은 department_id를 문자로 변경한다.
select job_id, round(avg(salary),2)
from employees
group by job_id;

-- union all의 기능을 grouping sets 함수로 적용
select department_id, job_id, round(avg(salary),2) 
from employees
-- set ( 조건1, 조건2 )
-- 조건1의 그룹핑한 결과와 조건2의 그룹핑한 결과의 합집합 
group by grouping sets (department_id, job_id)
order by department_id, job_id;


-- 대분류, 소분류로 나누어 병합하려고 할 때
select department_id, job_id, round(avg(salary),2) 
from employees
-- set ( ( 조건1, ....,  조건N ) )
-- 예)
-- set ( ( 조건1, 조건2 ) )
-- 조건1별 조건2별 그룹핑한 결과
group by grouping sets ( (department_id, job_id) ) -- 부서별 직무별 평균급여
order by department_id, job_id;

-- grouping set 기능확장
-- 그룹셋1 ~ 그룹셋N까지의 합집합
-- grouping set ( (그룹셋1), (그룹셋2) ...)
select department_id, job_id, manager_id, round(avg(salary),2) 평균급여  
from employees
group by grouping sets ( (department_id, job_id), (job_id, manager_id ))
order by department_id, job_id, manager_id;


-- Rollup, Cube
-- 기존의 grouping 방식보다 더 상세한 집계 결과를 제공

-- Rollup
-- 각레벨별(가장 소그룹) 소계, 총계(대그룹)를 제공
select department_id, job_id, round(avg(salary), 2), count(*)
from employees
group by rollup(department_id, job_id)
order by department_id, job_id;

-- cube
-- rollup 정보에 마지막 그룹의 값에 대한 소계 정보를 추가
select department_id, job_id, round(avg(salary), 2), count(*)
from employees
group by cube(department_id, job_id)
order by department_id, job_id;