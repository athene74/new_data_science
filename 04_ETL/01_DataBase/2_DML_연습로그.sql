select table_name from user_tables;

select * from student_scores;

describe student_scores;

select student_name from student_scores;

select resistration_number from student_scores;

select resistration_number, student_name from student_scores;

select student_name, kor_score, eng_score, math_score from student_scores;

select student_name, eng_score, math_score, kor_score from student_scores;

select student_name, math_score, resistration_number from student_scores;

select * from student_scores;
select * from student_scores where student_name = '강감찬';
select * from student_scores where student_name = '홍길동';
select * from student_scores where math_score >=80;
select * from student_scores where student_name='홍길동' and eng_score = 100;

select resistration_number from student_scores where kor_score >90 and eng_score >90;

select * from student_scores order by student_name desc;
select * from student_scores order by kor_score asc, eng_score desc;

select *,(kor_score + eng_score + math_score) from student_scores;
select * from student_scores;
-- 새로운 열을 추가할 때는 아래와 같이 기존열을 모두 명시해야 한다.
select id, student_name, kor_score, eng_score, math_score,
(kor_score + eng_score + math_score) from student_scores;

create table student_scores1(
    id number,
    student_name varchar2(50),
    kor_score number,
    eng_score number,
    math_score number,
    enroll_data date,
    primary key(id)
);
select table_name from user_tables;
select * from student_scores;

-- 김씨 또는 박씨 성을 가진 학생 정보를 가입일 순으로 오름차순 조회
select *
from student_scores
where student_name like '김%' or student_name like '박%'
order by enroll_date asc;
--김씨 또는 박씨 성이고 총합이 260 이상인 학생 정보를 가입일 순으로 내림차순 조회
select student_name, kor_score, eng_score, math_score, (kor_score + eng_score + math_score) as total_score, enroll_date
from student_scores
where (student_name like '김%' or student_name like '박%') and (kor_score + eng_score + math_score)>=260
order by enroll_date desc;
--김씨 또는 이씨 성이고 평균이 85 이상인 학생 정보를 가입일 순으로 내림차순 조회
select student_name, kor_score, eng_score, math_score, 
    round((kor_score + eng_score + math_score)/3,2) as avg_score, enroll_date
from student_scores
where (student_name like '김%' or student_name like '이%') and (kor_score + eng_score + math_score)/3 >= 85
order by enroll_date desc;
-- 가입일이 2023년 5월 10일 이후 가입한 학생 정보 최신순으로 출력
select *
from student_scores
where enroll_date>= to_date('2023-05-10','yyyy-mm-dd')
order by enroll_date desc;
-- 가입일이 2024년 이전에 가입한 학생 정보를 오래된 순으로 출력
select *
from student_scores
where enroll_date < to_date('2024-01-01','yyyy-mm-dd')
order by enroll_date asc;





