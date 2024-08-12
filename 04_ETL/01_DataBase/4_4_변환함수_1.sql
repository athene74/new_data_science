-- 암시적 형 변환: 명시적으로 타입을 변환하지 않아도 자동 형 변환 되는 경우
-- 적용 대상: 아래 타입은 변환 가능한 데이터인 경우 자동 형 변환
-- number <-> 문자열 <-> 날짜(date)

describe employees;
select first_name from employees
where department_id=40;

select first_name from employees
where department_id='40'; --'40'은 문자열 타입이지만 암시적 형 변환이 가능하다.

select hire_date from employees;

select first_name from employees
where hire_date='03/06/17'; -- 문자열 타입이지만 Date 타입에 저장되는 형식의 문자열이므로
                            -- 암묵적 형 변환이 가능하다.
--where hire_date='03-06-17';
--where hire_date='03년06월17일'; -- date 타입에서 벗어난 서식을 사용한 경우 형변환 불가

select 5500 - 4000 from dual;
select '5500' - 4000 from dual;
select '5,500' - 4000 from dual; -- 숫자는 어떠한 서식도 허용하지 않는다.
select '5500' + 4000 from dual;

-- 명시적 형 변환
-- TO_CHAR: 문자(날짜)열에 날짜포멧을 적용하여 문자열로 변환, 
-- TO_CHAR([날짜],[날짜포멧])
select first_name, to_char(hire_date,'MM/YY') as 입사월
from employees
where first_name='Steven';

--select first_name, to_char(hire_date,'YYYY-MM-DD') as 입사월
select first_name, to_char(hire_date,'YYYY"년" MM"월" DD"일"') as 입사월
from employees
where first_name='Steven';

-- TO_CHAR: 문자(숫자)열에 숫자포멧을 적용하여 문자로 변환
-- TO_CHAR([숫자],[숫자포멧])
-- 규칙) $999,999 <- 숫자는 9로 표시
-- 규칙) 포멧보다 변환 숫자의 길이가 큰 경우에는 '#'으로 표기
select to_char(2000000,'$999,999') salary from dual; -- 포멧보다 변환 숫자 길이가 큰 경우
-- #########
select to_char(2000000,'$9,999,999') salary from dual; -- 포멧보다 변환 숫자 길이가 큰 경우
--  $2,000,000
-- 패딩(기본값)을 넣고 싶을때
-- 사용예)목표 금액의 자리수를 고려하여 숫자를 표현하고 싶은 경우
select to_char(2000000,'$009,999,999') salary from dual;

-- 원본 값을 무시하고자 할 때
-- 소수점이하에 대한 포맷이 없다면 그 값은 삭제된다.
select to_char(2000000.324,'$009,999,999') salary from dual;

select to_char(2000000.324,'$009,999,999.99') salary from dual;
-- L: 해당 국가의 화폐 기호를 사용
select to_char(2000000.324,'L009,999,999.99') salary from dual;

-- Q] 직원 테이블에 이름이 David인 이름, 성, 급여, 15% 인상된 금액을 salary1 열에
-- 15.23% 인상율은 다음과 같은 형식($1,446.85)을 적용된 인상금액을 salary2열에 출력하세요.
select first_name, last_name, salary, salary*0.15 as salary1, 
    to_char(salary*0.153, '$9,999.99')  as salary2
from employees
where first_name = 'David';

-- Q] 날짜 타입이 아래와 같이 출력되도록 직원이름,입사일을 출력하세요.
-- '2003-06-17'
select first_name, to_char(hire_date, 'yyyy-mm-dd')  as 입사일
from employees
where hire_date = '03/06/17';

-- null 변환
-- NVL: 결측치에 대한 처리를 위해 사용
-- NVL([원본값],[원본값이 널이면 변환되는 값]) <= 널이아니면 원본값을 반환

select commission_pct from employees;
-- 보너스 인상율을 적용한 인상된 총급여 계산
-- 오라클에서 null과의 모든 연산결과는 null
select first_name,salary, commission_pct, salary + salary*commission_pct 인상된총급여
from employees;

select nvl(1000, 100) from dual;
select nvl(null, 100) from dual;

-- Q] NVL 함수를 사용하여 인상된 총급여액이 NULL이 나오지 않도록 변경하세요.
select  first_name,salary, commission_pct,
        salary + salary*nvl(commission_pct, 0) 인상된총급여
from employees;

-- NVL2([원본값],[널이 아니면 변환되는 값],[널이면 변환되는 값]) 
select nvl2(0.2, 1000*0.2,0) from dual;
select nvl2(null, 1000*0.2,0) from dual;

-- Q] 위 예제를 nvl2 함수를 적용해서 풀어보세요.
select  first_name,salary, commission_pct,
        nvl2(commission_pct, salary + salary*commission_pct, salary) 인상된총급여
from employees;
describe employees;

-- COALESCE([값 또는 구문1], [값 또는 구문2] ...) : 널이 아닌 첫번째 인자의 값을 선택
-- 예) 고객 데이터베이스에서 연락가능한 번호를 추출하고자 할때
-- 수집을 한 고객 연락가능한 유형: 집전화번호, 회사번호, 휴대폰번호
-- 선택가능한 값 중 우선순위(전업주부인경우: 휴대폰, 집전화, 회사번호, 직장인: 휴대폰, 회사번호, 집전화)를 
-- 정하여 널이 아닌 값을 추출하고자 할 때 유용

select coalesce('010-123-4567','070-123-7777','053-555-6666') from dual;
select coalesce(null,'070-123-7777','053-555-6666') from dual;
select coalesce(null,null,'053-555-6666') from dual;

-- Q] 위 예제를 coalesce를 함수를 적용해서 풀어보세요.
select  first_name,salary, commission_pct,
        coalesce(salary + salary*commission_pct, salary) 인상된총급여
from employees;