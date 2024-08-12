-- * 함수
-- - 단일행 함수: 단일 행에서만 적용 가능하고 행별로 하나의 결과를 리턴
-- - 다중행 함수: 복수의 행을 조작하여 행의 그룹당 하나의 결과를 리턴 (예: count())
--  > 단일행 함수: 문자함수, 숫자함수, 날짜 함수, 변환함수, 일반함수
-----------------------------------
--          문자함수
-----------------------------------
-- dual 테이블: 오라클 자체에서 값을 확인하기 용도로 제공하는 테이블
select * from dual;
select * from employees;
-- initcap: 단어를 기준으로 첫 문자만 대문자로 나머지는 소문자로 변환하는 함수
select email from employees;
select initcap(email) from employees;
select initcap('database specialist') from dual;
-- Database Specialist
select initcap('databasespecialist') from dual;
-- Databasespecialist



-- lower: 전체문자를 소문자로 만드는 함수
select lower('DATABASE SPECIALIST') from dual;
-- database specialist

-- upper: 전체문자를 대문자로 만드는 함수
select upper('database specialist') from dual;
-- DATABASE SPECIALIST

-- length: 문자열의 길이를 반환하는 함수
select length('database specialist') from dual;
-- 19
select length('데이터베이스 전문가') from dual;
-- 10: 한글인 경우 문자를 1로 카운트

-- concat: 두 문자열을 연결하여 반환
select concat('데이터베이스', '전문가') from dual;
-- 데이터베이스전문가
select concat('데이터베이스 ', '전문가') from dual;
select concat('데이터베이스', ' 전문가') from dual;
-- 데이터베이스 전문가

-- substr: substr([문자열],[시작인덱스],[시작인덱스로부터 Offset])
-- 문자열을 기준으로 시작인덱스에서 (오프셋까지 떨어진)끝 인덱스의 문자열 반환
-- 주의사항: 문자열의 시작인덱스 1
select substr('database specialist',5,8) from dual;
select substr('database specialist',1,8) from dual;
select substr('database specialist',10,7) from dual;
-- base 문자를 substr로 식별하세요.
select substr('database specialist', 5, 4) from dual;
-- 문자열 제일 마지막에서 3글자 반환 (옆에 파이썬 슬라이싱과 같은 효과 [-3:])
select substr('database specialist is you', -3) from dual;

-- instr: instr([문자열],[찾고자 하는 문자열]) => 찾고자하는 문자열이 있다면 해당 문자열의 인덱스
select instr('데이터베이스 전문가','전') from dual;
-- 8
select instr('데이터베이스 전문가','정') from dual; => 찾고자하는 문자열이 없으면 0 반환
-- 0

-- rpad/lpad: 주어진 자릿수 만큼 오른쪽(rpad)/왼쪽(lpad)에 지정한 문자열을 채운다.
-- rpad/lpad([문자열],[채울자리수],[채울문자])
select rpad('James',10,'*') from dual;
-- James*****
select rpad('홍길동',10,'*') from dual;
-- 홍길동******* (X)
-- 홍길동****  : 한글인 경우 한글자당 2로 계산 
select lpad('홍길동',10,'*') from dual;
-- ****홍길동

-- Q] 직원테이블에서 이름 10자리중 나머지 오른쪽을 '-'로 채우고
--      급여 10자리중 나머지 왼쪽은 '*'로 채워서 출력
select rpad(last_name, 10, '-'), lpad(salary, 10,'*')
from employees;

-- ltrim/rtrim/trim: 문자열을 기준으로 제거할 문자를 각각 왼쪽, 오른쪽, 양쪽으로 제거
-- ltrim/rtrim([문자열],[제거할문자열]) 제거할 문자열 기본값은 공백문자
-- trim([문자열]) 양쪽 공백 문자 제거
select ltrim('    데이터베이스    전문가    ') as name from dual;
select ltrim('####데이터베이스####전문가####','#') as name from dual;
-- 데이터베이스####전문가####

select rtrim('    데이터베이스    전문가    ') as name from dual;
select rtrim('####데이터베이스####전문가####','#') as name from dual;

select trim('    데이터베이스    전문가    ') as name from dual;
-- 데이터베이스    전문가
-- trim 함수 매개변수와 미일치, 공백만 제거
select trim('####데이터베이스####전문가####','#') as name from dual; -- 에러발생

-- replace
select replace('JavaSpecailist','Java','BigData') from dual;
-- BigDataSpecailist
select replace('Java Specailist', ' ', '') from dual; -- 공백 제거용으로 replace 사용
select replace('데이터베이스    전문가','    ','') as name from dual;    -- 가운데 특정개수의 공백삭제
select replace('데이터베이스    전문가','   ','') as name from dual;  -- 갯수가 일치하지 않으면 삭제불가
-- 가운데 공백문자를 글자개수와 상관없이 삭제
select replace('데이터베이스    전문가',' ','') as name from dual;
select replace('데이터베이스    전문가','   ','') as name from dual;
-- 데이터베이스전문가

문제 1:
EMPLOYEES 테이블에서 FIRST_NAME을 모두 대문자로 변환하여 출력하는 SQL 문을 작성하세요.
select upper('first_name') from dual;
select upper(first_name) from employees;

문제 2:
EMPLOYEES 테이블에서 LAST_NAME을 모두 소문자로 변환하여 출력하는 SQL 문을 작성하세요.
select lower(first_name) from employees;
문제 3:
EMPLOYEES 테이블에서 FIRST_NAME의 길이를 출력하는 SQL 문을 작성하세요.
select length(first_name) from employees;
문제 4:
EMPLOYEES 테이블에서 FIRST_NAME의 첫 번째 문자를 출력하는 SQL 문을 작성하세요.
select substr(first_name,1,1) from employees;
문제 5:
EMPLOYEES 테이블에서 FIRST_NAME의 마지막 두 문자를 출력하는 SQL 문을 작성하세요.
select substr(first_name,-2) from employees;
문제 6:
EMPLOYEES 테이블에서 FIRST_NAME과 LAST_NAME을 합쳐서 FullName이라는 컬럼으로 조회하려고 합니다. 공백으로 구분된 전체 이름을 출력하는 SQL 문을 작성하세요.
select first_name||' ' ||last_name as FullName from employees;
문제 7:
dual 테이블에서  '@' 기호 이전의 사용자 이름 부분을 출력하는 SQL 문을 작성하세요.
테스트 케이스
'haeun@alpha.com'
'hklee0724@gmail.com' (그리고 여러분의 이메일 계정).
select substr('haeun@alpha.com',) from dual;
문제 8:
EMPLOYEES 테이블에서 이름을 이름그대로, 소문자로, 첫글자만 대문자로, 모두대문자로 출력해보세요.
select first_name, lower(first_name), initcap(first_name), upper(first_name) from employees;
문제 9:
EMPLOYEES 테이블에서 JOB_ID 컬럼에 저장된 직무 타이틀에서 네 번째부터 열 번째 글자까지를 추출하여 출력하는 SQL 문을 작성하세요.
select job_id, substr(job_id, 4,10) as Substring
from employees;

--문제 1:
--EMPLOYEES 테이블에서 FIRST_NAME을 모두 대문자로 변환하여 출력하는 SQL 문을 작성하세요.
SELECT UPPER(FIRST_NAME)
FROM EMPLOYEES;

--문제 2:
--EMPLOYEES 테이블에서 LAST_NAME을 모두 소문자로 변환하여 출력하는 SQL 문을 작성하세요.
SELECT LOWER(LAST_NAME)
FROM EMPLOYEES;

--문제 3:
--EMPLOYEES 테이블에서 FIRST_NAME의 길이를 출력하는 SQL 문을 작성하세요.
SELECT LENGTH(FIRST_NAME)
FROM EMPLOYEES;

--문제 4:
--EMPLOYEES 테이블에서 FIRST_NAME의 첫 번째 문자를 출력하는 SQL 문을 작성하세요.
SELECT SUBSTR(FIRST_NAME, 1, 1)
FROM EMPLOYEES;

--문제 5:
--EMPLOYEES 테이블에서 FIRST_NAME의 마지막 두 문자를 출력하는 SQL 문을 작성하세요.
SELECT SUBSTR(FIRST_NAME, -2)
FROM EMPLOYEES;

--문제 6:
--EMPLOYEES 테이블에서 FIRST_NAME과 LAST_NAME을 합쳐서 FullName이라는 컬럼으로 조회하려고 합니다. 공백으로 구분된 전체 이름을 출력하는 SQL 문을 작성하세요.
SELECT FIRST_NAME || ' ' || LAST_NAME AS FullName
FROM EMPLOYEES;

--문제 7:
--EMPLOYEES 테이블에서 EMAIL 컬럼에 저장된 이메일 주소에서 '@' 기호 이전의 사용자 이름 부분을 출력하는 SQL 문을 작성하세요.
-- select email from employees;
-- SELECT SUBSTR(EMAIL, 1, INSTR(EMAIL, '@') - 1) AS UserName
-- FROM EMPLOYEES;

SELECT SUBSTR('haeun@joeun.com', 1, INSTR('haeun@joeun.com', '@') - 1) AS UserName
FROM dual;
SELECT SUBSTR('hklee0724@gmail.com', 1, INSTR('haeun@joeun.com', '@') - 1) AS UserName
FROM dual;

--문제 8:
--EMPLOYEES 테이블에서 이름을 이름그대로, 소문자로, 첫글자만 대문자로, 모두대문자로 출력해보세요.
select last_name, lower(last_name),initcap(last_name),upper(last_name)
from employees;

--문제 9:
--EMPLOYEES 테이블에서 JOB_ID 컬럼에 저장된 직무 타이틀에서 네 번째부터 열 번째 글자까지를 추출하여 출력하는 SQL 문을 작성하세요.
SELECT JOB_ID, SUBSTR(JOB_ID, 4, 10) AS Substring
FROM EMPLOYEES;