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
--3
insert into locations values(1, 'Tole bi 59', '050000', 'Almaty', 'South');
insert into locations values(2, '3211 Hillcrest Lane', '92380', 'Quail Valley', 'California');
insert into locations values(3, 'Pfaffacherweg 105', '5107','Schinznach-dorf','Brugg');
insert into locations values(4, 'Civic Centre, High Rd', 'N22 8LE', 'London', '	Wood Green');
insert into locations values(5, 'Merter', '34173', 'Güngören', 'Istanbul');
insert into departments values (30, 'Administration', 55000000,'Almaty', 1);
insert into departments values (50, 'Marketing', 1000000,'Quail Valley', 2);
insert into departments values (60, 'Purchasing', 12000000,'Schinznach-dorf', 3);
insert into departments values (70, 'Finance', 9000000,'Güngören', 5);
insert into departments values (80, 'IT', 990000000,'London', 4);
insert into employees values (1,'Dinmukhammed','Korganbek','dim03kz3@gmail.com','87785747318',12000000,80);
insert into employees values (2,'Aidos','Kakimov','aidos_obzor@gmail.com','87757321256',10000,30);
insert into employees values (3,'Temirzhan','Timur','timur@gmail.com','87775747318',110000,50);
insert into employees values (4,'Zhanserik','Kalmukhambet','zhans@gmail.com','87785747318',90000,70);
insert into employees values (5,'Tugelbay','Ansar','ansar@gmail.com','87475747318',30000,60);
--4
select first_name,last_name,e.department_id,department_name from departments
join employees e on departments.department_id = e.department_id;

--5
select first_name,last_name,e.department_id,department_name from departments
join employees e on departments.department_id = e.department_id
where e.department_id = 80 or e.department_id = 30;

--6
select first_name,last_name,department_name,d.city,state_province, d.location_id from employees
join departments d on employees.department_id = d.department_id
join locations l on l.location_id = d.location_id;

--7
insert into departments values (90,'Medicine',150000,'Almaty',1);
select * from departments;

--8
insert into employees  values (6,'Ernat','Manapaly','era@mail.ru','87757451265',null,6);
insert into locations values (6,'Krasyi Fonorei','10532','Moscow','Moscow');
select employees.first_name,employees.last_name,employees.department_id,d.department_name from employees
full outer join departments d on d.department_id = employees.department_id;

--9

select first_name,last_name from employees
join departments d on d.department_id = employees.department_id
where city = 'Almaty';