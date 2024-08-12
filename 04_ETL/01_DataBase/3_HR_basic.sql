-- HR(Human Resource, 인사정보) 관계형 데이터베이스 테이블 학습
select count(*) from employees;
select table_name from user_tables;
select * from employees;
describe employees;

/*
이름             널?       유형           
-------------- -------- ------------ 
EMPLOYEE_ID    NOT NULL NUMBER(6)    : 사원번호(직원정보를 나타내는 기본키)
FIRST_NAME              VARCHAR2(20) : 이름
LAST_NAME      NOT NULL VARCHAR2(25) : 성
EMAIL          NOT NULL VARCHAR2(25) : 이메일
PHONE_NUMBER            VARCHAR2(20) : 전화번호
HIRE_DATE      NOT NULL DATE         : 고용일
JOB_ID         NOT NULL VARCHAR2(10) : 직무아이디
SALARY                  NUMBER(8,2)  : 급여 (전체 8자리 중 소수점 이하 2자리)
COMMISSION_PCT          NUMBER(2,2)  : 커미션(보너스 인상율)
MANAGER_ID              NUMBER(6)    : 매니저아이디
DEPARTMENT_ID           NUMBER(4)    : 부서아이디
*/

-- 열 필터링(Projection)
-- 직원의 이름, 성, 급여 조회
select first_name, last_name, salary from employees;

-- 직원 이름, 고용일, 급여 조회
-- date 타입은 YY/MM/DD 형식으로 보여줌
select first_name, hire_date, salary from employees;

-- 이름, 성, 급여, 10% 인상된 급여를 조회
select first_name, last_name, salary, salary*0.1 from employees;
-- 이름 성, 급여 10% 인상된 급여를 조회, 신규열 이름을 가독성 있게 작성할 것
select first_name, last_name, salary, salary*0.1 as salary_increased_by_10pct from employees;

-- 열이름에 특수문자 포함X
-- selectg first_name, last_name, salary, salary*10 as 10%_increased_salary from employees;
-- selectg first_name, last_name, salary, salary*10 as salary_increased_by_10% from employees;

-- 열이름에 숫자가 허용되어도 일반적으로 숫자를 열이름으로 시작하지 않는 것이 좋다.
-- 오라클에서는 숫자를 제거한 열이름에 앞에 숫자가 전체 열에 할당되기도 한다.
-- select 1st_name, last_name, salary, salary*0.1 from employees;

-- 조회 열이름을 한글로 별칭하는 것도 가능
-- 장점: 조회 결과에 대한 가독성이 올라간다.
-- 단점: 조회 결과를 외부파일로 export 할 경우 캐릭터셋문제가 발생할 수 있다.
-- select first_name as 이름, last_name as 성,
--    salary as 급여, salary*10 as 급여_10퍼센트_인상분 from employees;

-- 이름, 성, 급여 10% 인상된 총급여를 조회, 신규열 이름을 가독성 있게 작성할 것
select first_name, last_name, salary, salary*1.1 as increased_total_salary from employees;

-- 이름, 부서id, commission 정보
-- 데이터가 정의되지 않을 경우에는 null로 표시한다.
select first_name, department_id, commission_pct
from employees;

-- 리터럴(literal)문자 스트링과의 연결
-- || : 연결 연산자
-- '문자를 표현하기 위해서 ''를 사용
select * from employees;

-- dual 테이블: 오라클 자체에서 값이나 오라클 문법을 확인하기 용도로 제공하는 테이블
select * from dual;

select 'Steven' from dual;
-- 문법 테스트
select 'Steven' || 'King''s salary is  $' ||'24000' from dual;


-- SQLDevelope에서 쿼리 수행하기 전에 문법 오류가 있다면 바로 마우스 오버하여 확인할 수 있다.
-- select 'Steven' || ' ' || 'King's' from dual;
select 'Steven' || ' ' || 'King''s' from dual;
-- 원본 열의 데이터를 보존하는 방식
select 'Steven' || ' ' || 'King' || '''s' from dual;
-- 나머지 문구 완성
select 'Steven' || ' ' || 'King' || '''s salary is $' ||'24000' from dual;


-- 아래와 같은 분석 결과를 각 열별로 출력하세요.
-- Steven King's salary is $24000(변동값은 Steven, King, 24000)
select first_name || ' ' || last_name || '''s salary is $' || salary as 사원급여정보 
from employees;
-- Steven King의 급여는 24000달러입니다.
-- 고정값 변동값을 중심으로 텍스트를 재구성한다.
select 'Steven' || ' ' || 'King' || '의 급여는 ' || '24000' || '달러 입니다.' from dual;
-- 변동값에 일치하는 열이름을 바꿔치기한다.
select first_name || ' ' || last_name || '의 급여는 ' || salary || '달러 입니다.' from employees;


-- 중복 행 제거
-- DISTINCT: 중복 레코드 제거 (판다스에서 unique함수의 결과와 유사)
-- 부서ID 조회(중복제거)
-- departments 테이블은 부서정보를 관리하는 테이블이다. 따라서 departments 테이블 관점에서
-- department_id는 중복이 허용되지 않는 primary key이다
select * from departments;

-- employees 테이블은 부서정보를 departments 테이블로 분리하고 id로 관리하고 있다.
-- 따라서 department_id는 employees 테이블 관점에서 중복이 되는 데이터이다.
select * from employees;
select department_id from employees;
select distinct department_id from employees;

-- 행 필터링(행의 제한) => Selection
-- 성이 'King'인 직원 정보 조회
select * from employees
where last_name = 'King';

-- 비교 연산
-- 급여가 15000 이상인 직원정보
select * from employees
where salary >= 15000;

-- 날짜비교
-- 2004년 1월 30일에 고용된 직원 정보 조회
select * from employees
-- 날짜타입 데이터에 대한 명시적 데이터 활용
where hire_date = to_date('2004-01-30','yyyy-mm-dd');
-- 날짜타입 데이터에 대한 묵시적 데이터 변환 활용
select * from employees
-- 날짜타입으로 변경가능한 문자열은 형변환이나 날짜 데이터타입을 생성하지 않아도
-- 묵시적인 형변환이 자동적용된다.
where hire_date = '04/01/30';

-- between 연산자 
-- between [시작조건] and [종료조건]
-- 시작조건과 종료조건은 숫자인 경우 모두 포함되는 조건
-- 급여가 10000 ~ 12000 인 직원
select * from employees
where salary between 10000 and 12000;

select * from employees
where salary >= 10000 and salary <= 12000;


-- 조건 Set
-- in 연산자
-- in (조건1, ... , 조건N) : 해당 조건을 or로 처리
-- 매니저ID가 101, 102, 103인 직원 이름, 급여, 매니저id 조회
select first_name, salary, manager_id
from employees
where manager_id in (101,102,103);

select first_name, salary, manager_id
from employees
where manager_id = 101 or manager_id = 102 or manager_id = 103;

select * from jobs;
-- LIKE 연산자
-- %: 아무 문자 0번에서 N번 매치
-- 직무ID가 IT로 시작하는 직원정보
select distinct job_id from employees;
select * from employees
where job_id like 'IT%';

select * from employees;
-- 2003년도에 입사한 직원 정보 조회
select * from employees
where hire_date like '03%'; -- 날짜 타입에 대해서 like 연산을 사용하면 암묵적 형변환이 일어난다.
-- 1월에 입사한 직원 정보 조회
select * from employees
where hire_date like '__/01%';
-- 1일에 입사한 직원 정보 조회
select * from employees
where hire_date like '__/__/01';
또는
select * from employees
where hire_date like '%01';

-- 이메일의 두 번째 문자가 'A'인 직원 정보
select * from employees
where email like '_A%';

-- null 데이터를 찾을 때 => 정의되지 않은 데이터(결측치)를 찾을 때
-- is null
-- 매니저 id가 null인 직원이름, 매니저id 조회
select manager_id from employees;
select first_name, manager_id from employees
where manager_id is null;
select * from employees;

-- 논리 연산자
-- and 연산
-- 직무 id가 IT_PROG이고 급여가 5000 이상인 직원 정보
select * from employees
where job_id='IT_PROG' and salary >= 5000;

-- Q] 직무 아이디가 'IT_PROG' 또는 'FI_MGR' 이고 급여가 6000 이상인 
-- 직원의 이름, 직무id, 급여를 출력하세요.
-- 오라클에서 and 연산자의 우선순위가 or 보다 높다.
-- 따라서 의미를 분명하게 하기 위해서 () 연산자를 활용할 것
select first_name, job_id, salary from employees
where (job_id ='IT_PROG' or job_id ='FI_MGR') and salary >= 6000;



-- 데이터 정렬
-- order by (기본 오름차순 정렬)
-- 문법
-- select
-- from
-- where
-- order by <- 이 위치에서 사용

select first_name, hire_date
from employees
order by hire_date;

select first_name, hire_date
from employees
order by hire_date asc; -- 명시적으로 오름차순임을 지정

-- 내림차순 정렬 (desc)
select first_name, hire_date
from employees
order by hire_date desc;

--select hire_date from employees order by hire_date desc;

-- 열 별칭 응용
select first_name, salary
from employees
order by salary desc;

select first_name, salary*1.2 -- <= salary*1.2 : 급여의 20% 인상이 반영된 금액
from employees
order by salary*1.2;

select first_name, salary*1.2 as 인상된급여 -- <= salary*1.2 : 급여의 20% 인상이 반영된 금액
from employees
order by 인상된급여;

select first_name, salary*1.2 as raise_salary -- <= salary*1.2 : 급여의 20% 인상이 반영된 금액
from employees
order by raise_salary;

