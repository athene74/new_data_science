select table_name from user_tables;

-- ��ü ���ڵ� ��ȸ
-- select * => ��ü �÷���
-- *�� ����� ������ �����ؾ� �Ѵ�. ���̺��� �÷���, ���ڵ���� ����ؾ��Ѵ�.

select * from student_scores;

--describe [���̺��]: ���̺� ��Ű�� ��ȸ
describe student_scores;


-- Ư�� �� ���͸�
-- select [�÷���1], .. ,[�÷���N] from [���̺��]
-- => select [�����͸�] from [���̺��]

select student_name from student_scores;

-- �ֹι�ȣ, �л��� �˻�
select resistration_number,student_name from student_scores;
-- �л���, ��,��,�� ���� �˻�
select student_name,korean_score,english_score,math_score from student_scores;

-- ��ȸ�� ���� ����
-- �л���, ����, ����, ���� ������ �˻�
select student_name,english_score,math_score,korean_score from student_scores;

--�л���, ��������, �ֹι�ȣ�� �˻�

select student_name,math_score,resistration_number from student_scores;

-- Ư�� �� ���͸�
-- where ���� ����
-- where [�����͸�����]; (���������� and, or�� ǥ��)
select * from student_scores;
select * from student_scores where student_name = '������';
-- �̸��� ȫ�浿�� ��� ������
select * from student_scores where student_name = 'ȫ�浿';
-- ���������� 80�� �̻��� ��� ������
select * from student_scores where math_score >=80;
-- ���������� 100�� �̸��� ��� ������
select * from student_scores where math_score <100;
-- �̸��� ȫ�浿�̰� ���� ������ 100���� ������
select * from student_scores where student_name='ȫ�浿' and eng_score =100;

-- ��� �� ���͸�: ��� �����͸� ������ ��� ���
-- ���� ������ ���� ������ ��� 90�� �Ѵ� �л��� �ֹε�Ϲ�ȣ
select resistration_number from student_scores where kor_score >90 and eng_score >90;

-- ����
-- select from ������ order by [������ �ʵ��] [���Ĺ��(asc/desc)]
-- order by�� �⺻ ���� ���: ��������
-- �л� �̸����� �������� �����ϱ�
select * from student_scores order by student_name asc;
select * from student_scores order by student_name;
-- �л� �̸����� �������� �����ϱ�
select * from student_scores order by student_name desc;
-- ���� �������� �������� �����ϱ�
select * from student_scores order by eng_score desc;
-- ���� �������� �������� �����ϱ�
select * from student_scores order by math_score desc;
select * from student_scores;
-- ���� ����(���� ������ ���ʿ��� ������ ��������)
-- ���������� ��������, ���������� ������������ ����
select * from student_scores order by kor_score asc, eng_score desc;

-- ��Ű�� ������� selest ������ ���ο� �� �����
-- ver1: ���� ������ ����
-- ������ ���� ����� ��ȸ�ϼ���.
select kor_score+eng_score+math_score from student_scores;
describe student_scores;
-- ver2: �������� ����� �߰�
-- �Ʒ� ������ ������� �ʴ´�.
-- select *, (kor_score + eng_score + math_score) from student_scores;
-- �Ʒ��� ���� �������� ��� ����ؾ� �Ѵ�.
select id, student_name, resistration_number, kor_score, eng_score, math_score,
(kor_score+eng_score+math_score) from student_scores;
-- ver3: �÷��� ��Ī���� �����ϱ�
select id, student_name, resistration_number,
        kor_score, eng_score, math_score,
        (kor_score+eng_score+math_score) as total_score
        from student_scores;
-- kor_score, eng_score ���̸��� ���� korean_score, english_score�� �ٲټ���.
select id, student_name, resistration_number,
        kor_score as korean_score, eng_score as english_score, math_score,
        (kor_score+eng_score+math_score) as total_score
        from student_scores;

-- �� ������ ������ ��Ī�� ���� ���� ������ ������ ����ȴ�.
-- select from where order by => from, where, select, order by ������ ����


-- �� ����� average_score ��� ���� ������ ���� �߰�
select id, student_name, resistration_number,
        kor_score, eng_score, math_score,
        (kor_score + eng_score + math_score) as total_score,
        (kor_score + eng_score + math_score)/3 as average_score
        from student_scores;
describe student_scores;        


select * from USER_SEQUENCES
where SEQUENCE_NAME='STUDENT_SCORES_SEQ';

-- ������ ����
drop sequence student_scores_seq;

-- ������ ����
create sequence student_scores_seq
    start with 1        -- ������ 1����
    increment by 1      -- 1�� ����
    nomaxvalue          -- �ִ밪 ���� ����
    nocycle;            -- ����Ŭ ����

drop table student_scores;
CREATE TABLE Student_Scores(
    ID number,                  -- number: ���� ó�� Ÿ��
    student_name varchar2(50),  -- varchar2(���ڿ� ����): ���� ó�� Ÿ��
    KOR_SCORE number,
    eng_score number,
    math_score number,
    enroll_date date,
    primary key (id)            
);

-- ���õ����͸� �Է�
-- 1�� �л� ������
INSERT INTO Student_Scores (id, student_name, kor_score, eng_score, math_score, enroll_date)
-- TO_DATE([��¥���ڿ�],[��¥����]): ��¥ ���ڿ��� ����Ŭ�� DATE ���� ��ȯ
VALUES (student_scores_seq.NEXTVAL, 'ȫ�浿', 90, 80, 95, TO_DATE('28/05/2023', 'DD/MM/YYYY'));

-- 2�� �л� ������
INSERT INTO Student_Scores (id, student_name, kor_score, eng_score, math_score, enroll_date)
VALUES (student_scores_seq.NEXTVAL, '��ö��', 85, 90, 92, TO_DATE('29/05/2024', 'DD/MM/YYYY'));

-- 3�� �л� ������
INSERT INTO Student_Scores (id, student_name, kor_score, eng_score, math_score, enroll_date)
VALUES (student_scores_seq.NEXTVAL, '�̿���', 78, 92, 88, TO_DATE('30/05/2023', 'DD/MM/YYYY'));

-- 4�� �л� ������
INSERT INTO Student_Scores (id, student_name, kor_score, eng_score, math_score, enroll_date)
VALUES (student_scores_seq.NEXTVAL, '�谩ȯ', 79, 85, 89, TO_DATE('23/07/2024', 'DD/MM/YYYY'));

-- 5�� �л� ������
INSERT INTO Student_Scores (id, student_name, kor_score, eng_score, math_score, enroll_date)
VALUES (student_scores_seq.NEXTVAL, '�ڱ�ġ', 69, 75, 85, TO_DATE('24/03/2024', 'DD/MM/YYYY'));

-- 6�� �л� ������
INSERT INTO Student_Scores (id, student_name, kor_score, eng_score, math_score, enroll_date)
VALUES (student_scores_seq.NEXTVAL, '��ȯ��', 88, 79, 96, TO_DATE('23/12/2023', 'DD/MM/YYYY'));

-- 7�� �л� ������
INSERT INTO Student_Scores (id, student_name, kor_score, eng_score, math_score, enroll_date)
VALUES (student_scores_seq.NEXTVAL, 'ǳ�ż���', 88, 79, 96, TO_DATE('21/4/2024', 'DD/MM/YYYY'));

select * from student_scores;

select * from student_scores;       

-- wild card % ���: like
-- �达 ���� ���� ���
select * from student_scores where student_name like '��%';  -- ������ �����ؼ� �ƹ� ���ڿ� ��Ī�Ǵ� �̸�

-- �̸��� '��' �ڰ� ���� ���
select * from student_scores where student_name like '%��%';  -- ��ġ�� 0�� �̻� �� ��

-- �̸� �� ���� �� ����� '��' �ڰ� ���� ���
select * from student_scores where student_name like '_��_'; -- '_'�� �ƹ����� 1���� ��Ī

-- �̸� ������ �� ������ ���ڰ� '��'�� ���
select * from student_scores where student_name like '__��';
-- �̸��� ������ ���ڰ� '��'�� ���
select * from student_scores where student_name like '%��';
-- �̸��� �ױ����� ���
select * from student_scores where student_name like '____';
-- ���� �达�̰� '��'�� ������ ���
select * from student_scores where student_name like '��_��'; -- �̸��� 3������ ��쿡�� ��Ī
select * from student_scores where student_name like '��%��'; -- �̸��� �α��� �Ǵ� ������ �̻��� ��� ��쿡�� ��Ī

------------------- ������� ANSI ǥ�ع���-----------------------
-------------------------------------------------------------

------------------------����Ŭ �Լ�----------------------------
--------��ġ���� ���� �Լ�: Ư������ ��� ���� ���� ��ġ�Լ��� �����Ѵ�.
-- max(): ��ü ���̺� �ִ� ��� ���ڵ� �߿��� �ְ��� ���� ��ȯ 
-- �� ���� �ְ� ���� ��ȸ
select max(kor_score) from student_scores;
select max(eng_score) from student_scores;
select max(math_score) from student_scores;
-- �������� ���� �ֽ��� ����?
select max(enroll_date) from student_scores;

-- min(): ��ü ���̺� �ִ� ��� ���ڵ� �߿��� ������ ���� ��ȯ
select min(kor_score) from student_scores;
select min(eng_score) from student_scores;
select min(math_score) from student_scores;

-- �������� ���� ������ ����?
select min(enroll_date) from student_scores;

-- �����Լ��� where ���� ����
-- ���� ������ 80�� �̻��� �л��� ������� ����
select avg(eng_score) from student_scores
where kor_score >= 80;

-- ���� ������ 80�� �̸��� �л��� ������� ����
select avg(eng_score) from student_scores
where kor_score < 80;   -- ����� �������� ��� ���ϴ� �л��� Ư���� �����Ͱ� ����

-- count(): ��ü ������ �����ϴ� �Լ�
-- ��ü �л��� ��ȸ
select count(*) from student_scores;
select count(*) as total_number from student_scores;

-- ���������� 90�� �λ��� �л� �� ��ȸ
select count(*) from student_scores
where math_score>=90;

describe student_scores;
-- ��������� 90�� �λ��� �л� �� ��ȸ
select count(*) as above_85_avg 
from student_scores 
where (kor_score + eng_score + math_score)/3 > 85;
select count(*) as above_90_avg
from student_scores
where (kor_score+eng_score+math_score)/3>90;
-- ���������� 85���Ѱ� ���������� 90�� �Ѵ� �л��� ��ȸ
select count(*) as total_student
from student_scores
where kor_score>85 and math_score>90;

describe student_scores;

-- �达 �Ǵ� �ھ� ���� ���� �л� ������ ������ ������ �������� ��ȸ
select * 
from student_scores 
where (student_name like '��%' or student_name like '��%') 
order by enroll_date asc;

select * from student_scores;

-- �达 �Ǵ� �ھ� ���̰� ������ 260 �̻��� �л� ������ ������ ������ �������� ��ȸ
select student_name, kor_score, eng_score, math_score, 
    (kor_score + eng_score + math_score) as total_score, enroll_date
from student_scores 
where (student_name like '��%' or student_name like '��%') and (kor_score + eng_score + math_score)>=260
order by enroll_date desc;


-- �达 �Ǵ� �̾� ���̰� ����� 85 �̻��� �л� ������ ������ ������ �������� ��ȸ
-- ��հ��� ��Ÿ���� �ʾҴ�.
select * 
from student_scores 
where (student_name like '��%' or student_name like '��%')
and (kor_score + eng_score + math_score)/3 >=85
order by enroll_date desc;

-- ������ ��հ��� �����Ƿ� ��հ� ���� �߰��ϵ��� ����.
select student_name, kor_score, eng_score, math_score,
    round((kor_score + eng_score + math_score)/3,2) as avg_score, enroll_date
from student_scores 
where (student_name like '��%' or student_name like '��%')and (kor_score + eng_score + math_score)/3 >= 85
order by enroll_date desc;

-- �������� 2023�� 5�� 10�� ���� ������ �л� ���� ���
select * 
from student_scores 
where enroll_date >= to_date('2023-05-10','YY-MM-DD')
order by enroll_date asc;

select *
from student_scores
where enroll_date >= ('23-05-10')
order by enroll_date asc;

-- �������� 2024�� ������ ������ �л� ������ ������ ������ ���
select *
from student_scores
where enroll_date<('24-01-01')
order by enroll_date asc;

-- �达 �Ǵ� �ھ� ���� ���� �л� ������ ������ ������ ���� ���� ��ȸ
-- �达 �Ǵ� �ھ� ���̰� ������ 260 �̻��� �л� ������ ������ ������ �������� ��ȸ
-- �达 �Ǵ� �̾� ���̰� ����� 85 �̻��� �л� ������ ������ ������ �������� ��ȸ
-- �������� 2023�� 5�� 10�� ���� ������ �л� ���� �ֽż����� ���
-- �������� 2024�� ������ ������ �л� ������ ������ ������ ���

-- �达 �Ǵ� �ھ� ���� ���� �л� ������ ������ ������ ���� ���� ��ȸ
select * from student_scores
where student_name like '��%' or student_name like '��%'
order by enroll_date;
-- �达 �Ǵ� �ھ� ���̰� ������ 260 �̻��� �л� ������ ������ ������ �������� ��ȸ
select student_name, kor_score, eng_score, math_score, 
    (kor_score + eng_score + math_score) as total_score, enroll_date
from student_scores
-- ����Ŭ���� and ������ �켱������ or ���� ����. 
where (student_name like '��%' or student_name like '��%') and (kor_score + eng_score + math_score) >= 260 
order by enroll_date desc;

-- �达 �Ǵ� �̾� ���̰� ����� 85 �̻��� �л� ������ ������ ������ �������� ��ȸ
select student_name, kor_score, eng_score, math_score, 
    (kor_score + eng_score + math_score)/3 as avg_score, enroll_date
from student_scores;

-- round �ݿø� �Լ�: (����, �ݿø� �ڸ���)
select student_name, kor_score, eng_score, math_score, 
    round((kor_score + eng_score + math_score)/3 , 2) as avg_score, enroll_date
from student_scores
-- select���� ����� ��Ī�� where���� ����� �� ����
-- ����Ŭ���� and ������ �켱������ or ���� ����. 
--where student_name like '��%' or student_name like '��%' and (kor_score + eng_score + math_score)/3 >= 90 
where (student_name like '��%' or student_name like '��%') and (kor_score + eng_score + math_score)/3 >= 85
order by enroll_date desc;

-- �������� 2023�� 5�� 10�� ���� ������ �л� ���� �ֽż����� ���
select * from student_scores;
select * from student_scores
where enroll_date >= to_date('2023-05-10','YYYY-MM-DD')
order by enroll_date desc;
-- �������� 2024�� ������ ������ �л� ������ ������ ������ ���
select * from student_scores;
select * from student_scores
where enroll_date <= to_date('2024-01-01','YYYY-MM-DD')
order by enroll_date asc;