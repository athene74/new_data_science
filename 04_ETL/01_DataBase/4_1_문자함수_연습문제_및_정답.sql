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
--dual 테이블에서  '@' 기호 이전의 사용자 이름 부분을 출력하는 SQL 문을 작성하세요.
--테스트 케이스
--'haeun@alpha.com'
--'hklee0724@gmail.com' (그리고 여러분의 이메일 계정)
--EMPLOYEES 테이블에서 EMAIL 컬럼에 저장된 이메일 주소에서 '@' 기호 이전의 사용자 이름 부분을 출력하는 SQL 문을 작성하세요.
-- select email from employees;
-- SELECT SUBSTR(EMAIL, 1, INSTR(EMAIL, '@') - 1) AS UserName
-- FROM EMPLOYEES;
-- step1]
select INSTR('haeun@joeun.com', '@') from dual;
select instr('athene74@naver.com','@') from dual;
select substr('haeun@joeun.com', 1, INSTR('haeun@joeun.com', '@')-1) as username from dual;
select substr('athene74@naver.com', 1, INSTR('athene74@naver.com','@')-1) as username from dual;
-- 중첩함수인경우 안쪽의 함수가 먼저 수행한다.
-- 예) A( B() ) => 수행 순서 B->A : B함수의 리턴값이 A함수의 실행인자로 활용이 되는 구조
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