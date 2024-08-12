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
select * from student_scores where student_name = '������';
select * from student_scores where student_name = 'ȫ�浿';
select * from student_scores where math_score >=80;
select * from student_scores where student_name='ȫ�浿' and eng_score = 100;

select resistration_number from student_scores where kor_score >90 and eng_score >90;

select * from student_scores order by student_name desc;
select * from student_scores order by kor_score asc, eng_score desc;

select *,(kor_score + eng_score + math_score) from student_scores;
select * from student_scores;
-- ���ο� ���� �߰��� ���� �Ʒ��� ���� �������� ��� ����ؾ� �Ѵ�.
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

-- �达 �Ǵ� �ھ� ���� ���� �л� ������ ������ ������ �������� ��ȸ
select *
from student_scores
where student_name like '��%' or student_name like '��%'
order by enroll_date asc;
--�达 �Ǵ� �ھ� ���̰� ������ 260 �̻��� �л� ������ ������ ������ �������� ��ȸ
select student_name, kor_score, eng_score, math_score, (kor_score + eng_score + math_score) as total_score, enroll_date
from student_scores
where (student_name like '��%' or student_name like '��%') and (kor_score + eng_score + math_score)>=260
order by enroll_date desc;
--�达 �Ǵ� �̾� ���̰� ����� 85 �̻��� �л� ������ ������ ������ �������� ��ȸ
select student_name, kor_score, eng_score, math_score, 
    round((kor_score + eng_score + math_score)/3,2) as avg_score, enroll_date
from student_scores
where (student_name like '��%' or student_name like '��%') and (kor_score + eng_score + math_score)/3 >= 85
order by enroll_date desc;
-- �������� 2023�� 5�� 10�� ���� ������ �л� ���� �ֽż����� ���
select *
from student_scores
where enroll_date>= to_date('2023-05-10','yyyy-mm-dd')
order by enroll_date desc;
-- �������� 2024�� ������ ������ �л� ������ ������ ������ ���
select *
from student_scores
where enroll_date < to_date('2024-01-01','yyyy-mm-dd')
order by enroll_date asc;





