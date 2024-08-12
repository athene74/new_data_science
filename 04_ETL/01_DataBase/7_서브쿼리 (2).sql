-- 서브쿼리: 쿼리의 각 절에 의존관계를 활용하여 중첩된 쿼리를 작성해 하나의 검색결과를 자동으로 완성
-- 종류: 
-- where: 일반 서브쿼리, 
-- from: 인라인뷰(Inline View), 
-- select: 스칼라 서브쿼리(Scalar Subquery)

-- Nancy의 급여보다 많은 급여를 받는 사원의 이름과 급여를 출력
select salary from employees where first_name ='Nancy';
select first_name, salary from employees where salary > 12008;

-- 서브쿼리의 유형: 단일행 서브쿼리, 다중행 서브쿼리, 다중컬럼 서브쿼리
-- 서브쿼리 활용(단일행 서브쿼리: 하나의 값을 대체)
select first_name, salary 
from employees 
where salary > (select salary 
                    from employees 
                    where first_name ='Nancy');

-- WHERE 뒤에 값(리터럴)에 의한 비교는 하나의 값과 매치가 되어야 한다. 복수개의 값과 매치를 하려고 한다면
-- 에러를 발생하게 된다.
-- 예)
select salary from employees where first_name ='David';
select first_name, salary from employees where first_name ='David';

select first_name, salary 
from employees 
where salary > (select salary 
                    from employees 
                    where first_name ='David');
                    
-- 다중행 서브쿼리
-- ANY/ALL
-- ANY: 하나라도 만족하는 조건 / ALL: 모든 것을 만족하는 조건
-- > ANY: 왼쪽값이 오른쪽값의 어떠한 값보다 큰조건 => 오른쪽 값의 가장 작은 조건(MIN 조건)
-- < ANY: 왼쪽값이 오른쪽값의 어떠한 값보다 작은조건 => 오른쪽 값의 가장 큰 조건(MAX 조건)
-- > ALL: 왼쪽값이 오른쪽의 모든 값보다 큰 조건 => 오른쪽 값의 가장 큰 조건(MAX 조건)
-- < ALL: 왼쪽값이 오른쪽의 모든 값보다 작은 조건 => 오른쪽 값의 가장 작은 조건(MIN 조건)

--4800
--9500
--6800
-- 다중행 서브쿼리 Min 조건 => 단일값 추출
select first_name, salary 
from employees 
-- salary가 4800(Min)값 보다 큰조건
where salary > ANY(select salary 
                    from employees 
                    where first_name ='David');
                    
-- 다중행 서브쿼리 Max 조건
select first_name, salary 
from employees 
-- salary가 9500(MAX)값 보다 작은 조건
where salary < ANY(select salary 
                    from employees 
                    where first_name ='David');                    

-- 그룹함수의 결과를 where의 검색조건으로 활용                    
-- Q] 20번 부서에 근무하는 사원의 평균보다 많은 급여를 받는 사원의 이름과 급여를 출력      
select first_name, salary
from employees
where salary > (
                select avg(salary)
                from employees
                where department_id = 20
);

-- Q] 직원 테이블에서 가장 높은 급여를 받는 직원의 모든 정보
select *
from employees
where salary = (
                select max(salary)
                from employees
);
                    
      
                    
-- IN 연산을 활용한 다중행 서브쿼리 
-- In 연산은 where 뒤에 조건을 여러개의 값으로 매치시킬수 있다.          
-- 따라서 in 연산 안에 다중행을 리턴하는 서브쿼리를 작성할 수 있다.
select department_id from employees where first_name ='David'; -- 60, 80

select first_name, department_id, job_id
from employees
where department_id in (60, 80);

select first_name, department_id, job_id
from employees
where department_id in (select distinct department_id 
                        from employees 
                        where first_name ='David'
);


-- 다중 컬럼 서브쿼리: 다중 컬럼 값을 반환하는 서브쿼리
-- 부서별 최고 급여를 받는 직원 정보
-- STEP1] 부서별 최고 급여에 대한 다중행 결과
SELECT DEPARTMENT_ID, MAX(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

SELECT *
FROM EMPLOYEES
-- where 조건이 두개의 값으로서 in 안의 다중행 결과와 일치하는 조건임
WHERE (DEPARTMENT_ID, SALARY) IN ( 
    SELECT DEPARTMENT_ID, MAX(SALARY)
    FROM EMPLOYEES
    GROUP BY DEPARTMENT_ID
); 

--Q] 부서별 최고급여 받는 사람들 이름이랑 최고급여만 조회 
SELECT first_name, salary
FROM EMPLOYEES
-- where 조건이 두개의 값으로서 in 안의 다중행 결과와 일치하는 조건임
WHERE (DEPARTMENT_ID, SALARY) IN ( 
    SELECT DEPARTMENT_ID, MAX(SALARY)
    FROM EMPLOYEES
    GROUP BY DEPARTMENT_ID
); 


-- Scalar Sub Query
-- select 절에서 서브쿼리 사용 -> Scalar Sub Query
-- Select절에서 Join의 조건을 명시하여 Join할 대상 범위를 줄임
-- 상황에 따라서 Join 보다 좋은 성능을 보이기 때문에 사용 (단, 항상 성능이 좋은 것은 아님)
-- 하지만 어떤 식으로 쿼리를 작성하여도 DBMS Optimizer가 최적의 성능을 낼 수 있도록 쿼리를 최적화한다.
select first_name, department_name
from employees e 
join departments d 
on (e.department_id = d.department_id)
order by first_name;

select first_name,(select department_name
                    from departments d
                    where d.department_id = e.department_id) department_name
from employees e
order by first_name;

-- 인라인 뷰
-- from 절에 적용하는 서브쿼리. from 절에는 테이블 또는 뷰가 올 수 있음
-- 서브쿼리도 독립적인 뷰라고 볼수 있기때문에 인라인 뷰라 칭함

-- ? 급여를 가장 많이 받는 상위 10위까지 사원의 이름과 급여를 출력
select first_name, salary
from(
    select first_name, salary
    from employees
    order by salary desc
    )
-- order by 한 결과에서 TOP 10을 의사열을 통하여 추출 해야하는데 
-- where이 order by 이전에 수행 되는 구조라 인라인 뷰를 만들어 사용
-- 아래 쿼리와 비교해 볼 것
where rownum between 1 and 10; -- rownum: 의사열 => 쿼리결과에 오라클에서 자동으로 제공하는 행번호

-- 정렬이 되기전 10개 추출
    select first_name, salary
    from employees
    where rownum between 1 and 10
    order by salary desc;
    
    
-- 뷰: 자주 사용하는 쿼리를 View로 등록하여 모든 SQL에서 참조
--  프로그래밍 언어의 함수와 비슷한 개념
--STEP1] View 쿼리 검증
SELECT   
     employee_id AS 사원번호, 
     first_name || ' ' || last_name AS 직원이름, 
    to_char(salary,'$9,999,999') 급여
   FROM     employees
   WHERE    department_id=60;     
   
--STEP2] View 등록
create view emp_dept60_salary
as
SELECT   
     employee_id AS 사원번호, 
     first_name || ' ' || last_name AS 직원이름, 
    to_char(salary,'$9,999,999') 급여
   FROM     employees
   WHERE    department_id=60;  
   
-- view 조회
select view_name from user_views;
select * from emp_dept60_salary;

-- view 삭제
drop view emp_dept60_salary;

--STEP3] View를 SQL구문에서 사용
select *
from emp_dept60_salary;