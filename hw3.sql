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
    from_date date,
    to_date date,
    primary key (emp_no,salary)
);

create table if not exists title(
    emp_no integer references employees(emp_no),
    title varchar(50),
    from_date date,
    to_date date,
    primary key (emp_no,title,from_date)
);

create table if not exists dept_manager(
    dept_no char(4) references departments(dept_no),
    emp_no integer references employees(emp_no),
    from_date date,
    to_date date
);

create table if not exists dept_emp(
    emp_no integer references employees(emp_no),
    dept_no char(4) references departments(dept_no),
    from_date date,
    to_date date,
    primary key (emp_no,dept_no)
);




