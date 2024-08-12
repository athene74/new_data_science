select table_name from user_tables;

-- 전체 레코드 조회
-- select * => 전체 컬럼명
-- *을 사용할 때에는 신중해야 한다. 테이블내에 컬럼수, 레코드수를 고려해야한다.

select * from student_scores;

--describe [테이블명]: 테이블 스키마 조회
describe student_scores;


-- 특정 열 필터링
-- select [컬럼명1], .. ,[컬럼명N] from [테이블명]
-- => select [열필터링] from [테이블명]

select student_name from student_scores;

-- 주민번호, 학생명 검색
select resistration_number,student_name from student_scores;
-- 학생명, 국,영,수 점수 검색
select student_name,korean_score,english_score,math_score from student_scores;

-- 조회열 순서 변경
-- 학생명, 영어, 수학, 국어 점수로 검색
select student_name,english_score,math_score,korean_score from student_scores;

--학생명, 수학점수, 주민번호로 검색

select student_name,math_score,resistration_number from student_scores;

-- 특정 행 필터링
-- where 단일 조건
-- where [행필터링조건]; (다중조건은 and, or로 표시)
select * from student_scores;
select * from student_scores where student_name = '강감찬';
-- 이름이 홍길동인 모든 데이터
select * from student_scores where student_name = '홍길동';
-- 수학점수가 80점 이상인 모든 데이터
select * from student_scores where math_score >=80;
-- 수학점수가 100점 미만인 모든 데이터
select * from student_scores where math_score <100;
-- 이름이 홍길동이고 영어 점수가 100점인 데이터
select * from student_scores where student_name='홍길동' and eng_score =100;

-- 행과 열 필터링: 행과 열필터링 조건을 모두 명시
-- 국어 점수와 영어 점수가 모두 90이 넘는 학생의 주민등록번호
select resistration_number from student_scores where kor_score >90 and eng_score >90;

-- 정렬
-- select from 다음에 order by [정렬할 필드명] [정렬방식(asc/desc)]
-- order by의 기본 정렬 방식: 오름차순
-- 학생 이름으로 오름차순 정렬하기
select * from student_scores order by student_name asc;
select * from student_scores order by student_name;
-- 학생 이름으로 내림차순 정렬하기
select * from student_scores order by student_name desc;
-- 영어 성적순로 내림차순 정렬하기
select * from student_scores order by eng_score desc;
-- 수학 성적순로 내림차순 정렬하기
select * from student_scores order by math_score desc;
select * from student_scores;
-- 다중 정렬(정렬 순서는 왼쪽에서 오른쪽 방향으로)
-- 국어점수는 오름차순, 영어점수는 내림차순으로 정렬
select * from student_scores order by kor_score asc, eng_score desc;

-- 스키마 변경없이 selest 쿼리로 새로운 열 만들기
-- ver1: 기존 열과의 조합
-- 국영수 총점 결과를 조회하세요.
select kor_score+eng_score+math_score from student_scores;
describe student_scores;
-- ver2: 기존열의 결과에 추가
-- 아래 문법은 허용하지 않는다.
-- select *, (kor_score + eng_score + math_score) from student_scores;
-- 아래와 같이 기존열을 모두 명시해야 한다.
select id, student_name, resistration_number, kor_score, eng_score, math_score,
(kor_score+eng_score+math_score) from student_scores;
-- ver3: 컬럼명 별칭으로 변경하기
select id, student_name, resistration_number,
        kor_score, eng_score, math_score,
        (kor_score+eng_score+math_score) as total_score
        from student_scores;
-- kor_score, eng_score 열이름을 각각 korean_score, english_score로 바꾸세요.
select id, student_name, resistration_number,
        kor_score as korean_score, eng_score as english_score, math_score,
        (kor_score+eng_score+math_score) as total_score
        from student_scores;

-- 각 구문에 정의한 별칭은 다음 실행 순서의 구문에 적용된다.
-- select from where order by => from, where, select, order by 순으로 진행


-- 위 결과에 average_score 라는 열을 연산을 통해 추가
select id, student_name, resistration_number,
        kor_score, eng_score, math_score,
        (kor_score + eng_score + math_score) as total_score,
        (kor_score + eng_score + math_score)/3 as average_score
        from student_scores;
describe student_scores;        


select * from USER_SEQUENCES
where SEQUENCE_NAME='STUDENT_SCORES_SEQ';

-- 시퀀스 삭제
drop sequence student_scores_seq;

-- 시퀀스 생성
create sequence student_scores_seq
    start with 1        -- 시작을 1부터
    increment by 1      -- 1씩 증가
    nomaxvalue          -- 최대값 제한 없음
    nocycle;            -- 사이클 없음

drop table student_scores;
CREATE TABLE Student_Scores(
    ID number,                  -- number: 숫자 처리 타입
    student_name varchar2(50),  -- varchar2(문자열 길이): 문자 처리 타입
    KOR_SCORE number,
    eng_score number,
    math_score number,
    enroll_date date,
    primary key (id)            
);

-- 샘플데이터를 입력
-- 1번 학생 데이터
INSERT INTO Student_Scores (id, student_name, kor_score, eng_score, math_score, enroll_date)
-- TO_DATE([날짜문자열],[날짜포멧]): 날짜 문자열을 오라클의 DATE 으로 변환
VALUES (student_scores_seq.NEXTVAL, '홍길동', 90, 80, 95, TO_DATE('28/05/2023', 'DD/MM/YYYY'));

-- 2번 학생 데이터
INSERT INTO Student_Scores (id, student_name, kor_score, eng_score, math_score, enroll_date)
VALUES (student_scores_seq.NEXTVAL, '김철수', 85, 90, 92, TO_DATE('29/05/2024', 'DD/MM/YYYY'));

-- 3번 학생 데이터
INSERT INTO Student_Scores (id, student_name, kor_score, eng_score, math_score, enroll_date)
VALUES (student_scores_seq.NEXTVAL, '이영희', 78, 92, 88, TO_DATE('30/05/2023', 'DD/MM/YYYY'));

-- 4번 학생 데이터
INSERT INTO Student_Scores (id, student_name, kor_score, eng_score, math_score, enroll_date)
VALUES (student_scores_seq.NEXTVAL, '김갑환', 79, 85, 89, TO_DATE('23/07/2024', 'DD/MM/YYYY'));

-- 5번 학생 데이터
INSERT INTO Student_Scores (id, student_name, kor_score, eng_score, math_score, enroll_date)
VALUES (student_scores_seq.NEXTVAL, '박길치', 69, 75, 85, TO_DATE('24/03/2024', 'DD/MM/YYYY'));

-- 6번 학생 데이터
INSERT INTO Student_Scores (id, student_name, kor_score, eng_score, math_score, enroll_date)
VALUES (student_scores_seq.NEXTVAL, '김환길', 88, 79, 96, TO_DATE('23/12/2023', 'DD/MM/YYYY'));

-- 7번 학생 데이터
INSERT INTO Student_Scores (id, student_name, kor_score, eng_score, math_score, enroll_date)
VALUES (student_scores_seq.NEXTVAL, '풍신수길', 88, 79, 96, TO_DATE('21/4/2024', 'DD/MM/YYYY'));

select * from student_scores;

select * from student_scores;       

-- wild card % 사용: like
-- 김씨 성을 가진 사람
select * from student_scores where student_name like '김%';  -- 김으로 시작해서 아무 글자와 매칭되는 이름

-- 이름에 '길' 자가 들어가는 사람
select * from student_scores where student_name like '%길%';  -- 매치가 0개 이상 될 때

-- 이름 세 글자 중 가운데에 '길' 자가 들어가는 사람
select * from student_scores where student_name like '_길_'; -- '_'는 아무글자 1개와 매칭

-- 이름 세글자 중 마지막 글자가 '길'인 사람
select * from student_scores where student_name like '__길';
-- 이름의 마지막 글자가 '길'인 사람
select * from student_scores where student_name like '%길';
-- 이름이 네글자인 사람
select * from student_scores where student_name like '____';
-- 성이 김씨이고 '수'로 끝나는 사람
select * from student_scores where student_name like '김_수'; -- 이름이 3글자인 경우에만 매칭
select * from student_scores where student_name like '김%수'; -- 이름이 두글자 또는 세글자 이상인 모든 경우에도 매칭

------------------- 여기까지 ANSI 표준문법-----------------------
-------------------------------------------------------------

------------------------오라클 함수----------------------------
--------수치관련 집계 함수: 특정열에 모든 값에 대한 수치함수를 적용한다.
-- max(): 전체 테이블에 있는 모든 레코드 중에서 최고의 값을 반환 
-- 각 과목 최고 점수 조회
select max(kor_score) from student_scores;
select max(eng_score) from student_scores;
select max(math_score) from student_scores;
-- 가입일이 가장 최신인 것은?
select max(enroll_date) from student_scores;

-- min(): 전체 테이블에 있는 모든 레코드 중에서 최저의 값을 반환
select min(kor_score) from student_scores;
select min(eng_score) from student_scores;
select min(math_score) from student_scores;

-- 가입일이 가장 오래된 것은?
select min(enroll_date) from student_scores;

-- 집계함수에 where 조건 적용
-- 국어 점수가 80점 이상인 학생의 영어평균 점수
select avg(eng_score) from student_scores
where kor_score >= 80;

-- 국어 점수가 80점 미만인 학생의 영어평균 점수
select avg(eng_score) from student_scores
where kor_score < 80;   -- 국어는 못하지만 영어를 잘하는 학생의 특이한 데이터가 존재

-- count(): 전체 개수를 집계하는 함수
-- 전체 학생수 조회
select count(*) from student_scores;
select count(*) as total_number from student_scores;

-- 수학점수가 90점 인상인 학생 수 조회
select count(*) from student_scores
where math_score>=90;

describe student_scores;
-- 평균점수가 90점 인상인 학생 수 조회
select count(*) as above_85_avg 
from student_scores 
where (kor_score + eng_score + math_score)/3 > 85;
select count(*) as above_90_avg
from student_scores
where (kor_score+eng_score+math_score)/3>90;
-- 국어점수가 85점넘고 수학점수가 90점 넘는 학생수 조회
select count(*) as total_student
from student_scores
where kor_score>85 and math_score>90;

describe student_scores;

-- 김씨 또는 박씨 성을 가진 학생 정보를 가입일 순으로 오름차순 조회
select * 
from student_scores 
where (student_name like '김%' or student_name like '박%') 
order by enroll_date asc;

select * from student_scores;

-- 김씨 또는 박씨 성이고 총합이 260 이상인 학생 정보를 가입일 순으로 내림차순 조회
select student_name, kor_score, eng_score, math_score, 
    (kor_score + eng_score + math_score) as total_score, enroll_date
from student_scores 
where (student_name like '김%' or student_name like '박%') and (kor_score + eng_score + math_score)>=260
order by enroll_date desc;


-- 김씨 또는 이씨 성이고 평균이 85 이상인 학생 정보를 가입일 순으로 내림차순 조회
-- 평균값을 나타내지 않았다.
select * 
from student_scores 
where (student_name like '김%' or student_name like '이%')
and (kor_score + eng_score + math_score)/3 >=85
order by enroll_date desc;

-- 문제에 평균값이 있으므로 평균값 열을 추가하도록 하자.
select student_name, kor_score, eng_score, math_score,
    round((kor_score + eng_score + math_score)/3,2) as avg_score, enroll_date
from student_scores 
where (student_name like '김%' or student_name like '이%')and (kor_score + eng_score + math_score)/3 >= 85
order by enroll_date desc;

-- 가입일이 2023년 5월 10일 이후 가입한 학생 정보 출력
select * 
from student_scores 
where enroll_date >= to_date('2023-05-10','YY-MM-DD')
order by enroll_date asc;

select *
from student_scores
where enroll_date >= ('23-05-10')
order by enroll_date asc;

-- 가입일이 2024년 이전에 가입한 학생 정보를 오래된 순으로 출력
select *
from student_scores
where enroll_date<('24-01-01')
order by enroll_date asc;

-- 김씨 또는 박씨 성을 가진 학생 정보를 가입일 순으로 오름 차순 조회
-- 김씨 또는 박씨 성이고 총합이 260 이상인 학생 정보를 가입일 순으로 내림차순 조회
-- 김씨 또는 이씨 성이고 평균이 85 이상인 학생 정보를 가입일 순으로 내림차순 조회
-- 가입일이 2023년 5월 10일 이후 가입한 학생 정보 최신순으로 출력
-- 가입일이 2024년 이전에 가입한 학생 정보를 오래된 순으로 출력

-- 김씨 또는 박씨 성을 가진 학생 정보를 가입일 순으로 오름 차순 조회
select * from student_scores
where student_name like '김%' or student_name like '박%'
order by enroll_date;
-- 김씨 또는 박씨 성이고 총합이 260 이상인 학생 정보를 가입일 순으로 내림차순 조회
select student_name, kor_score, eng_score, math_score, 
    (kor_score + eng_score + math_score) as total_score, enroll_date
from student_scores
-- 오라클에서 and 연산의 우선순위가 or 보다 높다. 
where (student_name like '김%' or student_name like '박%') and (kor_score + eng_score + math_score) >= 260 
order by enroll_date desc;

-- 김씨 또는 이씨 성이고 평균이 85 이상인 학생 정보를 가입일 순으로 내림차순 조회
select student_name, kor_score, eng_score, math_score, 
    (kor_score + eng_score + math_score)/3 as avg_score, enroll_date
from student_scores;

-- round 반올림 함수: (숫자, 반올림 자리수)
select student_name, kor_score, eng_score, math_score, 
    round((kor_score + eng_score + math_score)/3 , 2) as avg_score, enroll_date
from student_scores
-- select에서 사용한 별칭은 where에서 사용할 수 없음
-- 오라클에서 and 연산의 우선순위가 or 보다 높다. 
--where student_name like '김%' or student_name like '이%' and (kor_score + eng_score + math_score)/3 >= 90 
where (student_name like '김%' or student_name like '이%') and (kor_score + eng_score + math_score)/3 >= 85
order by enroll_date desc;

-- 가입일이 2023년 5월 10일 이후 가입한 학생 정보 최신순으로 출력
select * from student_scores;
select * from student_scores
where enroll_date >= to_date('2023-05-10','YYYY-MM-DD')
order by enroll_date desc;
-- 가입일이 2024년 이전에 가입한 학생 정보를 오래된 순으로 출력
select * from student_scores;
select * from student_scores
where enroll_date <= to_date('2024-01-01','YYYY-MM-DD')
order by enroll_date asc;