-- DECODE: DECODE(Column or expression, search1, result
--                                      [search2, result2, ...]
-- 원본값에 대한 재해석을 하고자 할 때 사용할 수 있다.
-- 첫번째 인자(원본값) java와 두번째 인자(매치가 되는 검색조건) java가 있어서 세번째 인자로 변환
select decode('java', 'java', '백엔드 언어') as language from dual;
-- 매치가 되지 않은 경우에는 null로 변환
select decode('python', 'java', '백엔드 언어') as language from dual;
-- 첫번째 인자(원본값) python과 네번째 인자(두번째 매치조건) python이 있어서 다섯번째 인자로 변환
select decode('python', 'java', '백엔드 언어', 'python', '데이터분석 언어') as language from dual;
-- 가독성을 위해 if/else 구조로 줄바꿈을 한다.
select decode('python', 'java', '백엔드 언어', 
                        'python', '데이터분석 언어') as language from dual;
-- 추가 조건을 확장한다.
select decode('python', 'java', '백엔드 언어', 
                        'python', '데이터분석 언어',
                        'html', '프론트 언어') as language from dual;
-- 원본값을 바꿔가며 변환이 잘되는지 테스트한다.
select decode('html', 'java', '백엔드 언어', 
                        'python', '데이터분석 언어',
                        'html', '프론트 언어') as language from dual;
-- 'Ruby'로 원본을 지정하면 변환 코드가 없기 때문에 null        
select decode('R', 'java', '백엔드 언어', 
                        'python', '데이터분석 언어',
                        'html', '프론트 언어') as language from dual;
-- decode 되지 않는 기본값 처리(마지막 인자에 매치조건 없이 변환 값만 추가)       
select decode('R', 'java', '백엔드 언어', 
                        'python', '데이터분석 언어',
                        'html', '프론트 언어',
                        '기타언어') as language from dual;
-- Q] 직원 테이블에서 직무 ID, 급여, 그리고 'revised_salary' 를 출력한다.
-- 급여 인상율은 직무 id가 IT_PROG, FI_MGR, FI_ACCOUNT에 따라 각각 10, 15, 20% 인상율을 적용한다.
-- DECODE 사용할 것
select distinct job_id from employees;
select job_id, salary,
       decode(job_id,  'IT_PROG', salary*1.1,
                       'FI_MGR', salary*1.15, 
                       'FI_ACCOUNT', salary*1.2,
                       salary ) 
       as revised_salary 
from employees;

-- CASE ~ WHEN ~ THEN ~ END
select job_id, salary,
    case job_id when 'IT_PROG'      then salary*1.1
                when 'FI_MGR'       then salary*1.15
                when 'FI_ACCOUNT'   then salary*1.2
                else salary
    end as revised_salary
from employees;

-- 중첩함수 사용하기
-- 함수1(함수2(함수3)))
-- 함수 실행순서: 함수3 - 함수 2 - 함수1 순으로 실행
-- 함수1(함수2(함수3의 리턴값))
-- 함수1(함수2의 리턴값)
-- Step1] 입사후 6개월후의 날짜
select first_name, add_months(hire_date, 6)
from employees
order by hire_date;

-- Stop2] 입사 6개월 후 가장 빠른 금요일
select first_name, next_day(add_months(hire_date, 6),'금')
from employees
order by hire_date;

-- step3]입사 6개월후 가장 빠른 금요일 날을 'YYYY-MM-DD' 형식으로 출력
select first_name, to_char(next_day(add_months(hire_date, 6),'금'), 'yyyy-mm-dd')
from employees
order by hire_date;

-- 참고] 년도를 2자리로 표현시 문제가 될 수 있는 경우
select to_date('2024-07-25', 'yyyy-mm-dd') from dual;
select to_date('1924-07-25', 'yyyy-mm-dd') from dual;
select to_date('2024-07-25', 'yyyy-mm-dd'), to_date('1924-07-25', 'yyyy-mm-dd') from dual;

select to_char(to_date('2024-07-25', 'yyyy-mm-dd'), 'yyyy-mm-dd'), 
       to_char(to_date('1924-07-25', 'yyyy-mm-dd'), 'yyyy-mm-dd') 
from dual;

-- 숫자 변환함수
-- to_number: 문자를 숫자로 변환

select to_number('12345') from dual;

-- Q] 직원 이름별 급여, 입사년도, 입사한 날의 요일, 급여 인상액을 출력하시오.
-- 출력 포맷 참고
-- 급여 인상액은 다음과 같다.
-- > 입사년도가 2010년 이후면 10% 인상
-- > 입사년도가 2005년 이후면 5% 인상
-- > 입사년도가 2005년 이전이면 인상액 없음
select salary from employees order by salary desc;
select hire_date from employees;

-- case 다음에 참조할 값을 정의한다면 decode 방식으로 매치가 되는 값에 대한 재정의를 진행
-- 범위지정이 어렵다.
select case to_char(hire_date, 'yyyy') 
            when '2010' then to_char(salary * 1.10, '$99,999')  -- 2010년만 적용
            when '2005' then to_char(salary * 1.10, '$99,999')  -- 2005년만 적용
            else to_char(salary, '$99,999')
       end
from employees;
-- hire_date를 개별 case에 사용
-- 복잡한 조건에 대한 변환을 할 경우에는 다음에 참조할 조건을 생략하고
-- 개별 when에 참조할 범위나 다중조건을 직접 지정하여 변환을 한다.
select first_name, salary, 
       to_char(hire_date,'yyyy"년 입사"') as 입사년도, 
       to_char(hire_date,'day') as 입사요일, 
       -- 원하는 년도를 추출하여 비교연산 수행, 연도는 암묵적변환이 가능한 숫자이기 때문에
       -- 추가적인 전처리를 하지 않았음
       -- 급여에 대한 서식은 최고 자리수가 5자리임을 확인하고 적용
       case when to_char(hire_date, 'yyyy') >= 2010 then to_char(salary * 1.10, '$99,999')
            when to_char(hire_date, 'yyyy') >= 2005 then to_char(salary * 1.05, '$99,999')     
            else to_char(salary, '$99,999')
       end as 급여인상액
from employees;
