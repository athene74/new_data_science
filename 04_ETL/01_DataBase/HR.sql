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

-- 이름, 성, 급여, 10% 인상된 급여를 조회
select first_name, last_name, salary, salary*1.1 as salary_increased_by_10pct
from employees;