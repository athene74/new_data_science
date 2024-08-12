/*
오라클 SQL문에서 멀티라인 주석 설정
*/

/*
<SQL Developer 기본 환경 설정>
 * 폰트 사이즈 설정
 메뉴 Tools(도구) - Preferences(환경설정) - Code Editor(코드 에디터) - 글꼴 - 글꼴크기
 * 행번호 토글: 왼쪽 에디터 옆 여백 마우스 우클릭 - '행번호 토글' 선택
*/

/*
DBMS(Database Mangement System)란?
데이터베이스 관리 시스템의 약자로 데이터를 효율적으로 저장, 검색, 관리하는 소프트웨어 도구
저장은 파일시스템에 각 DBMS 제품의 자료구조에서 정의한 형태로 한다.

Oracle은?
전 세계에서 가장 성능이 좋고 많이 사용되는 상용 DBMS
....
8i: i=> internet : 인터넷 환경 지원
....
10g: g=> grid: 빅데이터 처리를 위한 분산 환경을 지원 
....
12c: c=> cloud: 클라우드 환경의 데이터베이스 지원
.....
18c ~ : 기능의 확장

*/

-- SQL에서 한 줄 주석: SQL 실행에는 영향을 미치지 않는다.
/*
 SQL에서 여러줄 주석
*/

/*
SQL(Structed Query Language) : 데이터베이스 관리 시스템에서 데이터를 조작하고 관리하기 위해
표준화된 언어
SQL 문의 종류
1. DCL(Data Control Language): 데이터베이스 사용자의 권한을 관리하기 위한 SQL문
예) grant connect to open_source
2. DDL(Data Definition Language): 데이터베이스 구조를 정의하고 관리하기 위한 SQL문
예)CREATE TABLE Student_Scores1(
    student_name varchar2(50),  
    KOREAN_SCORE number,
    english_score number,
    math_score number
);
3. DML(Data Manipulation Langugae): 데이터를 조작하기 위한 SQL문
- 데이터 조작의 유형: CRUD (Create, Read, Update, Delete)
 => insert, select, update, delete 
4. TCL(Transaction Control Language): 데이터베이스 트랜잭션을 제어하기위한 SQL문
 -COMMIT, ROLLBACK...
*/

/*
table: 저장할 데이터의 논리적인 구조 (판다스의 DataFrame)
필드 또는 컬럼: 저장할 데이터의 특성을 표현
create table [테이블명](
 [필드명] [필드타입],
 ..
)
*/
-- create table student_scores(id number, student_name varchar2(50) .....); <- SQL 종료는 ';'
-- SQL문은 대소문자를 구분하지 않는다. (대소문자 Rule개발팀의 정책에 따름)
-- 테이블명, 컬럼(필드)명은 통상 snake 룰을 따른다.
-- 카멜(Camel)방식: 두 단어 이상으로 작명시 단어와 단어사이 첫번째 문자를 대문자로 표현
-- ex) StudentScores : 클래스명 또는 테이블명일때에는 첫단어의 첫글자도 대문자
--     studentName: 컬럼(필드)명일때 첫단어의 첫글자는 소문자.
-- 스네이크(Snake)방식: 두 단어 이상으로 작명시 단어는 모두 소문자로 작성하고 연결은 '_'로 함
-- ex) student_scores, student_name

/*****************************
 단계별 학생 점수 테이블 생성
****************************/
-- Version1]학생 점수를 관리하는 테이블 생성
-- 학생 정보: 학생이름, 국/영/수 점수

-- 멀티라인 SQL문 실행하는 방법: 멀티라인 시작행과 끝행 사이 아무 라인에서 Ctrl+Enter
create table student_scores1(
    student_name varchar2(50),
    korean_score number,
    english_score number,
    math_score number
);
-- 현재 계정에 생선된 테이블명 조회
select table_name from user_tables;
-- 테이블 스키마 조회
describe student_scores1;

-- 테이블 삭제
drop table student_scores1;

-- 서로 다른 SQL 실행문 동시에 수행: 별도의 연속된 SQL 문을 드래그하여 Ctrl+Enter

-- 테이블이 정상적으로 생성되었는지 확인하기 위하여 데이터 삽입 Test
-- insert 구문은 DML 이지만 테이블이 제대로 생성되었는지 확인하는 용도로 미리 테스트
insert into student_scores1 (student_name, korean_score, english_score, math_score )
values('홍길동', '95', '60', '85');    -- 레코드(행데이터)

select * from student_scores1;

insert into student_scores1 (student_name, korean_score, english_score, math_score )
values('김철수', '90', '100', '95');    -- 중복되지 않은 데이터는 문제 없이 처리

insert into student_scores1 (student_name, korean_score, english_score, math_score )
values('홍길동', '95', '100', '95');    -- 현재 홍길동이라는 학생데이터가 중복이 되고 있음(기본옵션으로는 중복입력 허용)

-- Version2] 중복데이터를 구분하기 위해 자연키 도입
-- 자연키(Natural Key): 실생활에서 발생하는 데이터를 구분지을 수 있는 값
-- 학생 정보: 주민번호, 학생이름, 국/영/수 점수
create table student_scores2(
    resistration_number varchar2(50),
    student_name varchar2(50),
    korean_score number,
    english_score number,
    math_score number
);
-- 현재 계정에 생성된 테이블명 조회
select tabel_name from uesr_tables;
-- 다중행 주석 입력: ctrl + 슬래시(/)
-- insert into student_scores2 (student_name, korean_score, english_score, math_score ) 
-- values('홍길동', '95', '60', '85'); -- 특정행 값을 입력하지 않으면 null값이 입력됨
-- select * from student_scores2;
-- drop table student_scores2;

insert into student_scores2 (resistration_number, student_name, korean_score, english_score, math_score )
values('010120-3011212', '홍길동', '95', '60', '85');  -- 2000년대 이후 주민번호는 뒤7자리 첫 자리가 3(남), 4(여)로 시작함

insert into student_scores2 (resistration_number, student_name, korean_score, english_score, math_score )
values('980120-1017282', '홍길동', '95', '100', '95');  

select * from student_scores2;

--자연키로 나머지 중복데이터를 구분할 수 있기 때문에 조회, 수정, 삭제 등의 작업에 검색조건으로 활용된다.
select * from student_scores2 where resistration_number='010120-3011212';

-- 자연키는 항상 절대 불변의 값은 아니다.
-- 자연키를 ID(Primary Key:행데이터에 접근할 수 있는 유일한 값)로 사용할 경우 외부에서 해당 데이터를 참조하는 경우
-- 더이상 예전데이터를 접근할 수 없다. (예: 성전환을 하여 주민등록번호가 바뀌는 경우)

-- Version3] 중복데이터를 구분하기 위해 대리키 도입
-- 대리키(Surrogate Key): 데이터베이스에서 사용하는 인공적인 식별자로 테이블의 기본키 
--                      Primary 키로 사용한다.
-- 학생 정보: 주민번호, 학생이름, 국/영/수 점수
create table student_scores3(
    id number,
    resistration_number varchar2(50),
    student_name varchar2(50),
    korean_score number,
    english_score number,
    math_score number
);
-- 현재 계정에서 생성된 테이블명 조회
select table_name from user_tables;
describe student_scores3;
insert into student_scores3 (id, resistration_number, student_name, korean_score, english_score, math_score )
values(1, '010120-3011212', '홍길동', '95', '60', '85');

insert into student_scores3 (id, resistration_number, student_name, korean_score, english_score, math_score )
values(2, '980120-1017282', '홍길동', '95', '100', '95');  
select * from student_scores3;

-- 대리키를 기본키로 사용하여 중복의 문제를 해결할 수 있다.
-- 그러나 대리키를 insert할 때 똑같은 대리키를 입력하게 되면 문제가 발생된다.
insert into student_scores3 (id, resistration_number, student_name, korean_score, english_score, math_score )
values(2, '780120-1017282', '강감찬', '99', '98', '100');  

-- Version4] 대리키가 실수로 중복입력이 되지 않도록 하기 위하여 primary key를 사용
-- 학생 정보: id, 학생이름, 국/영/수 점수 (주민번호는 더 이상 PK의 역할을 하지 않으므로 생략)
create table student_scores4(
    id number,
    resistration_number varchar2(50),
    student_name varchar2(50),
    korean_score number,
    english_score number,
    math_score number,
    primary key(id) -- 제약조건: id 컬럼을 primary 키로 활용(데이터 입력시 중복을 허용하지 않게 DB에서 보장함)
);
-- 현재 계정에서 생성된 테이블명 조회
select table_name from user_tables;
insert into student_scores4 (id, resistration_number, student_name, korean_score, english_score, math_score )
values(1, '010120-3011212', '홍길동', '95', '60', '85');

insert into student_scores4 (id, resistration_number, student_name, korean_score, english_score, math_score )
values(2, '980120-1017282', '홍길동', '95', '100', '95');  
select * from student_scores3;

-- 대리키가 중복 입력이 되지 않게 문제를 해결
-- 여전히 남아 있는 문제: PK번호가 중복되지 않게 입력하는 것은 누구의 책임? 입력하는 사람의 책임
-- 사람이 하는일은 실수가 가능
insert into student_scores4 (id, resistration_number, student_name, korean_score, english_score, math_score )
values(2, '780120-1017282', '강감찬', '99', '98', '100');

-- 중간과정의 테이블은 모두 삭제
drop table student_scores1;
drop table student_scores2;
drop table student_scores3;
drop table student_scores4;
-- 현재 계정에서 생성된 테이블명 조회
select table_name from user_tables;

drop table student_scores;
-- 최종 결과
create table student_scores(
    id number,                          -- number: 숫자 타입
    resistration_number varchar2(50),   -- varchar2: 문자열 타입
    student_name varchar2(50),
    korean_score number,
    english_score number,
    math_score number,
    primary key(id) -- 제약조건: id 컬럼을 primary 키로 활용
                    -- 데이터 입력시 중복을 허용 X
                    -- 유일값이 되도록 보장
                    -- null값이 되지 않도록 보장
);

-- 시퀀스 생성
CREATE SEQUENCE student_scores_seq
    start with 1        -- 시작은 1부터
    increment by 1      -- 1씩 증가
    nomaxvalue          -- 최대값 제한 없음
    nocycle;            -- 사이클 없음
    
-- 시퀀스 조회
select * from USER_SEQUENCES
where SEQUENCE_NAME='STUDENT_SCORES_SEQ';

-- 시퀀스 삭제
drop sequence student_scores_seq;

insert into student_scores (id, resistration_number, student_name, korean_score, english_score, math_score )
values(STUDENT_SCORES_SEQ.nextval, '010120-3011212', '홍길동', '95', '60', '85');
select * from student_scores;
insert into student_scores (id, resistration_number, student_name, korean_score, english_score, math_score )
values(STUDENT_SCORES_SEQ.nextval, '980120-1017282', '홍길동', '95', '100', '95');  

insert into student_scores (id, resistration_number, student_name, korean_score, english_score, math_score )
values(STUDENT_SCORES_SEQ.nextval, '780120-1017282', '강감찬', '99', '98', '100');

INSERT INTO Student_Scores (id, student_name, kor_score, eng_score, math_score, enroll_date)
VALUES (student_scores_seq.NEXTVAL, '김철수', 85, 90, 92, TO_DATE('29/05/2023', 'DD/MM/YYYY'));

INSERT INTO Student_Scores (id, student_name, kor_score, eng_score, math_score, enroll_date)
VALUES (student_scores_seq.NEXTVAL, '이영희', 78, 92, 88, TO_DATE('30/05/2023', 'DD/MM/YYYY'));

-- null 값에 대한 제약 조건 동작
insert into student_scores (resistration_number, student_name, korean_score, english_score, math_score )
values('730120-1017282', '유관순', '99', '100', '100');


/* Oracle 12c 이후 버전의 간소화 방식
CREATE TABLE Student_Scores (
  id NUMBER GENERATED ALWAYS AS IDENTITY,
  student_name VARCHAR2(50),
  korean_score NUMBER,
  english_score NUMBER,
  math_score NUMBER,
  PRIMARY KEY (id)
);

INSERT INTO Student_Scores (student_name, korean_score, english_score, math_score)
VALUES ('홍길동', 90, 80, 95);
*/


/******************************************
 * 테이블 스키마 변경
 * - 컬럼(열) 이름 변경, 컬럼 추가, 컬럼 삭제 ..
 ******************************************/
 
 -- 컬럼(열) 이름 변경
 -- alter table [테이블명] 
 -- rename column [바꿀 컬럼명] to [바꾸고자하는 컬럼명]
 
describe student_scores;
 
alter table student_scores 
rename column korean_score to kor_score;
 
alter table student_scores 
rename column english_score to eng_score;

/* 상위 버전에는 아래와 같이 간소화도 가능
ALTER TABLE student_scores
RENAME COLUMN korean_score TO kor_score,
RENAME COLUMN english_score TO eng_score;
*/

-- 테이블 열 추가
alter table student_scores
add (sci_score number);
select * from student_scores;

drop table student_scores;

-- 현재 계정에서 생성된 테이블명 조회
select table_name from user_tables;

-- 테이블 생성시 고려할 수 있는 제약조건(Constraint)
-- 테이블 컬럼에 적용
-- NOT NULL: 값을 반드시 가져야 하는 조건
create table person(
    name varchar2(50) not null,
    age number
);
select * from person;
-- 정상적인 입력
insert into person (Name, Age) values ('홍길동', 40);
-- not null 제약 조건이 없다면 어떠한 열도 null 형태로 들어갈 수 있다.
insert into person (name) values ('이순신');
-- 비정상 입력 name열이 not null 조건을 가지고 있음
insert into person (age) values (45);

-- check (컬럽값의 범위를 제한)
create table  products(
    product_name varchar2(50),
    price number,
    constraint chk_price check (price > 0)
);
select * from Products;
-- 정상적인 입력
insert into products (product_name, price) values ('조스바', 800);
insert into products (product_name) values ('누가바'); -- OK (Not null 조건은 없기 때문에)
-- 비정상 입력(범위 오류)
insert into products (product_name, price) values ('빠삐코', 0);

-- 제약 조건 이름 확인
select constraint_name
from user_cons_columns
-- table name과 column_name값은 대문자로
where table_name = 'PERSON' and column_name = 'NAME';

-- 제약 조건 삭제
alter table person
drop constraint SYS_C006999;

-- 새로운 제약조건 추가
alter table person
add constraint check_age_adult check (age >= 18);
insert into person (Name, Age) values ('성춘향', 18);
select * from person;

-- 제약조건 수정은 최신 버전의 오라클에서도 모두 허용하지 않는다. 수정하기 위해서는 삭제 후 재생성한다.
------------------- 여기까지 실습 --------------------

/* 
테이블 컬럼의 키 종류:

1. 기본 키 (Primary Key):
 - 테이블 내에서 각 행을 고유하게 식별하는 열 또는 열의 집합 
 - 테이블에 하나만 존재하며 중복된 값을 허용 X
 - 테이블의 레코드를 식별하고 다른 테이블과의 관계를 설정하는 데 사용
 - NULL 값을 허용 X

2. 고유 키 (Unique Key):
 - 고유 키는 테이블 내에서 중복된 값을 허용하지 않는 열 또는 열의 집합 
 - 기본 키와 마찬가지로 각 행을 고유하게 식별합니다. 
 - 하지만 고유 키는 기본 키가 아닌 열에 적용. 테이블 내에서 여러 개의 고유 키를 가질 수 있다.

3. 대체 키 (Alternate Key):
 - 대체 키는 기본 키가 아닌 후보 키입니다. (사원ID, 시퀀스에 의해 생성된키, UUID등)
 - 기본 키로 사용될 수 있는 열 또는 열의 집합 중 하나입니다. 
 - 대체 키는 테이블에서 각 행을 고유하게 식별하는 데 사용될 수 있지만 기본 키로 선택되지 않은 경우입니다.

4. 외래 키 (Foreign Key):
 - 다른 테이블의 기본 키를 참조 
 - 관계형 데이터베이스에서 테이블 간의 관계를 설정 
 - 외래 키는 참조된 테이블의 기본 키 값과 일치해야 하거나 NULL 값을 가질 수 있습니다.

이러한 키들은 데이터의 무결성을 보장하고 테이블 간의 관계를 설정하는 데 사용됩니다. 
각 키는 데이터베이스 설계에 따라 적절하게 선택되고 정의되어야 합니다.
*/
-- 테이블 생성
CREATE TABLE employees (
    employee_id NUMBER,
    ssn VARCHAR2(11) UNIQUE,
    first_name VARCHAR2(50),
    last_name VARCHAR2(50),
    email VARCHAR2(100) UNIQUE
);

-- 데이터 삽입
INSERT INTO employees (employee_id, ssn, first_name, last_name, email) 
VALUES (1, '123-45-6789', 'John', 'Doe', 'john.doe@example.com');

INSERT INTO employees (employee_id, ssn, first_name, last_name, email) 
VALUES (2, '987-65-4321', 'Jane', 'Smith', 'jane.smith@example.com');

INSERT INTO employees (employee_id, ssn, first_name, last_name, email) 
VALUES (3, '456-78-9123', 'Bob', 'Johnson', 'bob.johnson@example.com');
select * from employees;

INSERT INTO employees (employee_id, ssn, first_name, last_name, email) 
VALUES (4, '456-78-9126', 'James', 'Lee', 'jane.smith@example.com');

-- 외래 키 (Foreign Key)
--------------------------------------------------------------------------
--------------------------------------------------------------------------
-- 테이블 1: 역할 정보 테이블
CREATE TABLE roles (
  role_id NUMBER PRIMARY KEY,            -- 기본 키 (Primary Key)
  role_name VARCHAR2(50) UNIQUE not null         -- 고유 키 (Unique Key)
);
drop table roles;

-- 테이블 2: 회원 정보 테이블
CREATE TABLE members (
  member_id NUMBER PRIMARY KEY,          -- 기본 키 (Primary Key)
  user_id VARCHAR2(10) UNIQUE NOT NULL,  -- 대체 키 (Alternate Key)
  email VARCHAR2(100) UNIQUE,            -- 고유 키 (Unique Key) (광의의 개념으로 기본키/협의로 중복불가키)
  full_name VARCHAR2(100) NOT NULL,      -- NOT NULL 제약조건 추가
  birth_date DATE,                        -- 제약조건 없이 추가
  role_id number,
  FOREIGN KEY (role_id) REFERENCES roles(role_id)
);
drop table members;

drop sequence member_seq;
-- 시퀀스 생성
CREATE SEQUENCE member_seq START WITH 1 INCREMENT BY 1;

-- roles 테이블에 레코드 삽입
INSERT INTO roles (role_id, role_name)
VALUES (1, '관리자');

INSERT INTO roles (role_id, role_name)
VALUES (2, '사용자');

INSERT INTO roles (role_id, role_name)
VALUES (3, '손님');

INSERT INTO roles (role_id, role_name)
VALUES (4, '매니저');

INSERT INTO roles (role_id, role_name)
VALUES (5, '직원');

select * from roles;

-- members 테이블에 레코드 삽입
INSERT INTO members (member_id, user_id, email, full_name, birth_date, role_id)
VALUES (member_seq.NEXTVAL, 'user001', 'user1@example.com', '홍길동', TO_DATE('1990-01-01', 'YYYY-MM-DD'), 1);

INSERT INTO members (member_id, user_id, email, full_name, birth_date, role_id)
VALUES (member_seq.NEXTVAL, 'user002', 'user2@example.com', '이순신', TO_DATE('1985-05-10', 'YYYY-MM-DD'), 2);

INSERT INTO members (member_id, user_id, email, full_name, birth_date, role_id)
VALUES (member_seq.NEXTVAL, 'user003', 'user3@example.com', '김철수', TO_DATE('1993-11-25', 'YYYY-MM-DD'), 2);

INSERT INTO members (member_id, user_id, email, full_name, birth_date, role_id)
VALUES (member_seq.NEXTVAL, 'user004', 'user4@example.com', '박영희', TO_DATE('1988-07-15', 'YYYY-MM-DD'), 1);

INSERT INTO members (member_id, user_id, email, full_name, birth_date, role_id)
VALUES (member_seq.NEXTVAL, 'user005', 'user5@example.com', '정민지', TO_DATE('1992-04-20', 'YYYY-MM-DD'), 3);


select * from members;
select * from roles;

SELECT m.member_id, m.user_id, m.email, m.full_name, m.birth_date, r.role_name
FROM members m
LEFT JOIN roles r 
ON m.role_id = r.role_id;
