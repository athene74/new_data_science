-- 조인의 종류
-- 관점에 따라 여러가지로 나눌 수 있으나 주로 아래 관점으로 분류
-- 일반 분류: Inner Join(내부조인) / Outer Join(외부조인) / Cross Join(교차조인) => 조인의 범위에 따라 분류
-- 표준 여부: Ansi Join(안시 조인) vs Oracle Join(오라클 조인) => Ansi 조인: SQL 표준 문법
-- 조인 구문: Explicit Join(명시적 조인) vs Implicit Join(암시적 조인)
-- 조인 방향:(Inner/Left/Right/Full Outer/합집합(Union)/차집합(Difference)/교집합(Intersection)
-- 복잡성: Simple Join(단순 조인) / Complex Join(복합 조인)

-- Inner Join,  Explicit Join, ANSI Join 
select count(*) from employees;
--select 
select * from departments;
-- step1]
select *
from employees  
join departments  -- join [병합대상 테이블명], join 만 쓰게 되면 inner join이 수행된다.
on employees.department_id = departments.department_id; -- ON [병합 키 조건] / 병합에 사용하는 컬럼을 키(KEY)라고 한다.
-- 마지막 라인에서 조인에 대한 조건을 명시적으로 지정

-- STEP2] 테이블에 별칭 지정
select *
from employees e -- 테이블명 다음에 테이블명의 별칭을 지정할 수 있다. 별칭은 보통 테이블명의 첫글자를 소문자로
join departments d -- join [병합대상 테이블명]
on e.department_id = d.department_id; -- ON [병합 키 조건] / 병합에 사용하는 컬럼을 키(KEY)라고 한다.

-- STEP3] 관심사 컬럼선택, 중복 컬럼 제거
select e.employee_id, e.first_name,e.department_id, d.department_name
from employees e -- 테이블명 다음에 테이블명의 별칭을 지정할 수 있다. 별칭은 보통 테이블명의 첫글자를 소문자로
join departments d -- join [병합대상 테이블명]
on e.department_id = d.department_id; -- ON [병합 키 조건] / 병합에 사용하는 컬럼을 키(KEY)라고 한다.

-- Implicit Join(암시적/묵시적 조인)
-- NATURAL JOIN: 
-- 모든 동일한 이름을 갖는 컬럼들에 대해 조인 (Oracle Join이며 ANSI Join에는 지원하는 기능이 없다.)
-- Inner Join,  Oracle Join, Implicit Join
SELECT employee_id, first_name, department_id, department_name
FROM employees 
NATURAL JOIN departments
order by department_id;
-- 위 natural join은 양 테이블간 동일한 이름을 갖는 컬럼이 2개이기 때문에
-- 두개의 컴럼으로 Join을 진행하게 된다. (보다 엄격한 조건으로)
select *
from employees e 
join departments d 
on  e.department_id = d.department_id and
    e.manager_id = d.manager_id;
select count(*)
from employees e, departments d 
where  e.department_id = d.department_id and
    e.manager_id = d.manager_id;    

SELECT employee_id, first_name, employees.department_id, department_name
FROM employees 
JOIN departments ON employees.department_id = departments.department_id;

select count(*) from employees;
select department_id from departments;

SELECT COUNT(*) AS record_count
FROM employees
WHERE department_id IN (SELECT department_id FROM departments);


-- USING: using 절을 사용하여 원하는 컬럼에 대해서 명시적으로 조인
-- Inner Join,  Oracle Join, explicit Join
SELECT first_name, department_name
FROM   employees 
JOIN   departments 
USING (department_id); -- 테이블 명을 생략하여 조인 조건을 간소화


-- 복합조인(Complex Join): 세개 이상의 테이블로 조인하거나 복잡한 서브쿼리로 조인하는 경우
SELECT e.first_name AS name,
       d.department_name AS department, 
       l.street_address || ', ' || l.city || ', ' || l.state_province AS address
FROM  employees e 
JOIN  departments d 
ON    e.department_id=d.department_id AND employee_id = 103
JOIN  locations l 
ON    d.location_id=l.location_id;
select table_name, 
select * from employees;


1. 직원의 이름, 부서 이름, 그리고 부서 위치를 포함하는 직원 정보 조회하기.
select e.first_name, d.department_name, d.location_id
from employees e 
join departments d
on e.department_id = d.department_id;

select * from employees;
select * from departments;
2. 매니저와 그 매니저에게 직접 보고하는 직원의 정보를 함께 조회하기.
select *
from employees e 
join employees f
on e.employee_id= f.manager_id
order by f.manager_id;

3. 직원의 이름, 직무, 급여, 부서 위치, 그리고 근무하는 매니저의 이름 조회하기.
select e.first_name, e.job_id, e.salary, d.location_id, f.first_name
from employees e
join departments d, employees f
on e.department_id = d.department_id and
    e.employee_id= f.manager_id;

4. 부서별로 전체 직원의 평균 급여와 최대 급여 조회하기.
select e.department_id, round(avg(e.salary),2), max(e.salary)
from employees e
group by e.department_id;

5. 부서별로 직원 수가 5명 이상인 부서의 정보와 해당 부서에 속한 직원들의 수를 조회합니다.
select e.department_id, d.department_name, count(e.employee_id)
from employees e
join departments d
on e.department_id = d.department_id
group by e.department_id
having count(e.department_id)>=5;
