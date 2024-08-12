1. 모든 직원의 입사한 날짜에 돌아오는 가장 빠른 금요일이 되는 날짜를 계산하세요.
컬럼명을 '오리엔테이션일'로 하세요
-- 별칭시 as는 생략가능
-- 오는 금요일
SELECT next_day(hire_date, '금요일') 오리엔테이션일 FROM Employees;

2. 직원 ID가 100인 직원의 입사한 날짜에 다음 주의 화요일이 되는 날짜를 계산하세요.
컬럼명을 '매니저면담일'로 하세요
SELECT next_day(hire_date, '화요일') 매니저면담일 FROM Employees WHERE employee_id = 100;

3. 모든 직원의 입사한 날짜를 기준으로 마지막 날짜를 계산하세요.
컬럼명을 '입사환영회식일'로 하세요.
SELECT last_day(hire_date) 입사환영회식일 FROM Employees;

4. 직원 ID가 100인 직원의 입사한 달의 마지막 날짜를 계산하세요.
컬럼명을 '입사환영회식일'로 하세요.
SELECT last_day(hire_date) FROM Employees WHERE employee_id = 100;

5. 직원 ID가 100인 직원의 입사한 날짜에 3개월을 더한 날짜를 계산하세요.
컬럼명을 '정식계약일'로 하세요
SELECT ADD_MONTHS(hire_date, 3) 정식계약일 FROM Employees WHERE employee_id = 100;

6. 모든 직원의 입사한 날짜에 6개월을 더한 날짜를 계산하세요.
컬럼명을 '신규직원인사평가일'로 하세요.
SELECT ADD_MONTHS(hire_date, 6) 신규직원인사평가일 FROM Employees;

7. 직원 ID가 200인 직원의 입사한 날짜에 12개월을 더한 날짜를 계산하세요.
컬럼명을 '연봉현상일'로 하세요.
SELECT ADD_MONTHS(hire_date, 12) 연봉협상일 FROM Employees WHERE employee_id = 200;

8. 모든 직원의 입사한 날짜와 현재 날짜 사이의 개월 수를 계산하세요. 
ceil 함수 사용해서 올림 처리하세요. 
컬럼명을 '근속월수'로 하세요.
SELECT ceil(months_between(SYSDATE, hire_date)) 근속월수 FROM Employees;

9. 직원 ID가 100인 직원의 입사한 날짜와 현재 날짜 사이의 개월 수를 계산하세요.
ceil 함수 사용해서 올림 처리하세요. 
컬럼명을 '근속월수'로 하세요.
SELECT ceil(months_between(SYSDATE, hire_date)) 근속월수 FROM Employees WHERE employee_id = 100;