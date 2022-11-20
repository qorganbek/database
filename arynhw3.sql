
--1
--create database assignment_6;

--2
create table employees(
    emp_no INT primary key,
    birth_date date,
    first_name varchar(14),
    last_name varchar(16),
    gender gender,
    hire_date date
);
create table departments(
    dept_no char(4) primary key,
    dept_name varchar(40)
);
create table dept_manager(
    dept_no char(4) references departments(dept_no),
    emp_no int references employees(emp_no),
    from_date date,
    to_date date
);
create table dept_emp(
    emp_no int references employees(emp_no),
    dept_no char(4) references departments(dept_no),
    from_date date,
    to_date date
);
create table salaries(
    emp_no int references employees(emp_no),
    salary int,
    from_date date primary key ,
    to_date date
);
create table titles(
    emp_no int references employees(emp_no),
    title varchar(50),
    from_date date,
    to_date date,
    primary key (emp_no,title,from_date)
);

