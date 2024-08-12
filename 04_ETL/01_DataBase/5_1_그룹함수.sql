/*
    그룹함수(다중행 함수)란?
    복수의 행을 조작하여 행의 그룹당 하나의 결과를 리턴하는 데이터 분석/집계 함수
    주요함수
    count, sum, avg, min, max, variance, stddev
*/

select  count(salary), sum(salary), avg(salary), min(salary), max(salary), 
        variance(salary), stddev(salary)
from employees;

-- 날짜인 경우 min(): 가장 오래된 날짜/max(): 가장 최근 날짜.
select min(hire_date), max(hire_date)
from employees;

-- 문자인 경우:min(): 문자숫서가 가장 앞인 경우/max(): 문자 숫서가 가장 뒤인 경우
select min(first_name), max(first_name)
from employees;

-- 문제] 직원테이블에서 가장 큰 급여액은?
select max(salary) from employees;

-- Q] 사원들의 급여의 총합, 평균, 표준편차, 그리고 분산을 구하세요.
-- 단 소수점 이하 두  자리까지 반올림할것
-- Q] 사원들의 급여의 총합, 평균, 표준편차, 그리고 분산을 구하세요.
-- 단 소수점 이하 두 번? 자리까지 반올림할것
--  각각의 조회열 이름을 합계, 평균, 표준편차, 분산 으로 할 것
select sum(salary) as 합계, 
       round(avg(salary),2) as 평균, 
       round(stddev(salary),2) as 표준편차, 
       round(variance(salary),2) as 분산
from employees;

-- count 함수 사용시 주의사항
-- count(*) 함수는 null인 값도 센다.
select commission_pct from employees;
select * from employees; -- 전체 레코드수가 107개
select count(*) from employees; -- 전체 레코드수가 107개
-- commission_pct 열 데이터의 갯수: 값이 있는 것만 카운트
select count(commission_pct) from employees;

-- 평균 인상분 구하기(총인상금액/인상된레코드의 전체개수) 구하기
select
    sum(salary*commission_pct) 총인상금액,
    -- 이 경우는 분모의 갯수를 null이 있는 모든 레코드도 포함하여 계산
    round(sum(salary*commission_pct) / count(*),2) 평균_인상분_by_cnt_ast,
    -- 이 경우는 분모의 갯수를 null이 있는 모든 레코드를 제외하여 계산
    round(avg(salary*commission_pct), 2) 평균_인상분_by_avg
from employees;

문제1: 직원 테이블에서 전체 직원의 수를 계산하세요.
select count(*) as total_employees 
from employees;

문제2: 직원 테이블에서 직원의 최소 급여(salary)를 계산하세요.
select min(salary) as min_salary
from employees;
문제3: 직원 테이블에서 직원의 최대 급여(salary)를 계산하세요.
select max(salary) as max_salary
from employees;
문제4: 직원 테이블에서 직원의 평균 급여(salary)를 계산하세요.
반올림 처리하세요.
select round(avg(salary)) as average_salary
from employees;
문제5: 직원 테이블에서 직원의 급여 합계를 계산하세요.
select sum(salary) as total_salary
from employees;
문제6: 직원 테이블에서 직원의 가장 오래된 입사일(hire_date)을 조회하세요.
select min(hire_date) as oldest_hire_date
from employees;
문제7: 직원 테이블에서 직원의 가장 최근 입사일(hire_date)을 조회하세요.
select max(hire_date) recent_hire_date
from employees;
문제8: 직원 테이블에서 직원의 최소 커미션(commission)을 계산하세요.
select min(commission_pct) as min_commission
from employees;
문제9: 직원 테이블에서 직원의 최대 커미션(commission)을 계산하세요.
select max(commission_pct) as max_commission
from employees;
문제10: 직원 테이블에서 직원의 커미션(commission)이 null인 직원의 수를 계산하세요.
select count(*) as null_commission_employees 
from employees
where commission_pct is null;

-- 문제1: 직원 테이블에서 전체 직원의 수를 계산하세요.
SELECT COUNT(*) AS total_employees
FROM employees;

-- 문제2: 직원 테이블에서 직원의 최소 급여(salary)를 계산하세요.
SELECT MIN(salary) AS min_salary
FROM employees;

-- 문제3: 직원 테이블에서 직원의 최대 급여(salary)를 계산하세요.
SELECT MAX(salary) AS max_salary
FROM employees;

-- 문제4: 직원 테이블에서 직원의 평균 급여(salary)를 계산하세요. 반올림 처리하세요.
SELECT ROUND(AVG(salary), 2) AS average_salary
FROM employees;

-- 문제5: 직원 테이블에서 직원의 급여 합계를 계산하세요.
SELECT SUM(salary) AS total_salary
FROM employees;

-- 문제6: 직원 테이블에서 직원의 가장 오래된 입사일(hire_date)을 조회하세요.
SELECT MIN(hire_date) AS oldest_hire_date
FROM employees;

-- 문제7: 직원 테이블에서 직원의 가장 최근 입사일(hire_date)을 조회하세요.
SELECT MAX(hire_date) AS recent_hire_date
FROM employees;

-- 문제8: 직원 테이블에서 직원의 최소 커미션(commission)을 계산하세요.
SELECT MIN(commission_pct) AS min_commission
FROM employees;

-- 문제9: 직원 테이블에서 직원의 최대 커미션(commission)을 계산하세요.
SELECT MAX(commission_pct) AS max_commission
FROM employees;

-- 문제10: 직원 테이블에서 직원의 커미션(commission)이 null인 직원의 수를 계산하세요.
SELECT COUNT(*) AS null_commission_employees
FROM employees
WHERE commission_pct IS NULL;