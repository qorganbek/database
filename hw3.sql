-- EX 1
--
-- DDL:
-- DDL is Data Definition Language which is used to define data structures.
-- For example: create table, alter table are instructions in SQL.
--
-- DML:
-- DML is Data Manipulation Language which is used to manipulate data itself.
-- For example: insert, update, delete are instructions in SQL.
--
-- Difference between DDL and DML:
--
-- DDL:
-- It is used to create database schema and can be used to define some constraints as well.
-- It basically defines the column (Attributes) of the table.
-- Basic command present in DDL are CREATE, DROP, RENAME etc.
-- DDL does not use WHERE clause in its statement.
--
-- DML:
-- It is used to add, retrieve or update the data.
-- It add or update the row of the table.
-- BASIC command present in DML are UPDATE, INSERT, DELETE, MERGE etc.
-- DML uses WHERE clause in its statement.


--EX 2
-- create database hw3;
--
-- create  type g as ENUM ('M','F');



create table IF NOT EXISTS employees
(
    emp_no     integer primary key,
    birth_date date,
    first_name varchar(14),
    last_name  varchar(16),
    gender     g,
    hire_date  date
);

create table if not exists departments(
    dept_no char(4) primary key ,
    dept_name varchar(40)
);

create table if not exists salaries(
    emp_no integer references employees(emp_no),
    salary integer,
    from_date date primary key ,
    to_date date
);

create table if not exists title(
    emp_no integer references employees(emp_no),
    title varchar(50),
    from_date date,
    to_date date,
    primary key (title,from_date)
);


create table if not exists dept_emp(
    emp_no integer references employees(emp_no),
    dept_no char(4) references departments(dept_no),
    from_date date,
    to_date date

);

create table if not exists dept_manager(
    dept_no char(4) references departments(dept_no),
    emp_no integer references employees(emp_no),
    from_date date,
    to_date date
);

--ex3;
create table if not exists students_table(
    full_name varchar(100),
    age integer,
    birth_day date,
    gender g,
    avg_grade float,
    nationality varchar(100),
    phone_number varchar(100),
    social_category varchar(50)
);
-- create type rm_lesson as ENUM('Yes','No')


create table if not exists instructors_table(
     full_name varchar(100),
     speaking_languages varchar(255),
     work_experience varchar(255),
     pos_rm_lesson rm_lesson
);

create table if not exists student_relatives(
    full_name varchar(100),
    address varchar(100),
    phone_number varchar(100),
    position varchar(55)
);
-- create type honors as ENUM ('Yes','No');
create table if not exists student_social_data(
    school varchar(100),
    graduation_data date,
    addres varchar(100),
    region varchar(100),
    counrty varchar(100),
    gpa float,
    honors honors
);


--ex4
--insert
insert into employees(emp_no, birth_date, first_name, last_name, gender, hire_date)
values (9,'2003-12-19','Dinmukhammed','Korganbek','M','2022-10-01');
insert into employees(emp_no, birth_date, first_name, last_name, gender, hire_date)
values (2,'1961-04-16','Ibadat','Ablaeva','F','2022-10-02');
insert into employees(emp_no, birth_date, first_name, last_name, gender, hire_date)
values (3,'1983-01-07','Almas','Sailaubekov','M','2022-10-03');
insert into employees(emp_no, birth_date, first_name, last_name, gender, hire_date)
values (4,'1982-12-15','Nalikul','Omirbekova','F','2022-10-04');
insert into employees(emp_no, birth_date, first_name, last_name, gender, hire_date)
values (5,'2007-01-27','Nurdaulet','Ongarbek','M','2022-10-05');
insert into employees(emp_no, birth_date, first_name, last_name, gender, hire_date)
values (6,'2013-10-09','Erdaulet','Ongarbek','M','2022-10-01');
insert into employees(emp_no, birth_date, first_name, last_name, gender, hire_date)
values (7,'2005-06-15','Aliya','Duisenbek','F','2022-10-01');
insert into employees(emp_no, birth_date, first_name, last_name, gender, hire_date)
values (8,'1955-02-23','Ongarbek','Sailaubekov','M','2022-10-02');
--insert


--delete
delete from employees where emp_no = 9;
--delete

--update
update employees set hire_date = '2022-10-09' where emp_no = 1;
--update

select * from employees;






