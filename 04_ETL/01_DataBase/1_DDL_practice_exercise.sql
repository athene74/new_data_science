create table student_scores1(
    student_name varchar(50),
    korean_score number,
    english_score number,
    math_score number
);

select table_name from user_tables;
describe student_scores1;
drop table student_scores1;

insert into student_scores1(student_name, korean_score, english_score, math_score)
values ('ȫ�浿',95, 60, 85);
select * from student_scores1;
insert into student_scores1(student_name, korean_score, english_score, math_score)
values ('��ö��', 90, 100, 95);
insert into student_scores1(student_name, korean_score, english_score, math_score)
values ('ȫ�浿', 95, 100, 95);


create table student_scores2(
    resistration_number varchar2(50),
    student_name varchar(50),
    korean_score number,
    english_score number,
    math_score number
);

insert into student_scores2(resistration_number, student_name, korean_score, english_score, math_score)
values ('010120-3011212', 'ȫ�浿', 95, 60, 85);
insert into student_scores2(resistration_number, student_name, korean_score, english_score, math_score)
values ('980120-1017282', 'ȫ�浿', 95, 100, 75);
select * from student_scores2;

select * from student_scores2 where resitration_number='010120-3011212';

create table student_scores3(
    id number,
    resistration_number varchar2(50),
    student_name varchar2(50),
    korean_score number,
    english_score number,
    math_score number
);
insert into student_scores3(id, resistration_number, student_name, korean_score, english_score, math_score)
values (1, '010120-3011212', 'ȫ�浿', 95, 60, 85);
insert into student_scores3(id, resistration_number, student_name, korean_score, english_score, math_score)
values (2, '980120-1017282', 'ȫ�浿', 95, 100, 75);
select * from student_scores3;
insert into student_scores3 (id, resistration_number, student_name, korean_score, english_score, math_score)
values(2, '780120-1014176', '������', 99, 98, 100);
select * from student_scores3;

create table student_scores4(
    id number,
    resistration_number varchar2(50),
    student_name varchar2(50),
    korean_score number,
    english_score number,
    math_score number,
    primary key(id)
);
select table_name from user_tables;
insert into student_scores4 (id, resistration_number, student_name, korean_score, english_score, math_score)
values (1, '010120-3011212', 'ȫ�浿', 95, 60, 85);
insert into student_scores4 (id, resistration_number, student_name, korean_score, english_score, math_score)
values (2, '010120-3011212', 'ȫ�浿', 95, 100, 75);
insert into student_scores4 (id, resistration_number, student_name, korean_score, english_score, math_score)
values (2, '010120-3011212', '������', 99, 98, 100);
select * from student_scores4;

drop table student_scores1;
drop table student_scores2;
drop table student_scores3;
drop table student_scores4;
select table_name from user_tables;

create table student_scores(
    id number,
    resistration_number varchar2(50),
    student_name varchar2(50),
    korean_score number,
    english_score number,
    math_score number,
    primary key(id)
);
drop table student_scores;

select * from student_scores;  
create sequence student_scores_seq
    start with 1
    increment by 1
    nomaxvalue
    nocycle;
-- ������ ��ȸ    
select * from USER_SEQUENCES
where SEQUENCE_NAME = 'STUDENT_SCORES_SEQ';

-- ������ ����
drop sequence student_scores_seq;

insert into student_scores (id, resistration_number, student_name, korean_score, english_score, math_score)
values (student_scores_seq.nextval, '010120-3011212','ȫ�浿', 95, 60, 85);
insert into student_scores (id, resistration_number, student_name, korean_score, english_score, math_score)
values (student_scores_seq.nextval, '010120-3011212','ȫ�浿', 95, 60, 85);

insert into student_scores (id, resistration_number, student_name, korean_score, english_score, math_score)
values (student_scores_seq.nextval, '780120-1017282', '������', 99, 98, 100);
-- null ���� ���� ���� ���� ����
insert into student_scores (resistration_number, student_name, korean_score, english_score, math_score)
values ('780120-1017282', '������', 99, 98, 100);

/* Oracle 12c ���� ������ ����ȭ ���
create table student_scores(
    id number generated always as identity,
    student_name varchar2(50),
    korean_score number,
    english_score number,
    math_scor number,
    primary key(id),
);
*/
-- primary key ���� ���� �������� ����
insert into student_scores (student_name, korean_score, english_score, math_score)
values ( 'ȫ�浿', 90,80,95);

describe student_scores;

alter table student_scores
rename column korean_score to kor_score;

alter table student_scores
rename column english_score to eng_score;

/* ���� �������� �Ʒ��� ���� ����ȭ�� ����
alter table student_scores
rename column korean_score to kor_score,
rename dolumn english_score to eng_score;
*/

-- ���̺� �� �߰�
alter table student_scores
add (sci_score number);
select * from student_scores;
-- ���� �������� ������ ���̺�� ��ȸ
select table_name from user_tables;

create table person(
    name varchar2(50) not null,
    age number
);
select * from person;

insert into person (name, age) values ('ȫ�浿', 40);
in
