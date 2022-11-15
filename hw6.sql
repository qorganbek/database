--1
-- create database assignment_6;
--2
create table if not exists locations(
    location_id serial primary key,
    street_address varchar(25),
    postal_code varchar(12),
    city varchar(30),
    state_province varchar(12)
);

create table if not exists departments(
    department_id serial primary key,
    department_name varchar(50) unique,
    budget integer,
    city varchar(30),
    location_id integer references locations
);

create table if not exists employees(
    employee_id serial primary key,
    first_name varchar(50),
    last_name varchar(50),
    email varchar(50),
    phone_number varchar(20),
    salary integer,
    department_id integer references departments
);

