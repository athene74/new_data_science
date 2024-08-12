-- 반올림: round
-- 두번째 인자는 자리수로 양수이면 소수점 이하의 자리, 음수이면 소수점 왼쪽의 자리수에서 반올림이 이루어진다.
select round(45.962,2),round(45.962,0),round(45.962,-1)
from dual;


-- 올림: ceil (ceil 함수는 소수점 이하를 올리는 기능만 제공한다.)
select ceil(7.3)from dual;
-- 8

-- 버림: floor (floor함수는 소수점 이하를 버리는 기능만 제공한다.)
select floor(7.3)from dual;
-- 7
-- select floor(7.33434343, 2)from dual; -- 지원 X

-- 절삭: trunc([데이터],[자리수]) 자리수 만큼 데이터의 값을 절삭
-- 340,343,056,234,656 원
select trunc(45.923,2), trunc(45.923), trunc(45.923, -1) from dual;

-- to_date([날짜스트링],[포멧])
select to_date('2023-06-01','YYYY-MM-DD') from dual;

-- trunc 함수는 날짜타입에도 적용가능하다.
-- 해당월 첫째날 구하기
select trunc(
    to_date('2024-07-24','YYYY-MM-DD'),
    'MM'
    )
from dual;
select trunc(
    to_date('2024-12-25','YYYY-MM-DD'),
    'MM'
    ) 
from dual;
-- 새해 첫째날 구하기
select trunc(
    to_date('2024-07-24','YYYY-MM-DD'),
    'YYYY'
    ) 
from dual;
-- 23/01/01
select trunc(to_date('2024-07-24','YYYY-MM-DD'),'DD') from dual;
-- 24/07/24 : 날짜 이후로는 절삭할 단위가 없기 때문에 현재 날짜를 반환

-- 그 주의 첫번째 일요일 반환
select trunc(to_date('2024-07-24','YYYY-MM-DD'),'DAY') from dual;

-- 절대값
select abs(-1000) from dual;

-- 제곱값
select power(2,2) from dual;
--4
select power(2,3) from dual;
--8
-- 제곱근
select sqrt(100) from dual;

-- 나머지
select mod(10,3) from dual;
-- 1

Q] HK 데이터분석팀 직원은 입사일 해당 주의 금요일에 회식을 하게 됩니다.
직원의 회식일을 구하세요. trunc 함수 사용.
2024-02-07 일 입사했다고 가정합시다.
select trunc(to_date('2024-02-07','YYYY-MM-DD'),'DAY')+5 
from dual;
select trunc(to_date('2024-09-23','YYYY-MM-DD'),'DAY')+5 
from dual;

-- Q] employees 테이블에서 입사일 해당 주의 금요일에 해당하는 회식일을 계산하여
-- '이름', '입사일', '회식일' 열을 출력하세요.
select first_name as 이름, hire_date as 입사일,
    trunc(hire_date,'day')+5 as 회식일
from employees;

-- Q] employees 테이블에서 입사일 다음 주의 금요일에 근로계약서를 작성한다.
-- '이름', '입사일', '근로계약서_작성일' 열을 출력하세요.
-- 테이블 작성하기 전 테스트
select trunc(to_date('2024-07-24','YYYY-MM-DD'),'DAY')+12 
from dual;
-- 테이블 적용
select first_name as 이름, hire_date as 입사일,
    trunc(hire_date,'day')+ 12 as 근로계약서_작성일
from employees;

-- next_day(날짜, 요일): 특정일을 기준으로 돌아오는 가장 빠른 요일 반환
-- trunc() 함수로 해당일의 특정 요일 계산
select trunc( to_date( '2024-07-24','YYYY-MM-DD'),'DAY' ) + 5 
from dual;
select next_day( to_date('2024-07-24','YYYY-MM-DD') , '금요일' ) 
from dual;
select next_day( to_date('2024-07-24','YYYY-MM-DD') , '토요일' ) 
from dual;

-- last_day(날짜): 해당일 마지막날 반환
select last_day( to_date('2024-07-24','YYYY-MM-DD') ) 
from dual;

-- add_months(날짜, 개월수): 개월수가 지난 날짜
-- 7월 24일에서 한달이 지난 날짜
select add_months( to_date('2024-07-24','YYYY-MM-DD'), 1 ) from dual;
-- 7월 24일에서 두달이 지난 날짜
select add_months( to_date('2024-07-24','YYYY-MM-DD'), 2 ) from dual;

-- sysdate 현재 날짜
select sysdate from dual;

-- months_between(끝일, 시작일): 시작일과 끝일 사이의 기간, 버림함수와 사용해서 개월수를 계산한다.
-- 몇개월차를 구할 때 사용
select months_between(to_date('2024-07-31', 'yyyy-mm-dd'), to_date('2024-07-24', 'yyyy-mm-dd') )
from dual;

-- 1개월차 계산
select ceil(months_between(to_date('2024-07-31', 'yyyy-mm-dd'), to_date('2024-07-24', 'yyyy-mm-dd') ))
from dual;

-- 2개월차 계산
select ceil(months_between(to_date('2024-08-25', 'yyyy-mm-dd'), to_date('2024-07-24', 'yyyy-mm-dd') ))
from dual;

1. 모든 직원의 입사한 날짜에 다음 주의 금요일이 되는 날짜를 계산하세요.
컬럼명을 '오리엔테이션일'로 하세요
select next_day(hire_date,'금요일') as 오리엔테이션일
from employees;

2. 직원 ID가 100인 직원의 입사한 날짜에 다음 주의 화요일이 되는 날짜를 계산하세요.
컬럼명을 '매니저면담일'로 하세요
select next_day(hire_date,'화요일') as 매니저면담일
from employees
where employee_id = 100;

3. 모든 직원의 입사한 날짜를 기준으로 마지막 날짜를 계산하세요.
컬럼명을 '입사환영회식일'로 하세요.
select last_day(hire_date) as 입사환영회식일
from employees;

4. 직원 ID가 100인 직원의 입사한 달의 마지막 날짜를 계산하세요.
컬럼명을 '입사환영회식일'로 하세요.
select last_day(hire_date) as 입사환영회식일
from employees
where employee_id = 100;

5. 직원 ID가 100인 직원의 입사한 날짜에 3개월을 더한 날짜를 계산하세요.
컬럼명을 '정식계약일'로 하세요
select add_months(hire_date,3) as 정식계약일
from employees
where employee_id = 100;

6. 모든 직원의 입사한 날짜에 6개월을 더한 날짜를 계산하세요.
컬럼명을 '신규직원인사평가일'로 하세요.
select add_months(hire_date,6) as 신규직원인사평가일
from employees;

7. 직원 ID가 200인 직원의 입사한 날짜에 12개월을 더한 날짜를 계산하세요.
컬럼명을 '연봉협상일'로 하세요.
select add_months(hire_date,12) as 연봉협상일
from employees
where employee_id = 200;

8. 모든 직원의 입사한 날짜와 현재 날짜 사이의 개월 수를 계산하세요. 
ceil 함수 사용해서 올림 처리하세요. 
컬럼명을 '근속월수'로 하세요.
select ceil(months_between(sysdate, hire_date)) as 근속월수
from employees;

9. 직원 ID가 100인 직원의 입사한 날짜와 현재 날짜 사이의 개월 수를 계산하세요.
ceil 함수 사용해서 올림 처리하세요. 
컬럼명을 '근속월수'로 하세요.
select ceil(months_between(sysdate, hire_date)) as 근속월수
from employees
where employee_id = 100;