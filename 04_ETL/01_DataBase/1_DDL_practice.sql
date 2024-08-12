/*
����Ŭ SQL������ ��Ƽ���� �ּ� ����
*/

/*
<SQL Developer �⺻ ȯ�� ����>
 * ��Ʈ ������ ����
 �޴� Tools(����) - Preferences(ȯ�漳��) - Code Editor(�ڵ� ������) - �۲� - �۲�ũ��
 * ���ȣ ���: ���� ������ �� ���� ���콺 ��Ŭ�� - '���ȣ ���' ����
*/

/*
DBMS(Database Mangement System)��?
�����ͺ��̽� ���� �ý����� ���ڷ� �����͸� ȿ�������� ����, �˻�, �����ϴ� ����Ʈ���� ����
������ ���Ͻý��ۿ� �� DBMS ��ǰ�� �ڷᱸ������ ������ ���·� �Ѵ�.

Oracle��?
�� ���迡�� ���� ������ ���� ���� ���Ǵ� ��� DBMS
....
8i: i=> internet : ���ͳ� ȯ�� ����
....
10g: g=> grid: ������ ó���� ���� �л� ȯ���� ���� 
....
12c: c=> cloud: Ŭ���� ȯ���� �����ͺ��̽� ����
.....
18c ~ : ����� Ȯ��

*/

-- SQL���� �� �� �ּ�: SQL ���࿡�� ������ ��ġ�� �ʴ´�.
/*
 SQL���� ������ �ּ�
*/

/*
SQL(Structed Query Language) : �����ͺ��̽� ���� �ý��ۿ��� �����͸� �����ϰ� �����ϱ� ����
ǥ��ȭ�� ���
SQL ���� ����
1. DCL(Data Control Language): �����ͺ��̽� ������� ������ �����ϱ� ���� SQL��
��) grant connect to open_source
2. DDL(Data Definition Language): �����ͺ��̽� ������ �����ϰ� �����ϱ� ���� SQL��
��)CREATE TABLE Student_Scores1(
    student_name varchar2(50),  
    KOREAN_SCORE number,
    english_score number,
    math_score number
);
3. DML(Data Manipulation Langugae): �����͸� �����ϱ� ���� SQL��
- ������ ������ ����: CRUD (Create, Read, Update, Delete)
 => insert, select, update, delete 
4. TCL(Transaction Control Language): �����ͺ��̽� Ʈ������� �����ϱ����� SQL��
 -COMMIT, ROLLBACK...
*/

/*
table: ������ �������� ������ ���� (�Ǵٽ��� DataFrame)
�ʵ� �Ǵ� �÷�: ������ �������� Ư���� ǥ��
create table [���̺��](
 [�ʵ��] [�ʵ�Ÿ��],
 ..
)
*/
-- create table student_scores(id number, student_name varchar2(50) .....); <- SQL ����� ';'
-- SQL���� ��ҹ��ڸ� �������� �ʴ´�. (��ҹ��� Rule�������� ��å�� ����)
-- ���̺��, �÷�(�ʵ�)���� ��� snake ���� ������.
-- ī��(Camel)���: �� �ܾ� �̻����� �۸�� �ܾ�� �ܾ���� ù��° ���ڸ� �빮�ڷ� ǥ��
-- ex) StudentScores : Ŭ������ �Ǵ� ���̺���϶����� ù�ܾ��� ù���ڵ� �빮��
--     studentName: �÷�(�ʵ�)���϶� ù�ܾ��� ù���ڴ� �ҹ���.
-- ������ũ(Snake)���: �� �ܾ� �̻����� �۸�� �ܾ�� ��� �ҹ��ڷ� �ۼ��ϰ� ������ '_'�� ��
-- ex) student_scores, student_name

/*****************************
 �ܰ躰 �л� ���� ���̺� ����
****************************/
-- Version1]�л� ������ �����ϴ� ���̺� ����
-- �л� ����: �л��̸�, ��/��/�� ����

-- ��Ƽ���� SQL�� �����ϴ� ���: ��Ƽ���� ������� ���� ���� �ƹ� ���ο��� Ctrl+Enter
create table student_scores1(
    student_name varchar2(50),
    korean_score number,
    english_score number,
    math_score number
);
-- ���� ������ ������ ���̺�� ��ȸ
select table_name from user_tables;
-- ���̺� ��Ű�� ��ȸ
describe student_scores1;

-- ���̺� ����
drop table student_scores1;

-- ���� �ٸ� SQL ���๮ ���ÿ� ����: ������ ���ӵ� SQL ���� �巡���Ͽ� Ctrl+Enter

-- ���̺��� ���������� �����Ǿ����� Ȯ���ϱ� ���Ͽ� ������ ���� Test
-- insert ������ DML ������ ���̺��� ����� �����Ǿ����� Ȯ���ϴ� �뵵�� �̸� �׽�Ʈ
insert into student_scores1 (student_name, korean_score, english_score, math_score )
values('ȫ�浿', '95', '60', '85');    -- ���ڵ�(�൥����)

select * from student_scores1;

insert into student_scores1 (student_name, korean_score, english_score, math_score )
values('��ö��', '90', '100', '95');    -- �ߺ����� ���� �����ʹ� ���� ���� ó��

insert into student_scores1 (student_name, korean_score, english_score, math_score )
values('ȫ�浿', '95', '100', '95');    -- ���� ȫ�浿�̶�� �л������Ͱ� �ߺ��� �ǰ� ����(�⺻�ɼ����δ� �ߺ��Է� ���)

-- Version2] �ߺ������͸� �����ϱ� ���� �ڿ�Ű ����
-- �ڿ�Ű(Natural Key): �ǻ�Ȱ���� �߻��ϴ� �����͸� �������� �� �ִ� ��
-- �л� ����: �ֹι�ȣ, �л��̸�, ��/��/�� ����
create table student_scores2(
    resistration_number varchar2(50),
    student_name varchar2(50),
    korean_score number,
    english_score number,
    math_score number
);
-- ���� ������ ������ ���̺�� ��ȸ
select tabel_name from uesr_tables;
-- ������ �ּ� �Է�: ctrl + ������(/)
-- insert into student_scores2 (student_name, korean_score, english_score, math_score ) 
-- values('ȫ�浿', '95', '60', '85'); -- Ư���� ���� �Է����� ������ null���� �Էµ�
-- select * from student_scores2;
-- drop table student_scores2;

insert into student_scores2 (resistration_number, student_name, korean_score, english_score, math_score )
values('010120-3011212', 'ȫ�浿', '95', '60', '85');  -- 2000��� ���� �ֹι�ȣ�� ��7�ڸ� ù �ڸ��� 3(��), 4(��)�� ������

insert into student_scores2 (resistration_number, student_name, korean_score, english_score, math_score )
values('980120-1017282', 'ȫ�浿', '95', '100', '95');  

select * from student_scores2;

--�ڿ�Ű�� ������ �ߺ������͸� ������ �� �ֱ� ������ ��ȸ, ����, ���� ���� �۾��� �˻��������� Ȱ��ȴ�.
select * from student_scores2 where resistration_number='010120-3011212';

-- �ڿ�Ű�� �׻� ���� �Һ��� ���� �ƴϴ�.
-- �ڿ�Ű�� ID(Primary Key:�൥���Ϳ� ������ �� �ִ� ������ ��)�� ����� ��� �ܺο��� �ش� �����͸� �����ϴ� ���
-- ���̻� ���������͸� ������ �� ����. (��: ����ȯ�� �Ͽ� �ֹε�Ϲ�ȣ�� �ٲ�� ���)

-- Version3] �ߺ������͸� �����ϱ� ���� �븮Ű ����
-- �븮Ű(Surrogate Key): �����ͺ��̽����� ����ϴ� �ΰ����� �ĺ��ڷ� ���̺��� �⺻Ű 
--                      Primary Ű�� ����Ѵ�.
-- �л� ����: �ֹι�ȣ, �л��̸�, ��/��/�� ����
create table student_scores3(
    id number,
    resistration_number varchar2(50),
    student_name varchar2(50),
    korean_score number,
    english_score number,
    math_score number
);
-- ���� �������� ������ ���̺�� ��ȸ
select table_name from user_tables;
describe student_scores3;
insert into student_scores3 (id, resistration_number, student_name, korean_score, english_score, math_score )
values(1, '010120-3011212', 'ȫ�浿', '95', '60', '85');

insert into student_scores3 (id, resistration_number, student_name, korean_score, english_score, math_score )
values(2, '980120-1017282', 'ȫ�浿', '95', '100', '95');  
select * from student_scores3;

-- �븮Ű�� �⺻Ű�� ����Ͽ� �ߺ��� ������ �ذ��� �� �ִ�.
-- �׷��� �븮Ű�� insert�� �� �Ȱ��� �븮Ű�� �Է��ϰ� �Ǹ� ������ �߻��ȴ�.
insert into student_scores3 (id, resistration_number, student_name, korean_score, english_score, math_score )
values(2, '780120-1017282', '������', '99', '98', '100');  

-- Version4] �븮Ű�� �Ǽ��� �ߺ��Է��� ���� �ʵ��� �ϱ� ���Ͽ� primary key�� ���
-- �л� ����: id, �л��̸�, ��/��/�� ���� (�ֹι�ȣ�� �� �̻� PK�� ������ ���� �����Ƿ� ����)
create table student_scores4(
    id number,
    resistration_number varchar2(50),
    student_name varchar2(50),
    korean_score number,
    english_score number,
    math_score number,
    primary key(id) -- ��������: id �÷��� primary Ű�� Ȱ��(������ �Է½� �ߺ��� ������� �ʰ� DB���� ������)
);
-- ���� �������� ������ ���̺�� ��ȸ
select table_name from user_tables;
insert into student_scores4 (id, resistration_number, student_name, korean_score, english_score, math_score )
values(1, '010120-3011212', 'ȫ�浿', '95', '60', '85');

insert into student_scores4 (id, resistration_number, student_name, korean_score, english_score, math_score )
values(2, '980120-1017282', 'ȫ�浿', '95', '100', '95');  
select * from student_scores3;

-- �븮Ű�� �ߺ� �Է��� ���� �ʰ� ������ �ذ�
-- ������ ���� �ִ� ����: PK��ȣ�� �ߺ����� �ʰ� �Է��ϴ� ���� ������ å��? �Է��ϴ� ����� å��
-- ����� �ϴ����� �Ǽ��� ����
insert into student_scores4 (id, resistration_number, student_name, korean_score, english_score, math_score )
values(2, '780120-1017282', '������', '99', '98', '100');

-- �߰������� ���̺��� ��� ����
drop table student_scores1;
drop table student_scores2;
drop table student_scores3;
drop table student_scores4;
-- ���� �������� ������ ���̺�� ��ȸ
select table_name from user_tables;

drop table student_scores;
-- ���� ���
create table student_scores(
    id number,                          -- number: ���� Ÿ��
    resistration_number varchar2(50),   -- varchar2: ���ڿ� Ÿ��
    student_name varchar2(50),
    korean_score number,
    english_score number,
    math_score number,
    primary key(id) -- ��������: id �÷��� primary Ű�� Ȱ��
                    -- ������ �Է½� �ߺ��� ��� X
                    -- ���ϰ��� �ǵ��� ����
                    -- null���� ���� �ʵ��� ����
);

-- ������ ����
CREATE SEQUENCE student_scores_seq
    start with 1        -- ������ 1����
    increment by 1      -- 1�� ����
    nomaxvalue          -- �ִ밪 ���� ����
    nocycle;            -- ����Ŭ ����
    
-- ������ ��ȸ
select * from USER_SEQUENCES
where SEQUENCE_NAME='STUDENT_SCORES_SEQ';

-- ������ ����
drop sequence student_scores_seq;

insert into student_scores (id, resistration_number, student_name, korean_score, english_score, math_score )
values(STUDENT_SCORES_SEQ.nextval, '010120-3011212', 'ȫ�浿', '95', '60', '85');
select * from student_scores;
insert into student_scores (id, resistration_number, student_name, korean_score, english_score, math_score )
values(STUDENT_SCORES_SEQ.nextval, '980120-1017282', 'ȫ�浿', '95', '100', '95');  

insert into student_scores (id, resistration_number, student_name, korean_score, english_score, math_score )
values(STUDENT_SCORES_SEQ.nextval, '780120-1017282', '������', '99', '98', '100');

INSERT INTO Student_Scores (id, student_name, kor_score, eng_score, math_score, enroll_date)
VALUES (student_scores_seq.NEXTVAL, '��ö��', 85, 90, 92, TO_DATE('29/05/2023', 'DD/MM/YYYY'));

INSERT INTO Student_Scores (id, student_name, kor_score, eng_score, math_score, enroll_date)
VALUES (student_scores_seq.NEXTVAL, '�̿���', 78, 92, 88, TO_DATE('30/05/2023', 'DD/MM/YYYY'));

-- null ���� ���� ���� ���� ����
insert into student_scores (resistration_number, student_name, korean_score, english_score, math_score )
values('730120-1017282', '������', '99', '100', '100');


/* Oracle 12c ���� ������ ����ȭ ���
CREATE TABLE Student_Scores (
  id NUMBER GENERATED ALWAYS AS IDENTITY,
  student_name VARCHAR2(50),
  korean_score NUMBER,
  english_score NUMBER,
  math_score NUMBER,
  PRIMARY KEY (id)
);

INSERT INTO Student_Scores (student_name, korean_score, english_score, math_score)
VALUES ('ȫ�浿', 90, 80, 95);
*/


/******************************************
 * ���̺� ��Ű�� ����
 * - �÷�(��) �̸� ����, �÷� �߰�, �÷� ���� ..
 ******************************************/
 
 -- �÷�(��) �̸� ����
 -- alter table [���̺��] 
 -- rename column [�ٲ� �÷���] to [�ٲٰ����ϴ� �÷���]
 
describe student_scores;
 
alter table student_scores 
rename column korean_score to kor_score;
 
alter table student_scores 
rename column english_score to eng_score;

/* ���� �������� �Ʒ��� ���� ����ȭ�� ����
ALTER TABLE student_scores
RENAME COLUMN korean_score TO kor_score,
RENAME COLUMN english_score TO eng_score;
*/

-- ���̺� �� �߰�
alter table student_scores
add (sci_score number);
select * from student_scores;

drop table student_scores;

-- ���� �������� ������ ���̺�� ��ȸ
select table_name from user_tables;

-- ���̺� ������ ����� �� �ִ� ��������(Constraint)
-- ���̺� �÷��� ����
-- NOT NULL: ���� �ݵ�� ������ �ϴ� ����
create table person(
    name varchar2(50) not null,
    age number
);
select * from person;
-- �������� �Է�
insert into person (Name, Age) values ('ȫ�浿', 40);
-- not null ���� ������ ���ٸ� ��� ���� null ���·� �� �� �ִ�.
insert into person (name) values ('�̼���');
-- ������ �Է� name���� not null ������ ������ ����
insert into person (age) values (45);

-- check (�÷����� ������ ����)
create table  products(
    product_name varchar2(50),
    price number,
    constraint chk_price check (price > 0)
);
select * from Products;
-- �������� �Է�
insert into products (product_name, price) values ('������', 800);
insert into products (product_name) values ('������'); -- OK (Not null ������ ���� ������)
-- ������ �Է�(���� ����)
insert into products (product_name, price) values ('������', 0);

-- ���� ���� �̸� Ȯ��
select constraint_name
from user_cons_columns
-- table name�� column_name���� �빮�ڷ�
where table_name = 'PERSON' and column_name = 'NAME';

-- ���� ���� ����
alter table person
drop constraint SYS_C006999;

-- ���ο� �������� �߰�
alter table person
add constraint check_age_adult check (age >= 18);
insert into person (Name, Age) values ('������', 18);
select * from person;

-- �������� ������ �ֽ� ������ ����Ŭ������ ��� ������� �ʴ´�. �����ϱ� ���ؼ��� ���� �� ������Ѵ�.
------------------- ������� �ǽ� --------------------

/* 
���̺� �÷��� Ű ����:

1. �⺻ Ű (Primary Key):
 - ���̺� ������ �� ���� �����ϰ� �ĺ��ϴ� �� �Ǵ� ���� ���� 
 - ���̺� �ϳ��� �����ϸ� �ߺ��� ���� ��� X
 - ���̺��� ���ڵ带 �ĺ��ϰ� �ٸ� ���̺���� ���踦 �����ϴ� �� ���
 - NULL ���� ��� X

2. ���� Ű (Unique Key):
 - ���� Ű�� ���̺� ������ �ߺ��� ���� ������� �ʴ� �� �Ǵ� ���� ���� 
 - �⺻ Ű�� ���������� �� ���� �����ϰ� �ĺ��մϴ�. 
 - ������ ���� Ű�� �⺻ Ű�� �ƴ� ���� ����. ���̺� ������ ���� ���� ���� Ű�� ���� �� �ִ�.

3. ��ü Ű (Alternate Key):
 - ��ü Ű�� �⺻ Ű�� �ƴ� �ĺ� Ű�Դϴ�. (���ID, �������� ���� ������Ű, UUID��)
 - �⺻ Ű�� ���� �� �ִ� �� �Ǵ� ���� ���� �� �ϳ��Դϴ�. 
 - ��ü Ű�� ���̺��� �� ���� �����ϰ� �ĺ��ϴ� �� ���� �� ������ �⺻ Ű�� ���õ��� ���� ����Դϴ�.

4. �ܷ� Ű (Foreign Key):
 - �ٸ� ���̺��� �⺻ Ű�� ���� 
 - ������ �����ͺ��̽����� ���̺� ���� ���踦 ���� 
 - �ܷ� Ű�� ������ ���̺��� �⺻ Ű ���� ��ġ�ؾ� �ϰų� NULL ���� ���� �� �ֽ��ϴ�.

�̷��� Ű���� �������� ���Ἲ�� �����ϰ� ���̺� ���� ���踦 �����ϴ� �� ���˴ϴ�. 
�� Ű�� �����ͺ��̽� ���迡 ���� �����ϰ� ���õǰ� ���ǵǾ�� �մϴ�.
*/
-- ���̺� ����
CREATE TABLE employees (
    employee_id NUMBER,
    ssn VARCHAR2(11) UNIQUE,
    first_name VARCHAR2(50),
    last_name VARCHAR2(50),
    email VARCHAR2(100) UNIQUE
);

-- ������ ����
INSERT INTO employees (employee_id, ssn, first_name, last_name, email) 
VALUES (1, '123-45-6789', 'John', 'Doe', 'john.doe@example.com');

INSERT INTO employees (employee_id, ssn, first_name, last_name, email) 
VALUES (2, '987-65-4321', 'Jane', 'Smith', 'jane.smith@example.com');

INSERT INTO employees (employee_id, ssn, first_name, last_name, email) 
VALUES (3, '456-78-9123', 'Bob', 'Johnson', 'bob.johnson@example.com');
select * from employees;

INSERT INTO employees (employee_id, ssn, first_name, last_name, email) 
VALUES (4, '456-78-9126', 'James', 'Lee', 'jane.smith@example.com');

-- �ܷ� Ű (Foreign Key)
--------------------------------------------------------------------------
--------------------------------------------------------------------------
-- ���̺� 1: ���� ���� ���̺�
CREATE TABLE roles (
  role_id NUMBER PRIMARY KEY,            -- �⺻ Ű (Primary Key)
  role_name VARCHAR2(50) UNIQUE not null         -- ���� Ű (Unique Key)
);
drop table roles;

-- ���̺� 2: ȸ�� ���� ���̺�
CREATE TABLE members (
  member_id NUMBER PRIMARY KEY,          -- �⺻ Ű (Primary Key)
  user_id VARCHAR2(10) UNIQUE NOT NULL,  -- ��ü Ű (Alternate Key)
  email VARCHAR2(100) UNIQUE,            -- ���� Ű (Unique Key) (������ �������� �⺻Ű/���Ƿ� �ߺ��Ұ�Ű)
  full_name VARCHAR2(100) NOT NULL,      -- NOT NULL �������� �߰�
  birth_date DATE,                        -- �������� ���� �߰�
  role_id number,
  FOREIGN KEY (role_id) REFERENCES roles(role_id)
);
drop table members;

drop sequence member_seq;
-- ������ ����
CREATE SEQUENCE member_seq START WITH 1 INCREMENT BY 1;

-- roles ���̺� ���ڵ� ����
INSERT INTO roles (role_id, role_name)
VALUES (1, '������');

INSERT INTO roles (role_id, role_name)
VALUES (2, '�����');

INSERT INTO roles (role_id, role_name)
VALUES (3, '�մ�');

INSERT INTO roles (role_id, role_name)
VALUES (4, '�Ŵ���');

INSERT INTO roles (role_id, role_name)
VALUES (5, '����');

select * from roles;

-- members ���̺� ���ڵ� ����
INSERT INTO members (member_id, user_id, email, full_name, birth_date, role_id)
VALUES (member_seq.NEXTVAL, 'user001', 'user1@example.com', 'ȫ�浿', TO_DATE('1990-01-01', 'YYYY-MM-DD'), 1);

INSERT INTO members (member_id, user_id, email, full_name, birth_date, role_id)
VALUES (member_seq.NEXTVAL, 'user002', 'user2@example.com', '�̼���', TO_DATE('1985-05-10', 'YYYY-MM-DD'), 2);

INSERT INTO members (member_id, user_id, email, full_name, birth_date, role_id)
VALUES (member_seq.NEXTVAL, 'user003', 'user3@example.com', '��ö��', TO_DATE('1993-11-25', 'YYYY-MM-DD'), 2);

INSERT INTO members (member_id, user_id, email, full_name, birth_date, role_id)
VALUES (member_seq.NEXTVAL, 'user004', 'user4@example.com', '�ڿ���', TO_DATE('1988-07-15', 'YYYY-MM-DD'), 1);

INSERT INTO members (member_id, user_id, email, full_name, birth_date, role_id)
VALUES (member_seq.NEXTVAL, 'user005', 'user5@example.com', '������', TO_DATE('1992-04-20', 'YYYY-MM-DD'), 3);


select * from members;
select * from roles;

SELECT m.member_id, m.user_id, m.email, m.full_name, m.birth_date, r.role_name
FROM members m
LEFT JOIN roles r 
ON m.role_id = r.role_id;
