-- Group by: 유일한 값으로 데이터를 그룹핑한다. 
-- 그룹화한 데이터셋을 기준으로 다양한 다중행 함수를 적용하여 데이터를 분석할 때 활용된다.
-- Step1] group by할 열(범주형 값을 갖는 열)을 select에서 일치 시킨다.
-- 부서ID별 그루핑하여 부서ID 출력
select department_id from employees;
select distinct department_id from employees;

select department_id
from employees
group by department_id;

-- group by와 집계 함수 응용
-- 부서별 급여평균
-- step2] group by 한 결과에 대해 다중행함수를 적용한다.
-- 부서별 직원수
select department_id, count(*)
from employees
group by department_id;

-- 문제] 부서별 평균급여

select department_id, round(avg(salary),2) as 부서별_평균급여
from employees
group by department_id;

-- 그룹함수의 잘못된 사용예
-- 개별열과 그룹함수를 혼합해서 사용하는 것은 문법오류를 발생
-- 개별열의 값에 대한 집계 결과를 보여줘야 하기 때문에 개별과 그룹함수를 같이 사용하려면
-- 개별열의 값에 대한 group by를 만드시 해야한다.
select department_id, avg(salary)
from employees;

/*
    group by문 사용시 적용가능한 모든 문법

    select
    from
    where
    group by
    having
    order by
*/
-- having: group by 한 결과를 필터링 할 때 사용
-- 부서별 평균 급여
select department_id, round(avg(salary),2)
from employees
group by department_id;
-- 평균급여가 8000이상인 부서별 평균급여
select department_id, round(avg(salary),2)
from employees
group by department_id
having avg(salary) >=8000;

-- SQL 정의 순서: select - from - where - group by - having - order by
-- 내부 수행 순서: from - where - group by - having - select - order by
select job_id, avg(salary) 평균급여
from employees
where job_id not like 'SA%' 
group by job_id
having avg(salary) > 8000
order by 평균급여 desc;

-- 2개 이상 group by
SELECT 
    department_id, job_id,
    COUNT(*) AS employee_count
FROM 
    employees
GROUP BY 
    department_id, job_id
ORDER BY  -- 대분류 별로 모으기 위해 order by를 한다. 생략하고 해보며 비교해보자
    department_id ASC;

1번~6번 select - from - group by
1. employees 테이블에서 각 부서별로 평균 급여를 구하세요.
소수점이하 반올림처리하세요

select department_id, round(avg(salary),2) as 부서별_평균급여
from employees
group by department_id;

2. 각 부서의 최고 급여 구하기:

select department_id, round(max(salary),2) as 부서별_최고급여
from employees
group by department_id;

3. 각 직책별로 평균 급여 구하기:
select job_id,round(avg(salary),2) as 직책별_평균급여
from employees
group by job_id;

4. 각 직책별로 최소 급여와 최고 급여의 차이 구하기:
select job_id, max(salary)-min(salary) as 직책별_차이급여
from employees
group by job_id;

5. 각 매니저별로 소속된 부서의 총 직원 수 구하기:
select manager_id, count(employee_id) as 매니저별_직원
from employees
group by manager_id;

6. 급여가 10000 이상인 부서의 직원 수 구하기
===============================
select department_id, salary, count(*)
from employees
where salary >= 10000
group by department_id, salary;

7번 이후 select from group by having
7. 각 직책별로 평균 급여가 5000 이상인 직책의 직원들의 수 구하기:
select job_id, salary, count(*)
from employees
group by job_id, salary
having avg(salary)>=5000;

select table_name from user_tables;

8. 각 부서의 직원 수가 5명 이상인 부서만 보기:
select department_id, count(*)
from employees
group by department_id
having count(department_id)>=5;
9. 각 직책별로 직원 수가 3명 이상인 직책만 보기:
select job_id, count(*)
from employees
group by job_id
having count(job_id)>=3;
10. 매니저별 직속 부하 직원 수가 5명 이상인 매니저 구하기
select manager_id, count(*) as 직원수
from employees
group by manager_id
having count(manager_id)>=5;

-- 연습문제2
1. 부서별 직원 수 조회하여 부서 id 오름차순으로 정렬
오름차순으로 정렬
select department_id, count(*)
from employees
group by department_id
order by count(department_id);

2. 부서별 평균 급여와 최소 급여 조회하기 (부서 평균 급여가 5000 이상인 경우만)
- 평균급여는 소수점 이하 반올림하세요.
- 부서 id로 오름차순하여 정렬하세요.
select department_id, round(avg(salary),2), min(salary)
from employees
group by department_id;

-- order by 

3. 직무별 급여의 합계와 최고 급여 조회하기 (급여 합계가 10000 이상인 경우만)
- 급여 합계로 내림차순 정렬하세요.

4. 관리자별 직속 부하 직원 수와 관리 부서의 평균 급여 조회하기
-- 매니저 id로 오름차순 정렬하세요.

5. 부서별, 직무별, 매니저별 직원수를 구하세요.
- 부서id, 직무id, 매니저id순으로 오름 차순 정렬하세요.
select department_id, job_id, magener_id count(*)
from employees
group by department_id, job_id, magener_id;
6. 급여 범위에 따른 직원 수 조회하기
급여범위 및 group by 조건
0~3000, 3001~6000, 6001~9000, 9001 이상

1. employees 테이블에서 각 부서별로 평균 급여를 구하세요.
소수점이하 반올림처리하세요

SELECT department_id, round(AVG(salary))
FROM employees
GROUP BY department_id;


2. 각 부서의 최고 급여 구하기:

SELECT department_id, MAX(salary) AS max_salary
FROM employees
GROUP BY department_id;


3. 각 직책별로 평균 급여 구하기:

SELECT job_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY job_id;


4. 각 직책별로  최고 급여와 최소 급여의 차이 구하기:

SELECT job_id, MAX(salary) - MIN(salary) AS salary_difference
FROM employees
GROUP BY job_id;


5. 각 매니저별로 총 직원 수 구하기:

SELECT manager_id, COUNT(employee_id) AS total_employees
FROM employees
GROUP BY manager_id;

6. 급여가 10000 이상인 부서의 직원 수 구하기
SELECT department_id, COUNT(*) AS employee_count
FROM employees
WHERE salary >= 10000
GROUP BY department_id;

7. 각 직책별로 평균 급여가 5000 이상인 (직책의) 직원들의 수 구하기:
SELECT job_id, COUNT(employee_id) AS employee_count
FROM employees
GROUP BY job_id
HAVING AVG(salary) >= 5000;

8. 각 부서의 직원 수가 5명 이상인 부서의 직원수 보기:
SELECT department_id, COUNT(employee_id) AS total_employees
FROM employees
GROUP BY department_id
HAVING COUNT(employee_id) >= 5;

9. 각 직책별로 직원 수가 3명 이상인 직원수 보기:
SELECT job_id, COUNT(employee_id) AS employee_count
FROM employees
GROUP BY job_id
HAVING COUNT(employee_id) >= 3;

10. 매니저별 직속 부하 직원 수가 5명 이상인 매니저의 직원수 구하기
SELECT manager_id, COUNT(*) AS subordinate_count
FROM employees
GROUP BY manager_id
HAVING COUNT(*) >= 5;
-- 1. 부서별 직원 수 조회하여 부서 id 오름차순으로 정렬
SELECT department_id, COUNT(*) AS employee_count
FROM employees
GROUP BY department_id
ORDER BY department_id;

-- 2. 부서별 평균 급여와 최소 급여 조회하기 (부서 평균 급여가 5000 이상인 경우만)
SELECT department_id, ROUND(AVG(salary), 2) AS avg_salary, MIN(salary) AS min_salary
FROM employees
GROUP BY department_id
HAVING AVG(salary) >= 5000
ORDER BY department_id;

-- 3. 직무별 급여의 합계와 최고 급여 조회하기 (급여 합계가 10000 이상인 경우만)
-- 급여 합계는 내림차순으로 정렬
SELECT job_id, SUM(salary) AS total_salary, MAX(salary) AS max_salary
FROM employees
GROUP BY job_id
HAVING SUM(salary) >= 10000
ORDER BY total_salary DESC;

-- 4. 관리자별 직속 부하 직원 수와 관리 부서의 평균 급여 조회하기
-- 매니저 ID로 오름차순 정렬
SELECT manager_id, COUNT(*) AS subordinate_count, AVG(salary) AS avg_salary
FROM employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id
ORDER BY manager_id;

-- 5. 부서별, 직무별, 매니저별 직원수를 구하세요.
-- 부서ID, 직무ID, 매니저ID 오름차순 정렬
SELECT department_id, job_id, manager_id, COUNT(*) AS employee_count
FROM employees
GROUP BY department_id, job_id, manager_id
ORDER BY department_id, job_id, manager_id;

-- 6. 급여 범위에 따른 직원 수 조회하기
급여범위 및 group by 조건
0~3000, 3001~6000, 6001~9000, 9001 이상
SELECT CASE 
         WHEN salary BETWEEN 0 AND 3000 THEN '0-3000'
         WHEN salary BETWEEN 3001 AND 6000 THEN '3001-6000'
         WHEN salary BETWEEN 6001 AND 9000 THEN '6001-9000'
         ELSE '9001 이상'
       END AS salary_range,
       COUNT(*) AS employee_count
FROM employees
GROUP BY 
       CASE 
         WHEN salary BETWEEN 0 AND 3000 THEN '0-3000'
         WHEN salary BETWEEN 3001 AND 6000 THEN '3001-6000'
         WHEN salary BETWEEN 6001 AND 9000 THEN '6001-9000'
         ELSE '9001 이상'
       END;
-- 중복 코드 제거	   
WITH salary_ranges AS (
    SELECT CASE 
             WHEN salary BETWEEN 0 AND 3000 THEN '0-3000'
             WHEN salary BETWEEN 3001 AND 6000 THEN '3001-6000'
             WHEN salary BETWEEN 6001 AND 9000 THEN '6001-9000'
             ELSE '9001 이상'
           END AS salary_range
    FROM employees
)
SELECT salary_range,
       COUNT(*) AS employee_count
FROM salary_ranges
GROUP BY salary_range;