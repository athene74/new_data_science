--DB 접속을 연습용 계정으로 변경
select table_name from user_tables;
-- 모든 조인의 결과를 확인가능케하는 연습용 테이블 생성`
-- 테이블 A 생성
drop table employees;
CREATE TABLE employees (
  employee_id number PRIMARY KEY,
  employee_name VARCHAR2(50), 
  department_id number
);

-- 테이블 A 데이터 삽입
INSERT INTO employees (employee_id, employee_name, department_id)
VALUES (1, '홍길동', 101);
INSERT INTO employees (employee_id, employee_name, department_id)
VALUES (2, '김철수', 102);
INSERT INTO employees (employee_id, employee_name, department_id)
VALUES (3, '이영희', 101);
INSERT INTO employees (employee_id, employee_name, department_id)
VALUES (4, '박민지', 102);
INSERT INTO employees (employee_id, employee_name, department_id)
VALUES (5, '최영호', 103);
INSERT INTO employees (employee_id, employee_name, department_id)
VALUES (6, '나사장', 201);

-- 테이블 B 생성
drop table departments;
CREATE TABLE departments (
  department_id number PRIMARY KEY,
  department_name VARCHAR2(50)
);


-- 테이블 B 데이터 삽입
INSERT INTO departments (department_id, department_name)
VALUES (101, '개발');
INSERT INTO departments (department_id, department_name)
VALUES (102, '영업');
INSERT INTO departments (department_id, department_name)
VALUES (103, '마케팅');
INSERT INTO departments (department_id, department_name)
VALUES (104, '재무');

select * from employees;
select * from departments;
-- department_id: 조인키
-- employees 테이블에서 부서ID
select distinct department_id from employees order by department_id;

-- departments 테이블의 부서 ID
-- 101, 102, 103, 104
-- Inner Join (ANSI Style): 조인의 결과는 두 집합에서 조인되는 키의 교집합범위에서 일어난다.
SELECT e.employee_id, e.employee_name, e.department_id, d.department_name
FROM employees e
INNER JOIN departments d 
ON e.department_id = d.department_id;
--1    홍길동    101    개발
--2    김철수    102    영업
--3    이영희    101    개발
--4    박민지    102    영업
--5    최영호    103    마케팅

select e.employee_id, e.employee_name, e.department_id, d.department_name
from employees e
inner join departments d
on e.department_id = d.department_id;

-- Left Join (ANSI Style): Left 테이블을 기준으로 병합(그렇기 때문에 Left 테이블의 조인키 누락은 없다.)
-- 조인시 첫번째로 지정하는 테이블을 Left, 두번?로 지정하는 테이블이 Right
SELECT e.employee_id, e.employee_name, e.department_id, d.department_name
FROM employees e
LEFT JOIN departments d 
ON e.department_id = d.department_id;
--3    이영희    101    개발
--1    홍길동    101    개발
--4    박민지    102    영업
--2    김철수    102    영업
--5    최영호    103    마케팅
--6    나사장    201          => A(Employees)를 기준으로 누락되면 않되기 때문에 201정보는 포함
--                    => 하지만 B(Departments)테이블에는 201번 정보가 없기 때문에 null로 표현
--조인의 결과 순서는 일반적으로 데이터베이스 내부에서 처리되는 방식, 물리적인 구조, 인덱스 등에 따라 달라질 수 있습니다. 
--특정 순서로 데이터가 나오는 것은 보장되지 않습니다.

-- right join (ANSI Style)
SELECT e.employee_id, e.employee_name, e.department_id, d.department_name
FROM employees e
RIGHT JOIN departments d 
ON e.department_id = d.department_id;
--1    홍길동    101    개발
--2    김철수    102    영업
--3    이영희    101    개발
--4    박민지    102    영업
--5    최영호    103    마케팅
--                재무
-- Right 조인 경우 오른쪽 테이블이 기준이기 때문에 조인키는 오른쪽 테이블을 기준으로 한다.
-- 또한 조인키를 left 테이블로 프로젝션하면 누락될 수 있다.

SELECT e.employee_id, e.employee_name, d.department_id, d.department_name
FROM employees e
RIGHT JOIN departments d 
ON e.department_id = d.department_id;

-- Left/Right 조인의 결과와 상관없이 누락방지를 위한 팁
SELECT e.employee_id, e.employee_name, coalesce(e.department_id, d.department_id), d.department_name
FROM employees e
RIGHT JOIN departments d 
ON e.department_id = d.department_id;

-- Full Outer Join (ANSI Style): 조인키의 합집합 범위내에서 병합 진행
-- step1] Outer Join 시도
SELECT e.employee_id, e.employee_name, e.department_id, d.department_name
FROM employees e
FULL OUTER JOIN departments d ON e.department_id = d.department_id;
-- 두 테이블 결과중 양쪽 테이블에 department_id가 null 인경우가 모두 존재한다.
--1    홍길동    101    개발
--2    김철수    102    영업
--3    이영희    101    개발
--4    박민지    102    영업
--5    최영호    103    마케팅
--6    나사장    201    
--                재무
-- Full Outer Join시 두 테이블마다 유일한 조인키를 가질 경우 두 테이블에서 조인키가 null인 경우가 발생가능
-- step2] 누락 방지 처리
SELECT e.employee_id, e.employee_name, coalesce(e.department_id, d.department_id), d.department_name
FROM employees e
FULL OUTER JOIN departments d ON e.department_id = d.department_id;

-- A-B(Employees-Departments) 차집합 (ANSI Style)
-- step1] A(Employees Inner) 조인 결과 구하기
SELECT e.employee_id, e.employee_name, e.department_id, d.department_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id;

SELECT e.employee_id, e.employee_name, e.department_id, d.department_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id
-- Left join의 결과는 A(employees) 테이블을 기준으로 하기 때문에 A(employees) 값은 누락되지 않는다.
-- 나사장 직원의 department_id는 A(employees) 테이블에만 존재하는 값이다.
-- Left Join의 결과로 department_id가 null값인 레코드는 A(Employees) 테이블에만 존재하는 값이다.
-- A-B의 결과는 A테이블에만 존재한 결과의 집합이다. 따라서 조인하려는 테이블의 조인 컬럼값이 null인 조건은
-- 차집합을 구하는 조건이된다.
WHERE d.department_id IS NULL; 

-- B-A(Departments - Employees) 차집합 (ANSI Style)
SELECT e.employee_id, e.employee_name, d.department_id, d.department_name
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id
WHERE e.department_id IS NULL;

-- Full Outer Join (ANSI Style): 조인키의 합집합 범위내에서 병합 진행
-- step1] Outer Join 시도
SELECT e.employee_id, e.employee_name, e.department_id, d.department_name
FROM employees e
FULL OUTER JOIN departments d ON e.department_id = d.department_id;
-- 두 테이블 결과중 양쪽 테이블에 department_id가 null 인경우가 모두 존재한다.
--1    홍길동    101    개발
--2    김철수    102    영업
--3    이영희    101    개발
--4    박민지    102    영업
--5    최영호    103    마케팅
--6    나사장    201    
--                재무
-- Full Outer Join시 두 테이블마다 유일한 조인키를 가질 경우 두 테이블에서 조인키가 null인 경우가 발생가능
SELECT  e.employee_id, e.employee_name, 
        coalesce(e.department_id, d.department_id) 부서id, 
        d.department_name
FROM employees e
FULL OUTER JOIN departments d ON e.department_id = d.department_id;

-- Full Outer Join - Inner Join (ANSI Style): 투 테이블간 고유의 조인키값만 조회하고 싶은 경우(중복영역을 제거)
SELECT  e.employee_id, e.employee_name, 
        coalesce(e.department_id, d.department_id) 부서id,
        d.department_name
FROM employees e
FULL OUTER JOIN departments d ON e.department_id = d.department_id
WHERE e.department_id IS NULL OR d.department_id IS NULL; 

-- Full Outer Join - Inner Join
-- A-B
SELECT e.employee_id, e.employee_name, e.department_id
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id
WHERE d.department_id IS NULL

UNION all
-- B-A
SELECT e.employee_id, e.employee_name, d.department_id 
FROM employees e
RIGHT JOIN departments d ON e.department_id = d.department_id
WHERE e.department_id IS NULL;

-- CROSS JOIN: 두 개의 테이블에 대한 카테시안 프로덕트(Cartesian Product)와 같은 결과(모든 조합)를 출력하는 Join
-- 값으로 만들어 낼수 있는 모든 조합을 고려하고자 할 때
-- select table1.column1, table2.column2
-- from table1
-- cross join table2;
select employee_id from employees;
select department_name from departments;
SELECT employee_id, department_name
FROM  employees 
CROSS JOIN departments;
